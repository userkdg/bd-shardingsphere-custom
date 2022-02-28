package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig.MYSQL;
import static cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig.POSTGRESQL;

/**
 * @author Jarod.Kong
 */
@Slf4j
public abstract class BaseSparkDbExtract implements SparkDbExtract, ExtractSPI {

    public static final String JDBC_PARTITION_FIELD_ID = "proxy_batch_id";

    public static final String SPARK_JDBC_DBTABLE_ALIAS = "a";

    public static final String BATCH_SIZE = System.getProperty("spark.encrypt.shuffle.jdbc.batchSize", "1000");

    public static final String JDBC_NUM_PARTITIONS = System.getProperty("spark.encrypt.shuffle.jdbc.numPartitions", "100");

    public static final String lowerBound = System.getProperty("spark.encrypt.shuffle.jdbc.lowerBound", "0");
    public static final String upperBound = System.getProperty("spark.encrypt.shuffle.jdbc.upperBound", "10000000");

    @Setter
    protected GlobalConfig config;

    @Setter
    protected SparkSession spark;

    protected BaseSparkDbExtract(GlobalConfig config, SparkSession spark) {
        this.config = config;
        this.spark = spark;
    }

    protected Map<String, String> getCustomDbTableJdbcReadProps() {
        Map<String, String> props = getSourceJdbcBasicProps();
        ExtractMode shuffleMode = config.getExtractMode();
        String dbTable = getDbTableByMode(shuffleMode, config.getDatabaseType());
        props.put(JDBCOptions.JDBC_TABLE_NAME(), dbTable);
        props.put(JDBCOptions.JDBC_PARTITION_COLUMN(), JDBC_PARTITION_FIELD_ID);
        props.put(JDBCOptions.JDBC_NUM_PARTITIONS(), JDBC_NUM_PARTITIONS);
        props.put(JDBCOptions.JDBC_BATCH_FETCH_SIZE(), BATCH_SIZE);
        props.put(JDBCOptions.JDBC_LOWER_BOUND(), lowerBound);
        props.put(JDBCOptions.JDBC_UPPER_BOUND(), upperBound);
        return props;
    }

    protected String getDbTableByMode(ExtractMode shuffleMode, String databaseType) {
        // 2021/12/1 只查询相关字段
        List<String> fields = config.getPrimaryCols().stream().map(GlobalConfig.FieldInfo::getName).collect(Collectors.toList());
        List<String> extractCols = config.internalGetExtractCols().stream().map(GlobalConfig.FieldInfo::getName).collect(Collectors.toList());
        fields.addAll(extractCols);
        // 明文列对应的密文列 2021/12/1 定义行为，重跑洗数什么模式，全覆盖（全部重跑），获取明文列对应的密文列中为null的数据进行加密洗数
        final String whereSql = getSqlWhere(shuffleMode, fields, extractCols);
        final String fieldProjectionsStr = getSqlProjectionsStr(fields, databaseType);
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

    private String getSqlProjectionsStr(List<String> fields, String databaseType) {
        // 分区字段
        GlobalConfig.FieldInfo partitionCol = config.getPartitionColOpt().orElse(config.getPrimaryCols().get(0));
        // partitionCol.getType()只能外部提供字段类型
        String dynamicPartitionField = "";
        if ("mysql".equalsIgnoreCase(databaseType)) {
//            dynamicPartitionField = String.format(" CAST(%s AS SIGNED) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
            dynamicPartitionField = String.format(" MOD(%s, %d) AS %s", wrappedFieldAlias(partitionCol.getName()), Integer.parseInt(JDBC_NUM_PARTITIONS), JDBC_PARTITION_FIELD_ID);
        }
        if ("postgresql".equalsIgnoreCase(databaseType)) {
            dynamicPartitionField = String.format(" CAST(%s AS INTEGER) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
        }
        List<String> fieldProjections = new LinkedList<>();
        fieldProjections.add(dynamicPartitionField);
        List<String> actualFields = fields.stream().map(this::wrappedFieldAlias).collect(Collectors.toList());
        fieldProjections.addAll(actualFields);
        // 2022/2/25 增加onUpdateCurrentTimestamps字段查询，用于自增数据回填
        for (String onUpdateCurrentTimestampField : config.getOnUpdateCurrentTimestamps()) {
            fieldProjections.add(wrappedFieldAlias(onUpdateCurrentTimestampField));
        }
        return String.join(", ", fieldProjections);
    }

    protected String wrappedFieldAlias(String field) {
        return String.format("%s.%s", SPARK_JDBC_DBTABLE_ALIAS, field);
    }

    private String getSqlWhere(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        if (shuffleMode == null) {
            return " 1=1 ";
        }
        return getCustomWhereSql(shuffleMode, fields, extractCols);
    }

    protected abstract String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols);

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
