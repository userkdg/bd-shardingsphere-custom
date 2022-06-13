package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

/**
 * @author Jarod.Kong
 */
public interface IExtractStateCache {
    default <T> IExtractStateManager<T> extractCache() {
        return null;
    }
}
