package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import com.google.gson.Gson;

/**
 * @author Jarod.Kong
 */
public class GlobalConfigSwapper {
    public static final Gson gson = new Gson();

    public static GlobalConfig swapToConfig(String configStr) {
        return gson.fromJson(configStr, GlobalConfig.class);
    }
}
