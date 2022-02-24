INSERT INTO `ec_order`.`ec_oms_plat_order_repeat_alarm` (`id`,`shop_order_id`,`plat_pay_time`,`create_time`) VALUES (79305402,'2422720837978673123','2022-01-18 05:48:59','2022-01-18 05:55:17');
INSERT INTO `ec_order`.`ec_oms_order` (`order_code`,`shop_order_id`,`shop_code`,`relate_order_code`,`plat_order_status`,`breed_num`,`pro_total_num`,`gross_weight`,`buyer_nick`,`has_buyer_message`,`buyer_message`,`seller_message`,`invoice_type`,`invoice_title`,`country`,`province`,`city`,`district`,`town`,`village`,`address`,`post_code`,`receiver_name`,`receiver_mobile`,`receiver_phone`,`send_channel`,`storehouse_code`,`storehouse_name`,`express_code`,`express_name`,`waybill_code`,`order_all_price`,`order_shop_pro_discount_amt`,`order_plat_pro_discount_amt`,`order_shop_discount_amt`,`order_plat_discount_amt`,`shop_all_discount_amt`,`plat_all_discount_amt`,`order_pro_pay_amt`,`order_pay_amt`,`order_received_amt`,`order_all_shipment`,`price_control_discrepancy`,`split_order`,`merge_order`,`client_code`,`pro_codes`,`shop_pro_name`,`remark`,`import_cause`,`import_nopass_cause`,`import_examine_code`,`import_examine_name`,`import_operation_hint`,`dispatch_fail_reason`,`dispatch_type`,`hang_emp_code`,`hang_emp_name`,`create_time`,`last_update_time`,`del_flag`,`creator_id`,`creator_name`,`reissue_relate_order_code`,`sale_channel`,`return_reason`,`apply_file_code`) VALUES (1020220118055517400000000,'2422720837978673123',10156,1020220118055517400000000,'tmall_WAIT_SELLER_SEND_GOODS',1,1,0.58,'福建厦门翔安2017',0,'','',0,'',null,'湖北省','黄冈市','武穴市','余川镇',null,'余*镇湖北省黄冈市武穴市**镇**村六组','435400','余**','*******9679',null,null,null,null,null,null,null,13.9,1,0,0,0,1,0,12.9,12.9,12.9,0,0,null,null,null,'10000127','蓝月亮洗手液抑菌芦荟滋润野菊花清爽500g家用洗手液瓶装正品包邮',null,null,null,null,null,null,null,null,null,null,'2022-01-18 05:55:17','2022-01-18 05:55:17',0,0,'系统账号',null,null,null,null);
INSERT INTO `ec_order`.`ec_oms_order_status` (`order_code`,`order_type`,`business_type`,`order_status`,`place_order_status`,`is_outec`,`handle_type`,`split_type`,`sap_split_type`,`hang_status`,`is_valid`,`is_exc`,`is_bigorder`,`is_beyond_area`,`product_convert_status`,`auto_add_present_status`,`is_auto_examine_adopt`,`examine_adopt_status`,`auto_examine_adopt_reason`,`examine_adopt_time`,`import_commit_order_time`,`verify_status`,`verify_time`,`is_same_receipt_batch`,`receipt_batch_no`,`temporary_receipt_no`,`add_receipt_batch_time`,`add_temporary_receipt_time`,`payment_type`,`payment_status`,`pay_time`,`plat_start_time`,`plat_end_time`,`plat_update_time`,`plat_delivery_time`,`send_sms_status`,`send_sms_time`,`send_sms_fail_resaon`,`is_return_order`,`is_price_structure`,`last_update_time`,`is_risk`,`risk_tips`,`risk_batch`,`risk_control`,`is_presale_order`,`order_sign`,`delivery_limitation`,`logistics_collection`,`is_original_receive`) VALUES (1020220118055517400000000,1,1,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,null,null,null,1,null,0,null,null,null,null,1,1,'2022-01-18 05:48:59','2022-01-18 05:48:43',null,'2022-01-18 05:49:00',null,99,null,null,0,null,'2022-01-18 05:55:17',4,null,null,0,0,0,0,0,0);
INSERT INTO `ec_order`.`ec_oms_order_product_detail` (`id`,`order_code`,`product_code`,`shop_pro_name`,`buy_num`,`actual_num`,`gross_weight`,`pro_type`,`outter_id`,`add_present_type`,`is_present`,`is_convert`,`original_id`,`original_product_code`,`sys_price`,`price_logic`,`is_price_structure`,`pro_one_price`,`pro_all_price`,`pro_shop_discount_amt`,`pro_plat_discount_amt`,`pro_pay_amt`,`order_shop_discount_share`,`order_plat_discount_share`,`shop_discount_amt`,`plat_discount_amt`,`shipment`,`pro_pay_type`,`batch_scope_text`,`last_update_time`,`del_flag`) VALUES (116887405,1020220118055517400000000,10000127,'蓝月亮洗手液抑菌芦荟滋润野菊花清爽500g家用洗手液瓶装正品包邮',1,1,0.58,1,'640027263248',null,0,0,null,10000127,0,0,0,13.9,13.9,1,0,12.9,0,0,1,0,0,0,'','2022-01-18 05:55:17',0);
INSERT INTO `ec_order`.`ec_oms_order_discount` (`id`,`order_code`,`shop_order_id`,`shop_code`,`product_code`,`outter_id`,`order_product_detail_id`,`discount_code`,`discount_name`,`discount_amount`,`discount_type`,`create_time`,`last_update_time`,`del_flag`) VALUES (99682033,1020220118055517400000000,'2422720837978673123',10156,10000127,'640027263248',116887405,'discount_fee',null,1,4,'2022-01-18 05:55:17','2022-01-18 05:55:17',0);
INSERT INTO `ec_order`.`ec_oms_plat_product_detail` (`plat_product_id`,`order_code`,`shop_order_id`,`shop_code`,`product_code`,`shop_pro_name`,`buy_num`,`pro_type`,`outter_id`,`is_present`,`pro_one_price`,`pro_all_price`,`pro_shop_discount_amt`,`pro_plat_discount_amt`,`pro_pay_amt`,`order_shop_discount_share`,`order_plat_discount_share`,`shop_discount_amt`,`plat_discount_amt`,`shipment`,`last_update_time`,`delivery_actual_num`,`del_flag`) VALUES (98070218,1020220118055517400000000,'2422720837978673123',10156,10000127,'蓝月亮洗手液抑菌芦荟滋润野菊花清爽500g家用洗手液瓶装正品包邮',1,1,'640027263248',0,13.9,13.9,1,0,12.9,0,0,1,0,0,'2022-01-18 05:55:17',0,0);
INSERT INTO `ec_order`.`ec_oms_order_oper_log` (`id`,`oper_user_id`,`oper_user_name`,`oper_time`,`oper_type`,`oper_content`,`order_code`,`is_exc`) VALUES (595843932,0,'系统账号','2022-01-18 05:55:17',161,'系统抓取并新增订单',1020220118055517400000000,0);
INSERT INTO `ec_order`.`ec_oms_plat_order_encrypt_data` (`shop_order_id`,`shop_code`,`order_code`,`address_encrypted`,`receiver_name_encrypted`,`receiver_mobile_encrypted`,`address_decrypted`,`receiver_name_decrypted`,`receiver_mobile_decrypted`,`decrypted_time`,`create_time`,`last_update_time`,`is_use`,`decrypted_status`,`plat_name`,`oaid`,`sid`,`decrypt_type`,`decrypt_amt`) VALUES ('2422720837978673123',10156,1020220118055517400000000,'余*镇湖北省黄冈市武穴市**镇**村六组','余**','*******9679','余*镇湖北省黄冈市武穴市**镇**村六组','余**','*******9679',null,'2022-01-18 05:55:17','2022-01-18 05:55:17',1,0,'tmall','12adgP50aXfDhicmFMpzElXxPvvKoAib6yx3C6bib1ZhGDIUSamVD7cQNwkWI0UKEZ4lhMsgXf',null,null,0);
INSERT INTO `ec_order`.`ec_oms_order_tmall` (`tid`,`status`,`type`,`seller_nick`,`buyer_nick`,`created`,`modified`,`jdp_hashcode`,`jdp_response`,`jdp_created`,`jdp_modified`,`update_delivery_status`) VALUES (2422720837978673123,'WAIT_SELLER_SEND_GOODS','fixed','蓝月亮品牌','福建厦门翔安2017','2022-01-18 05:48:43','2022-01-18 05:49:00','-71042129','{\"trade_fullinfo_get_response\":{\"trade\":{\"tid\":2422720837978673123,\"tid_str\":\"2422720837978673123\",\"status\":\"WAIT_SELLER_SEND_GOODS\",\"type\":\"fixed\",\"seller_nick\":\"蓝月亮品牌\",\"buyer_nick\":\"福建厦门翔安2017\",\"created\":\"2022-01-18 05:48:43\",\"oaid\":\"12adgP50aXfDhicmFMpzElXxPvvKoAib6yx3C6bib1ZhGDIUSamVD7cQNwkWI0UKEZ4lhMsgXf\",\"modified\":\"2022-01-18 05:49:00\",\"ofp_hold\":0,\"trade_attr\":\"{\\\"cutoffMinutes\\\":\\\"960\\\",\\\"collectTime\\\":\\\"2022-01-18 23:59:59\\\",\\\"signTime\\\":\\\"2022-01-20 16:00:00\\\",\\\"deliveryTime\\\":\\\"2022-01-18 23:59:59\\\",\\\"esTime\\\":\\\"2\\\"}\",\"sign_time\":\"2022-01-20 16:00:00\",\"adjust_fee\":\"0.00\",\"alipay_no\":\"2022011822001192331424058310\",\"alipay_point\":0,\"available_confirm_fee\":\"12.90\",\"buyer_alipay_no\":\"185****9679\",\"buyer_area\":\"\",\"buyer_cod_fee\":\"0.00\",\"buyer_email\":\"\",\"buyer_obtain_point_fee\":0,\"buyer_rate\":false,\"cod_fee\":\"0.00\",\"cod_status\":\"NEW_CREATED\",\"coupon_fee\":0,\"commission_fee\":\"0.00\",\"discount_fee\":\"0.00\",\"has_post_fee\":true,\"is_3D\":false,\"is_brand_sale\":false,\"is_daixiao\":false,\"is_force_wlb\":false,\"is_lgtype\":false,\"is_part_consign\":false,\"is_wt\":false,\"num\":1,\"num_iid\":640027263248,\"orders\":{\"order\":[{\"adjust_fee\":\"0.00\",\"buyer_rate\":false,\"cid\":50012923,\"discount_fee\":\"1.00\",\"divide_order_fee\":\"12.90\",\"is_oversold\":false,\"num\":1,\"num_iid\":640027263248,\"oid\":2422720837978673123,\"order_from\":\"WAP,WAP\",\"outer_sku_id\":\"10000127\",\"part_mjz_discount\":\"0.00\",\"payment\":\"12.90\",\"pic_path\":\"https://img.alicdn.com/bao/uploaded/i3/2209327614793/O1CN01UdL7cA1lHF2zCfuId_!!2209327614793-0-tblite.jpg\",\"price\":\"13.90\",\"refund_status\":\"NO_REFUND\",\"seller_rate\":false,\"seller_type\":\"C\",\"sku_id\":\"4750719484550\",\"sku_properties_name\":\"净含量:300g;香味:芦荟500g*1瓶\",\"snapshot_url\":\"u:2422720837978673123_1\",\"status\":\"WAIT_SELLER_SEND_GOODS\",\"title\":\"蓝月亮洗手液抑菌芦荟滋润野菊花清爽500g家用洗手液瓶装正品包邮\",\"total_fee\":\"12.90\"}]},\"pay_time\":\"2022-01-18 05:48:59\",\"payment\":\"12.90\",\"pcc_af\":0,\"pic_path\":\"https://img.alicdn.com/bao/uploaded/i3/2209327614793/O1CN01UdL7cA1lHF2zCfuId_!!2209327614793-0-tblite.jpg\",\"point_fee\":0,\"post_fee\":\"0.00\",\"price\":\"13.90\",\"promotion_details\":{\"promotion_detail\":[{\"discount_fee\":\"3.00\",\"id\":2422720837978673123,\"promotion_desc\":\"买贵必赔V3:省3.00元\",\"promotion_id\":\"liteMgbpItemPromotion-17959914349_588835251198\",\"promotion_name\":\"买贵必赔V3\"},{\"discount_fee\":\"0.00\",\"id\":2422720837978673123,\"promotion_desc\":\"1月柔顺剂顺手买一件:省0.00元\",\"promotion_id\":\"taobaoTiedPromotion-43823853252_589196772606\",\"promotion_name\":\"1月柔顺剂顺手买一件\"}]},\"real_point_fee\":0,\"received_payment\":\"0.00\",\"receiver_address\":\"余*镇湖北省黄冈市武穴市**镇**村六组\",\"receiver_city\":\"黄冈市\",\"receiver_district\":\"武穴市\",\"receiver_mobile\":\"*******9679\",\"receiver_name\":\"余**\",\"receiver_state\":\"湖北省\",\"receiver_town\":\"余川镇\",\"receiver_zip\":\"435400\",\"seller_alipay_no\":\"***ntjapp@bluemoon.com.cn\",\"seller_can_rate\":false,\"seller_cod_fee\":\"0.00\",\"seller_email\":\"moontjapp@bluemoon.com.cn\",\"seller_flag\":0,\"seller_mobile\":\"13680331130\",\"seller_name\":\"蓝月亮（中国）有限公司\",\"seller_rate\":false,\"service_tags\":{\"logistics_tag\":[{\"logistic_service_tag_list\":{\"logistic_service_tag\":[{\"service_tag\":\"origAreaId=421182;lgType=-4\",\"service_type\":\"FAST\"},{\"service_tag\":\"cutoffMinutes=960;collectTime=2022-01-18 23:59:59;promiseService=tmallPlatformEstimate.arrival.timing;esDate=2022-01-20;waveDate=2022-01-18;asdpEstimateDate=2022-01-20;deliveryTime=2022-01-18 23:59:59;signTime=2022-01-20 16:00:00;asdpTimingNDShipType=null;esTime=2\",\"service_type\":\"PREDICTIVE_TIME_TMALL_PLATFORM\"}]},\"order_id\":\"2422720837978673123\"},{\"logistic_service_tag_list\":{\"logistic_service_tag\":[{\"service_tag\":\"cutoffMinutes=960;collectTime=2022-01-18 23:59:59;promiseService=tmallPlatformEstimate.arrival.timing;esDate=2022-01-20;waveDate=2022-01-18;asdpEstimateDate=2022-01-20;deliveryTime=2022-01-18 23:59:59;signTime=2022-01-20 16:00:00;asdpTimingNDShipType=null;esTime=2\",\"service_type\":\"PREDICTIVE_TIME_TMALL_PLATFORM\"}]},\"order_id\":\"2422720837978673123\"}]},\"shipping_type\":\"express\",\"snapshot_url\":\"u:2422720837978673123_1\",\"title\":\"蓝月亮官方折扣店\",\"total_fee\":\"13.90\",\"trade_from\":\"WAP,WAP\"}}}','2022-01-18 05:48:44','2022-01-18 05:49:01',0);
INSERT INTO `ec_order`.`ec_oms_order_tmall_product_detail` (`tid`,`oid`,`outer_iid`,`outer_sku_id`,`num_iid`,`num`,`price`,`total_fee`,`adjust_fee`,`discount_fee`,`divide_order_fee`,`part_mjz_discount`,`payment`,`update_delivery_status`,`update_notice_delivery_status`) VALUES (2422720837978673123,2422720837978673123,null,'10000127',640027263248,1,13.9,12.9,0,1,12.9,0,12.9,0,0);