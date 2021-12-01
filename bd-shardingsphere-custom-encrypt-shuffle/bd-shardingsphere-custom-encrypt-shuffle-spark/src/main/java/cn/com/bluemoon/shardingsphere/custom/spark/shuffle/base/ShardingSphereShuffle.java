package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

/**
 * @author Jarod.Kong
 */
public interface ShardingSphereShuffle {
    default void init(Object config) {

    }

    public void shuffle();
}
