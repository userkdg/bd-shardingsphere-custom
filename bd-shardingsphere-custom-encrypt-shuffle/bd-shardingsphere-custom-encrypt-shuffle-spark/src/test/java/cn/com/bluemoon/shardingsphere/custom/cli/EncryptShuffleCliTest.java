package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.ShardingProxyEncryptShuffleCli;
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
        GlobalConfig config = new GlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.8:4401/ec_order?user=sharding&password=HGbZYrqlpr25");
        config.setTargetUrl("jdbc:mysql://192.168.243.34:23308/ec_order_db?user=root&password=root");
        config.setRuleTableName("ec_oms_order");
        config.setPrimaryCols(Lists.newArrayList(
                new GlobalConfig.FieldInfo("order_code")
//                ,new EncryptGlobalConfig.FieldInfo("id")
        ));
        config.setOnYarn(false);
        config.setJobName("电商洗数-ec_order");
        config.setExtractCols(
                Lists.newArrayList(
                        new GlobalConfig.FieldInfo("receiver_name"),
                        new GlobalConfig.FieldInfo("receiver_mobile"),
                        new GlobalConfig.FieldInfo("address")
                )
        );
        config.setExtractMode(ExtractMode.All);
        String json = GlobalConfigSwapper.gson.toJson(config);
        System.out.println(json);
        GlobalConfig configEq = GlobalConfigSwapper.swapToConfig(json);
        this.args = new String[]{"-c=" + json};
    }

    @Test
    public void test() {
        ShardingProxyEncryptShuffleCli.main(args);
    }
}
