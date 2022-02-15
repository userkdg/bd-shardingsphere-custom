package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.AbstractSqlRewriteShuffle;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.SqlExecutorResult;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler.RewriteSqlHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.SaveMode;

/**
 * select sql rewrite 分析
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkSelectRewriteShuffleImpl extends AbstractSqlRewriteShuffle {

    public static final String DEFAULT_SAVE_AS_TABLE = "dap_data_secure.shuffle_select_rewrite_sql_result";

    static {
        // add rewriteSqlHandler
        rowRewriteSqlHandlers.add(new EcOrderSplitSourceRowSqlHandler());
    }

    /**
     * 结果集保存在hive的库和表名
     */
    private String saveAsTable;

    /**
     * 保存方式
     */
    private SaveMode saveMode = SaveMode.Overwrite;

    public SparkSelectRewriteShuffleImpl(RewriteConfiguration rewriteConfig) {
        super(rewriteConfig);
        // force
        rewriteConfig.setResetDbStatus(false);
    }

    @Override
    public String sqlType() {
        return "select";
    }

    @Override
    protected void addSink(Dataset<SqlExecutorResult> shuffleResultDf) {
        if (StringUtils.isBlank(saveAsTable)) {
            saveAsTable = DEFAULT_SAVE_AS_TABLE;
        }
        if (saveMode == null) {
            saveMode = SaveMode.Overwrite;
        }
        shuffleResultDf.write()
                .mode(saveMode)
                .saveAsTable(saveAsTable);
    }

    @Slf4j
    public static class EcOrderSplitSourceRowSqlHandler implements RewriteSqlHandler {

        @Override
        public String handler(RewriteConfiguration config, String sourceSql) {
            if (config.getDbName().toLowerCase().startsWith("ec_order")) {
                if (sourceSql.equalsIgnoreCase("Date|||Query|||Default_db")) {
                    return "";
                }
                String[] cells = sourceSql.split("\\|\\|\\|");
                if (cells.length >= 2) {
                    return cells[1];
                } else {
                    log.warn("注：skip source Row {}", sourceSql);
                    return "";
                }
            }
            return sourceSql;
        }
    }
}
