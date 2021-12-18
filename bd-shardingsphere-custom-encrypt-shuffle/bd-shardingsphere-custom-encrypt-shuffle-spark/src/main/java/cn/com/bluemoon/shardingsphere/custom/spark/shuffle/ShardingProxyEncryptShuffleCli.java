package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.AdvCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJob;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Deprecated
public class ShardingProxyEncryptShuffleCli extends BaseShuffleCli {

    public static void main(String[] args) {
        String simpleName = ShardingProxyEncryptShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new ShardingProxyEncryptShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

    @Override
    protected EncryptShuffle getCustomShuffleJob(EncryptGlobalConfig config) {
        return new EncryptShuffleJob(config);
    }
}
