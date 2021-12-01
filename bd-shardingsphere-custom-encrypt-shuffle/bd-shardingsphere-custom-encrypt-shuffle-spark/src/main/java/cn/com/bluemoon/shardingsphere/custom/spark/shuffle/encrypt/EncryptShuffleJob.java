package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FilterFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Column;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;
import org.apache.spark.sql.types.StructType;

import java.util.*;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfig.MYSQL;
import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfig.POSTGRESQL;

/**
 * @author Jarod.Kong
 */
@RequiredArgsConstructor
@Slf4j
@Getter
public class EncryptShuffleJob implements EncryptShuffle {
    private static final String BATCH_SIZE = System.getProperty("spark.encrypt.shuffle.jdbc.batchSize", "1000");
    private static final String parallelNum = System.getProperty("spark.encrypt.shuffle.jdbc.numPartitions", "50");
    private static final String lowerBound = System.getProperty("spark.encrypt.shuffle.jdbc.lowerBound", "0");
    private static final String upperBound = System.getProperty("spark.encrypt.shuffle.jdbc.upperBound", "1000");

    // must static
    private static Broadcast<EncryptGlobalConfig> globalConfigBroadcast;
    private final EncryptGlobalConfig config;
    private Map<String, String> sourceJdbcProps;

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
            dataset.filter((FilterFunction<Row>) row -> globalConfig.getPlainCols().stream().anyMatch(f -> row.getAs(f.getName()) != null))
                    .repartition(Integer.parseInt(parallelNum), globalConfig.getPrimaryCols().stream().map(g -> new Column(g.getName())).toArray(Column[]::new))
                    .foreachPartition(new UpdateForeachPartitionFunction(schema, globalConfigBroadcast));
            log.info("结束！！");
        }

    }

    @Override
    public void finish() {
        log.info("run done !!");
    }

    private Map<String, String> getSourceJdbcProps() {
        Map<String, String> prop = new HashMap<>(16);
        if (MYSQL.equalsIgnoreCase(config.getDatabaseType())) {
            prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        } else if (POSTGRESQL.equalsIgnoreCase(config.getDatabaseType())) {
            prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "org.postgresql.Driver");
        }
        prop.put(JDBCOptions.JDBC_URL(), config.getSourceUrl());
        // 2021/12/1 只查询相关字段
        List<String> fields = new ArrayList<>();
        fields.addAll(config.getPrimaryCols().stream().map(EncryptGlobalConfig.FieldInfo::getName).collect(Collectors.toList()));
        fields.addAll(config.getPlainCols().stream().map(EncryptGlobalConfig.FieldInfo::getName).collect(Collectors.toList()));
        final String dbTable = String.format("(select %s from %s where 1=1 ) as %s_tmp", String.join(",", fields), config.getRuleTableName(), config.getRuleTableName());
        prop.put(JDBCOptions.JDBC_TABLE_NAME(), dbTable);
        prop.put(JDBCOptions.JDBC_PARTITION_COLUMN(), config.getPrimaryCols().get(0).getName());
        prop.put(JDBCOptions.JDBC_NUM_PARTITIONS(), parallelNum);
        prop.put(JDBCOptions.JDBC_BATCH_FETCH_SIZE(), BATCH_SIZE);
        prop.put(JDBCOptions.JDBC_LOWER_BOUND(), lowerBound);
        prop.put(JDBCOptions.JDBC_UPPER_BOUND(), upperBound);
        return prop;
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
