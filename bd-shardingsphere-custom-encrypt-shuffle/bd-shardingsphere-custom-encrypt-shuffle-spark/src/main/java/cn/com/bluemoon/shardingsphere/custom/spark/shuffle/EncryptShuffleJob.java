package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shardingsphere.infra.database.type.dialect.MySQLDatabaseType;
import org.apache.shardingsphere.infra.database.type.dialect.PostgreSQLDatabaseType;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FilterFunction;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Column;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;

import java.sql.*;
import java.util.*;

/**
 * @author Jarod.Kong
 */
@RequiredArgsConstructor
@Slf4j
@Getter
public class EncryptShuffleJob {
    private static final String BATCH_SIZE = "1000";
    private static final int parallelNum = 50;
    private final EncryptGlobalConfig config;
    private static Broadcast<EncryptGlobalConfig> globalConfigBroadcast;
    //    private final CenterConfig centerConfig;
//    private final MetaDataPersistService metaDataPersistService;
    private Map<String, String> sourceJdbcProps;

    public EncryptShuffleJob init(String schemaName) {
        this.sourceJdbcProps = Collections.unmodifiableMap(getSourceJdbcProps());
        if (config.getPlainColumnNames() == null || config.getPlainColumnNames().isEmpty()) {
            throw new RuntimeException("洗数字段不可为空");
        }
        return this;
    }

    public Map<String, String> getSourceJdbcProps() {
        Map<String, String> prop = new HashMap<>(16);
        if ("MySQL".equalsIgnoreCase(config.getDatabaseType())) {
            prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        }
        prop.put(JDBCOptions.JDBC_URL(), config.getSourceUrl());
        prop.put(JDBCOptions.JDBC_TABLE_NAME(), config.getRuleTableName());
        prop.put(JDBCOptions.JDBC_PARTITION_COLUMN(), config.getPartitionColumn().getName());
        prop.put(JDBCOptions.JDBC_NUM_PARTITIONS(), parallelNum + "");
        prop.put(JDBCOptions.JDBC_BATCH_FETCH_SIZE(), BATCH_SIZE);
        prop.put(JDBCOptions.JDBC_LOWER_BOUND(), "0");
        prop.put(JDBCOptions.JDBC_UPPER_BOUND(), "1000");
        return prop;
    }


    public void shuffle() {
        try (SparkSession spark = getSparkSession()) {
            Dataset<Row> dataset = spark.read().format("jdbc").options(sourceJdbcProps).load();
            dataset.printSchema();
            log.info("更新源表");
            dataset.filter((FilterFunction<Row>) row -> {
                EncryptGlobalConfig config = globalConfigBroadcast.value();
                return config.getPlainColumnNames().stream().anyMatch(f -> row.getAs(f.getName()) != null);
            }).repartition(parallelNum, new Column(globalConfigBroadcast.getValue().getPartitionColumn().getName()))
                    .foreachPartition(new UpdateForeachPartitionFunction(globalConfigBroadcast));
        }

    }


    private SparkSession getSparkSession() {
        SparkConf conf = new SparkConf().setAppName("Spark MySQL").setMaster("local[*]");
        JavaSparkContext sc = new JavaSparkContext(conf);
        sc.setLogLevel("INFO");
        globalConfigBroadcast = sc.broadcast(config);
        return SparkSession.builder().config(conf).getOrCreate();
    }


}
