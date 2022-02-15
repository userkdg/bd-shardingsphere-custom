package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.AbstractSqlRewriteShuffle;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.SqlExecutorResult;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler.RewriteEcOrderInsertSqlTablesHandler;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler.RewriteSqlEcOrderInsertSqlSchemaHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.SaveMode;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class SparkInsertRewriteShuffleImpl extends AbstractSqlRewriteShuffle {

    static {
        rowRewriteSqlHandlers.add(new RewriteSqlEcOrderInsertSqlSchemaHandler());
        rowRewriteSqlHandlers.add(new RewriteEcOrderInsertSqlTablesHandler());
    }

    public SparkInsertRewriteShuffleImpl(RewriteConfiguration rewriteConfig) {
        super(rewriteConfig);
    }

    @Override
    protected void addSink(Dataset<SqlExecutorResult> shuffleResultDf) {
        shuffleResultDf.write()
                .mode(SaveMode.Overwrite)
                .saveAsTable("dap_data_secure.shuffle_insert_rewrite_sql_result");
    }

    @Override
    public String sqlType() {
        return "insert";
    }

}
