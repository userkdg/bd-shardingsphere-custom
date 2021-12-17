package cn.com.bluemoon.encrypt.shuffle.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import lombok.extern.slf4j.Slf4j;

import java.util.Arrays;
import java.util.Properties;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitMainParamEcOrderExample {
    private static String exampleArg = "";
    private static String jobName = "";

    static {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        final String dbName = "ec_order";
        final String tableName = "ec_oms_order";
        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.7:3306/%s?user=shproxy_morder&password=9kD6sN4qMIwN", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.7:3306/%s?user=shproxy_morder&password=9kD6sN4qMIwN", dbName));
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new EncryptGlobalConfig.FieldInfo("order_code")
        ));
        config.setPartitionCol(new EncryptGlobalConfig.FieldInfo("order_code"));
        config.setOnYarn(true);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));
        Properties props = new Properties();
        props.put("aes-key-value", "wlf1d5mmal2xsttr");
        config.setPlainCols(
                Arrays.asList(
                        new EncryptGlobalConfig.FieldInfo("address", new EncryptGlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setExtractMode(ExtractMode.WithIncrTimestamp);
        config.setIncrTimestampCol("last_update_time");
        config.setMultiBatchUrlConfig(true);
        String json = EncryptGlobalConfigSwapper.gson.toJson(config);
        log.debug("mock json example:{}", json);
        EncryptGlobalConfig encryptGlobalConfig = EncryptGlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", encryptGlobalConfig);
        exampleArg = json;
        jobName = tableName;
    }

    public static void main(String[] args) {
        SparkSubmitMain.main(new String[]{exampleArg, jobName});
    }
}
