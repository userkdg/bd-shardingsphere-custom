package cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.Options;

/**
 * @author Jarod.Kong
 */
public interface CliRunner {

    /**
     * 添加命令行参数PARAM_MAX_RUNNING
     *
     * @return 命令行参数
     */
    public Options initOptions();

    /**
     * 定义命令行参数的验证方法
     *
     * @return true为通过，false为不通过
     */
    public boolean validateOptions(CommandLine cmdLine);

    /**
     * 业务逻辑处理
     */
    public void start(CommandLine cmdLine);
}
