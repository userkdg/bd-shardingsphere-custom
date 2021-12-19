//package cn.com.bluemoon.shardingsphere.custom.cli;
//
//import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
//import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
//import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
//import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli;
//import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.Before;
//import org.junit.Test;
//
//import java.util.Arrays;
//import java.util.LinkedHashMap;
//import java.util.Properties;
//import java.util.concurrent.TimeUnit;
//
///**
// * @author Jarod.Kong
// */
//@Slf4j
//public class EncryptShuffleCliV2TestEcOrder {
//    private String[] args;
//
//    @Before
//    public void setUp() throws Exception {
//        GlobalConfig config = new GlobalConfig();
//        config.setSourceUrl("jdbc:mysql://192.168.234.7:3306/ec_order?user=shproxy_morder&password=9kD6sN4qMIwN");
//        config.setTargetUrl("jdbc:mysql://192.168.234.7:3306/ec_order?user=shproxy_morder&password=9kD6sN4qMIwN");
//        String tableName = "ec_oms_order";
//        config.setRuleTableName(tableName);
//        config.setPrimaryCols(Arrays.asList(
//                new GlobalConfig.FieldInfo("order_code")
//        ));
//        config.setPartitionCol(new GlobalConfig.FieldInfo("order_code"));
//        config.setOnYarn(false);
//        config.setJobName("bd-spark-encrypt-shuffle-" + tableName);
//        Properties props = new Properties();
//        props.put("aes-key-value", "wlf1d5mmal2xsttr");
//        config.setShuffleCols(new LinkedHashMap<String, GlobalConfig.FieldInfo>(){{
//            put("address", new GlobalConfig.FieldInfo("address_cipher", new GlobalConfig.EncryptRule("AES", props)));
//        }});
//        config.setExtractMode(ExtractMode.All);
//        config.setMultiBatchUrlConfig(true);
//        String json = GlobalConfigSwapper.gson.toJson(config);
//        log.debug("mock json example:{}", json);
//        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
//        log.debug("json to bean:{}", globalConfig);
//        this.args = new String[]{"-c " + json};
//    }
//
//
//    @SneakyThrows
//    @Test
//    public void test() {
//        SparkEncryptShuffleCli.main(args);
//
//    }
//}
