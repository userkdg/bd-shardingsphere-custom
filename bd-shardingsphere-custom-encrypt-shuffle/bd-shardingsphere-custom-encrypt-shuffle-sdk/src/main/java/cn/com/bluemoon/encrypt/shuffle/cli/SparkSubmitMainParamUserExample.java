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
public class SparkSubmitMainParamUserExample {
    private static String exampleArg = "";
    private static String jobName = "";

    static {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        final String dbName = "ec_order";
        final String tableName = "sys_user";
        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.8:4401/%s?user=sharding&password=HGbZYrqlpr25", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.8:4401/%s?user=sharding&password=HGbZYrqlpr25", dbName));
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new EncryptGlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new EncryptGlobalConfig.FieldInfo("id"));
        config.setOnYarn(true);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));
        Properties props = new Properties();
        props.put("aes-key-value", "wlf1d5mmal2xsttr");
        config.setPlainCols(
                Arrays.asList(
                        new EncryptGlobalConfig.FieldInfo("phone", new EncryptGlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setExtractMode(ExtractMode.WithIncrTimestamp);
        config.setIncrTimestampCol("op_time");
        String json = EncryptGlobalConfigSwapper.gson.toJson(config);
        log.debug("mock json example:{}", json);
        config.setMultiBatchUrlConfig(true);
        EncryptGlobalConfig encryptGlobalConfig = EncryptGlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", encryptGlobalConfig);
        exampleArg = json;
        jobName = tableName;
    }

    public static void main(String[] args) {
        SparkSubmitMain.main(new String[]{exampleArg, jobName});
    }
}
