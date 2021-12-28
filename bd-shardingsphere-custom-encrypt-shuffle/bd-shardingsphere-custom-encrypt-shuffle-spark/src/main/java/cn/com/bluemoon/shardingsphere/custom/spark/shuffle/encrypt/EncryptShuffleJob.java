package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleJob;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
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
public class EncryptShuffleJob extends BaseShuffleJob implements EncryptShuffle {
    public static final String CIPHER_SUFFIX = System.getProperty("cipher.suffix", "_cipher");

    public EncryptShuffleJob(GlobalConfig config) {
        super(config);
    }

    public static String encryptFieldName(String plainName) {
        return plainName + CIPHER_SUFFIX;
    }

    @Override
    public void init() {
        super.init();
        boolean hadEncryptRule = config.internalGetTargetCols().stream().allMatch(f -> f.getEncryptRule() != null && f.getEncryptRule().getType() != null);
        Assert.isTrue(hadEncryptRule, "必须指定明文列的加密算法信息");
    }

    @Override
    protected void doShuffle0(Dataset<InternalMap> df, StructType schema, GlobalConfig globalConfig) {

    }

    @Override
    protected void doShuffle(JavaRDD<Map<String, Object>> javaRDD, StructType schema, GlobalConfig globalConfig) {
        javaRDD
                .mapPartitions(new EncryptFlatMapFunction(globalConfigBroadcast))
                .foreachPartition(new EncryptForeachPartitionFunction(schema, globalConfigBroadcast));
    }
}
