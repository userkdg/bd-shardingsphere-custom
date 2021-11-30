package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

/**
 * @author Jarod.Kong
 */
public interface ShardingSphereShuffle {
    default void init(Object config) {

    }

    public void shuffle();
}
