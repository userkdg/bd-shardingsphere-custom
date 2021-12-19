package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkEncryptShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.SparkReEncryptShuffleCli;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.util.*;

/**
 * 重加密
 * 说明：对已加密数据进行修改密文
 * 密文->明文->重新加密->密文
 *
 * @author Jarod.Kong
 */
@Slf4j
public class ReEncryptShuffleEcOrderSysUserTest {
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
        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        Properties targetProps = new Properties();
        targetProps.put("aes-key-value", "wlf1d5mmal2xstta");
        List<GlobalConfig.Tuple2<GlobalConfig.FieldInfo>> shuffleCols = new LinkedList<>();
        GlobalConfig.Tuple2<GlobalConfig.FieldInfo> tuple2 = new GlobalConfig.Tuple2<>();
        tuple2.setT1(new GlobalConfig.FieldInfo("phone_cipher", new GlobalConfig.EncryptRule("AES", sourceProps)));
        tuple2.setT2(new GlobalConfig.FieldInfo("phone_cipher", new GlobalConfig.EncryptRule("AES", targetProps)));
        shuffleCols.add(tuple2);
        config.setShuffleCols(shuffleCols);
        // FIXME: 2021/12/19 目前重新只支持全量一次，在增量中存在重复加密问题（由于增量字段，在更新数据时更新了增量最大值，导致重复获取被加密的数据，再加密的时候报错！）。
        config.setExtractMode(ExtractMode.All);
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
        SparkReEncryptShuffleCli.main(args);

    }
}
