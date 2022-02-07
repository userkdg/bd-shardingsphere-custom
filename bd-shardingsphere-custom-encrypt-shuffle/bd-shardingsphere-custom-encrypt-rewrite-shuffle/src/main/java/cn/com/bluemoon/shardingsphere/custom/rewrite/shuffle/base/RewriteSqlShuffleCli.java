package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

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
public abstract class RewriteSqlShuffleCli implements CliRunner {
    protected static final String PARAM_JOB_CONFIG = "config";

    @Override
    public Options initOptions() {
        Options options = new Options();
        options.addOption("c", PARAM_JOB_CONFIG, true, "任务所有配置信息,Config的Json字符串");
        return options;
    }

    @Override
    public boolean validateOptions(CommandLine cmdLine) {
        return cmdLine.hasOption(PARAM_JOB_CONFIG);
    }

    @Override
    public void start(CommandLine cmdLine) {
        log.info("=====================加解密-SQL重写检查-作业开始===================");
        String configStr = cmdLine.getOptionValue(PARAM_JOB_CONFIG);
        log.info("=====================启动参数:{}", configStr);
        RewriteConfiguration config = RewriteConfigurationSwapper.swapToConfig(configStr);
        BaseRewriteShuffle shuffle = getCustomShuffleJob(config);
        shuffle.beforeShuffle();
        shuffle.shuffle();
        shuffle.afterShuffle();
    }

    protected abstract BaseRewriteShuffle getCustomShuffleJob(RewriteConfiguration config);
}
