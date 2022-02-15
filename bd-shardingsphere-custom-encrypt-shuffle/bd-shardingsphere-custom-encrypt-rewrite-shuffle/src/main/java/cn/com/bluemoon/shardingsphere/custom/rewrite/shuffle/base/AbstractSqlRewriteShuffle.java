package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler.RewriteSqlHandler;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.spark.JavaSparkSession;
import cn.hutool.core.lang.Assert;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FilterFunction;
import org.apache.spark.api.java.function.MapPartitionsFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Encoders;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.*;

/**
 * @author Jarod.Kong
 */
@Slf4j
public abstract class AbstractSqlRewriteShuffle implements BaseRewriteShuffle {
    /**
     * 源数据的行处理器
     */
    protected static final List<RewriteSqlHandler> rowRewriteSqlHandlers = new ArrayList<>();

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
        if (Boolean.TRUE.equals(customSparkConfig.getSupportHive())) {
            log.info("开启支持spark sql操作hive数据");
            sparkConf.set("spark.sql.catalogImplementation", "hive");
        }
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
            List<String> truncateTbSqls = DbUtil.getTruncateTableSql(getJdbcConnection(), databaseName, true);
            DbUtil.sqlExecuteBatch(getJdbcConnection(), truncateTbSqls, true);
            log.info("truncate scheme ={} all table data", databaseName);
        }
    }

    @SneakyThrows
    private Connection getJdbcConnection() {
        String url = rewriteConfig.getExecutorUrl();
        Assert.isTrue(url != null, "连接信息不为空（带上账号和密码）");
        return DriverManager.getConnection(url);
    }

    @Override
    public void shuffle() {
        Dataset<Row> df = getSourceDf();
        Dataset<SqlExecutorResult> shuffleResultDf = doShuffle(df);
        addSink(shuffleResultDf);
    }

    /**
     * 加工过程
     */
    protected Dataset<SqlExecutorResult> doShuffle(Dataset<Row> df) {
        Dataset<SqlExecutorResult> shuffleResultDf = df
                .mapPartitions(new RewriteShuffleMapPartitionFun(getRewriteConfigByBroadcast(), rowRewriteSqlHandlers), Encoders.STRING())
                .filter((FilterFunction<String>) StringUtils::isNotBlank)
                .mapPartitions(new RewriteShuffleExecuteMapPartitionFun(getRewriteConfigByBroadcast()), Encoders.bean(SqlExecutorResult.class))
                .filter((FilterFunction<SqlExecutorResult>) result -> result != null && !result.getSuccess());
        return shuffleResultDf;
    }

    /**
     * 对df进行action操作
     * 默认show
     */
    protected void addSink(Dataset<SqlExecutorResult> shuffleResultDf) {
        shuffleResultDf.show(20,false);
    }

    /**
     * 源头数据df 支持重写
     */
    protected Dataset<Row> getSourceDf() {
        Dataset<Row> df;
        if (getRewriteConfig().getFromSql() != null && !getRewriteConfig().getFromSql().isEmpty()) {
            List<String> rdd = new ArrayList<>(getRewriteConfig().getFromSql());
            df = spark.createDataFrame(rdd, String.class);
        } else if (getRewriteConfig().getFromFilePath() != null) {
            String fileType = Optional.ofNullable(getRewriteConfig().getFileType()).orElse("text");
            df = spark.read().format(fileType).load(getRewriteConfig().getFromFilePath());
        } else {
            throw new RuntimeException("请指定源数据属性");
        }
        df.show(10, false);
        return df;
    }

    @Override
    public void afterShuffle() {

    }

    public abstract String sqlType();

    public static class RewriteShuffleExecuteMapPartitionFun implements MapPartitionsFunction<String, SqlExecutorResult> {
        private final RewriteConfiguration conf;

        public RewriteShuffleExecuteMapPartitionFun(RewriteConfiguration conf) {
            this.conf = conf;
        }

        @Override
        public Iterator<SqlExecutorResult> call(Iterator<String> itr) throws Exception {
            Connection conn = DriverManager.getConnection(conf.getExecutorUrl());
            List<SqlExecutorResult> results = DbUtil.sqlExecuteForEach(conn, itr, true);
            return results.iterator();
        }
    }

    public static class RewriteShuffleMapPartitionFun implements MapPartitionsFunction<Row, String> {
        private final List<RewriteSqlHandler> rewriteSqlHandlers;
        private final RewriteConfiguration config;

        public RewriteShuffleMapPartitionFun(RewriteConfiguration rewriteConfigByBroadcast, List<RewriteSqlHandler> rewriteSqlHandlers) {
            this.rewriteSqlHandlers = rewriteSqlHandlers;
            this.config = rewriteConfigByBroadcast;
        }

        @Override
        public Iterator<String> call(Iterator<Row> itr) throws Exception {
            List<String> sqls = new LinkedList<>();
            while (itr.hasNext()) {
                Row row = itr.next();
                String sql = row.getString(0);
                if (rewriteSqlHandlers != null && !rewriteSqlHandlers.isEmpty()) {
                    String sourceSql = sql;
                    for (RewriteSqlHandler handler : rewriteSqlHandlers) {
                        sourceSql = handler.handler(config, sourceSql);
                        log.debug("sourceSql-handler={}->{}", sql, sourceSql);
                    }
                    if (sourceSql != null) {
                        sqls.add(sourceSql);
                    }
                } else {
                    sqls.add(sql);
                }
            }
            return sqls.iterator();
        }
    }

}
