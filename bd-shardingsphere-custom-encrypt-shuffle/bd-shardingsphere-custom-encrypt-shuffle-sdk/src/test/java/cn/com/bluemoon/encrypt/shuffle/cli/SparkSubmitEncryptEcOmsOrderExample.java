package cn.com.bluemoon.encrypt.shuffle.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.util.*;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitEncryptEcOmsOrderExample {
    public static final String PROXY_BATCH_ID = "proxy_batch_id";
    private static final List<String> partitions = new ArrayList<>();
    private static String exampleArg = "";
    private static String jobName = "";

    static {
        init();

        GlobalConfig config = new GlobalConfig();
        final String dbName = "ec_order";
        final String tableName = "ec_oms_order";
        config.setDbType(GlobalConfig.MYSQL);
        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.7:3306/%s?user=shproxy_morder&password=9kD6sN4qMIwN", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.7:3306/%s?user=shproxy_morder&password=9kD6sN4qMIwN", dbName));
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
        tuple1.setT1(new GlobalConfig.FieldInfo("address", new GlobalConfig.EncryptRule("AES", sourceProps)));
        tuple1.setT2(new GlobalConfig.FieldInfo("address_cipher"));
        shuffleCols.add(tuple1);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple2 = new GlobalConfig.Tuple2<>();
        tuple2.setT1(new GlobalConfig.FieldInfo("receiver_mobile", new GlobalConfig.EncryptRule("AES", sourceProps)));
        tuple2.setT2(new GlobalConfig.FieldInfo("receiver_mobile_cipher"));
        shuffleCols.add(tuple2);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple3 = new GlobalConfig.Tuple2<>();
        tuple3.setT1(new GlobalConfig.FieldInfo("receiver_name", new GlobalConfig.EncryptRule("AES", sourceProps)));
        tuple3.setT2(new GlobalConfig.FieldInfo("receiver_name_cipher"));
        shuffleCols.add(tuple3);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.All);
//        config.setIncrTimestampCol("last_update_time");
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>() {{
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
        SparkSubmitEncryptShuffleMain.main(new String[]{exampleArg, jobName});
    }

    public static void init() {
        BigDecimal r = new BigDecimal("2020220000000000000000000");
        BigDecimal p = new BigDecimal("1020190000000000000000000");
        BigDecimal sub = r.subtract(p);
        BigDecimal per = sub.divide(new BigDecimal("1000"));
        System.out.println(per.toPlainString());
        System.out.println(per.longValue());
        BigDecimal pre = p, curr = p;
        while (((curr = pre.add(per))).compareTo(r) < 0) {
            String part = String.format("%s < %s and %s >=%s", PROXY_BATCH_ID, curr.toPlainString(), PROXY_BATCH_ID, pre);
            System.out.println(part);
            partitions.add(part);
            pre = curr;
        }
        String part = String.format("%s >=%s", PROXY_BATCH_ID, pre);
        System.out.println(part);
        partitions.add(part);
        System.out.println(partitions.size());
    }
}
