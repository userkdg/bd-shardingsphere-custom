package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptShuffleCliV2;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.ShuffleMode;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfigSwapper;
import com.google.common.collect.Lists;
import org.junit.Before;
import org.junit.Test;

import java.util.Properties;

/**
 * @author Jarod.Kong
 */
public class EncryptShuffleCliV2Test {
    private String[] args;

    @Before
    public void setUp() throws Exception {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        config.setTargetUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz");
        config.setRuleTableName("t_user_info_encrypt_v3");
        config.setPrimaryCols(Lists.newArrayList(
                new EncryptGlobalConfig.FieldInfo("id")
//                ,new EncryptGlobalConfig.FieldInfo("id")
                ));
        config.setOnYarn(false);
        config.setJobName("电商洗数-t_user_info_encrypt_v3");
        Properties props = new Properties();
        props.put("aes-key-value", "123456abc");
        config.setPlainCols(
                Lists.newArrayList(
                        new EncryptGlobalConfig.FieldInfo("password", new EncryptGlobalConfig.EncryptRule("AES", props)),
                        new EncryptGlobalConfig.FieldInfo("account", new EncryptGlobalConfig.EncryptRule("AES", props))
                )
        );
        config.setShuffleMode(ShuffleMode.ReShuffle);
        String json = EncryptGlobalConfigSwapper.gson.toJson(config);
        System.out.println(json);
        config.setMultiBatchUrlConfig(true);
        EncryptGlobalConfig configEq = EncryptGlobalConfigSwapper.swapToConfig(json);
        this.args = new String[]{"-c=" + json};
    }

    @Test
    public void test() {
        EncryptShuffleCliV2.main(args);
    }
}
