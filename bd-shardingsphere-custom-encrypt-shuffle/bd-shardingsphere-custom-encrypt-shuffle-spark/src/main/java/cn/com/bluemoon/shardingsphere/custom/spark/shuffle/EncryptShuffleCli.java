package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import cn.com.bluemoon.shardingsphere.custom.spark.cli.AdvCli;
import cn.com.bluemoon.shardingsphere.custom.spark.cli.CliRunner;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfigSwapper;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJob;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.Options;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class EncryptShuffleCli implements CliRunner {
    private static final String PARAM_JOB_CONFIG = "config";

    public static void main(String[] args) {
        String simpleName = EncryptShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new EncryptShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

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
        EncryptShuffle encryptShuffleJob = new EncryptShuffleJob(config);
        encryptShuffleJob.init().shuffle();
    }
}
