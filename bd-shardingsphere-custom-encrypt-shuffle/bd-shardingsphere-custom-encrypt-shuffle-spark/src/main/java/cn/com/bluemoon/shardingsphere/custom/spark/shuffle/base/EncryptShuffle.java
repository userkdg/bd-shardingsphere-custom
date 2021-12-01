package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

/**
 * @author Jarod.Kong
 */
public interface EncryptShuffle extends ShardingSphereShuffle {
    public EncryptShuffle init();

    public void finish();
}
