package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import java.util.Map;

/**
 * @author Jarod.Kong
 */
public interface IExtractStateManager<STATE> {
    void addState(String key, STATE state);

    void removeState(String key);

    Map<String, STATE> loadAll();

    STATE getState(String key);

    void close();
}
