package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.AbstractSqlRewriteShuffle;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.DbUtil;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.SqlExecutorResult;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler.RewriteEcOrderInsertSqlTablesHandler;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler.RewriteSqlEcOrderInsertSqlSchemaHandler;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler.RewriteSqlHandler;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.FilterFunction;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.api.java.function.MapPartitionsFunction;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Encoders;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SaveMode;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.*;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkInsertRewriteShuffleImpl extends AbstractSqlRewriteShuffle {

    private static final List<RewriteSqlHandler> rewriteSqlHandlers = new ArrayList<>();

    static {
        rewriteSqlHandlers.add(new RewriteSqlEcOrderInsertSqlSchemaHandler());
        rewriteSqlHandlers.add(new RewriteEcOrderInsertSqlTablesHandler());
    }

    public SparkInsertRewriteShuffleImpl(RewriteConfiguration rewriteConfig) {
        super(rewriteConfig);
    }

    @Override
    public void shuffle() {
        if (getRewriteConfig().getFromFilePath() != null) {
            String fileType = Optional.ofNullable(getRewriteConfig().getFileType()).orElse("text");
            Dataset<Row> df = spark.read().format(fileType).load(getRewriteConfig().getFromFilePath());
            df.show(10, false);
            df
                    .mapPartitions(new RewriteShuffleMapPartitionFun(getRewriteConfigByBroadcast(), rewriteSqlHandlers), Encoders.STRING())
                    .mapPartitions(new RewriteShuffleExecuteMapPartitionFun(getRewriteConfigByBroadcast()), Encoders.bean(SqlExecutorResult.class))
                    .filter((FilterFunction<SqlExecutorResult>) result -> result != null && !result.getSuccess())
                    .write()
                    .mode(SaveMode.Overwrite)
                    .saveAsTable("dap_data_secure.shuffle_insert_rewrite_sql_result");
        }
    }

    @Override
    public String sqlType() {
        return "insert";
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

    // TODO: 2022/1/31 后续结合各种sqlType进行抽象：统一入口，各自的业务处理，统一创建连接和执行和销毁等
    public static class RewriteShuffleForeachPartitionFun implements ForeachPartitionFunction<String> {
        private final RewriteConfiguration conf;

        public RewriteShuffleForeachPartitionFun(RewriteConfiguration conf) {
            this.conf = conf;
        }

        @Override
        public void call(Iterator<String> itr) throws Exception {
            Connection conn = DriverManager.getConnection(conf.getExecutorUrl());
            DbUtil.sqlExecuteForEach(conn, itr, true);
        }
    }


    public static class RewriteShuffleExecuteMapPartitionFun implements MapPartitionsFunction<String, SqlExecutorResult>{
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
}
