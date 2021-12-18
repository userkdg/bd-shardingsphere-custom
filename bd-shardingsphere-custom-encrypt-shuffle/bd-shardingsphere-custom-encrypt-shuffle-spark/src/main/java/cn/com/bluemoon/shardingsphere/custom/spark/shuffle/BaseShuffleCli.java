package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.AdvCli;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.CliRunner;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJobV2;
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
        log.info("=====================加解密-明文->密文-洗数作业开始===================");
        String configStr = cmdLine.getOptionValue(PARAM_JOB_CONFIG);
        log.info("=====================启动参数:{}", configStr);
        EncryptGlobalConfig config = EncryptGlobalConfigSwapper.swapToConfig(configStr);
        if (config.isMultiBatchUrlConfig()) {
            log.info("启用jdbc multi batch execute Mode");
        }
        BaseShuffle encryptShuffleJob = getEncryptShuffleJob(config);
        encryptShuffleJob.shuffle();
    }

    protected abstract EncryptShuffle getEncryptShuffleJob(EncryptGlobalConfig config);
}
