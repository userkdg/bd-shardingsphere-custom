
集成方式一：
maven依赖，公司私服
```
<dependency>
    <groupId>cn.com.bluemoon</groupId>
    <artifactId>bd-kms-encrypt-sdk</artifactId>
    <version>1.0.0-SNAPSHOT</version>
</dependency>
```

集成方式二：
全部依赖打成一个jar，bd-kms-encrypt-sdk-1.0.0-SNAPSHOT-jar-with-dependencies.jar


使用方法：

解密方法：
```
// 电商
String sys = "ec";
// 密文
String cipher = "密文"
// 明文值
Object plain = EncryptAlgorithmUtils.decrypt(sys, cipher)

```

加密方法：
```
Object plain = "明文";
String sys = "ec";
// 密文值
String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
```


电商ec_order库表加密字段罗列：

|  表名   | 字段名 |
|  ----  | ----  |
| ec_oms_order | address | 
| ec_oms_order | receiver_name | 
| ec_oms_order | receiver_mobile | 
| ec_oms_order | receiver_phone | 
| ec_oms_plat_order_encrypt_data | address_decrypted | 
| ec_oms_plat_order_encrypt_data | receiver_name_decrypted | 
| ec_oms_plat_order_encrypt_data | receiver_mobile_decrypted | 
| ec_oms_order_import | receiver_name | 
| ec_oms_order_import | receiver_mobile | 
| ec_oms_order_import | address | 
| ec_oms_order_import | receiver_phone | 
| ec_oms_invoice | buyer_bank_account | 
| ec_oms_invoice | buyer_address | 
| ec_oms_invoice | invoice_receiver_phone | 
| ec_oms_invoice | invoice_receiver_address | 
| ec_oms_invoice | invoice_receiver | 
| ec_oms_invoice | buyer_phone | 
| ec_oms_plat_order_decrypt_data | address_decrypted | 
| ec_oms_plat_order_decrypt_data | receiver_name_decrypted | 
| ec_oms_plat_order_decrypt_data | receiver_mobile_decrypted | 
| ec_oms_sms_management_sub | phone_number | 
| ec_oms_sms_management_sub | receive_name | 
| ec_oms_plat_tmall_presale_order | address | 
| ec_oms_plat_tmall_presale_order | receiver_name | 
| ec_oms_plat_tmall_presale_order | receiver_mobile | 
| ec_oms_plat_tmall_presale_order | receiver_phone | 
| ec_oms_sms_management | phone_number | 
| ec_oms_sms_management | receive_name | 
| ec_oms_plat_address_modify_record | address | 
| ec_oms_plat_address_modify_record | receiver_name | 
| ec_oms_plat_address_modify_record | receiver_phone | 
| ec_oms_exc_reissue_order | receiver_name | 
| ec_oms_exc_reissue_order | address | 
| ec_oms_exc_reissue_order | receiver_mobile | 
| ec_oms_exc_reissue_order | receiver_phone | 
| ec_oms_address_modify_record | address | 
| ec_oms_address_modify_record | receiver_name | 
| ec_oms_address_modify_record | receiver_mobile | 
| ec_oms_address_modify_record | receiver_phone | 
| ec_oms_address_clean_record | address | 
| oms_b2b_oper_client_base | client_name | 
| oms_b2b_oper_client_base | mobile_phone | 
| oms_b2b_oper_client_base | company_address | 
| oms_b2b_oper_client_base | charge_phone | 
| oms_b2b_oper_client_base | invoice_account | 
| oms_b2b_oper_client_base | receive_invoice_name | 
| oms_b2b_oper_client_base | receive_invoice_phone | 
| oms_b2b_oper_client_base | receive_invoice_address | 
| oms_b2b_oper_client_account | account_card | 
| ec_oms_self_help_query_log | receiver_mobile | 
| sys_user | mobile | 
| oms_b2b_client_storehouse | charge_phone | 
| ec_oms_exc_offline_refund_order | account | 
| ec_oms_exc_offline_refund_order | account_name | 
| ec_oms_channel_shop_base | shop_password | 
| ec_oms_channel_shop_base | shop_phone_number | 
| oms_b2b_client_distri_channel_charge | charge_phone | 
