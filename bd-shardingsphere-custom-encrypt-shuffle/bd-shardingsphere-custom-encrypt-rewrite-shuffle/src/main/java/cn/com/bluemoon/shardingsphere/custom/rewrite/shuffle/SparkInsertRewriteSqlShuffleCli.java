package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.BaseRewriteShuffle;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteSqlShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.SparkInsertRewriteShuffleImpl;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.cli.AdvCli;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkInsertRewriteSqlShuffleCli extends RewriteSqlShuffleCli {

    public static void main(String[] args) {
        String simpleName = SparkInsertRewriteSqlShuffleCli.class.getSimpleName();
        AdvCli.initRunner(args, simpleName, new SparkInsertRewriteSqlShuffleCli());
        log.info("退出{}的main()方法", simpleName);
//        System.exit(0);
    }

    @Override
    protected BaseRewriteShuffle getCustomShuffleJob(RewriteConfiguration config) {
        return new SparkInsertRewriteShuffleImpl(config);
    }
}
