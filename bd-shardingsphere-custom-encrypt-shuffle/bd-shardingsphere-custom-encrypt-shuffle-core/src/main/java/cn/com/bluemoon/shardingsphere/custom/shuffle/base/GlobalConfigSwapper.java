package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import com.alibaba.fastjson.JSON;

/**
 * @author Jarod.Kong
 */
public class GlobalConfigSwapper {
    public static String swapToJsonStr(GlobalConfig globalConfig) {
        return JSON.toJSONString(globalConfig);
    }

    public static GlobalConfig swapToConfig(String configStr) {
        return JSON.parseObject(configStr, GlobalConfig.class);
    }
}
