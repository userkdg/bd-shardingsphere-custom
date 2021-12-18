package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import com.google.common.collect.Lists;
import lombok.SneakyThrows;
import org.junit.Before;
import org.junit.Test;

import java.util.Properties;
import java.util.concurrent.TimeUnit;

/**
 * @author Jarod.Kong
 */
public class EncryptShuffleCliV2Test {
    private String[] args;

    @Before
    public void setUp() throws Exception {
        GlobalConfig config = new GlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        config.setTargetUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        config.setRuleTableName("t_user_info_encrypt_v3");
        config.setPrimaryCols(Lists.newArrayList(
                new GlobalConfig.FieldInfo("id")
//                ,new EncryptGlobalConfig.FieldInfo("id")
                ));
        config.setOnYarn(false);
        config.setJobName("bd-spark-encrypt-shuffle-t_user_info_encrypt_v3");
        Properties props = new Properties();
        props.put("aes-key-value", "123456abc");
        config.setExtractCols(
                Lists.newArrayList(
                        new GlobalConfig.FieldInfo("password", new GlobalConfig.EncryptRule("AES", props)),
                        new GlobalConfig.FieldInfo("account", new GlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setExtractMode(ExtractMode.All);
        config.setMultiBatchUrlConfig(true);
        String json = GlobalConfigSwapper.gson.toJson(config);
        System.out.println(json);
        GlobalConfig configEq = GlobalConfigSwapper.swapToConfig(json);
        this.args = new String[]{"-c " + json};
    }


    @SneakyThrows
    @Test
    public void test() {
        SparkEncryptShuffleCli.main(args);

    }
}
