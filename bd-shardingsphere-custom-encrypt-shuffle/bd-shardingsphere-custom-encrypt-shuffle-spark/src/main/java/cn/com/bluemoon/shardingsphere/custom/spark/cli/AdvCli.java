package cn.com.bluemoon.shardingsphere.custom.spark.cli;

import cn.hutool.core.lang.Assert;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.DefaultParser;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class AdvCli {

    @SneakyThrows
    public static void initRunner(String[] args, String simpleName, CliRunner cliRunner) {
        log.info("{} Cli 初始化", simpleName);
        DefaultParser parser = new DefaultParser();
        CommandLine commandLine = parser.parse(cliRunner.initOptions(), args);
        boolean valid = cliRunner.validateOptions(commandLine);
        Assert.isTrue(valid, ()->new RuntimeException("传入必填项：\n"+cliRunner.initOptions().toString()));
        cliRunner.start(commandLine);
    }
}
