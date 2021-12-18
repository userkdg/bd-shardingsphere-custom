package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;

import java.util.*;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig.MYSQL;
import static cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig.POSTGRESQL;

/**
 * @author Jarod.Kong
 */
@Slf4j
public abstract class BaseSparkDbExtract implements SparkDbExtract {

    public static final String JDBC_PROXY_CIPHER_FILED_SUFFIX = "_cipher";
    public static final String JDBC_PARTITION_FIELD_ID = "proxy_batch_id";
    public static final String SPARK_JDBC_DBTABLE_ALIAS = "a";

    public static final String BATCH_SIZE = System.getProperty("spark.encrypt.shuffle.jdbc.batchSize", "1000");
    protected static final String parallelNum = System.getProperty("spark.encrypt.shuffle.jdbc.numPartitions", "50");
    protected static final String lowerBound = System.getProperty("spark.encrypt.shuffle.jdbc.lowerBound", "0");
    protected static final String upperBound = System.getProperty("spark.encrypt.shuffle.jdbc.upperBound", "10000000");

    protected final EncryptGlobalConfig config;
    protected final SparkSession spark;

    protected BaseSparkDbExtract(EncryptGlobalConfig config, SparkSession spark) {
        this.config = config;
        this.spark = spark;
    }

    @Override
    public Dataset<Row> extract(SparkSession spark) {
        return spark.read().format("jdbc").options(getCustomJdbcReadProps()).load();
    }

    protected Map<String, String> getCustomJdbcReadProps() {
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

    protected String getDbTableByMode(ExtractMode shuffleMode, String databaseType) {
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

    protected String wrappedFieldAlias(String field) {
        return String.format("%s.%s", SPARK_JDBC_DBTABLE_ALIAS, field);
    }

    protected String wrappedCipherFieldAlias(String field) {
        return String.format("%s.%s", SPARK_JDBC_DBTABLE_ALIAS, field + JDBC_PROXY_CIPHER_FILED_SUFFIX);
    }

    private String getSqlWhere(ExtractMode shuffleMode, List<String> fields, List<String> plainCols) {
       if (shuffleMode == null) {
           return " 1=1 ";
       }
       return getCustomWhereSql(shuffleMode, fields, plainCols);
    }

    protected abstract String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> plainCols);

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
}
