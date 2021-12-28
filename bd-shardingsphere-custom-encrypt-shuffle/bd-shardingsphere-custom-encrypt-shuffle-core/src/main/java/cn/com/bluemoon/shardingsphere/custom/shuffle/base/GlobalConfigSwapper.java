package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;

import java.util.Base64;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class GlobalConfigSwapper {
    public static String swapToJsonStr(GlobalConfig globalConfig) {
        byte[] jsonBytes = JSON.toJSONBytes(globalConfig);
        log.info("to Json={}", new String(jsonBytes));
        return Base64.getEncoder().encodeToString(jsonBytes);
    }

    public static GlobalConfig swapToConfig(String configStr) {
        byte[] jsonBytes = Base64.getDecoder().decode(StrUtil.trim(configStr));
        String jsonStr = new String(jsonBytes);
        log.info("to Json={}", jsonStr);
        return JSON.parseObject(jsonStr, GlobalConfig.class);
    }
}
