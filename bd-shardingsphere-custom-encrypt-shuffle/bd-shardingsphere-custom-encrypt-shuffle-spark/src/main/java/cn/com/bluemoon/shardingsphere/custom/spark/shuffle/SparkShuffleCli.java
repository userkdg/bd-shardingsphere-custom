package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.AdvCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJobV2;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkShuffleCli extends BaseShuffleCli {

    public static void main(String[] args) {
        String simpleName = SparkShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new SparkShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

    @Override
    protected EncryptShuffle getEncryptShuffleJob(EncryptGlobalConfig config) {
        return new EncryptShuffleJobV2(config);
    }


}
