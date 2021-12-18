package cn.com.bluemoon.encrypt.shuffle.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
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
        GlobalConfig config = new GlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        config.setTargetUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        String tableName = "t_user_info_encrypt_v3";
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("id"));
        config.setOnYarn(true);
        config.setJobName("bd-spark-encrypt-shuffle-" + tableName);
        Properties props = new Properties();
        props.put("aes-key-value", "123456abc");
        config.setExtractCols(
                Arrays.asList(
                        new GlobalConfig.FieldInfo("password", new GlobalConfig.EncryptRule("AES", props)),
                        new GlobalConfig.FieldInfo("account", new GlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setExtractMode(ExtractMode.All);
        config.setMultiBatchUrlConfig(true);
        String json = GlobalConfigSwapper.gson.toJson(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        exampleArg = json;
        jobName = tableName;
    }

    public static void main(String[] args) {
        SparkSubmitMain.main(new String[]{exampleArg, jobName});
    }
}
