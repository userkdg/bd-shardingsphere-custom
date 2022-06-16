package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * 上线前修补历史数据单
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitEncryptEcOmsOrderCustomOnlineBeforeTest {

    private static GlobalConfig GetGlobalConfig() {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "ec_order";
        final String tableName = "ec_oms_order";
        config.setSourceUrl(String.format("jdbc:mysql://192.168.50.152:3336/%s?user=data_app&password=03rEv28DpCud&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.50.152:3336/%s?user=data_app&password=03rEv28DpCud&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai", dbName));
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
        tuple1.setT1(new GlobalConfig.FieldInfo("address"));
        tuple1.setT2(new GlobalConfig.FieldInfo("address_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple1);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple2 = new GlobalConfig.Tuple2<>();
        tuple2.setT1(new GlobalConfig.FieldInfo("receiver_mobile"));
        tuple2.setT2(new GlobalConfig.FieldInfo("receiver_mobile_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple2);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple3 = new GlobalConfig.Tuple2<>();
        tuple3.setT1(new GlobalConfig.FieldInfo("receiver_name"));
        tuple3.setT2(new GlobalConfig.FieldInfo("receiver_name_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple3);

        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple4 = new GlobalConfig.Tuple2<>();
        tuple4.setT1(new GlobalConfig.FieldInfo("receiver_phone"));
        tuple4.setT2(new GlobalConfig.FieldInfo("receiver_phone_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        shuffleCols.add(tuple4);

        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.OtherCustom);
//        config.setCustomExtractWhereSql(" a.last_update_time >= '2019-01-01 00:00:00' and a.last_update_time < '2020-01-01 00:00:00' and (a.address_cipher is null or a.receiver_mobile_cipher is null)");
//        config.setCustomExtractWhereSql(" a.last_update_time >= '2020-01-01 00:00:00' and a.last_update_time < '2021-01-01 00:00:00' and (a.address_cipher is null or a.receiver_mobile_cipher is null)");
//        config.setCustomExtractWhereSql(" a.last_update_time >= '2021-01-01 00:00:00' and a.last_update_time < '2022-01-01 00:00:00' and (a.address_cipher is null or a.receiver_mobile_cipher is null)");
//        config.setCustomExtractWhereSql(" a.last_update_time >= '2022-01-01 00:00:00' and a.last_update_time < '2023-01-01 00:00:00' and (a.address_cipher is null or a.receiver_mobile_cipher is null)");
        config.setMultiBatchUrlConfig(true);
        // 增加避免刷库更新SQL中timestamp自动更新问题，会拿该原值数据回填
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>() {{
            add("last_update_time");
        }});
        return config;
    }

    public static void main(String[] args) {
        List<String> customSqls = new ArrayList<String>(){{
            add(" a.last_update_time < '2019-01-01 00:00:00' and a.receiver_mobile_cipher is null ");
            add(" a.last_update_time >= '2019-01-01 00:00:00' and a.last_update_time < '2020-01-01 00:00:00' and a.receiver_mobile_cipher is null ");
            add(" a.last_update_time >= '2020-01-01 00:00:00' and a.last_update_time < '2021-01-01 00:00:00' and a.receiver_mobile_cipher is null ");
            add(" a.last_update_time >= '2021-01-01 00:00:00' and a.last_update_time < '2022-01-01 00:00:00' and a.receiver_mobile_cipher is null ");
            add(" a.last_update_time >= '2022-01-01 00:00:00' and a.last_update_time < '2023-01-01 00:00:00' and a.receiver_mobile_cipher is null ");
        }};
        for (String customSql : customSqls) {
            GlobalConfig config = GetGlobalConfig();
            System.setProperty("ec.order.code.partition", "100");
            log.warn("动态配置ec.order.code.partition为{}", System.getProperty("ec.order.code.partition"));
            log.info("开始跑自定义查询：{}", customSql);
            config.setCustomExtractWhereSql(customSql);
            // 转换
            String json = GlobalConfigSwapper.swapToJsonStr(config);
            log.debug("mock json example:{}", json);
            GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
            log.debug("json to bean:{}", globalConfig);
            SparkEncryptShuffleCli.main(new String[]{"-c "+json, config.getRuleTableName()});
        }
        System.exit(0);
    }

    @Test
    public void testWhere() {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime p = LocalDateTime.of(2021, 9, 1, 0, 0);
        LocalDateTime r = LocalDateTime.of(2022, 3, 16, 0, 0);
        String start = String.format(" a.last_update_time < '%s' and a.receiver_mobile_cipher is null ", dateTimeFormatter.format(p));
        System.out.println(start);
        LocalDateTime curr = p;
        while (curr.compareTo(r) < 0){
            curr = p.plusDays(1);
            String currPartition = String.format("a.last_update_time >= '%s' and a.last_update_time < '%s' and a.receiver_mobile_cipher is null ",
                    p, curr);
            System.out.println(currPartition);
            p = curr;
        }
        String end = String.format(" a.last_update_time >= '%s' and a.receiver_mobile_cipher is null ", dateTimeFormatter.format(r));
        System.out.println(end);

    }
}
