package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

/**
 * @author Jarod.Kong
 */
public interface BaseRewriteShuffle {
    void beforeShuffle();

    void shuffle();

    void afterShuffle();
}
