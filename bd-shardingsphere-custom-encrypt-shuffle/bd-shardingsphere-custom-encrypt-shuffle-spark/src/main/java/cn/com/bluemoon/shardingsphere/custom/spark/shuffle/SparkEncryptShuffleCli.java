package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.AdvCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJob;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkEncryptShuffleCli extends BaseShuffleCli {

    public static void main(String[] args) {
        String simpleName = SparkEncryptShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new SparkEncryptShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

    @Override
    protected EncryptShuffle getCustomShuffleJob(GlobalConfig config) {
        config.setShuffleMode(GlobalConfig.ShuffleMode.ENCRYPT);
        return new EncryptShuffleJob(config);
    }


}
