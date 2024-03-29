package cn.com.bluemoon.encrypt.shuffle.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ssh.SshUtils;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ssh.valueobject.PtSsh;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSubmitDecryptShuffleMain {

    private static final String exampleArg = "{\"sourceUrl\":\"jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user\\u003dds_sync_struct\\u0026password\\u003dJmMBtXTz\",\"targetUrl\":\"jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user\\u003dds_sync_struct\\u0026password\\u003dJmMBtXTz\",\"ruleTableName\":\"t_user_info_encrypt_v3\",\"primaryCols\":[{\"name\":\"id\"}],\"onYarn\":false,\"jobName\":\"bd-spark-encrypt-shuffle-t_user_info_encrypt_v3\",\"extractCols\":[{\"name\":\"password\",\"encryptRule\":{\"type\":\"AES\",\"props\":{\"aes-key-value\":\"123456abc\"}}},{\"name\":\"account\",\"encryptRule\":{\"type\":\"AES\",\"props\":{\"aes-key-value\":\"123456abc\"}}}],\"ExtractMode\":\"ReShuffle\",\"multiBatchUrlConfig\":false}";

    public static void main(String[] args) {
        String jsonParam;
        if (args.length == 0) {
            throw new RuntimeException("必须传入作业参数，如：" + exampleArg);
        }
        jsonParam = args[0];
        String jobName = "default-job-name";
        if (args.length > 1) {
            jobName = args[1];
        }
        String jobEnv = "test";
        if (args.length > 2){
            jobEnv = args[2];
        }
        final String sshUser = "data_tool";
        final String sshHost =  jobEnv.equalsIgnoreCase("prod") ? "192.168.39.11": "192.168.235.12";
        final String password = "tool@aeb56c";
        int sshPort = 22;
        final String command = String.format("sh /home/data_tool/bd-spark/bd-spark-encrypt-shuffle/runSparkDecryptShuffleJob.sh '-c %s' '%s'",
                jsonParam, jobName);
        log.info("accept arg1:{}", jsonParam);
        log.info("accept arg2:{}", jobName);
        log.info("command:{}", command);
        boolean status = SshUtils.client()
                .sshInfo(PtSsh.builder().host(sshHost).username(sshUser).port(sshPort).password(password).build())
                .runScript(command);
        log.info("status:{}", status);
    }
}
