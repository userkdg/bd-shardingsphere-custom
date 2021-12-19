package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.reencrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleJobGraceful;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt.DecryptFlatMapFunction;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptFlatMapFunction;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptForeachPartitionFunction;
import cn.hutool.core.lang.Assert;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.sql.types.StructType;

import java.util.Map;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public class ReEncryptShuffleJob extends BaseShuffleJobGraceful implements EncryptShuffle {
    public static final String CIPHER_SUFFIX = System.getProperty("cipher.suffix", "_cipher");

    public ReEncryptShuffleJob(GlobalConfig config) {
        super(config);
    }

    @Override
    public void init() {
        super.init();
        boolean hadEncryptRule = config.getExtractCols().stream().allMatch(f -> f.getEncryptRule() != null && f.getEncryptRule().getType() != null);
        Assert.isTrue(hadEncryptRule, "必须指定明文列的加密算法信息");
    }

    @Override
    public void doShuffle(JavaRDD<Map<String, Object>> javaRDD, StructType schema, GlobalConfig globalConfig) {
        javaRDD.mapPartitions(new DecryptFlatMapFunction(globalConfigBroadcast))
                .mapPartitions(new EncryptFlatMapFunction(globalConfigBroadcast))
                .foreachPartition(new EncryptForeachPartitionFunction(schema, globalConfigBroadcast));
    }

}
