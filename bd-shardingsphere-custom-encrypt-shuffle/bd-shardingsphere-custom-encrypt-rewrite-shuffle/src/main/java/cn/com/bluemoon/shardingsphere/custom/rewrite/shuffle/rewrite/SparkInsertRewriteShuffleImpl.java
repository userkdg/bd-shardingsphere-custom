package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.AbstractSqlRewriteShuffle;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.api.java.function.MapPartitionsFunction;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Encoders;
import org.apache.spark.sql.Row;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
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
            df.mapPartitions((MapPartitionsFunction<Row, String>) itr -> {
                List<String> sqls = new LinkedList<>();
                while (itr.hasNext()) {
                    Row row = itr.next();
                    String sql = row.getString(0);
                    sqls.add(sql);
                }
                return sqls.iterator();
            }, Encoders.STRING()).foreachPartition(new ShuffleForeachPartitionFun(getRewriteConfigByBroadcast()));
        }
    }

    @Override
    public String sqlType() {
        return "insert";
    }

    public static class ShuffleForeachPartitionFun implements ForeachPartitionFunction<String> {
        private final RewriteConfiguration conf;

        public ShuffleForeachPartitionFun(RewriteConfiguration conf) {
            this.conf = conf;
        }

        @Override
        public void call(Iterator<String> itr) throws Exception {
            insertBatch(itr);
        }

        // TODO: 2022/1/25 插入id 重复问题
        private void insertBatch(Iterator<String> its) {
            try (Connection conn = DriverManager.getConnection(conf.getExecutorUrl())) {
                try (Statement ps = conn.createStatement()) {
                    while (its.hasNext()) {
                        final String sql = its.next();
                        log.debug("add insert sql:{}", sql);
                        ps.addBatch(sql);
                    }
                    ps.executeBatch();
                }
            } catch (SQLException e) {
                log.error("批量写入异常", e);
            }
        }
    }

}
