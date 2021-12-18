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
@Deprecated
public class ShardingProxyShuffleCli extends BaseShuffleCli {

    public static void main(String[] args) {
        String simpleName = ShardingProxyShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new ShardingProxyShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

    @Override
    protected EncryptShuffle getEncryptShuffleJob(EncryptGlobalConfig config) {
        return new EncryptShuffleJob(config);
    }
}
