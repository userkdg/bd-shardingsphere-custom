package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
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
    public static final String JDBC_PROXY_CIPHER_FILED_SUFFIX = "_cipher";
    public static final String JDBC_PARTITION_FIELD_ID = "proxy_batch_id";
    public static final String SPARK_JDBC_DBTABLE_ALIAS = "a";
    protected static final String parallelNum = System.getProperty("spark.encrypt.shuffle.jdbc.numPartitions", "50");
    protected static final String lowerBound = System.getProperty("spark.encrypt.shuffle.jdbc.lowerBound", "0");
    protected static final String upperBound = System.getProperty("spark.encrypt.shuffle.jdbc.upperBound", "10000000");
    static final String BATCH_SIZE = System.getProperty("spark.encrypt.shuffle.jdbc.batchSize", "1000");
    // must static
    protected static Broadcast<EncryptGlobalConfig> globalConfigBroadcast;
    protected final EncryptGlobalConfig config;
    private volatile String preExtractTimestamp;
    private volatile String curMaxIncrTimestamp;

    public EncryptShuffle init() {
        if (config.getPlainCols() == null || config.getPlainCols().isEmpty()) {
            throw new RuntimeException("洗数字段不可为空");
        }
        return this;
    }

    public void shuffle() {
        try (SparkSession spark = getSparkSession(config.isOnYarn())) {
            if (ExtractMode.WithIncrTimestamp.equals(config.getExtractMode())) {
                tryReShuffleWithExtractMode(spark);
            } else {
                Dataset<Row> dataset = spark.read().format("jdbc").options(getSourceJdbcProps()).load();
                dataset.printSchema();
                log.info("开始更新源表");
                doShuffle(dataset, dataset.schema(), globalConfigBroadcast.getValue());
            }
            log.info("{}模式，洗数结束！！", config.getExtractMode());
        }
    }

    /**
     * 尝试抽取下一次增量
     */
    private void tryReShuffleWithExtractMode(SparkSession spark) {
        long incrExtractSize = 0;
        do {
            // 先查询出top1的增量字段值，再进行增量条件查询
            Dataset<Row> maxIncrTimestampDf = spark.read().format("jdbc").options(getSourceJdbcMaxIncrTimestampProps()).load();
            Row topOne = maxIncrTimestampDf.select(config.getIncrTimestampCol()).first();
            curMaxIncrTimestamp = Optional.ofNullable(topOne.getAs(config.getIncrTimestampCol())).map(String::valueOf).orElse(DateUtil.now());
            // 调整方案 普通模式跑一次，若是增量时间类型的就跑多次，直至没有新数据为止
            Dataset<Row> nextDf = spark.read().format("jdbc").options(getSourceJdbcProps()).load();
            Dataset<Row> dfCache = nextDf.cache();
            incrExtractSize = dfCache.count();
            if (incrExtractSize > 0) {
                log.info("发现增量数据进行开始洗数");
                dfCache.printSchema();
                doShuffle(dfCache, dfCache.schema(), globalConfigBroadcast.getValue());
                log.info("增量数据进行洗数完成，将尝试获取下一次增量数据，直至为空");
            }
        } while (incrExtractSize != 0);
        log.info("增量数据为空，洗数结束！！");
    }

    /**
     * 获取增量字段最大值
     */
    protected Map<String, String> getSourceJdbcMaxIncrTimestampProps() {
        Map<String, String> props = getSourceJdbcBasicProps();
        ExtractMode shuffleMode = config.getExtractMode();
        Assert.isTrue(ExtractMode.WithIncrTimestamp.equals(shuffleMode) && StringUtils.isNotBlank(config.getIncrTimestampCol()), "暂支持{}模式获取增量字段最大值", ExtractMode.WithIncrTimestamp);
        final String tableAlias = String.format("%s AS %s", config.getRuleTableName(), SPARK_JDBC_DBTABLE_ALIAS);
        String maxQuerySql = String.format("(select MAX(%s) as %s from %s ) as max_table_tmp", wrappedFieldAlias(config.getIncrTimestampCol()), config.getIncrTimestampCol(), tableAlias);
        props.put(JDBCOptions.JDBC_TABLE_NAME(), maxQuerySql);
        return props;
    }

    public abstract void doShuffle(Dataset<Row> dataset, StructType schema, EncryptGlobalConfig globalConfig);

    @Override
    public void finish() {
        log.info("run done !!");
    }

    protected Map<String, String> getSourceJdbcProps() {
        Map<String, String> props = getSourceJdbcBasicProps();
        ExtractMode shuffleMode = config.getExtractMode();
        String dbTable = getDbTableByMode(shuffleMode, config.getDatabaseType());
        props.put(JDBCOptions.JDBC_TABLE_NAME(), dbTable);
        props.put(JDBCOptions.JDBC_PARTITION_COLUMN(), JDBC_PARTITION_FIELD_ID);
        props.put(JDBCOptions.JDBC_NUM_PARTITIONS(), parallelNum);
        props.put(JDBCOptions.JDBC_BATCH_FETCH_SIZE(), BATCH_SIZE);
        props.put(JDBCOptions.JDBC_LOWER_BOUND(), lowerBound);
        props.put(JDBCOptions.JDBC_UPPER_BOUND(), upperBound);
        return props;
    }

    protected Map<String, String> getSourceJdbcBasicProps() {
        Map<String, String> props = new HashMap<>(16);
        if (MYSQL.equalsIgnoreCase(config.getDatabaseType())) {
            props.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        } else if (POSTGRESQL.equalsIgnoreCase(config.getDatabaseType())) {
            props.put(JDBCOptions.JDBC_DRIVER_CLASS(), "org.postgresql.Driver");
        }
        props.put(JDBCOptions.JDBC_URL(), config.getConvertSourceUrl());
        return props;
    }

    protected String getDbTableByMode(ExtractMode shuffleMode, String databaseType) {
        if (shuffleMode == null) {
            shuffleMode = ExtractMode.All;
        }
        // 2021/12/1 只查询相关字段
        List<String> fields = config.getPrimaryCols().stream().map(EncryptGlobalConfig.FieldInfo::getName).collect(Collectors.toList());
        List<String> plainCols = config.getPlainCols().stream().map(EncryptGlobalConfig.FieldInfo::getName).collect(Collectors.toList());
        fields.addAll(plainCols);
        // 明文列对应的密文列 2021/12/1 定义行为，重跑洗数什么模式，全覆盖（全部重跑），获取明文列对应的密文列中为null的数据进行加密洗数
        final String whereSql = getSqlWhere(shuffleMode, fields, plainCols);
        final String fieldProjectionsStr = getSqlProjectionsStr(fields, plainCols, databaseType);
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

    private String getSqlWhere(ExtractMode shuffleMode, List<String> fields, List<String> plainCols) {
        if (ExtractMode.All.equals(shuffleMode)) {
            return " 1=1 ";
        } else if (ExtractMode.AndNull.equals(shuffleMode)) {
            List<String> fieldCiphers = plainCols.stream().map(f -> String.format("%s is null", wrappedCipherFieldAlias(f))).collect(Collectors.toList());
            return String.join(" and ", fieldCiphers);
        } else if (ExtractMode.OrNull.equals(shuffleMode)) {
            List<String> fieldCiphers = plainCols.stream().map(f -> String.format("%s is null", wrappedCipherFieldAlias(f))).collect(Collectors.toList());
            return String.join(" or ", fieldCiphers);
        } else if (ExtractMode.OtherCustom.equals(shuffleMode)) {
            return Optional.ofNullable(config.getCustomExtractWhereSql()).orElse(" 1=1 ");
        } else if (ExtractMode.WithIncrTimestamp.equals(shuffleMode)) {
            String incrTimestampCol = config.getIncrTimestampCol();
            Objects.requireNonNull(incrTimestampCol, String.format("%s模式必须填写时间类型增量[%s]字段", ExtractMode.WithIncrTimestamp, "EncryptGlobalConfig.incrTimestampCol"));
            if (preExtractTimestamp == null) {
                String currentTimestamp = curMaxIncrTimestamp;
                String lte = String.format(" %s <= '%s' ",
                        wrappedFieldAlias(incrTimestampCol), currentTimestamp);
                preExtractTimestamp = currentTimestamp;
                return lte;
            } else {
                String gte;
                if (preExtractTimestamp.equals(curMaxIncrTimestamp)) {
                    gte = String.format(" %s > '%s' ",
                            wrappedFieldAlias(incrTimestampCol), preExtractTimestamp);
                } else {
                    gte = String.format(" %s > '%s' and %s <= '%s' ",
                            wrappedFieldAlias(incrTimestampCol), preExtractTimestamp,
                            wrappedFieldAlias(incrTimestampCol), curMaxIncrTimestamp);
                    preExtractTimestamp = curMaxIncrTimestamp;
                }
                return gte;
            }
        }
        return getCustomWhereSql();
    }

    /**
     * 获取自定义的where sql 可重写
     */
    protected String getCustomWhereSql() {
        return " 1=1 ";
    }

    private String getSqlProjectionsStr(List<String> fields, List<String> plainCols, String databaseType) {
        // 分区字段
        EncryptGlobalConfig.FieldInfo partitionCol = config.getPartitionColOpt().orElse(config.getPrimaryCols().get(0));
        // partitionCol.getType()只能外部提供字段类型
        String dynamicPartitionField = "";
        if ("mysql".equalsIgnoreCase(databaseType)) {
            dynamicPartitionField = String.format(" CAST(%s AS SIGNED) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
        }
        if ("postgresql".equalsIgnoreCase(databaseType)) {
            dynamicPartitionField = String.format(" CAST(%s AS INTEGER) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
        }
        List<String> fieldProjections = new LinkedList<>();
        fieldProjections.add(dynamicPartitionField);
        List<String> actualFields = fields.stream().map(this::wrappedFieldAlias).collect(Collectors.toList());
        fieldProjections.addAll(actualFields);
        return String.join(", ", fieldProjections);
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
