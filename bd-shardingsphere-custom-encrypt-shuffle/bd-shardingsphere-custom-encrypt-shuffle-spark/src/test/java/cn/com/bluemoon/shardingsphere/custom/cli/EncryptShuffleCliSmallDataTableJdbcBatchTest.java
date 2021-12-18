package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import org.junit.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Jarod.Kong
 */
public class EncryptShuffleCliSmallDataTableJdbcBatchTest {


    private static final GlobalConfig config = new GlobalConfig();

    @Test
    public void testBatchUpdate() {
        List<Object[]> res = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(convertJdbcUrl("jdbc:mysql://192.168.234.8:4401/ec_order?user=sharding&password=HGbZYrqlpr25"))) {
            DatabaseMetaData metaData = conn.getMetaData();
            boolean b = metaData.supportsBatchUpdates();
            System.out.println("1 支持supportsBatchUpdates？" + b);
            try (PreparedStatement ps = conn.prepareStatement("select charge_phone,client_storehouse_code from oms_b2b_client_storehouse ")) {
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Object f1 = rs.getObject(1);
                        Object f2 = rs.getObject(2);
                        res.add(new Object[]{f1, f2});
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection conn = DriverManager.getConnection(convertJdbcUrl("jdbc:mysql://192.168.243.34:23308/ec_order_db?user=root&password=root"))) {
            DatabaseMetaData metaData = conn.getMetaData();
            boolean b = metaData.supportsBatchUpdates();
            System.out.println("2 支持supportsBatchUpdates？" + b);
            try (PreparedStatement ps = conn.prepareStatement("update oms_b2b_client_storehouse set charge_phone=? where client_storehouse_code=?")) {
                //Set auto-commit to false
                conn.setAutoCommit(false);
                int batchSize = 10;
                int size = 0;
                for (Object[] rs : res) {
                    ps.setObject(1, rs[0], JDBCType.VARCHAR);
                    ps.setObject(2, rs[1], JDBCType.VARCHAR);
                    ps.addBatch();
                    size++;
                    if (size % batchSize == 0) {
                        ps.executeBatch();
                        ps.clearBatch();
                    }
                }
                ps.executeBatch();
                conn.commit();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String convertJdbcUrl(String s) {
        return config.convertJdbcUrl(s, false);
    }


}
