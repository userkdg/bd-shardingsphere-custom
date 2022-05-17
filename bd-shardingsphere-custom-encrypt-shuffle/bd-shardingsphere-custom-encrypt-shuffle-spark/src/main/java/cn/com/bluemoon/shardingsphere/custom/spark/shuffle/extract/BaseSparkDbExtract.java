package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.InternalDbUtil;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition.DbTablePartitionUtils;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;

import java.util.*;
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

    public static final String JDBC_NUM_PARTITIONS = System.getProperty("spark.encrypt.shuffle.jdbc.numPartitions", "500");

    public static final String lowerBound = System.getProperty("spark.encrypt.shuffle.jdbc.lowerBound", "0");

    /**
     * bm_crm业务主键到了1亿+
     */
    public static final String upperBound = System.getProperty("spark.encrypt.shuffle.jdbc.upperBound", "200000000");

    @Setter
    protected GlobalConfig config;

    @Setter
    protected SparkSession spark;

    protected BaseSparkDbExtract(GlobalConfig config, SparkSession spark) {
        this.config = config;
        this.spark = spark;
    }

    @Override
    public Dataset<Row> extract() {
        return loadCustomDbTableJdbcDF();
    }

    /**
     * 统一加载自定义表数据
     */
    protected Dataset<Row> loadCustomDbTableJdbcDF() {
        // 优先表是否有自定义分区，否则，走统一配置的分区列，spark默认数值分区eg:0-1000, 1000-2000...
        String[] customPartitionAllPredicateArr = DbTablePartitionUtils.getPartitions(config.getDbName(), config.getRuleTableName());
        if (customPartitionAllPredicateArr != null && customPartitionAllPredicateArr.length > 0) {
            ExtractMode shuffleMode = config.getExtractMode();
            Map<String, String> sourceJdbcBasicProps = getSourceJdbcBasicProps();
            Properties props = new Properties();
            sourceJdbcBasicProps.forEach((k, v) -> {
                log.info("set {}:{}", k, v);
                props.setProperty(k, v);
            });
            String dbTableByMode = getDbTableByMode(shuffleMode, config.getDbType());
            log.warn("表{}，开启自定义分区全量抽取方式：总分区数：{}，分区如下：", config.getRuleTableName(), customPartitionAllPredicateArr.length);
            for (String part : customPartitionAllPredicateArr) {
                log.info("{}", part);
            }
            return spark.read().jdbc(getConvertSourceUrl(), dbTableByMode, customPartitionAllPredicateArr, props);
        }
        log.info("加载表{}spark默认配置字段{}分区", config.getRuleTableName(), config.getPartitionCol());
        return spark.read().format("jdbc").options(getCustomDbTableJdbcReadProps()).load();
    }


    public String getConvertSourceUrl() {
        return InternalDbUtil.convertJdbcUrl(config.getSourceUrl(), config.isMultiBatchUrlConfig());
    }

    public String getConvertTargetUrl() {
        return InternalDbUtil.convertJdbcUrl(config.getTargetUrl(), config.isMultiBatchUrlConfig());
    }


    protected Map<String, String> getCustomDbTableJdbcReadProps() {
        Map<String, String> props = getSourceJdbcBasicProps();
        ExtractMode shuffleMode = config.getExtractMode();
        String dbTable = getDbTableByMode(shuffleMode, config.getDbType());
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

    protected String wrappedFieldAlias(String field) {
        return String.format("%s.%s", SPARK_JDBC_DBTABLE_ALIAS, field);
    }

    protected abstract String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols);

    protected Map<String, String> getSourceJdbcBasicProps() {
        Map<String, String> props = new HashMap<>(16);
        if (MYSQL.equalsIgnoreCase(config.getDbType())) {
            props.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.jdbc.Driver");
        } else if (POSTGRESQL.equalsIgnoreCase(config.getDbType())) {
            props.put(JDBCOptions.JDBC_DRIVER_CLASS(), "org.postgresql.Driver");
        } else {
            log.warn("数据库类型{}未能初始化Driver，请增加driver和初始化！", config.getDbType());
        }
        props.put(JDBCOptions.JDBC_URL(), getConvertSourceUrl());
        return props;
    }

    /**
     * <pre>
     *  1. dynamicPartitionField = String.format(" CAST(%s AS SIGNED) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
     *  2. dynamicPartitionField = String.format(" %s AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
     *  3. dynamicPartitionField = String.format(" MOD(%s, %d) AS %s", wrappedFieldAlias(partitionCol.getName()), Integer.parseInt(JDBC_NUM_PARTITIONS), JDBC_PARTITION_FIELD_ID);
     *  基于mod/cast来支持分区，实际上spark默认分区容易倾斜，建议结合实际表分区字段进行定义
     * </pre>
     * {@link DbTablePartitionUtils}
     */
    private String getSqlProjectionsStr(List<String> fields, String databaseType) {
        // 分区字段
        GlobalConfig.FieldInfo partitionCol = config.getPartitionColOpt().orElse(config.getPrimaryCols().get(0));
        String dynamicPartitionField = getDynamicPartitionFieldStr(databaseType, partitionCol);
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

    /**
     * 获取表分区加工字段值，统一as为{@see JDBC_PARTITION_FIELD_ID}
     */
    private String getDynamicPartitionFieldStr(String databaseType, GlobalConfig.FieldInfo partitionCol) {
        // partitionCol.getType()只能外部提供字段类型
        String dynamicPartitionField = "";
        String[] customPartition = DbTablePartitionUtils.getPartitions(config.getDbName(), config.getRuleTableName());
        boolean hadCustomPartition = customPartition != null && customPartition.length > 0;
        if ("mysql".equalsIgnoreCase(databaseType)) {
            if (hadCustomPartition) {
                dynamicPartitionField = String.format(" %s AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
            } else {
                //  2022/3/14 要证走索引
                dynamicPartitionField = String.format(" %s AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
//                dynamicPartitionField = String.format(" MOD(%s, %d) AS %s", wrappedFieldAlias(partitionCol.getName()), Integer.parseInt(JDBC_NUM_PARTITIONS), JDBC_PARTITION_FIELD_ID);
            }
        }
        if ("postgresql".equalsIgnoreCase(databaseType)) {
            if (hadCustomPartition) {
                dynamicPartitionField = String.format(" %s AS %s",   wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
            } else {
                dynamicPartitionField = String.format(" CAST(%s AS INTEGER) AS %s", wrappedFieldAlias(partitionCol.getName()), JDBC_PARTITION_FIELD_ID);
            }
        }
        return dynamicPartitionField;
    }


    private String getSqlWhere(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        if (shuffleMode == null) {
            return " 1=1 ";
        }
        return getCustomWhereSql(shuffleMode, fields, extractCols);
    }

}
