package cn.com.bluemoon.encrypt.shuffle.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ShuffleMode;
import lombok.extern.slf4j.Slf4j;

import java.util.Arrays;
import java.util.Properties;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitMainParamExample {
    private static String jobName = "";
    private static String exampleArg = "";

    static {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        config.setTargetUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        config.setRuleTableName("t_user_info_encrypt_v3");
        config.setPrimaryCols(Arrays.asList(
                new EncryptGlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new EncryptGlobalConfig.FieldInfo("id"));
        config.setOnYarn(true);
        String tableName = "t_user_info_encrypt_v3";
        config.setJobName("bd-spark-encrypt-shuffle-" + tableName);
        Properties props = new Properties();
        props.put("aes-key-value", "123456abc");
        config.setPlainCols(
                Arrays.asList(
                        new EncryptGlobalConfig.FieldInfo("password", new EncryptGlobalConfig.EncryptRule("AES", props)),
                        new EncryptGlobalConfig.FieldInfo("account", new EncryptGlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setShuffleMode(ShuffleMode.ReShuffle);
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
