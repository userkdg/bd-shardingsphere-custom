package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import com.google.gson.Gson;

/**
 * @author Jarod.Kong
 */
public class EncryptGlobalConfigSwapper {
    public static final Gson gson = new Gson();

    public static EncryptGlobalConfig swapToConfig(String configStr) {
        return gson.fromJson(configStr, EncryptGlobalConfig.class);
    }
}
