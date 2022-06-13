package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition;

import cn.hutool.core.util.StrUtil;
import com.alibaba.datax.common.util.Configuration;
import com.alibaba.datax.plugin.rdbms.reader.Constant;
import com.alibaba.datax.plugin.rdbms.reader.Key;
import com.alibaba.datax.plugin.rdbms.reader.util.SingleTableSplitUtil;
import com.alibaba.datax.plugin.rdbms.util.DataBaseType;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.*;

/**
 * @author Jarod.Kong
 */
public class RdbmsPartitionUtils {

    private RdbmsPartitionUtils() {
    }

    @RequiredArgsConstructor
    @Getter
    public static class TableSplitPkInfo{
        private final String[] pkPredicateArr;
        private final Object minPkValue;
        private final Object maxPkValue;
    }

    /**
     * 获取表where predicate的情况
     *
     * @param tableName       表名
     * @param splitPk         分片字段名
     * @param jdbcUrl         url
     * @param username        账号
     * @param password        密码
     * @param selectColumns   查询字段
     * @param queryWhere      附加查询条件
     * @param adviceNumber    期望分片数
     * @param databaseType    数据库类型
     * @param openPkTypeGuess 是否开启分片字段的类型值（雪花算法的long值库表字段为字符串、uuid字符串主键...）
     * @return 表分片条件
     */
    public static TableSplitPkInfo getTablePredicateArr(final String tableName,
                                                        final String splitPk,
                                                        final String jdbcUrl,
                                                        final String username,
                                                        final String password,
                                                        final List<String> selectColumns,
                                                        final String queryWhere,
                                                        final int adviceNumber,
                                                        final DataBaseType databaseType,
                                                        final boolean openPkTypeGuess) {
        Map<String, Object> config = new HashMap<>();
        config.put(Key.SPLIT_PK, splitPk);
        config.put(Key.WHERE, queryWhere);
        config.put(Key.COLUMN, String.join(", ", selectColumns));
        config.put(Constant.FETCH_SIZE, 1000);
        config.put(Key.TABLE, tableName);
        config.put(Key.JDBC_URL, jdbcUrl);
        config.put(Key.USERNAME, username);
        config.put(Key.PASSWORD, password);
        // 新增配置：猜测分片字段字符串类型，是否为UUID，是否为雪花算法。
        config.put(Constant.PK_TYPE_GUESS, openPkTypeGuess);
        Configuration configuration = Configuration.from(config);
        SingleTableSplitUtil.DATABASE_TYPE = databaseType;
        List<Configuration> doSplit = SingleTableSplitUtil.splitSingleTable(configuration, adviceNumber);
        String[] predicateArr = doSplit.stream().map(c -> getQuerySqlWhereSuffix(c.getString(Key.QUERY_SQL)))
                .filter(s -> s != null && !"".equals(s)).toArray(String[]::new);
        return new TableSplitPkInfo(predicateArr,
                doSplit.size() > 0? doSplit.get(0).get(Constant.PK_TYPE_MIN_PK) : null,
                doSplit.size() > 0? doSplit.get(0).get(Constant.PK_TYPE_MAX_PK) : null);
    }

    private static String getQuerySqlWhereSuffix(String querySql) {
        if (querySql != null && StrUtil.count(querySql.toLowerCase(), " where ") == 1) {
            String flag = "where ";
            return querySql.substring(querySql.lastIndexOf(flag) + flag.length());
        }
        // 若没有predicate分片则返回完成查询语句，如：select * from sys_user ，故忽略掉，后续记得清楚
        return null;
    }
}
