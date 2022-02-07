package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import lombok.extern.slf4j.Slf4j;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class DbUtil {

    public static List<String> getTruncateTableSql(Connection conn, String databaseName, boolean closeConn) {
        List<String> truncateTbSqls = new ArrayList<>();
        String tableNameSql = "show tables";
        try (PreparedStatement ps = conn.prepareStatement(tableNameSql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String tableName = rs.getString(1);
                    truncateTbSqls.add(String.format("truncate table %s.%s", databaseName, tableName));
                }
            }
        } catch (SQLException e) {
            log.error("查询执行失败：", e);
        } finally {
            if (closeConn) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    // nothing
                }
            }
        }
        return truncateTbSqls;
    }
    public static List<String> getSchemaTruncateTableSql(Connection conn, String databaseName, boolean closeConn) {
        List<String> truncateTbSqls = new ArrayList<>();
        String truncateTbSql = "select concat('truncate table ',table_schema,'.',table_name) as clean_tb_data from information_schema.TABLES where table_schema=?";
        try (PreparedStatement ps = conn.prepareStatement(truncateTbSql)) {
            ps.setString(1, databaseName);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String sql = rs.getString(1);
                    truncateTbSqls.add(sql);
                }
            }
        } catch (SQLException e) {
            log.error("查询执行失败：", e);
        } finally {
            if (closeConn) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    // nothing
                }
            }
        }
        return truncateTbSqls;
    }

    public static List<SqlExecutorResult> sqlExecuteForEach(Connection conn, Iterator<String> iterator, boolean finallyCloseConn) {
        List<SqlExecutorResult> results = new ArrayList<>();
        try (Statement stats = conn.createStatement()) {
            while (iterator.hasNext()) {
                String sql = iterator.next();
                boolean res = false;
                String error = null;
                try {
                    res = stats.execute(sql);
                    res = true;
                } catch (SQLException e) {
                    log.error("sql={},执行失败：", sql, e);
                    error = e.getMessage();
                }
                SqlExecutorResult result = new SqlExecutorResult();
                result.setSql(sql);
                result.setSuccess(res);
                result.setErrorMsg(error);
                results.add(result);
            }
        } catch (SQLException e) {
            log.error("批量执行失败：", e);
        } finally {
            if (finallyCloseConn) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    // nothing
                }
            }
        }
        return results;
    }

    public static int[] sqlExecuteBatch(Connection conn, Iterator<String> iterator, boolean finallyCloseConn) {
        try (Statement stats = conn.createStatement()) {
            while (iterator.hasNext()) {
                String sql = iterator.next();
                stats.addBatch(sql);
            }
            int[] batch = stats.executeBatch();
            log.debug("batch res:{}", Arrays.toString(batch));
            return batch;
        } catch (SQLException e) {
            log.error("批量执行失败：", e);
        } finally {
            if (finallyCloseConn) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    // nothing
                }
            }
        }
        return new int[0];
    }

    public static int[] sqlExecuteBatch(Connection conn, List<String> sqls, boolean finallyCloseConn) {
        return sqlExecuteBatch(conn, sqls.iterator(), finallyCloseConn);
    }
}
