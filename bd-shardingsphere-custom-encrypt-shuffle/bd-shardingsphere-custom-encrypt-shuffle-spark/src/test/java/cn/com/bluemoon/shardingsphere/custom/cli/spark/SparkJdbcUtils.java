package cn.com.bluemoon.shardingsphere.custom.cli.spark;


import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SaveMode;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;
import org.junit.Test;
import scala.Tuple2;
import scala.collection.mutable.ArrayBuffer;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkJdbcUtils {
    public static void main1(String[] args) {
        SparkConf conf = new SparkConf().setAppName("Spark Mysql").setMaster("local[*]");
        JavaSparkContext sc = new JavaSparkContext(conf);
        long s1;
        try (SparkSession spark = SparkSession.builder().config(conf).getOrCreate()) {
            sc.setLogLevel("ERROR");
            String partitionNums = "10";
            Map<String, String> readProps = getBasicProps();
            readProps.put(JDBCOptions.JDBC_TABLE_NAME(), "(select * from ec_oms_order limit 5000) as ec_oms_order_encrypt_test");
//            readProps.put(JDBCOptions.JDBC_PARTITION_COLUMN(), "order_code");
            readProps.put(JDBCOptions.JDBC_NUM_PARTITIONS(), partitionNums);
            readProps.put(JDBCOptions.JDBC_BATCH_FETCH_SIZE(), "1000");
//            readProps.put(JDBCOptions.JDBC_LOWER_BOUND(), "0");
//            readProps.put(JDBCOptions.JDBC_UPPER_BOUND(), partitionNums);
            s1 = System.currentTimeMillis();

            Properties properties = new Properties();
            properties.putAll(readProps);
            val cal = Calendar.getInstance();
            cal.add(Calendar.DATE, -90);
            val array = new ArrayList<Tuple2<String,String>>();
            for (int i = 0; i < 90; i++) {
                val start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
                cal.add(Calendar.DATE, +1);
                val end = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
                Tuple2<String, String> tuple2 = Tuple2.apply(start, end);
                array.add(tuple2);
            }

            String[] predicates = array.stream().map(t -> String.format("gmt_create >= '%s' AND gmt_create < '%s'", t._1, t._2)).toArray(String[]::new);
            Dataset<Row> dataset;
            dataset = spark.read().jdbc(readProps.get(JDBCOptions.JDBC_URL()), readProps.get(JDBCOptions.JDBC_TABLE_NAME()),
                    predicates, properties);
            dataset.foreachPartition(new ForeachPartitionFunction<Row>() {
                @Override
                public void call(Iterator<Row> t) throws Exception {
                    log.debug("t={}",t);
                }
            });
        }
    }

    public static void main(String[] args) {
        //
        SparkConf conf = new SparkConf().setAppName("Spark Mysql").setMaster("local[*]");
        JavaSparkContext sc = new JavaSparkContext(conf);
        long s1;
        try (SparkSession spark = SparkSession.builder().config(conf).getOrCreate()) {
            sc.setLogLevel("ERROR");
            String partitionNums = "20";
            Map<String, String> readProps = getBasicProps();
            readProps.put(JDBCOptions.JDBC_TABLE_NAME(), "(select cast(a.order_code as UNSIGNED ) as proxy_batch_id, a.* from ec_oms_order a limit 1000) as ec_oms_order_encrypt_test");
            readProps.put(JDBCOptions.JDBC_PARTITION_COLUMN(), "proxy_batch_id");
            readProps.put(JDBCOptions.JDBC_NUM_PARTITIONS(), partitionNums);
            readProps.put(JDBCOptions.JDBC_BATCH_FETCH_SIZE(), "1000");
            readProps.put(JDBCOptions.JDBC_LOWER_BOUND(), "0");
            readProps.put(JDBCOptions.JDBC_UPPER_BOUND(), partitionNums);
            s1 = System.currentTimeMillis();
            Dataset<Row> dataset;
            dataset = spark.read().format("jdbc").options(readProps).load();
            dataset.printSchema();
            List<Row> rows = dataset.collectAsList();
            if (rows.isEmpty()) {
                log.warn("源表数据为空，不进行新增表和数据");
            }
            System.out.println(rows);
//            Map<String, String> writeProps = getBasicProps();
//            writeProps.put("dbtable", "ec_oms_order_encrypt_test");
//            dataset.write().format("jdbc").options(writeProps).mode(SaveMode.Overwrite).save();
            long s2 = System.currentTimeMillis();
            System.out.println(s2 - s1);
        }

    }

    private static Map<String, String> getBasicProps() {
        Map<String, String> prop;
        prop = new HashMap<>(16);
        prop.put("user", "sharding");
        prop.put("password", "HGbZYrqlpr25");
        prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://192.168.234.8:4401/ec_order?useUnicode=true&useSSL=false&characterEncoding=utf-8";
        prop.put(JDBCOptions.JDBC_URL(), url);
        return prop;
    }

    private static Map<String, String> getBasicTestProps() {
        Map<String, String> prop;
        prop = new HashMap<>(16);
        prop.put("user", "ds_sync_struct");
        prop.put("password", "JmMBtXTz");
        prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://192.168.234.4:3304/db_for_sharding_0?useUnicode=true&useSSL=false&characterEncoding=utf-8";
        prop.put(JDBCOptions.JDBC_URL(), url);
        return prop;
    }



}
