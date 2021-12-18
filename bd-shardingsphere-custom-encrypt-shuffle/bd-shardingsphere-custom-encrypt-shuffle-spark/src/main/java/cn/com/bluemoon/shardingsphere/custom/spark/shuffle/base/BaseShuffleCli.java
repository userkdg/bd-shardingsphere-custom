package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.CliRunner;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.Options;

/**
 * @author Jarod.Kong
 */
@Slf4j
public abstract class BaseShuffleCli implements CliRunner {
    protected static final String PARAM_JOB_CONFIG = "config";

    @Override
    public Options initOptions() {
        Options options = new Options();
        options.addOption("c", PARAM_JOB_CONFIG, true, "任务所有配置信息, EncryptConfig的Json字符串");
        return options;
    }

    @Override
    public boolean validateOptions(CommandLine cmdLine) {
        return cmdLine.hasOption(PARAM_JOB_CONFIG);
    }

    @Override
    public void start(CommandLine cmdLine) {
        log.info("=====================加解密-明文与密文-洗数作业开始===================");
        String configStr = cmdLine.getOptionValue(PARAM_JOB_CONFIG);
        log.info("=====================启动参数:{}", configStr);
        GlobalConfig config = GlobalConfigSwapper.swapToConfig(configStr);
        if (config.isMultiBatchUrlConfig()) {
            log.info("启用jdbc multi batch execute Mode");
        }
        BaseShuffle shuffle = getCustomShuffleJob(config);
        shuffle.shuffle();
    }

    protected abstract BaseShuffle getCustomShuffleJob(GlobalConfig config);
}
