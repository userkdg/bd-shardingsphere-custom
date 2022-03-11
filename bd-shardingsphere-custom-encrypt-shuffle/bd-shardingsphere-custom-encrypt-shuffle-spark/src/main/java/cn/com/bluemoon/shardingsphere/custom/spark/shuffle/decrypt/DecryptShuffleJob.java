package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleJob;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.DecryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.InternalMap;
import cn.hutool.core.lang.Assert;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.types.StructType;

import java.util.Map;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public class DecryptShuffleJob extends BaseShuffleJob implements DecryptShuffle {
    public static final String PLAIN_BAK_SUFFIX = System.getProperty("plain.bak.suffix", "_plain");

    public DecryptShuffleJob(GlobalConfig config) {
        super(config);
    }

    public static String wrapPlainBakFieldName(String colName) {
        return colName + PLAIN_BAK_SUFFIX;
    }

    @Override
    public void init() {
        super.init();
        boolean hadEncryptRule = config.internalGetExtractCols().stream().allMatch(f -> f.getEncryptRule() != null && f.getEncryptRule().getType() != null);
        Assert.isTrue(hadEncryptRule, "必须指定明文列的加密算法信息");
    }

    @Override
    protected void doShuffle(JavaRDD<Map<String, Object>> javaRDD, StructType schema, GlobalConfig globalConfig) {
        javaRDD
                .mapPartitions(new DecryptFlatMapFunction(globalConfigBroadcast))
                .foreachPartition(new DecryptForeachPartitionFunction(schema, globalConfigBroadcast));
    }
}
