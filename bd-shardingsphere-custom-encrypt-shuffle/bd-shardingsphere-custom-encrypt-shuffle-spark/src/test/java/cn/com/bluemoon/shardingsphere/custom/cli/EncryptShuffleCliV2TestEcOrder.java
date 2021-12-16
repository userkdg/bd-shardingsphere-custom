package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ShuffleMode;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptShuffleCliV2;
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
public class EncryptShuffleCliV2TestEcOrder {
    private String[] args;

    @Before
    public void setUp() throws Exception {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.7:3306/ec_order?user=shproxy_morder&password=9kD6sN4qMIwN");
        config.setTargetUrl("jdbc:mysql://192.168.234.7:3306/ec_order?user=shproxy_morder&password=9kD6sN4qMIwN");
        String tableName = "ec_oms_order";
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new EncryptGlobalConfig.FieldInfo("order_code")
        ));
        config.setPartitionCol(new EncryptGlobalConfig.FieldInfo("create_time"));
        config.setOnYarn(false);
        config.setJobName("bd-spark-encrypt-shuffle-" + tableName);
        Properties props = new Properties();
        props.put("aes-key-value", "wlf1d5mmal2xsttr");
        config.setPlainCols(
                Arrays.asList(
                        new EncryptGlobalConfig.FieldInfo("address", new EncryptGlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setShuffleMode(ShuffleMode.ReShuffle);
        String json = EncryptGlobalConfigSwapper.gson.toJson(config);
        log.debug("mock json example:{}", json);
        config.setMultiBatchUrlConfig(true);
        EncryptGlobalConfig encryptGlobalConfig = EncryptGlobalConfigSwapper.swapToConfig(json);
        log.debug("json to bean:{}", encryptGlobalConfig);
        this.args = new String[]{"-c " + json};
    }


    @SneakyThrows
    @Test
    public void test() {
        EncryptShuffleCliV2.main(args);
        TimeUnit.MINUTES.sleep(10);
    }
}
