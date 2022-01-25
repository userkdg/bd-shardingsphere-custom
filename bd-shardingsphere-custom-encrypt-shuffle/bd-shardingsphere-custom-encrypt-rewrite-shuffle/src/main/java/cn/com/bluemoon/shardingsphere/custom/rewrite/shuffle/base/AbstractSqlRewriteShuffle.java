package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.spark.JavaSparkSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.SparkSession;

import java.util.Objects;

/**
 * @author Jarod.Kong
 */
@Slf4j
public abstract class AbstractSqlRewriteShuffle implements BaseRewriteShuffle {
    private static volatile Broadcast<RewriteConfiguration> rewriteConfigurationBroadcast = null;
    private final RewriteConfiguration rewriteConfig;
    protected transient SparkSession spark;
    protected transient JavaSparkContext sc;

    public AbstractSqlRewriteShuffle(RewriteConfiguration rewriteConfig) {
        Objects.requireNonNull(rewriteConfig);
        this.rewriteConfig = rewriteConfig;
        String url = rewriteConfig.getExecutorUrl();
        Objects.requireNonNull(url);

        spark = JavaSparkSession.getInstance(getSparkConf(rewriteConfig));
        sc = new JavaSparkContext(spark.sparkContext());
        rewriteConfigurationBroadcast = sc.broadcast(rewriteConfig);
    }

    private SparkConf getSparkConf(BaseSparkConfig customSparkConfig) {
        SparkConf sparkConf = new SparkConf();
        sparkConf.setMaster(customSparkConfig.getMaster());
        sparkConf.setAppName(customSparkConfig.getAppName());
        if (customSparkConfig.getOtherParams() != null) {
            customSparkConfig.getOtherParams().forEach((k, v) -> {
                log.info("设置spark配置{}：{}", k, v);
                sparkConf.set(k, v);
            });
        }
        return sparkConf;
    }

    public RewriteConfiguration getRewriteConfigByBroadcast() {
        return rewriteConfigurationBroadcast.getValue();
    }

    public RewriteConfiguration getRewriteConfig() {
        return rewriteConfig;
    }

    public abstract String sqlType();

}
