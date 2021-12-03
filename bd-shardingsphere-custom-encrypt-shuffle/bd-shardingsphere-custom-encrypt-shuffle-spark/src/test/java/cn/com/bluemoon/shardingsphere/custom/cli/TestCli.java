package cn.com.bluemoon.shardingsphere.custom.cli;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfig.FieldInfo;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptGlobalConfigSwapper;
import com.google.common.collect.Lists;
import org.junit.Test;

import java.sql.JDBCType;
import java.util.Collections;

/**
 * @author Jarod.Kong
 */
public class TestCli {

    @Test
    public void test() {
        EncryptGlobalConfig config = new EncryptGlobalConfig();
        config.setSourceUrl("jdbc:mysql://192.168.234.4:3304/db_for_sharding_1?user=ds_sync_struct&password=JmMBtXTz&useUnicode=true&useSSL=false&characterEncoding=utf-8");
        config.setTargetUrl("jdbc:mysql://192.168.243.34:23308/db_for_sharding?user=root&password=root&useUnicode=true&useSSL=false&characterEncoding=utf-8");
        config.setRuleTableName("t_user_info_encrypt_v3");
        config.setPrimaryCols(Collections.singletonList(new FieldInfo("id", JDBCType.INTEGER.getVendorTypeNumber())));
        config.setPlainCols(
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
