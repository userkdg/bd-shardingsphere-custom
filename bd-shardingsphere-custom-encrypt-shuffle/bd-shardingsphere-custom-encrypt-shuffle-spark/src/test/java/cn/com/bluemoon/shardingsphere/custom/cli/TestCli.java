package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptGlobalConfig.FieldInfo;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.EncryptGlobalConfigSwapper;
import com.google.common.collect.Lists;
import org.junit.Test;

import java.sql.JDBCType;

/**
 * @author Jarod.Kong
 */
public class TestCli {

    @Test
    public void test() {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&useSSL=false&characterEncoding=utf-8");
        config.setProxyUrl("jdbc:mysql://192.168.243.34:23308/db_for_sharding?user=root&password=root&useUnicode=true&useSSL=false&characterEncoding=utf-8");
        config.setRuleTableName("t_user_info_encrypt_v3");
        config.setPartitionColumn(new FieldInfo("id", JDBCType.INTEGER.getVendorTypeNumber()));
        config.setPlainColumnNames(
                Lists.newArrayList(
                        new FieldInfo("account", JDBCType.VARCHAR.getVendorTypeNumber()),
                        new FieldInfo("password", JDBCType.VARCHAR.getVendorTypeNumber()))
        );
        String json = EncryptGlobalConfigSwapper.gson.toJson(config);
        System.out.println(json);
        EncryptGlobalConfig configEq = EncryptGlobalConfigSwapper.swapToConfig(json);
        assert configEq != null;
    }
}
