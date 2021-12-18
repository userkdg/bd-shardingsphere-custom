package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

/**
 * @author Jarod.Kong
 */
@FunctionalInterface
public interface BaseShuffle {

    default void init() {

    }

    default void finish() {

    }

    public void shuffle();
}
