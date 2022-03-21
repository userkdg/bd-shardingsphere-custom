package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig.FieldInfo;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
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
public class ReEncryptShuffleEcOrderOmsB2bClientStorehouseTest {
    private String[] args;

    @Before
    public void setUp() throws Exception {
        GlobalConfig config = new GlobalConfig();
        final String dbName = "ec_order_sandbox";
        final String tableName = "oms_b2b_client_storehouse";
        config.setDbName(dbName);
        config.setDbType(GlobalConfig.MYSQL);
        config.setSourceUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz", dbName));
        config.setTargetUrl(String.format("jdbc:mysql://192.168.234.4:3304/%s?user=ds_sync_struct&password=JmMBtXTz", dbName));
        config.setRuleTableName(tableName);
        config.setPrimaryCols(Arrays.asList(
                new FieldInfo("client_storehouse_code")
        ));
        config.setPartitionCol(new FieldInfo("client_storehouse_code"));
        config.setOnYarn(false);
        config.setJobName(String.format("bd-spark-encrypt-shuffle-%s-%s", dbName, tableName));
        Properties sourceProps = new Properties();
        sourceProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        Properties targetProps = new Properties();
        targetProps.put("aes-key-value", "wlf1d5mmal2xssaa");
        List<GlobalConfig.Tuple3<FieldInfo>> reShuffleCols = new LinkedList<>();
        GlobalConfig.Tuple3<FieldInfo> tuple3 = new GlobalConfig.Tuple3<FieldInfo>();
        // 主要1 2 3是否设置加密
        // 1密文（有加密规则）需要设置
        // 2明文没有加密规则，不用设置
        // 3密文（需要加密），需要设置
        // 也就是密文列都要设置对应的加密规则
        tuple3.setT1(new FieldInfo("charge_phone", new GlobalConfig.EncryptRule("AES", sourceProps)));
        tuple3.setT2(new FieldInfo("charge_phone"));
        tuple3.setT3(new FieldInfo("charge_phone", new GlobalConfig.EncryptRule("AES", targetProps)));
        reShuffleCols.add(tuple3);
        config.setReShuffleCols(reShuffleCols);

        // 在增量中存在重复加密问题（由于增量字段，在更新数据时更新了增量最大值，导致重复获取被加密的数据，再加密的时候报错！）。
        // 如果一定要走增量重加密，可以首次用spark解密完成后，再进行spark加密，两个步骤都独立执行，就可以避免反复拉取更新数据的问题
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
        SparkReEncryptShuffleCli.main(args);
    }
}
