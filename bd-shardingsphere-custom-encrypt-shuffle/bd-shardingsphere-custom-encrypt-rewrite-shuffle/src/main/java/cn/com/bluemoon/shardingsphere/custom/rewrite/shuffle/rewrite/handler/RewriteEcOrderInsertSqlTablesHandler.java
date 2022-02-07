package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Jarod.Kong
 */
public class RewriteEcOrderInsertSqlTablesHandler implements RewriteSqlHandler {
    private static final Set<String> tableNames = new HashSet<String>() {{
        add("oms_b2b_client_storehouse");
        add("ec_oms_address_modify_record");
        add("ec_oms_invoice");
        add("ec_oms_sms_management");
        add("ec_oms_order");
        add("oms_b2b_oper_client_account");
        add("ec_oms_plat_address_modify_record");
        add("oms_b2b_oper_client_base");
        add("ec_oms_plat_tmall_presale_order");
        add("ec_oms_sms_management_sub");
        add("ec_oms_plat_order_decrypt_data");
        add("sys_user");
        add("ec_oms_self_help_query_log");
        add("ec_oms_plat_order_encrypt_data");
        add("ec_oms_channel_shop_base");
        add("oms_b2b_client_distri_channel_charge");
        add("ec_oms_exc_offline_refund_order");
        add("ec_oms_address_clean_record");
        add("ec_oms_exc_reissue_order");
        add("ec_oms_order_import");
    }};

    @Override
    public String handler(RewriteConfiguration config, String sourceSql) {
        if (sourceSql != null) {
            if (config.getDbName() != null && config.getDbName().startsWith("ec_order")) {
                for (String tableName : tableNames) {
                    if (sourceSql.toLowerCase().contains(tableName.toLowerCase())) {
                        return sourceSql;
                    }
                }
            }
        }
        return null;
    }
}
