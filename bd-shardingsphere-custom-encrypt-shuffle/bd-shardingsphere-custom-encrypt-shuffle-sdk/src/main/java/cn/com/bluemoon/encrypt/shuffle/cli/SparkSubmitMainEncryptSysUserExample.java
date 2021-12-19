package cn.com.bluemoon.encrypt.shuffle.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import lombok.extern.slf4j.Slf4j;

import java.util.*;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitMainEncryptSysUserExample {
    private static String exampleArg = "";
    private static String jobName = "";

    static {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "ec_order";
        final String tableName = "sys_user";
        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.8:4401/%s?user=sharding&password=HGbZYrqlpr25", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.8:4401/%s?user=sharding&password=HGbZYrqlpr25", dbName));
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("id")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("id"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));

        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple2 = new GlobalConfig.Tuple2<>();
        tuple2.setT1(new GlobalConfig.FieldInfo("phone"));
        tuple2.setT2(new GlobalConfig.FieldInfo("phone_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple2);
        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithIncField);
        config.setIncrTimestampCol("op_time");
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
