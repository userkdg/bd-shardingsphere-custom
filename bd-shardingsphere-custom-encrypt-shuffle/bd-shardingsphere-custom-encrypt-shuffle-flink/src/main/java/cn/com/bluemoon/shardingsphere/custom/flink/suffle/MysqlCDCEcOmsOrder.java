package cn.com.bluemoon.shardingsphere.custom.flink.suffle;

import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.EnvironmentSettings;
import org.apache.flink.table.api.TableResult;
import org.apache.flink.table.api.TableSchema;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.apache.flink.types.Row;
import org.apache.flink.util.CloseableIterator;

public class MysqlCDCEcOmsOrder {
    public static void main(String[] args) throws Exception {
        // 构建执行环境
        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
//        env.enableCheckpointing(60000);
        EnvironmentSettings build = EnvironmentSettings.newInstance().useBlinkPlanner().inStreamingMode().build();
        StreamTableEnvironment tableEnv = StreamTableEnvironment.create(env, build);

        // 创建MySQL CDC表
        tableEnv.executeSql(Constants.REGISTER_CDC_TABLE);

        TableResult tableResult = tableEnv.executeSql("select * from express limit 10");
//        TableSchema tableSchema = tableResult.getTableSchema();
//        String[] fieldNames = tableSchema.getFieldNames();
        CloseableIterator<Row> res = tableResult.collect();
        res.forEachRemaining((row -> {
            System.out.println(row);
        }));
        tableEnv.execute("Test MySQL CDC");
    }

    public static class Constants {

        // 定义Flink SQL CDC table
        public final static String REGISTER_CDC_TABLE = "create table express (\n" +
                " data_id string," +
                " pk_express_id bigint," +
                " express_code bigint," +
                " express_name string," +
                " start_time string," +
                " end_time string," +
                " etl_datetime timestamp" +
                ") with (" +
                "'connector' = 'mysql-cdc'," +
                "'scan.startup.mode' = 'initial'," +
                "'hostname' = '192.168.234.7'," +
                "'port' = '3306'," +
                "'username' = 'canal'," +
                "'password' = 'canal'," +
                "'server-time-zone' = 'Asia/Shanghai'," +
                "'database-name' = 'ec_order'," +
                "'table-name' = 'dim_ec_ldp_express_test'" +
                ")";
    }
}
