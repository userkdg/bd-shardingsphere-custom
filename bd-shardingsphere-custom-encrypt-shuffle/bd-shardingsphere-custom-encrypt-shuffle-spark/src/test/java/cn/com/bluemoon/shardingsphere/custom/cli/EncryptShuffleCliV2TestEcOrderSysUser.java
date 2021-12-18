package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.util.Arrays;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class EncryptShuffleCliV2TestEcOrderSysUser {
    private String[] args;

    @Before
    public void setUp() throws Exception {
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
        Properties props = new Properties();
        props.put("aes-key-value", "wlf1d5mmal2xsttr");
        config.setExtractCols(
                Arrays.asList(
                        new GlobalConfig.FieldInfo("phone", new GlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setExtractMode(ExtractMode.WithIncField);
        config.setIncrTimestampCol("op_time");
        config.setMultiBatchUrlConfig(true);
        String json = GlobalConfigSwapper.gson.toJson(config);
        log.debug("mock json example:{}", json);
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", globalConfig);
        this.args = new String[]{"-c " + json, tableName};
    }


    @SneakyThrows
    @Test
    public void test() {
        SparkEncryptShuffleCli.main(args);
        TimeUnit.MINUTES.sleep(10);
    }
}
