package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.spark.JavaSparkSession;
import cn.hutool.core.lang.Assert;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.SparkSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;
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

    @Override
    public void beforeShuffle() {
        // 执行前统一重置执行后的状态
        Boolean resetDbStatus = rewriteConfig.getResetDbStatus();
        if (Boolean.TRUE.equals(resetDbStatus)) {
            log.info("进行重置数据库初始化状态");
            String databaseName = rewriteConfig.getDbName();
            Assert.isTrue(databaseName != null, "请指定数据库名");
            List<String> truncateTbSqls = DbUtil.getSchemaTruncateTableSql(getJdbcConnection(), databaseName, true);
            DbUtil.sqlExecuteBatch(getJdbcConnection(), truncateTbSqls, true);
            log.info("truncate scheme ={} all table data", databaseName);
        }
    }

    @SneakyThrows
    private Connection getJdbcConnection() {
        String url = rewriteConfig.getExecutorUrl();
        Assert.isTrue(url != null, "连接信息不为空");
        return DriverManager.getConnection(url);
    }

    @Override
    public void afterShuffle() {

    }

    public abstract String sqlType();

}
