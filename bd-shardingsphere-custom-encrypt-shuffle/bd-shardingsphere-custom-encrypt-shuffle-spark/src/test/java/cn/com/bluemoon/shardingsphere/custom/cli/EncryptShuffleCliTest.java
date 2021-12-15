package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ShuffleMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfigSwapper;
import com.google.common.collect.Lists;
import org.junit.Before;
import org.junit.Test;

/**
 * @author Jarod.Kong
 */
public class EncryptShuffleCliTest {
    private String[] args;

    @Before
    public void setUp() throws Exception {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.8:4401/ec_order?user=sharding&password=HGbZYrqlpr25");
        config.setTargetUrl("jdbc:mysql://192.168.243.34:23308/ec_order_db?user=root&password=root");
        config.setRuleTableName("ec_oms_order");
        config.setPrimaryCols(Lists.newArrayList(
                new EncryptGlobalConfig.FieldInfo("order_code")
//                ,new EncryptGlobalConfig.FieldInfo("id")
                ));
        config.setOnYarn(false);
        config.setJobName("电商洗数-ec_order");
        config.setPlainCols(
                Lists.newArrayList(
                        new EncryptGlobalConfig.FieldInfo("receiver_name"),
                        new EncryptGlobalConfig.FieldInfo("receiver_mobile"),
                        new EncryptGlobalConfig.FieldInfo("address")
                )
        );
        config.setShuffleMode(ShuffleMode.OrNullShuffle);
        String json = EncryptGlobalConfigSwapper.gson.toJson(config);
        System.out.println(json);
        EncryptGlobalConfig configEq = EncryptGlobalConfigSwapper.swapToConfig(json);
        this.args = new String[]{"-c=" + json};
    }

    @Test
    public void test() {
        EncryptShuffleCli.main(args);
    }
}
