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
public class SparkSubmitDecryptEcOmsOrderExample {
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

        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple1 = new GlobalConfig.Tuple2<>();
        tuple1.setT1(new GlobalConfig.FieldInfo("address_cipher"));
        tuple1.setT2(new GlobalConfig.FieldInfo("address_plain", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple1);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple2 = new GlobalConfig.Tuple2<>();
        tuple2.setT1(new GlobalConfig.FieldInfo("receiver_mobile_cipher"));
        tuple2.setT2(new GlobalConfig.FieldInfo("receiver_mobile_plain", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple2);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple3 = new GlobalConfig.Tuple2<>();
        tuple3.setT1(new GlobalConfig.FieldInfo("receiver_name_cipher"));
        tuple3.setT2(new GlobalConfig.FieldInfo("receiver_name_plain", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple3);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithIncField);
        config.setIncrTimestampCol("last_update_time");
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>(){{
            add("last_update_time");
        }});
        String json = GlobalConfigSwapper.swapToJsonStr(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        exampleArg = json;
        jobName = tableName;
    }

    public static void main(String[] args) {
        SparkSubmitDecryptShuffleMain.main(new String[]{exampleArg, jobName});
    }
}
