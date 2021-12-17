package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.AdvCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJob;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class EncryptShuffleCli extends BaseEncryptCli {

    public static void main(String[] args) {
        String simpleName = EncryptShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new EncryptShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

    @Override
    protected EncryptShuffle getEncryptShuffleJob(EncryptGlobalConfig config) {
        return new EncryptShuffleJob(config);
    }
}
