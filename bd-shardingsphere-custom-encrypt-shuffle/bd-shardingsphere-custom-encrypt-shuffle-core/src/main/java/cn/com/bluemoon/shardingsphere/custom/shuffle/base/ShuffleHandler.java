package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

/**
 * 拓展处理功能
 * 如：执行spark前、执行后
 *
 * @author Jarod.Kong
 */
@FunctionalInterface
public interface ShuffleHandler {
    void handler(GlobalConfig config);
}
