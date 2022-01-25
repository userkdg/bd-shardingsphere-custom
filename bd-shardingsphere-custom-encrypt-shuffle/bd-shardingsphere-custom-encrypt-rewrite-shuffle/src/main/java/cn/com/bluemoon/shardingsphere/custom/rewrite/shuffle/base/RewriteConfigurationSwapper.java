package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;

import java.util.Base64;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class RewriteConfigurationSwapper {
    public static String swapToJsonStr(RewriteConfiguration globalConfig) {
        byte[] jsonBytes = JSON.toJSONBytes(globalConfig);
        log.info("to Json={}", new String(jsonBytes));
        return Base64.getEncoder().encodeToString(jsonBytes);
    }

    public static RewriteConfiguration swapToConfig(String configStr) {
        byte[] jsonBytes = Base64.getDecoder().decode(StrUtil.trim(configStr));
        String jsonStr = new String(jsonBytes);
        log.info("to Json={}", jsonStr);
        return JSON.parseObject(jsonStr, RewriteConfiguration.class);
    }
}
