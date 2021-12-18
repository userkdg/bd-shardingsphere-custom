package cn.com.bluemoon.encrypt.shuffle.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import lombok.extern.slf4j.Slf4j;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Properties;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitEncryptEcOmsOrderExample {
    private static String exampleArg = "";
    private static String jobName = "";

    static {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "ec_order";
        final String tableName = "ec_oms_order";
        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.7:3306/%s?user=shproxy_morder&password=9kD6sN4qMIwN", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.7:3306/%s?user=shproxy_morder&password=9kD6sN4qMIwN", dbName));
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("order_code")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("order_code"));
        config.setOnYarn(true);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));
        Properties props = new Properties();
        props.put("aes-key-value", "wlf1d5mmal2xsttr");
        config.setShuffleCols(new LinkedHashMap<String, GlobalConfig.FieldInfo>() {{
            put("address", new GlobalConfig.FieldInfo("address_cipher", new GlobalConfig.EncryptRule("AES", props)));
            put("receiver_mobile", new GlobalConfig.FieldInfo("receiver_mobile_cipher", new GlobalConfig.EncryptRule("AES", props)));
            put("receiver_name", new GlobalConfig.FieldInfo("receiver_name_cipher", new GlobalConfig.EncryptRule("AES", props)));
        }});
        config.setExtractMode(ExtractMode.WithIncField);
        config.setIncrTimestampCol("last_update_time");
        config.setMultiBatchUrlConfig(true);
        String json = GlobalConfigSwapper.gson.toJson(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        exampleArg = json;
        jobName = tableName;
    }

    public static void main(String[] args) {
        SparkSubmitEncryptShuffleMain.main(new String[]{exampleArg, jobName});
    }
}
