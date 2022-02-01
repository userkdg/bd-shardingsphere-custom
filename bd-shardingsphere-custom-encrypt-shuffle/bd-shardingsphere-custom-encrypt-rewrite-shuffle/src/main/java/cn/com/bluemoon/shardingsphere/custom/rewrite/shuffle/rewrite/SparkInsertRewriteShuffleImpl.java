package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.AbstractSqlRewriteShuffle;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.DbUtil;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.api.java.function.MapPartitionsFunction;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Encoders;
import org.apache.spark.sql.Row;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkInsertRewriteShuffleImpl extends AbstractSqlRewriteShuffle {

    public SparkInsertRewriteShuffleImpl(RewriteConfiguration rewriteConfig) {
        super(rewriteConfig);
    }

    @Override
    public void shuffle() {
        if (getRewriteConfig().getFromFilePath() != null) {
            String fileType = Optional.ofNullable(getRewriteConfig().getFileType()).orElse("text");
            Dataset<Row> df = spark.read().format(fileType).load(getRewriteConfig().getFromFilePath());
            df.show(10, false);
            df.mapPartitions(new RewriteShuffleMapPartitionFun(), Encoders.STRING())
                    .foreachPartition(new RewriteShuffleForeachPartitionFun(getRewriteConfigByBroadcast()));
        }
    }

    @Override
    public String sqlType() {
        return "insert";
    }

    public static class RewriteShuffleMapPartitionFun implements MapPartitionsFunction<Row, String> {

        @Override
        public Iterator<String> call(Iterator<Row> itr) throws Exception {
            List<String> sqls = new LinkedList<>();
            while (itr.hasNext()) {
                Row row = itr.next();
                String sql = row.getString(0);
                sqls.add(sql);
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
            int[] batchRes = DbUtil.sqlExecuteBatch(conn, itr, true);
            int i = 0;
            final boolean rewriteBatchedStats = batchRes.length == 1;
            while (itr.hasNext()) {
                String sql = itr.next();
                // 1flag 表示一次一批执行（rewriteBatchedStatements=true）,2flag表示每条执行结果为1
                if (rewriteBatchedStats || batchRes[i] == 1) {
                    log.info("sql=>{}执行成功, batchResult:{}", sql, batchRes[i]);
                } else {
                    log.error("sql=>{}执行失败，batchResult:{}", sql, batchRes[i]);
                }
                i++;
            }
        }
    }

}
