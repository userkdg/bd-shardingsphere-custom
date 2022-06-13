package cn.com.bluemoon.shardingsphere.custom.cli.extract;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition.RdbmsPartitionUtils;
import com.alibaba.datax.plugin.rdbms.util.DataBaseType;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author Jarod.Kong
 */
public class RdbmsPartitionUtilsTest {

    public static void main(String[] args) {
        final String tableName = "dap_system_info";
        final String splitPk = "id";
        final String jdbcUrl = "jdbc:mysql://192.168.234.4:3306/data_asset_platform?user=dsmanager&password=l0qwU3UU";
        final String username = null;
        final String password = null;
//        或者
//        final String jdbcUrl = "jdbc:mysql://192.168.234.4:3306/data_asset_platform";
//        final String username = "dsmanager";
//        final String password = "l0qwU3UU";
        final List<String> selectColumns = new ArrayList<>();
        selectColumns.add("id");
        selectColumns.add("name");
        selectColumns.add("update_time");
        final String queryWhere = "1526105025431124217 <= id";// 管理抽取条件
        final int adviceNumber = 100;
        final DataBaseType databaseType = DataBaseType.MySql;
        final boolean pkTypeGuess = true;

        String[] tablePartitionArr = RdbmsPartitionUtils.getTablePredicateArr(tableName, splitPk, jdbcUrl, username, password, selectColumns, queryWhere, adviceNumber, databaseType, pkTypeGuess).getPkPredicateArr();
        System.out.println(Arrays.toString(tablePartitionArr));
    }

    @Test
    public void testIncr() {

    }
}
