package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

/**
 * @author Jarod.Kong
 */
public interface EncryptShuffle extends ShardingSphereShuffle {
    public void init(EncryptGlobalConfig paramConfig);

    public void finish();
}
