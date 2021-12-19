package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class ShuffleLogHandler implements ShuffleHandler {
    private final String message;

    public ShuffleLogHandler(String message) {
        this.message = message;
    }

    @Override
    public void handler(GlobalConfig config) {
        log.info(message);
    }
}
