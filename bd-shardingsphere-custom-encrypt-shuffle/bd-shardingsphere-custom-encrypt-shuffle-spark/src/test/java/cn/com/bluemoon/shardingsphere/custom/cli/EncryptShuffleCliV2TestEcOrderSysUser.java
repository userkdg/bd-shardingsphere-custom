package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfigSwapper;
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
        config.setOnYarn(false);
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
        config.setMultiBatchUrlConfig(true);
        String json = EncryptGlobalConfigSwapper.gson.toJson(config);
        log.debug("mock json example:{}", json);
        EncryptGlobalConfig encryptGlobalConfig = EncryptGlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", encryptGlobalConfig);
        this.args = new String[]{"-c " + json, tableName};
    }


    @SneakyThrows
    @Test
    public void test() {
        SparkEncryptShuffleCli.main(args);
        TimeUnit.MINUTES.sleep(10);
    }
}
