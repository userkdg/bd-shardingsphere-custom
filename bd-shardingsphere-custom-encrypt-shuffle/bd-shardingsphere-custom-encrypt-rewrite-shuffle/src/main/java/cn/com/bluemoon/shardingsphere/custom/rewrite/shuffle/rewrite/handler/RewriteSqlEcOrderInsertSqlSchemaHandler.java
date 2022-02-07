package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;

/**
 * @author Jarod.Kong
 */
public class RewriteSqlEcOrderInsertSqlSchemaHandler implements RewriteSqlHandler {

    @Override
    public String handler(RewriteConfiguration config, String sourceSql) {
        if (config.getDbName() != null && config.getDbName().startsWith("ec_order")) {
            return sourceSql.replace("`ec_order`.", "");
        }
        return sourceSql;
    }
}
