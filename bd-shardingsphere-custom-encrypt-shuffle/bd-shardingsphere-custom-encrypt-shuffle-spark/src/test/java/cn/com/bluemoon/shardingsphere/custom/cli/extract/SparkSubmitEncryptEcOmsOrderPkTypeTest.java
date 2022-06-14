package cn.com.bluemoon.shardingsphere.custom.cli.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.util.*;

/**
 * 上线前修补历史数据单
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitEncryptEcOmsOrderPkTypeTest {

    @Test
    public void TestDecimalZeroScalePk() {
        GlobalConfig config = GetPkDecimalZeroScaleGlobalConfig();
        // 转换
        String json = GlobalConfigSwapper.swapToJsonStr(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        SparkEncryptShuffleCli.main(new String[]{"-c " + json, config.getRuleTableName()});
    }

    @Test
    public void TestAutoIncrementPK() {
        GlobalConfig config = GetPkAutoIncrementGlobalConfig();
        // 转换
        String json = GlobalConfigSwapper.swapToJsonStr(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        SparkEncryptShuffleCli.main(new String[]{"-c " + json, config.getRuleTableName()});
    }
    @Test
    public void TestSnowflakeLongPK() {
        GlobalConfig config = GetSnowflakeLongPKGlobalConfig();
        // 转换
        String json = GlobalConfigSwapper.swapToJsonStr(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        SparkEncryptShuffleCli.main(new String[]{"-c " + json, config.getRuleTableName()});
    }


    @Test
    public void TestSnowflakeStrPK() {
        GlobalConfig config = GetSnowflakeStrPKGlobalConfig();
        // 转换
        String json = GlobalConfigSwapper.swapToJsonStr(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        SparkEncryptShuffleCli.main(new String[]{"-c " + json, config.getRuleTableName()});
    }

    @Test
    public void TestUUIDStrPK() {
        GlobalConfig config = GetUUIDStrPKtGlobalConfig();
        // 转换
        String json = GlobalConfigSwapper.swapToJsonStr(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        SparkEncryptShuffleCli.main(new String[]{"-c " + json, config.getRuleTableName()});
    }

    private GlobalConfig GetUUIDStrPKtGlobalConfig() {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "data_asset_platform";
        final String tableName = "dap_data_model_pk_uuid";

        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setDbType(GlobalConfig.MYSQL);
        config.setDbName(dbName);
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("id"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));

        // 加密
        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple1 = new GlobalConfig.Tuple2<>();
        tuple1.setT1(new GlobalConfig.FieldInfo("name"));
        tuple1.setT2(new GlobalConfig.FieldInfo("name_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple1);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithPersistStateCustomWhere);
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>() {{
            add("update_time");
        }});
        // 新建配置定义，优化抽取性能
        config.setOpenPartitionPkTypeGuess(true);
        config.setAdviceNumberPartition(50);
        return config;
    }


    private GlobalConfig GetSnowflakeLongPKGlobalConfig() {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "data_asset_platform";
        final String tableName = "dap_data_model_pk_snowflake_bigint";

        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setDbType(GlobalConfig.MYSQL);
        config.setDbName(dbName);
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("id"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));

        // 加密
        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple1 = new GlobalConfig.Tuple2<>();
        tuple1.setT1(new GlobalConfig.FieldInfo("name"));
        tuple1.setT2(new GlobalConfig.FieldInfo("name_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple1);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithPersistStateCustomWhere);
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>() {{
            add("update_time");
        }});
        // 新建配置定义，优化抽取性能
        config.setOpenPartitionPkTypeGuess(true);
        config.setAdviceNumberPartition(50);
        return config;
    }
    private GlobalConfig GetSnowflakeStrPKGlobalConfig() {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "data_asset_platform";
        final String tableName = "dap_data_model_pk_snowflake_str";

        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setDbType(GlobalConfig.MYSQL);
        config.setDbName(dbName);
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("id"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));

        // 加密
        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple1 = new GlobalConfig.Tuple2<>();
        tuple1.setT1(new GlobalConfig.FieldInfo("name"));
        tuple1.setT2(new GlobalConfig.FieldInfo("name_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple1);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithPersistStateCustomWhere);
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>() {{
            add("update_time");
        }});
        // 新建配置定义，优化抽取性能
        config.setOpenPartitionPkTypeGuess(true);
        config.setAdviceNumberPartition(50);
        return config;
    }


    private static GlobalConfig GetPkDecimalZeroScaleGlobalConfig() {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "ec_order_sandbox";
        final String tableName = "ec_oms_order";

        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setDbType(GlobalConfig.MYSQL);
        config.setDbName(dbName);
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("order_code")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("order_code"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));

        // 加密
        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple1 = new GlobalConfig.Tuple2<>();
        tuple1.setT1(new GlobalConfig.FieldInfo("address_plain"));
        tuple1.setT2(new GlobalConfig.FieldInfo("address", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple1);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple2 = new GlobalConfig.Tuple2<>();
        tuple2.setT1(new GlobalConfig.FieldInfo("receiver_mobile_plain"));
        tuple2.setT2(new GlobalConfig.FieldInfo("receiver_mobile", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple2);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple3 = new GlobalConfig.Tuple2<>();
        tuple3.setT1(new GlobalConfig.FieldInfo("receiver_name_plain"));
        tuple3.setT2(new GlobalConfig.FieldInfo("receiver_name", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple3);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple4 = new GlobalConfig.Tuple2<>();
        tuple4.setT1(new GlobalConfig.FieldInfo("receiver_phone_plain"));
        tuple4.setT2(new GlobalConfig.FieldInfo("receiver_phone", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple4);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithPersistStateCustomWhere);
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>() {{
            add("last_update_time");
        }});
        // 新建配置定义，优化抽取性能
        config.setOpenPartitionPkTypeGuess(true);
        config.setAdviceNumberPartition(200);
//        config.setResetJobState(true);
        return config;
    }

    private GlobalConfig GetPkAutoIncrementGlobalConfig() {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "data_asset_platform";
        final String tableName = "dap_data_model_pk_auto_increment";

        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setDbType(GlobalConfig.MYSQL);
        config.setDbName(dbName);
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("id"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));

        // 加密
        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple1 = new GlobalConfig.Tuple2<>();
        tuple1.setT1(new GlobalConfig.FieldInfo("name"));
        tuple1.setT2(new GlobalConfig.FieldInfo("name_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple1);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithPersistStateCustomWhere);
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>() {{
            add("update_time");
        }});
        // 新建配置定义，优化抽取性能
        config.setOpenPartitionPkTypeGuess(true);
        config.setAdviceNumberPartition(50);
        return config;
    }
}
