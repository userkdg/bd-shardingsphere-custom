package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ShuffleMode;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;
import org.apache.spark.sql.types.StructType;

import java.util.*;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig.MYSQL;
import static cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig.POSTGRESQL;

/**
 * @author Jarod.Kong
 */
@RequiredArgsConstructor
@Slf4j
@Getter
public abstract class BaseEncryptShuffleJob implements EncryptShuffle {
    protected static final String parallelNum = System.getProperty("spark.encrypt.shuffle.jdbc.numPartitions", "50");
    protected static final String lowerBound = System.getProperty("spark.encrypt.shuffle.jdbc.lowerBound", "0");
    protected static final String upperBound = System.getProperty("spark.encrypt.shuffle.jdbc.upperBound", "10000000");
    static final String BATCH_SIZE = System.getProperty("spark.encrypt.shuffle.jdbc.batchSize", "1000");
    private static final String JDBC_PARTITION_FIELD_ID = "proxy_batch_id";
    private static final String SPARK_JDBC_DBTABLE_ALIAS = "a";
    private static final String JDBC_PROXY_CIPHER_FILED_SUFFIX = "_cipher";

    // must static
    protected static Broadcast<EncryptGlobalConfig> globalConfigBroadcast;
    protected final EncryptGlobalConfig config;
    protected Map<String, String> sourceJdbcProps;

    public EncryptShuffle init() {
        this.sourceJdbcProps = Collections.unmodifiableMap(getSourceJdbcProps());
        if (config.getPlainCols() == null || config.getPlainCols().isEmpty()) {
            throw new RuntimeException("洗数字段不可为空");
        }
        return this;
    }

    public void shuffle() {
        try (SparkSession spark = getSparkSession(config.isOnYarn())) {
            Dataset<Row> dataset = spark.read().format("jdbc").options(sourceJdbcProps).load();
            dataset.printSchema();
            final StructType schema = dataset.schema();
            log.info("开始更新源表");
            final EncryptGlobalConfig globalConfig = globalConfigBroadcast.getValue();
            doShuffle(dataset, schema, globalConfig);
            log.info("结束！！");
        }
    }

    public abstract void doShuffle(Dataset<Row> dataset, StructType schema, EncryptGlobalConfig globalConfig);

    @Override
    public void finish() {
        log.info("run done !!");
    }

    protected Map<String, String> getSourceJdbcProps() {
        Map<String, String> prop = new HashMap<>(16);
        if (MYSQL.equalsIgnoreCase(config.getDatabaseType())) {
            prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        } else if (POSTGRESQL.equalsIgnoreCase(config.getDatabaseType())) {
            prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "org.postgresql.Driver");
        }
        prop.put(JDBCOptions.JDBC_URL(), config.getConvertSourceUrl());
        ShuffleMode shuffleMode = config.getShuffleMode();
        String dbTable = getDbTableByMode(shuffleMode, config.getDatabaseType());
        prop.put(JDBCOptions.JDBC_TABLE_NAME(), dbTable);
        prop.put(JDBCOptions.JDBC_PARTITION_COLUMN(), JDBC_PARTITION_FIELD_ID);
        prop.put(JDBCOptions.JDBC_NUM_PARTITIONS(), parallelNum);
        prop.put(JDBCOptions.JDBC_BATCH_FETCH_SIZE(), BATCH_SIZE);
        prop.put(JDBCOptions.JDBC_LOWER_BOUND(), lowerBound);
        prop.put(JDBCOptions.JDBC_UPPER_BOUND(), upperBound);
        return prop;
    }

    protected String getDbTableByMode(ShuffleMode shuffleMode, String databaseType) {
        if (shuffleMode == null) {
            shuffleMode = ShuffleMode.ReShuffle;
        }
        // 2021/12/1 只查询相关字段
        List<String> fields = config.getPrimaryCols().stream().map(EncryptGlobalConfig.FieldInfo::getName).collect(Collectors.toList());
        List<String> plainCols = config.getPlainCols().stream().map(EncryptGlobalConfig.FieldInfo::getName).collect(Collectors.toList());
        fields.addAll(plainCols);
        // 明文列对应的密文列 2021/12/1 定义行为，重跑洗数什么模式，全覆盖（全部重跑），获取明文列对应的密文列中为null的数据进行加密洗数
        final String whereSql = getSqlWhere(shuffleMode, fields, plainCols);
        final String fieldProjectionsStr = getSqlProjectionsStr(shuffleMode, fields, plainCols, databaseType);
        final String tableAlias = String.format("%s AS %s", config.getRuleTableName(), SPARK_JDBC_DBTABLE_ALIAS);
        final String finalTableTmpName = config.getRuleTableName() + "_tmp";
        String finalDbTableSql = "(" +
                "select " +
                fieldProjectionsStr +
                " from " + tableAlias +
                " where " + whereSql +
                ") as " + finalTableTmpName;
        log.info("构建spark dbTable Sql=>{}", finalDbTableSql);
        return finalDbTableSql;
    }

    private String getSqlWhere(ShuffleMode shuffleMode, List<String> fields, List<String> plainCols) {
        if (ShuffleMode.ReShuffle.equals(shuffleMode)) {
            return " 1=1 ";
        } else if (ShuffleMode.AndNullShuffle.equals(shuffleMode)) {
            List<String> fieldCiphers = plainCols.stream().map(f -> String.format("%s is null", wrappedCipherFieldAlias(f))).collect(Collectors.toList());
            return String.join(" and ", fieldCiphers);
        } else if (ShuffleMode.OrNullShuffle.equals(shuffleMode)) {
            List<String> fieldCiphers = plainCols.stream().map(f -> String.format("%s is null", wrappedCipherFieldAlias(f))).collect(Collectors.toList());
            return String.join(" or ", fieldCiphers);
        }
        return "1=1";
    }

    private String getSqlProjectionsStr(ShuffleMode shuffleMode, List<String> fields, List<String> plainCols, String databaseType) {
        if (ShuffleMode.ReShuffle.equals(shuffleMode)) {
            // 分区字段
            EncryptGlobalConfig.FieldInfo partitionCol = config.getPartitionColOpt().orElse(config.getPrimaryCols().get(0));
            // partitionCol.getType()只能外部提供字段类型
            String dynamicPartitionField = "";
            if ("mysql".equalsIgnoreCase(databaseType)) {
                dynamicPartitionField = String.format(" CAST(%s AS SIGNED) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
            }
            if ("postgresql".equalsIgnoreCase(databaseType)){
                dynamicPartitionField = String.format(" CAST(%s AS INTEGER) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
            }
            List<String> fieldProjections = new LinkedList<>();
            fieldProjections.add(dynamicPartitionField);
            List<String> actualFields = fields.stream().map(this::wrappedFieldAlias).collect(Collectors.toList());
            fieldProjections.addAll(actualFields);
            return String.join(", ", fieldProjections);
        } else if (ShuffleMode.AndNullShuffle.equals(shuffleMode)) {
            return fields.stream().map(this::wrappedFieldAlias).collect(Collectors.joining(", "));
        } else if (ShuffleMode.OrNullShuffle.equals(shuffleMode)) {
            return fields.stream().map(this::wrappedFieldAlias).collect(Collectors.joining(", "));
        }
        return SPARK_JDBC_DBTABLE_ALIAS + ".*";
    }

    private String wrappedFieldAlias(String field) {
        return String.format("%s.%s", SPARK_JDBC_DBTABLE_ALIAS, field);
    }

    private String wrappedCipherFieldAlias(String field) {
        return String.format("%s.%s", SPARK_JDBC_DBTABLE_ALIAS, field + JDBC_PROXY_CIPHER_FILED_SUFFIX);
    }

    private SparkSession getSparkSession(boolean onYarn) {
        SparkConf conf = new SparkConf().setAppName(config.getJobName());
        if (!onYarn) conf.setMaster("local[*]");
        JavaSparkContext sc = new JavaSparkContext(conf);
        sc.setLogLevel("INFO");
        globalConfigBroadcast = sc.broadcast(config);
        return SparkSession.builder().config(conf).getOrCreate();
    }

}
