package cn.com.bluemoon.shardingsphere.custom.cli.spark;


import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FilterFunction;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.sql.Column;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;

import java.sql.*;
import java.util.*;

/**
 * 1.源端配置连接
 * 2.代理库配置连接
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkJdbcUtilsTest {
    public static void main(String[] args) {
        SparkConf conf = new SparkConf().setAppName("Spark MySQL").setMaster("local[*]");
        JavaSparkContext sc = new JavaSparkContext(conf);
        long s1;
        try (SparkSession spark = SparkSession.builder().config(conf).getOrCreate()) {
            sc.setLogLevel("ERROR");
            String partitionNums = "5";
            Map<String, String> readProps = getBasicSourceProps();
            readProps.put(JDBCOptions.JDBC_TABLE_NAME(), "t_user_info_encrypt_v3");
            readProps.put(JDBCOptions.JDBC_PARTITION_COLUMN(), "id");
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
            log.debug("{}", rows);

//            log.info("新增规则");
//            mockUpsertEncryptRule("t_user_info_encrypt_v3");
//            log.info("新增表入库");
//            Map<String, String> writeProps = getBasicTestProps();
//            writeProps.put("dbtable", "t_user_info_encrypt_v3_encrypt");
//            dataset.write().format("jdbc").options(writeProps).mode(SaveMode.Overwrite).save();
            log.info("更新源表");
            dataset.filter(new FilterFunction<Row>() {
                @Override
                public boolean call(Row row) throws Exception {
                    Object account = row.getAs("..");
                    Object password = row.getAs("password");
                    return Objects.nonNull(account) || Objects.nonNull(password);
                }
            })
                    .repartition(10, new Column("id"))
                    .foreachPartition(new ForeachPartitionFunction<Row>() {
                        @Override
                        public void call(Iterator<Row> its) throws Exception {
                            update(its);
                        }
                    });
            long s2 = System.currentTimeMillis();
            System.out.println(s2 - s1);
        }
    }

    private static void update(Iterator<Row> its) throws SQLException {
        try (Connection conn = getConnection(getBasicSinkProps())) {
            String sql = "update t_user_info_encrypt_v3 set account=?, password=? where id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                while (its.hasNext()) {
                    Row row = its.next();
                    // 类型问题
                    ps.setObject(1, row.getAs("account"), JDBCType.VARCHAR);
                    ps.setObject(2, row.getAs("password"), JDBCType.VARCHAR);
                    ps.setObject(3, row.getAs("id"), JDBCType.INTEGER);
                    ps.addBatch();
                }
                ps.executeBatch();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static Connection getConnection(Map<String, String> basicTestProps) throws SQLException {
        Connection conn = DriverManager.getConnection(basicTestProps.get(JDBCOptions.JDBC_URL()));
        return conn;
    }

    private static Map<String, String> getBasicSourceProps() {
        Map<String, String> prop;
        prop = new HashMap<>(16);
        prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&useSSL=false&characterEncoding=utf-8";
        prop.put(JDBCOptions.JDBC_URL(), url);
        return prop;
    }

    private static Map<String, String> getBasicSinkProps() {
        Map<String, String> prop;
        prop = new HashMap<>(16);
        prop.put(JDBCOptions.JDBC_DRIVER_CLASS(), "com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://192.168.243.34:23308/db_for_sharding?user=root&password=root&useUnicode=true&useSSL=false&characterEncoding=utf-8";
        prop.put(JDBCOptions.JDBC_URL(), url);
        return prop;
    }
}
