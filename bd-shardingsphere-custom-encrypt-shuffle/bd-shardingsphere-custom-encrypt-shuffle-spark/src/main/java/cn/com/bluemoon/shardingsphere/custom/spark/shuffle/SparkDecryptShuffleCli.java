package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.AdvCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.DecryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt.DecryptShuffleJob;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkDecryptShuffleCli extends BaseShuffleCli {

    public static void main(String[] args) {
        String simpleName = SparkDecryptShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new SparkDecryptShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

    @Override
    protected DecryptShuffle getCustomShuffleJob(GlobalConfig config) {
        return new DecryptShuffleJob(config);
    }


}
