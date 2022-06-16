package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkDecryptShuffleCli;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.util.*;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class DecryptShuffleEcOrderOmsB2BClientStoreHouseTest {
    private String[] args;

    @Before
    public void setUp() throws Exception {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "ec_order";
        final String tableName = "oms_b2b_client_storehouse";
        config.setDbType(GlobalConfig.MYSQL);
        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.8:4401/%s?user=sharding&password=HGbZYrqlpr25", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.8:4401/%s?user=sharding&password=HGbZYrqlpr25", dbName));
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new GlobalConfig.FieldInfo("client_storehouse_code")
        ));
        config.setPartitionCol(new GlobalConfig.FieldInfo("client_storehouse_code"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-decrypt-shuffle-%s-%s", dbName, tableName));

        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
//        Properties targetProps = new Properties();
//        targetProps.put("aes-key-value", "wlf1d5mmal2xstta");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple2 = new GlobalConfig.Tuple2<>();
        tuple2.setT1(new GlobalConfig.FieldInfo("charge_phone_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        tuple2.setT2(new GlobalConfig.FieldInfo("charge_phone_plain"));
        shuffleCols.add(tuple2);
        config.setShuffleCols(shuffleCols);

        config.setExtractMode(ExtractMode.WithIncField);
        config.setIncrTimestampCol("changed_time");
        config.setOnUpdateCurrentTimestamps(new ArrayList<String>(){{
            add("changed_time");
        }});
        config.setMultiBatchUrlConfig(true);
        String json = GlobalConfigSwapper.swapToJsonStr(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        this.args = new String[]{"-c " + json, tableName};
    }


    @SneakyThrows
    @Test
    public void test() {
        SparkDecryptShuffleCli.main(args);

    }
}
