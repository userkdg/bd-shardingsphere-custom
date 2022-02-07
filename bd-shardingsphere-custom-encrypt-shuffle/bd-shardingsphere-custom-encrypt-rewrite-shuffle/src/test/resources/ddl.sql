create table buried_point_config
(
    id               int(11) unsigned auto_increment comment '主键ID'
        primary key,
    url              varchar(128)                         not null comment 'URL标识',
    event_name       varchar(64)                          not null comment '事件名称',
    system_name      varchar(64)                          not null comment '系统名称',
    module_name      varchar(64)                          not null comment '模块名称',
    page_name        varchar(64)                          not null comment '页面名称',
    function_name    varchar(64)                          not null comment '功能名称',
    remarks          varchar(256)                         not null comment '备注',
    creator_id       int(10)                              not null comment '创建人编号',
    creator_name     varchar(32)                          not null comment '创建人名称',
    create_time      timestamp  default CURRENT_TIMESTAMP not null comment '创建时间',
    operator_id      int(10)                              not null comment '操作人编号',
    operator_name    varchar(32)                          not null comment '操作人名称',
    last_update_time timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint(3) default 0                 not null comment '删除标记@1-是 0-否'
)
    comment '埋点事件配置表';

create table dba_check_otter_sync
(
    id              int auto_increment comment 'id'
        primary key,
    finenter_to_oms datetime null comment 'oms同步至mallorder的时间戳',
    oms_to_finenter datetime null comment 'mallorder同步至oms的时时间戳'
)
    comment 'zabbix监控otter同步表' charset = utf8;

create table dim_area
(
    province_code       varchar(50) null comment '省编码',
    province_desc       varchar(50) null comment '省名称',
    province_short_desc varchar(50) null comment '省简称',
    city_code           varchar(50) null comment '城市编码',
    city_desc           varchar(50) null comment '城市名称',
    county_code         varchar(50) null comment '乡镇编码',
    county_desc         varchar(50) null comment '乡镇名称',
    etl_date            date        null comment 'etl时间'
)
    comment '省市维表' charset = utf8;

create table dim_ec_channel_data_authorization
(
    channel_id    int unsigned null comment '主键',
    plat_form     varchar(50)  null comment '店铺来源',
    channel_group varchar(50)  null comment '店铺组',
    channel_name  varchar(50)  null comment '店铺组名称',
    channel_code  varchar(50)  null comment '店铺组代码',
    valid_time    varchar(50)  null comment '有效时间',
    is_front_show varchar(50)  null comment '是否前端展示 1-展示 0-不展示',
    order_id      varchar(50)  null comment 'order_id'
)
    comment '大数据店铺组信息表' charset = utf8;

create table dim_ec_channel_data_authorization_test
(
    id            varchar(500) null,
    plat_form     varchar(500) null,
    channel_group varchar(500) null,
    channel_name  varchar(500) null,
    channel_code  varchar(500) null,
    valid_time    varchar(500) null,
    is_front_show varchar(500) null,
    etl_datetime  varchar(500) null,
    order_id      varchar(500) null
);

create table dim_ec_ldp_express_test
(
    data_id        varchar(32)  null,
    pk_express_id  varchar(10)  not null
        primary key,
    express_code   varchar(10)  null,
    express_name   varchar(30)  null,
    start_time     varchar(32)  null,
    end_time       varchar(32)  null,
    express_remark varchar(100) null,
    is_freeze      varchar(3)   null,
    etl_datetime   timestamp(6) null
);

create table dim_ec_ldp_warehouse_test
(
    data_id               varchar(32)  null,
    pk_warehouse_id       varchar(10)  not null
        primary key,
    warehouse_code        varchar(20)  null,
    warehouse_name        varchar(64)  null,
    return_warehouse_id   varchar(20)  null,
    return_warehouse_name varchar(64)  null,
    warehouse_type        varchar(3)   null,
    deliver_type          varchar(3)   null,
    deliver_name          varchar(12)  null,
    is_freeze             varchar(3)   null,
    etl_datetime          timestamp(6) null
);

create table dim_ec_oms_channel_shop_info
(
    shop_code         bigint       null comment '店铺编码',
    shop_short_name   varchar(128) null comment '店铺名称',
    shop_english_code varchar(128) null comment '店铺英文代码'
)
    comment '大数据新oms店铺信息' charset = utf8;

create table dim_ec_oms_channel_shop_info_test
(
    data_id              varchar(500) null,
    channel_code         varchar(500) null,
    channel_name         varchar(500) null,
    chan_is_frozen       varchar(500) null,
    chan_remark          varchar(500) null,
    shop_code            varchar(500) null,
    shop_name            varchar(500) null,
    shop_short_name      varchar(500) null,
    shop_english_code    varchar(500) null,
    sap_client_code      varchar(500) null,
    sap_shop_code        varchar(500) null,
    platform_name        varchar(500) null,
    delivery_limitation  varchar(500) null,
    logistics_collection varchar(500) null,
    complain_days        varchar(500) null,
    shop_is_frozen       varchar(500) null,
    shop_is_docking      varchar(500) null,
    shop_remark          varchar(500) null,
    etl_datetime         varchar(500) null
);

create table dim_ec_oms_product_base_test
(
    data_id              varchar(32)    null,
    product_code         varchar(20)    null,
    product_type         varchar(10)    null,
    product_name         varchar(100)   null,
    product_short_name   varchar(30)    null,
    category_first       varchar(10)    null,
    category_first_name  varchar(400)   null,
    category_second      varchar(10)    null,
    category_second_name varchar(400)   null,
    category_thrid       varchar(10)    null,
    category_thrid_name  varchar(400)   null,
    is_frozen            varchar(3)     null,
    retail_price         decimal(16, 4) null,
    claim_price          decimal(16, 4) null,
    claim_price_type     decimal(3)     null,
    volume_unit          decimal(8, 4)  null,
    unit_length          decimal(8, 4)  null,
    unit_width           decimal(8, 4)  null,
    unit_height          decimal(8, 4)  null,
    net_weight           decimal(8, 2)  null,
    gross_weight         decimal(8, 2)  null,
    unit                 decimal(3)     null,
    shelf_life           decimal(5)     null,
    barcode              varchar(20)    null,
    box_barcode          varchar(20)    null,
    carton               decimal(5)     null,
    is_present           varchar(3)     null,
    estimated_usage_days decimal(5)     null,
    id                   varchar(20)    null,
    sub_product_code     varchar(20)    null,
    product_num          decimal(5)     null,
    sub_retail_price     decimal(16, 4) null,
    sub_retail_rate      decimal(16, 5) null,
    is_zz_product        varchar(10)    null,
    zz_version           varchar(1024)  null,
    pic_url              varchar(512)   null,
    etl_datetime         timestamp(6)   null
);

create table dim_ec_oms_zz_product_info
(
    package_id     bigint       null comment '产品编码',
    package_name   varchar(128) null comment '产品名称',
    zz_product_num int(10)      null comment '产品数量',
    zz_rate        varchar(50)  null comment '至尊比例'
)
    comment '大数据新oms至尊产品表' charset = utf8;

create table dim_ec_user_channel_group
(
    user_id       bigint       null comment '用户编码',
    plat_form     varchar(128) null comment '店铺类型',
    channel_group varchar(50)  null comment '店铺组'
)
    comment '大数据电商权限控制' charset = utf8;

create table dim_moonr_oms_channel_shop_info_test
(
    data_id              varchar(64)  null,
    channel_code         varchar(40)  null,
    channel_name         varchar(80)  null,
    channel_is_frozen    varchar(10)  null,
    channel_remark       varchar(200) null,
    shop_code            varchar(40)  null,
    shop_name            varchar(50)  null,
    shop_short_name      varchar(20)  null,
    shop_english_code    varchar(20)  null,
    sap_client_code      varchar(20)  null,
    sap_shop_code        varchar(20)  null,
    platform_name        varchar(40)  null,
    delivery_limitation  varchar(40)  null,
    logistics_collection varchar(40)  null,
    complain_days        varchar(40)  null,
    shop_is_frozen       varchar(10)  null,
    is_docking           varchar(10)  null,
    shop_remark          varchar(200) null,
    data_date            varchar(8)   null,
    etl_datetime         timestamp(6) null
);

create table ec_oms_address_clean_record
(
    id             int unsigned auto_increment comment '主键'
        primary key,
    order_code     decimal(30)                                not null comment '订单编号',
    province       varchar(32)                                not null comment '收货人省份',
    city           varchar(32)                                not null comment '收货人城市',
    district       varchar(32)                                not null comment '收货人区县',
    address        varchar(255)                               not null comment '收货人详细地址',
    address_cipher varchar(1024)                              null comment '收货人详细地址',
    create_time    timestamp        default CURRENT_TIMESTAMP not null comment '创建时间',
    quality_result tinyint unsigned default 0                 not null comment '质检结果0-未检查-1-合格-2不合格'
)
    comment 'ec订单地址清洗记录表';

create index idx_ctime_qresult
    on ec_oms_address_clean_record (create_time, quality_result);

create index idx_order_code
    on ec_oms_address_clean_record (order_code);

create table ec_oms_address_modify_record
(
    id                     int unsigned auto_increment comment '主键ID'
        primary key,
    order_code             decimal(30) unsigned                       not null comment 'EC订单编号',
    province               varchar(32)                                null comment '收货人省份',
    city                   varchar(32)                                null comment '收货人城市',
    district               varchar(32)                                null comment '收货人区县',
    town                   varchar(32)                                null comment '收货人城镇',
    village                varchar(32)                                null comment '社区/村',
    address                varchar(255)                               null comment '收货人详细地址',
    address_cipher         varchar(1024)                              null comment '收货人详细地址',
    post_code              varchar(10)                                null comment '邮政编码',
    receiver_name          varchar(32)      default ''                not null comment '收货人姓名',
    receiver_name_cipher   varchar(152)                               null comment '收货人姓名',
    receiver_mobile        varchar(20)                                null comment '收货人手机',
    receiver_mobile_cipher varchar(88)                                null comment '收货人手机',
    receiver_phone         varchar(32)                                null comment '收货人固定电话',
    receiver_phone_cipher  varchar(152)                               null comment '收货人固定电话',
    qianniu_result         tinyint unsigned                           null comment '千牛返回结果(字典ec_oms_qianniu_result)@0-未返回1-成功2-失败',
    qianniu_fail_reason    tinyint unsigned                           null comment '千牛返回失败原因(字典ec_oms_qianniu_fail_reason)',
    modify_result          tinyint unsigned                           null comment '实际修改结果(字典ec_oms_address_modify_result)@0-失败1-成功2-修改中',
    modify_fail_reason     tinyint unsigned                           null comment '实际修改失败原因(字典ec_oms_address_modify_fail_reason)',
    mark_exc_time          timestamp                                  null comment '标记异常时间',
    creator_id             int unsigned                               null comment '创建人编号',
    creator_name           varchar(32)                                null comment '创建人名称',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id            int unsigned                               null comment '操作人编号',
    operator_name          varchar(32)                                null comment '操作人名称',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag               tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单地址修改记录表';

create index idx_order_code
    on ec_oms_address_modify_record (order_code);

create table ec_oms_ag_recover_send_config
(
    id                int unsigned auto_increment comment '编号'
        primary key,
    config_name       varchar(64)                            null comment '配置名称',
    shop_code         int unsigned                           null comment '店铺编号',
    config_start_time timestamp                              not null comment '配置开始时间',
    config_end_time   timestamp                              not null comment '配置结束时间',
    creator_id        int                                    null comment '创建人编号',
    creator_name      varchar(32)                            null comment '创建人名称',
    create_time       timestamp    default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id       int                                    null comment '操作人编号',
    operator_name     varchar(32)                            null comment '操作人名称',
    last_update_time  timestamp    default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag          int unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment 'AG自动恢复发货配置表';

create index idx_config_start_time
    on ec_oms_ag_recover_send_config (config_start_time);

create table ec_oms_ag_recover_send_config_op_record
(
    id                  int unsigned auto_increment comment '编号'
        primary key,
    config_id           int unsigned                        not null comment '配置编号',
    config_name         varchar(64)                         null comment '配置名称',
    operate_describe    tinyint                             null comment '操作描述(业务字典ec_oms_ag_recover_config_operate_type)',
    shop_code           int unsigned                        not null comment '店铺编号',
    return_product_code bigint unsigned                     not null comment '退款商品编号',
    present_code        varchar(64)                         not null comment '赠品商品编号',
    config_start_time   timestamp                           null comment '配置开始时间',
    config_end_time     timestamp                           null comment '配置结束时间',
    operator_id         int                                 null comment '操作人编号',
    operator_name       varchar(32)                         null comment '操作人名称',
    operate_time        timestamp default CURRENT_TIMESTAMP null comment '操作时间'
)
    comment 'AG自动恢复发货配置操作记录表';

create table ec_oms_ag_recover_send_config_sub
(
    id                  int unsigned auto_increment comment '编号'
        primary key,
    config_id           int unsigned                           not null comment '配置编号',
    return_product_code bigint unsigned                        not null comment '退款商品编号',
    present_code        bigint unsigned                        not null comment '赠品商品编号',
    creator_id          int                                    null comment '创建人编号',
    creator_name        varchar(32)                            null comment '创建人名称',
    create_time         timestamp    default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id         int                                    null comment '操作人编号',
    operator_name       varchar(32)                            null comment '操作人名称',
    last_update_time    timestamp    default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag            int unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment 'AG自动恢复发货配置子表';

create index idx_config_id
    on ec_oms_ag_recover_send_config_sub (config_id);

create index idx_present_code
    on ec_oms_ag_recover_send_config_sub (present_code);

create index idx_return_product_code
    on ec_oms_ag_recover_send_config_sub (return_product_code);

create table ec_oms_amount_refund_apply
(
    apply_code           varchar(14)                                not null comment '额度退款申请编号,BC+年月日+4位顺序码'
        primary key,
    refund_code          bigint unsigned                            not null comment '退款单号',
    order_code           decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_order_id        varchar(64)                                not null comment '店铺订单编号',
    exc_waybill_code     varchar(30)                                not null comment '异常快递单号',
    refund_amount_type   tinyint unsigned default 1                 not null comment '退款额度类型（字典 ec_oms_refund_amount_type 1-可抵扣金额 2-预存款金额）',
    refund_amount        decimal(14, 4) unsigned                    not null comment '退款金额',
    order_all_price      decimal(14, 4) unsigned                    not null comment '订单实付金额',
    order_all_shipment   decimal(14, 4)   default 0.0000            not null comment '订单总邮费',
    amount_refund_method tinyint unsigned default 1                 not null comment '退款方式（字典 ec_oms_amount_refund_method 1-立即退款 2-退货入库后退款）',
    amount_refund_status tinyint unsigned                           not null comment '审核状态（字典ec_oms_amount_refund_status 1-待提交 2-待退货 99-待财务审核 3-被驳回 4-已退款 5-已取消）字典最大值为99',
    client_code          varchar(32)                                null comment '平台客户编码',
    shop_code            int unsigned                               not null comment '店铺来源编号',
    buyer_nick           varchar(64)                                null comment '买家昵称/ID',
    pay_time             timestamp                                  null comment '订单支付时间',
    auto_refund_msg_type tinyint unsigned default 0                 not null comment '自动退款信息类型，字典ec_oms_auto_refund_msg_type 0-否，1-系统备注：退款金额类型为【可抵扣金额】，且【退款金额】≤500，无需审核！',
    creator_id           int unsigned                               null comment '创建人编号',
    creator_name         varchar(32)                                null comment '创建人名称',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id          int unsigned                               null comment '操作人编号',
    operator_name        varchar(32)                                null comment '操作人名称',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    constraint idx_refund_code
        unique (refund_code) comment '退款单编号'
)
    comment '额度退款申请表';

create index idx_method_status_time
    on ec_oms_amount_refund_apply (amount_refund_method, amount_refund_status, last_update_time)
    comment '定时器索引';

create index idx_order_code
    on ec_oms_amount_refund_apply (order_code)
    comment 'EC订单编号索引';

create index idx_status_time
    on ec_oms_amount_refund_apply (amount_refund_status, pay_time, shop_code)
    comment '排序索引';

create table ec_oms_amount_refund_apply_log
(
    id           bigint unsigned auto_increment comment '自增主键'
        primary key,
    apply_code   varchar(14)                            not null comment '退款申请编号',
    oper_node    tinyint(4) unsigned                    not null comment '操作节点（字典ec_oms_amount_refund_oper_node 1-申请人 2-财务审核）',
    oper_type    tinyint(4) unsigned                    not null comment '操作类型（字典ec_oms_amount_refund_oper_type 1-提交 2-审核通过 3-驳回 4-取消）',
    remark       varchar(300) default ''                not null comment '操作备注',
    creator_id   int unsigned                           null comment '创建人编号',
    creator_name varchar(32)                            null comment '创建人名称',
    create_time  timestamp    default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '额度退款申请操作记录表';

create index idx_apply_code
    on ec_oms_amount_refund_apply_log (apply_code)
    comment '退款申请编号索引';

create table ec_oms_amount_refund_recharge_log
(
    id                bigint unsigned auto_increment comment '主键'
        primary key,
    order_code        decimal(30) unsigned                       not null comment 'EC订单编号',
    apply_code        varchar(14)                                not null comment '额度退款申请编号,BC+年月日+4位顺序码',
    recharge_type     tinyint unsigned default 2                 not null comment '充值类型，字典：ec_b2b_recharge_type@1-可抵扣金额,2-预存款金额',
    refund_amount     decimal(14, 4) unsigned                    not null comment '退款金额',
    client_code       varchar(15)                                not null comment '客户编号',
    company_full_name varchar(100)                               null comment '公司名称',
    remark            varchar(255)                               null comment '备注',
    creator_id        int unsigned                               null comment '创建人编号',
    creator_name      varchar(32)                                null comment '创建人名称',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag          tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '额度退款记录表';

create index idx_time_del
    on ec_oms_amount_refund_recharge_log (del_flag, create_time)
    comment '定时器索引';

create table ec_oms_attachment
(
    id               bigint unsigned auto_increment comment '主键ID'
        primary key,
    file_name        varchar(128)                               null comment '文件源名',
    file_path        varchar(1024)                              not null comment '文件保存路径',
    business_type    tinyint unsigned                           not null comment '业务类型，枚举(Java类配置AttachmentBusinessTypeContants.java)',
    business_code    varchar(32)                                not null comment '业务流水号(关联对应业务数据主键，如需要再使用备用字段)',
    spare1           varchar(32)                                null comment '备用字段1',
    spare2           varchar(32)                                null comment '备用字段2',
    spare3           varchar(32)                                null comment '备用字段3',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单统一附件存储表';

create index idx2_attach_business_code
    on ec_oms_attachment (business_type, business_code);

create table ec_oms_auto_add_present
(
    plan_code                  bigint unsigned                            not null comment '策略编码'
        primary key,
    plan_name                  varchar(20)                                not null comment '策略名称',
    shop_code                  int unsigned                               not null comment '平台来源（店铺编号）',
    plan_start_time            timestamp                                  null comment '策略开始时间',
    plan_end_time              timestamp                                  null comment '策略结束时间',
    plan_status                tinyint unsigned default 1                 not null comment '策略状态@1-启用0-停用',
    time_type                  tinyint unsigned                           not null comment '时间类型@1-订单付款时间',
    add_present_type           tinyint unsigned default 1                 not null comment '加赠类型@1-满额送 2-满件送 3-指定商品送',
    is_limit_order_send        tinyint unsigned default 0                 not null comment '是否限单@1-是 0-否',
    limit_order_send_num       int(6) unsigned                            null comment '对前N张单有效',
    added_present_num          int(6) unsigned  default 0                 null comment '已加赠订单数量',
    is_support_multiple        tinyint unsigned default 0                 not null comment '是否倍送@1-是 0-否',
    limit_support_multiple_num int unsigned                               null comment '最多送N倍',
    is_specify_buyer_scope     tinyint unsigned default 0                 not null comment '是否指定买家范围@1-是 0-否',
    product_scope_type         tinyint unsigned default 0                 not null comment '商品范围类型@0-无 1-排除 2-包含 ',
    product_scope_code         varchar(1024)                              null comment '商品范围类型对应的产品编码',
    verify_user_code           int unsigned                               null comment '审核用户编号',
    verify_user_name           varchar(32)                                null comment '审核用户姓名',
    verify_time                timestamp                                  null comment '审核时间',
    no_pass_reason             varchar(128)                               null comment '审核不通过原因',
    creator_id                 int unsigned                               null comment '创建人编号',
    creator_name               varchar(32)                                null comment '创建人名称',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id                int unsigned                               null comment '操作人编号',
    operator_name              varchar(32)                                null comment '操作人名称',
    last_update_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                   tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '自动加赠策略主表';

create table ec_oms_auto_add_present_sub
(
    id                   int unsigned auto_increment comment '主键ID'
        primary key,
    plan_code            bigint unsigned            not null comment '策略编号，关联表ec_oms_auto_add_present中plan_code',
    plan_sub_type        tinyint unsigned default 1 not null comment '关联类型@1-赠品策略，2-指定买家范围',
    target_product_code  bigint unsigned            null comment '目标产品编码',
    target_product_name  varchar(100)               null comment '目标产品名称',
    target_product_num   int unsigned               null comment '目标产品数量',
    full_order_payment   decimal(12, 4)             null comment '金额满',
    full_order_num       int unsigned               null comment '数量满',
    present_product_code bigint unsigned            null comment '赠送产品编码',
    present_product_name varchar(100)               null comment '赠送产品名称',
    present_product_num  int unsigned               null comment '赠送产品数量',
    buyer_id             varchar(32)                null comment '指定买家ID',
    del_flag             tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '自动加赠策略详情表';

create index idx_plan_code
    on ec_oms_auto_add_present_sub (plan_code);

create table ec_oms_auto_assignment
(
    plan_code        bigint unsigned                            not null comment '策略编码'
        primary key,
    plan_name        varchar(50)                                not null comment '策略名称',
    plan_start_time  timestamp                                  not null comment '策略开始时间',
    plan_end_time    timestamp                                  not null comment '策略结束时间',
    plan_status      tinyint unsigned default 1                 not null comment '启用状态@1-启用0-停用',
    shop_codes       varchar(1024)                              not null comment '关联的店铺编号，多个逗号分隔',
    remark           varchar(200)                               null comment '备注',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '自动指派策略管理表';

create table ec_oms_auto_assignment_record
(
    id             int unsigned auto_increment comment '主键ID'
        primary key,
    group_code     int unsigned           not null comment '客服组编号（关联表ec_oms_customer_service_group.group_code）',
    customer_code  int unsigned           not null comment '客服编号(关联：ec_oms_customer_service.customer_code)',
    assigned_times int unsigned default 0 not null comment '当天已指派次数',
    record_date    date                   not null comment '日期'
)
    comment '自动指派每日次数记录表';

create index idx_customer_code
    on ec_oms_auto_assignment_record (customer_code);

create table ec_oms_auto_assignment_sub
(
    id                  int unsigned auto_increment comment '主键ID'
        primary key,
    plan_code           bigint unsigned                            not null comment '策略编码',
    issue_type_code     int unsigned                               not null comment '二级问题编号（关联表ec_oms_issue_type_base.issue_type_code）',
    issue_subject_code  int unsigned                               not null comment '一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code）',
    issue_reason_code   int unsigned                               null comment '问题原因编号（关联表ec_oms_issue_reason_base.issue_reason_code）',
    first_group_code    int unsigned                               not null comment '首选客服组编号（关联表ec_oms_customer_service_group.group_code）',
    first_customer_code int unsigned                               null comment '首选客服编号',
    second_group_codes  varchar(255)                               null comment '备选客服组编号，多个逗号分隔',
    creator_id          int unsigned                               null comment '创建人编号',
    creator_name        varchar(32)                                null comment '创建人名称',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id         int unsigned                               null comment '操作人编号',
    operator_name       varchar(32)                                null comment '操作人名称',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag            tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '自动指派策略详情表';

create index idx_plan_code
    on ec_oms_auto_assignment_sub (plan_code);

create table ec_oms_catch_delay_strategy
(
    id                    int unsigned auto_increment comment 'id'
        primary key,
    strategy_code         varchar(13)                                not null comment '策略编码',
    strategy_name         varchar(20)                                not null comment '策略名称',
    start_time            timestamp                                  not null comment '策略开始时间',
    end_time              timestamp                                  not null comment '策略结束时间',
    delay_time_difference smallint unsigned                          not null comment '抓单延迟时差min',
    creator_id            int unsigned                               null comment '创建人编号',
    creator_name          varchar(32)                                null comment '创建人名称',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id           int unsigned                               null comment '操作人编号',
    operator_name         varchar(32)                                null comment '操作人名称',
    last_update_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag              tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '延迟抓单策略表';

create table ec_oms_catch_delay_strategy_detail
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    strategy_code    varchar(13)                                not null comment '策略编码',
    shop_code        int unsigned                               not null comment '店铺编号',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '延迟抓单策略详情表';

create index idx_strategy_code
    on ec_oms_catch_delay_strategy_detail (strategy_code)
    comment '策略编码索引';

create table ec_oms_channel_base
(
    channel_code      int unsigned                               not null comment '渠道编号，按序号排列，5位数字（10000）'
        primary key,
    channel_name      varchar(20)                                not null comment '所属渠道名称',
    channel_level_one tinyint unsigned default 0                 not null comment '一级渠道 0-电商 1-异业（字典:ec_oms_channel_level_one）',
    is_frozen         tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    remark            varchar(100)                               null comment '备注',
    creator_id        int                                        null comment '创建人编号',
    creator_name      varchar(32)                                null comment '创建人名称',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id       int                                        null comment '操作人编号',
    operator_name     varchar(32)                                null comment '操作人名称',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '店铺渠道主数据表';

create table ec_oms_channel_shop_base
(
    shop_code                int unsigned                                 not null comment '店铺编号，按序号排列，5位数字（10000）'
        primary key,
    shop_name                varchar(50)                                  not null comment '店铺全称',
    shop_short_name          varchar(20)                                  not null comment '店铺简称',
    shop_english_code        varchar(20)                                  not null comment '店铺代码',
    channel_code             int unsigned                                 not null comment '所属渠道编号',
    sap_client_code          varchar(20)                                  not null comment 'SAP客户编号',
    sap_shop_code            varchar(20)                                  not null comment 'SAP公司编号',
    platform_name            varchar(20)                                  not null comment '所属平台名称',
    shop_website             varchar(512)                                 null comment '店铺网址',
    shop_account             varchar(100)                                 not null comment '店铺主账号',
    shop_password            varchar(100)                                 not null comment '店铺密码',
    shop_password_cipher     varchar(408)                                 null comment '店铺密码',
    shop_phone_number        varchar(15)                                  not null comment '店铺绑定手机',
    shop_phone_number_cipher varchar(64)                                  null comment '店铺绑定手机',
    shop_user_code           int                                          null comment '店铺绑定人员编号',
    express_name             varchar(20)        default '蓝月亮'             not null comment '快递面单名称',
    delivery_limitation      mediumint unsigned default 48                not null comment '发货时效(回传快递单号)，单位小时',
    logistics_collection     mediumint unsigned default 72                not null comment '发货时效(物流揽收)，单位小时',
    complain_days            mediumint unsigned default 360               not null comment '申诉时长，单位小时',
    shop_user_name           varchar(32)                                  null comment '店铺绑定人员名称',
    is_frozen                tinyint unsigned   default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    is_docking               tinyint unsigned   default 0                 not null comment '是否已对接（字典：ec_oms_yes_no）@0-否 1-是',
    remark                   varchar(200)                                 null comment '备注',
    is_auto_send_sms         tinyint unsigned   default 1                 not null comment '是否发送自动短信（字典：ec_oms_yes_no）@0-否 1-是',
    account_code             int(11) unsigned                             null comment '短信账号编号（关联表：ec_oms_sms_account_base.account_code）',
    sms_account              varchar(50)                                  null comment '短信账号',
    new_qr_code              varchar(255)                                 null comment '渠道二维码URL',
    content_pic_url          varchar(255)                                 null comment '引流文案内容URL',
    sort                     int(5) unsigned    default 99999             not null comment '排序',
    creator_id               int                                          null comment '创建人编号',
    creator_name             varchar(32)                                  null comment '创建人名称',
    create_time              timestamp          default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id              int                                          null comment '操作人编号',
    operator_name            varchar(32)                                  null comment '操作人名称',
    last_update_time         timestamp          default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '店铺主数据表';

create index idx_shop_name
    on ec_oms_channel_shop_base (shop_name);

create table ec_oms_channel_shop_close_config
(
    id                      int unsigned auto_increment comment '编号'
        primary key,
    title                   varchar(32)                                   null comment '通知标题',
    notice_day              tinyint unsigned                              null comment '提醒日期',
    notice_time             varchar(5)                                    null comment '提醒时间',
    content                 varchar(300)                                  null comment '通知内容',
    admin_id                int                                           null comment '店铺管理员编号',
    notice_responsible_flag tinyint(1)          default 0                 null comment '是否需要通知店铺负责人, 0-否，1-是',
    notice_docking_flag     tinyint(1)          default 0                 null comment '是否需要通知店铺对接人, 0-否，1-是',
    copy_member_user_codes  varchar(240)                                  null comment '抄送人编号，最多20个，逗号分割',
    operator_id             int                                           null comment '操作人编号',
    operator_name           varchar(32)                                   null comment '操作人名称',
    last_update_time        timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                tinyint(1) unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '关店提醒配置';

create table ec_oms_channel_shop_member_detail
(
    id          int unsigned auto_increment comment '编号'
        primary key,
    shop_code   int unsigned                        not null comment '店铺编号',
    role        tinyint(4) unsigned                 not null comment '用户角色, 1-店铺负责人，2-店铺对接人',
    user_code   int unsigned                        null comment '用户编号',
    create_time timestamp default CURRENT_TIMESTAMP not null comment '创建时间'
)
    comment '店铺运营人员信息表';

create index idx_shop_code
    on ec_oms_channel_shop_member_detail (shop_code);

create table ec_oms_chat_account_suning
(
    cust_num         bigint(12)  not null comment '会员编码'
        primary key,
    shop_code        int(10)     null comment '店铺编号',
    user_name        varchar(50) null comment '子账号',
    eamil            varchar(50) null comment '邮箱',
    phone            varchar(30) null comment '手机号码',
    status           tinyint(1)  null comment '子账号当天状态0-已停用，1-使用中，3-离职',
    status_val       varchar(20) null comment '状态名称',
    cust_direct      tinyint(1)  null comment '是否为客服账号0 否；1 是',
    real_name        varchar(50) null comment '子账号姓名',
    create_time      timestamp   null comment '在数据库种创建时间',
    last_update_time timestamp   null on update CURRENT_TIMESTAMP comment '在数据库种更新时间'
);

create table ec_oms_chat_content_guomei
(
    id                int unsigned auto_increment comment '自增主键'
        primary key,
    ques_id           bigint(12)   not null comment '咨询ID',
    shop_code         int(8)       null comment '店铺编码',
    ques_type         tinyint(3)   null comment '咨询类型(1=帮助、2=购买、3=送货、4=支付、5=售后)',
    title             varchar(255) null comment '咨询标题（未用）',
    question          varchar(500) null comment '咨询内容',
    post_user         bigint(12)   null comment '留言者ID',
    post_time         timestamp    null comment '留言时间',
    feedback          varchar(500) null comment '回复内容',
    reply_user        bigint(12)   null comment '回复者ID',
    reply_time        timestamp    null comment '回复时间',
    status            tinyint(3)   null comment '状态：0：编辑中 1：已提交 2：审核通过 3：审核不通过 4：待发送 5：已发送6：已答复； 8：已完成 9：已取消',
    approve_user_name varchar(50)  null comment '关联出来的审批用户名',
    post_user_name    varchar(50)  null comment '关联出来的提交用户名（未用）',
    reply_user_name   varchar(50)  null comment '关联出来的回复用户名（未用）',
    product_name      varchar(120) null comment '关联出来的商品明证',
    product_no        varchar(15)  null comment '产品编码，A+10位编码',
    create_time       timestamp    null comment '数据库创建时间',
    last_update_time  timestamp    null on update CURRENT_TIMESTAMP comment '数据库更新时间'
)
    comment '国美客户聊天记录';

create index inx_quse_id
    on ec_oms_chat_content_guomei (ques_id);

create table ec_oms_chat_content_suning
(
    msg_id           varchar(40)  not null comment '消息ID'
        primary key,
    shop_code        int(10)      null comment '店铺编号',
    chat_id          varchar(40)  null comment '会话ID',
    msg_from         varchar(20)  null comment '消息发送方',
    msg_to           varchar(20)  null comment '消息接收方',
    msg_type         int(4)       null comment '消息类型。 100：文本消息 101：图片消息 102：邀请评价 103：正在输入 104：转接会话 105：文件消息 106：已评价 107：窗口抖动 110：系统消息 112：关闭会话 113：更新消息版本号 120:名片消息',
    msg_content      varchar(500) null comment '消息内容',
    create_time      timestamp    null comment '消息创建时间',
    update_time      timestamp    null comment '消息更新时间',
    oms_create_time  timestamp    null comment '在数据库种创建时间',
    last_update_time timestamp    null on update CURRENT_TIMESTAMP comment '在数据库种更新时间'
);

create table ec_oms_chat_user_suning
(
    chat_id          varchar(40)  not null comment '会话唯一ID'
        primary key,
    shop_code        int(10)      null comment '店铺编号',
    login_name       varchar(50)  null comment '客服账号',
    member_account   varchar(50)  null comment '会员登陆名',
    member_id        bigint(12)   null comment '会员编码',
    member_nick      varchar(50)  null comment '会员昵称',
    start_time       timestamp    null comment '会话创建时间',
    end_time         timestamp    null comment '会话结束时间',
    next_chat_id     int(10)      null comment '下一通会话ID',
    pre_chat_id      int(10)      null comment '上一通会话ID',
    user_name        varchar(100) null comment '坐席姓名',
    user_nick        varchar(50)  null comment '坐席昵称',
    create_time      timestamp    null comment '在数据库种创建时间',
    last_update_time timestamp    null on update CURRENT_TIMESTAMP comment '在数据库种更新时间'
);

create table ec_oms_classes
(
    classes_code     int unsigned                               not null comment '班次编号'
        primary key,
    classes_name     varchar(32)                                not null comment '班次名称',
    start_time       time                                       not null comment '班次起始时间',
    end_time         time                                       not null comment '班次结束时间',
    remark           varchar(200)                               null comment '备注',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '班次信息管理表';

create table ec_oms_config_assign_express
(
    id                 int unsigned auto_increment comment '主键id'
        primary key,
    auto_assign_status tinyint unsigned default 1                 not null comment '自动指定开关@1-开启，0-关闭',
    assign_rule        tinyint unsigned default 1                 not null comment '系统指定快递规则：1-按同仓快递指定，2-按同仓快递合作省份指定，3-按同仓快递合作省份及城市指定，字典ec_oms_designated_express_assign_rule',
    creator_id         int                                        null comment '创建人编号',
    creator_name       varchar(32)                                null comment '创建人名称',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag           tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单店铺指定快递配置';

create table ec_oms_config_assign_express_sub
(
    id        int unsigned auto_increment comment '主键id'
        primary key,
    config_id int unsigned               not null comment '指定快递配置主表id（ec_oms_config_assign_express.id）',
    shop_code int unsigned               not null comment '店铺编号（关联ec_oms_channel_shop_base）',
    del_flag  tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '订单店铺指定快递配置子表';

create index idx_config_id
    on ec_oms_config_assign_express_sub (config_id);

create table ec_oms_config_auto_assignment
(
    id                              int unsigned auto_increment comment '主键ID'
        primary key,
    config_type                     tinyint unsigned default 1                 not null comment '配置类型@1-自动指派，2-自动取消指派',
    auto_assignment_status          tinyint          default 1                 null comment '自动指派开关（字典;ec_oms_on_off）@1-开启，0-关闭',
    auto_cancel_assignment_status   tinyint          default 1                 null comment '自动取消指派开关（字典;ec_oms_on_off）@1-开启，0-关闭',
    auto_recovery_assignment_status tinyint          default 1                 null comment '自动恢复未处理开关（字典;ec_oms_on_off）@1-开启，0-关闭',
    auto_recovery_assignment_time   time                                       null comment '每日自动恢复未处理时间',
    auto_cancel_assignment_time     time                                       null comment '每日自动取消指派时间',
    creator_id                      int unsigned                               null comment '创建人编号',
    creator_name                    varchar(32)                                null comment '创建人名称',
    create_time                     timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id                     int unsigned                               null comment '操作人编号',
    operator_name                   varchar(32)                                null comment '操作人名称',
    last_update_time                timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                        tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '自动（取消）指派配置表';

create table ec_oms_config_auto_examine_adopt
(
    id                         int unsigned auto_increment comment '主键id'
        primary key,
    retail_examine_adop_status tinyint unsigned default 0                 not null comment '分销订单自动财审开关@1-开启，0-关闭',
    retail_examine_adop_scale  tinyint unsigned default 0                 null comment '【废弃】分销订单自动财审，允许订单所有产品报价低于系统维护价格的比例，自动财审',
    sale_examine_adop_status   tinyint unsigned default 0                 not null comment '销售订单自动财审开关@1-开启，0-关闭',
    sale_examine_adop_scale    tinyint unsigned default 0                 null comment '【废弃】销售订单自动财审，允许订单所有产品报价低于系统维护价格的比例，自动财审',
    creator_id                 int unsigned                               null comment '创建人编号',
    creator_name               varchar(32)                                null comment '创建人名称',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag                   tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单自动财审配置';

create table ec_oms_config_import_order_user
(
    id                int unsigned auto_increment comment '主键id'
        primary key,
    user_code         int                                        not null comment '人员编号',
    user_name         varchar(32)                                not null comment '人员名称',
    handle_shop       varchar(2048)                              null comment '指派可导入平台，逗号分隔',
    user_type         tinyint unsigned default 1                 not null comment '人员类型@1-员工，2--合作伙伴',
    import_permission tinyint unsigned default 0                 not null comment '导入权限@0-部分平台 1-全部平台',
    creator_id        int                                        null comment '创建人编号',
    creator_name      varchar(32)                                null comment '创建人名称',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id       int                                        null comment '操作人编号',
    operator_name     varchar(32)                                null comment '操作人名称',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag          tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '人员订单导入配置表';

create index idx_user_code
    on ec_oms_config_import_order_user (user_code);

create table ec_oms_config_order_catch_delay
(
    id                    int unsigned auto_increment comment '主键id'
        primary key,
    delay_time_difference smallint unsigned                          not null comment '抓单延迟时差min',
    handle_shop           varchar(2048)                              null comment '延迟抓单的平台，逗号分隔',
    shop_type             tinyint(3)       default 1                 not null comment '店铺类型@1-普通2-特殊',
    creator_id            int                                        null comment '创建人编号',
    creator_name          varchar(32)                                null comment '创建人名称',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag              tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '抓单延迟时间配置';

create table ec_oms_config_order_examine
(
    id                     int unsigned auto_increment comment '主键id'
        primary key,
    auto_examine_import    tinyint unsigned default 0                 not null comment '导入订单自动审单状态@1-开启，0-关闭',
    eliminate_area         varchar(2048)                              null comment '禁止区域，逗号分隔',
    eliminate_product      varchar(2048)                              null comment '禁止产品，逗号分隔',
    allow_auto_examine_num smallint unsigned                          not null comment '允许自动审单的订单商品总件数',
    auto_examine           tinyint unsigned default 0                 not null comment '对接订单自动审单状态@1-开启，0-关闭',
    handle_shop            varchar(2048)                              null comment '允许自动审单的平台，逗号分隔',
    creator_id             int                                        null comment '创建人编号',
    creator_name           varchar(32)                                null comment '创建人名称',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag               tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单自动审单配置';

create table ec_oms_config_order_hang
(
    hand_code           int unsigned                               not null comment '挂起编号'
        primary key,
    auto_hang_status    tinyint unsigned default 0                 not null comment '自动挂起开关@1-开启，0-关闭',
    is_all              tinyint unsigned default 0                 not null comment '是否全部地区：1-是，0-否',
    buyer_message_keys  varchar(2048)                              null comment '买家留言关键字，逗号分隔',
    seller_message_keys varchar(2048)                              null comment '卖家留言关键字，逗号分隔',
    creator_id          int                                        null comment '创建人编号',
    creator_name        varchar(32)                                null comment '创建人名称',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag            tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单自动挂起配置';

create table ec_oms_config_order_hang_sub
(
    id            int unsigned auto_increment comment '主键id'
        primary key,
    hand_code     int unsigned     default 0 not null comment '挂起编号',
    order_type    tinyint unsigned default 1 not null comment '订单类型，1-非大订单挂起，2-大订单挂起',
    province_code int unsigned               null comment '省份编码',
    province_name varchar(50)                null comment '省份名称',
    city_code     int unsigned               null comment '城市编码',
    city_name     varchar(50)                null comment '城市名称',
    district_code int unsigned               null comment '区县编号',
    district_name varchar(50)                null comment '区县名称'
)
    comment '订单自动挂起配置区域明细表';

create index idx_hand_code
    on ec_oms_config_order_hang_sub (hand_code);

create table ec_oms_config_risk_control
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    risk_code        int unsigned                               not null comment '风险编号',
    risk_name        varchar(128)                               null comment '风险名称',
    risk_type        tinyint unsigned                           not null comment '风险类型（ec_oms_risk_type）1-价格，2-商品',
    is_risk          tinyint unsigned default 0                 not null comment '是否标记风险（ec_oms_yes_no）1-是 0-否',
    risk_range       tinyint unsigned                           not null comment '风险监控范围（ec_oms_risk_range）',
    risk_tips        tinyint unsigned                           not null comment '风险提示（ec_oms_risk_tips）',
    remark           varchar(30)                                null comment '客服备注',
    risk_action      tinyint unsigned default 0                 not null comment '有风险系统动作（ec_oms_risk_action）0-无，1-自动取消订单，2-自动挂起，3-自动审单',
    is_valid         tinyint unsigned default 1                 not null comment '是否有效（字典：ec_oms_yes_no）@1-是 0-否，主要针对程序运行的状态',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '自动风控配置表';

create index idx_risk_code
    on ec_oms_config_risk_control (risk_code);

create table ec_oms_config_shop_supply
(
    id           int unsigned auto_increment comment '主键id'
        primary key,
    pro_num_80   int unsigned                               not null comment '允许专供80品数',
    pro_num_10   int unsigned                               not null comment '允许专供10品数',
    creator_id   int                                        null comment '创建人编号',
    creator_name varchar(32)                                null comment '创建人名称',
    create_time  timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag     tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '店铺专供配额配置主表';

create table ec_oms_config_shop_supply_sub
(
    id        int unsigned auto_increment comment '主键id'
        primary key,
    supply_id int unsigned not null comment '专供配置主表id（关联ec_oms_config_shop_supply）',
    shop_code int unsigned not null comment '店铺编号（关联ec_oms_channel_shop_base）'
)
    comment '店铺专供配额配置明细表';

create index idx_supply_id
    on ec_oms_config_shop_supply_sub (supply_id);

create table ec_oms_customer_group_shop_relation
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    shop_code        int unsigned                               not null comment '店铺编号，按序号排列，5位数字（10000）',
    group_code       int unsigned                               not null comment '客服组编号（关联表ec_oms_customer_service_group.group_code）',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '客服组与店铺关系表';

create table ec_oms_customer_service
(
    id                     int unsigned auto_increment comment '主键ID'
        primary key,
    customer_code          int unsigned                               not null comment '客服编号',
    customer_name          varchar(32)                                not null comment '客服名称',
    daily_assignment_limit int unsigned                               not null comment '每日指派上限',
    remark                 varchar(200)                               null comment '备注',
    creator_id             int unsigned                               null comment '创建人编号',
    creator_name           varchar(32)                                null comment '创建人名称',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id            int unsigned                               null comment '操作人编号',
    operator_name          varchar(32)                                null comment '操作人名称',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag               tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '客服信息管理表';

create index idx_custcode_dflag
    on ec_oms_customer_service (customer_code, del_flag);

create table ec_oms_customer_service_group
(
    group_code        int unsigned                               not null comment '客服组编号'
        primary key,
    group_name        varchar(32)                                not null comment '客服组名称',
    group_leader_code int(10)                                    null comment '客服组组长编号',
    group_leader_name varchar(32)                                null comment '客服组组长名称',
    remark            varchar(200)                               null comment '备注',
    creator_id        int unsigned                               null comment '创建人编号',
    creator_name      varchar(32)                                null comment '创建人名称',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id       int unsigned                               null comment '操作人编号',
    operator_name     varchar(32)                                null comment '操作人名称',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag          tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '客服组信息管理表';

create table ec_oms_customer_service_group_relation
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    customer_code    int unsigned                               not null comment '客服编号（关联表ec_oms_customer_service.customer_code）',
    group_code       int unsigned                               not null comment '客服组编号（关联表ec_oms_customer_service_group.group_code）',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '客服与客服组关系表';

create index idx_custcode_dflag
    on ec_oms_customer_service_group_relation (customer_code, del_flag);

create table ec_oms_delivery_limitation_strategy
(
    strategy_code            bigint unsigned                            not null comment '策略编号,日期+5位增长'
        primary key,
    strategy_name            varchar(64)                                not null comment '策略名称',
    time_type                int unsigned     default 0                 not null comment '策略时间类型,0付款时间',
    strategy_begin_time      timestamp        default CURRENT_TIMESTAMP not null comment '策略开始时间',
    strategy_end_time        timestamp        default CURRENT_TIMESTAMP not null comment '策略结束时间',
    product_code             bigint                                     not null comment '商品编号，等于-1，代表全部商品',
    buyer_range              tinyint unsigned default 0                 not null comment '买家范围（字典ec_oms_retention_product_buyer_range） 0-全部 1-指定部分买家',
    order_sign               tinyint unsigned default 0                 not null comment '订单标记（字典ec_oms_order_sign） 0-无，1-直播订单，2-大促活动',
    delivery_limitation_type tinyint unsigned default 1                 not null comment '发货时效类型（字典ec_oms_delivery_limitation_type） 1-固定时长，2-区间发货',
    operator_id              int                                        null comment '操作人编号',
    operator_name            varchar(32)                                null comment '操作人名称',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    creator_id               int                                        null comment '创建人编号',
    creator_name             varchar(32)                                null comment '创建人姓名',
    del_flag                 tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '发货时效策略表';

create index idx_be_end_pro
    on ec_oms_delivery_limitation_strategy (strategy_begin_time, strategy_end_time, product_code);

create table ec_oms_delivery_limitation_strategy_buyer_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '所属策略编号',
    buyer_id         varchar(64)                                not null comment '指定买家ID',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '发货时效策略买家信息表';

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_buyer_sub (strategy_code);

create table ec_oms_delivery_limitation_strategy_delivery_sub
(
    id                   int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code        bigint unsigned                              not null comment '所属策略编号',
    delivery_limitation  mediumint unsigned default 48                not null comment '发货时效(回传快递单号)，单位小时',
    logistics_collection mediumint unsigned default 72                not null comment '发货时效(物流揽收)，单位小时',
    num_interval_start   int unsigned       default 0                 not null comment '发货数量区间起始值',
    num_interval_end     int unsigned       default 0                 not null comment '发货数量区间结束值',
    use_num              int(10)            default 0                 not null comment '已使用量',
    del_flag             tinyint unsigned   default 0                 not null comment '删除标记，1-是，0-否',
    create_time          timestamp          default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time     timestamp          default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '发货时效策略发货信息子表';

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_delivery_sub (strategy_code);

create table ec_oms_delivery_limitation_strategy_record
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC订单编号，关联ec_oms_order',
    strategy_code    bigint unsigned                            not null comment '策略编号，关联ec_oms_delivery_limitation_strategy',
    product_code     bigint unsigned                            not null comment '商品编号',
    talent_name      varchar(32)      default ''                null comment '达人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '订单应用发货时效策略明细表';

create index idx_order_code
    on ec_oms_delivery_limitation_strategy_record (order_code);

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_record (strategy_code);

create table ec_oms_delivery_limitation_strategy_shop_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '所属策略编号',
    shop_code        int(30) unsigned                           not null comment '店铺编号',
    shop_name        varchar(64)                                not null comment '店铺名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '发货时效策略店铺信息表';

create index idx_strategy_shop_code
    on ec_oms_delivery_limitation_strategy_shop_sub (strategy_code, shop_code, del_flag);

create table ec_oms_delivery_limitation_strategy_talent_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '所属策略编号',
    shop_pro_name    varchar(255)                               not null comment '平台商品名',
    talent_name      varchar(32)      default ''                not null comment '达人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '发货时效策略达人标记表';

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_talent_sub (strategy_code);

create table ec_oms_edit_order_finenter
(
    id                   int(11) unsigned auto_increment comment '自增id'
        primary key,
    export_code          bigint unsigned                     null comment '导出编号',
    writeoff_ec_order_id int(11) unsigned                    null comment 'writeoff_ec_order的编号id',
    order_code           decimal(30) unsigned                null comment 'ec订单编号',
    failure_reason       varchar(255)                        null comment '失败原因',
    create_time          timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '财务中台导出错误订单列表';

create table ec_oms_edit_order_import
(
    id                      int unsigned auto_increment comment '主键ID'
        primary key,
    import_code             bigint unsigned                            not null comment '导入批次号',
    order_code              decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_order_id           varchar(64)                                not null comment '店铺订单编号',
    shop_code               int unsigned                               null comment '店铺来源编号',
    order_shop_discount_amt decimal(14, 2) unsigned                    null comment '店铺承担订单优惠',
    order_plat_discount_amt decimal(14, 2) unsigned                    null comment '平台承担订单优惠',
    order_all_shipment      decimal(14, 2) unsigned                    null comment '总运费',
    handle_status           tinyint unsigned default 0                 null comment '处理状态 0 未处理 1-成功 2-失败',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    creator_id              int unsigned                               not null comment '创建人编号',
    creator_name            varchar(32)                                null comment '创建人名称'
)
    comment '导入修正订单记录表';

create table ec_oms_edit_order_product_import
(
    id                    int unsigned auto_increment comment '自增id'
        primary key,
    import_code           bigint unsigned                            not null comment '导入批次号',
    order_code            decimal(30) unsigned                       not null comment 'ec订单编号',
    shop_order_id         varchar(64)                                null comment '店铺订单编号',
    product_code          bigint unsigned                            not null comment '商品编号',
    pro_one_price         decimal(14, 2) unsigned                    null comment '产品报价',
    buy_num               int unsigned                               null comment '购买数量',
    pro_all_price         decimal(14, 2) unsigned                    null comment '报价金额',
    pro_shop_discount_amt decimal(14, 2) unsigned                    null comment '店铺承担产品优惠',
    pro_plat_discount_amt decimal(14, 2) unsigned                    null comment '平台承担产品优惠',
    handle_status         tinyint unsigned default 0                 null comment '处理状态 0 未处理 1-成功 2-失败',
    creator_id            int unsigned                               null comment '创建人编号',
    creator_name          varchar(32)                                null comment '创建人姓名',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '导入修正订单产品数据记录表';

create table ec_oms_exc_offline_refund_order
(
    offline_refund_code        bigint unsigned                                   not null comment '线下退款单编号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    refund_code                bigint unsigned                                   null comment '关联退款单号（关联表ec_oms_exc_refund_order.refund_code）',
    order_code                 decimal(30) unsigned                              not null comment 'EC订单编号',
    refund_amount              decimal(12, 2) unsigned default 0.00              not null comment '退款金额',
    refund_reason              tinyint unsigned                                  null comment '退款原因（字典：ec_oms_offline_refund_reason）',
    refund_type                tinyint unsigned        default 1                 not null comment '退款类型（字典：ec_oms_refund_type）@1- 退货退款2-贷款折让3-超额退款4-未发货仅退款5-定金',
    refund_mode                tinyint unsigned        default 1                 not null comment '退款方式（字典：ec_oms_refund_mode）@1- 支付宝退款、2-银行退款、3-平台退款',
    offline_refund_status      tinyint unsigned        default 0                 not null comment '线下退款单状态（字典：ec_oms_offline_refund_status）@0-待提交、1-待审核、2-待退款、3-退款中、4-退款成功、5-退款失败、6-审核不通过、7-已取消',
    account                    varchar(64)                                       null comment '账户（支付宝）',
    account_cipher             varchar(280)                                      null comment '账户（支付宝）',
    account_name               varchar(20)                                       null comment '账户名称',
    account_name_cipher        varchar(88)                                       null comment '账户名称',
    deposit_bank_province      varchar(32)                                       null comment '开户行省份',
    deposit_bank_province_code mediumint unsigned                                null comment '省份编码',
    deposit_bank_city          varchar(32)                                       null comment '开户行城市',
    deposit_bank_city_code     mediumint unsigned                                null comment '城市编码',
    deposit_bank_name          varchar(64)                                       null comment '开户行名称',
    has_refund_voucher         tinyint unsigned        default 0                 not null comment '是否存在退款凭证，1-是，0-否',
    remark                     varchar(200)                                      null comment '备注',
    verify_user_id             int unsigned                                      null comment '审核人编号',
    verify_user_name           varchar(32)                                       null comment '审核人姓名',
    verify_time                timestamp                                         null comment '审核时间',
    verify_no_pass_reason      varchar(128)                                      null comment '审核不通过原因',
    refund_no_pass_reason      varchar(128)                                      null comment '退款不通过原因',
    batch_no                   varchar(16)                                       null comment '批次号',
    submit_time                timestamp                                         null comment '提交时间',
    refunding_time             timestamp                                         null comment '标记退款中时间',
    refunded_time              timestamp                                         null comment '退款成功时间',
    shop_order_id              varchar(64)                                       null comment '店铺订单编号',
    creator_id                 int unsigned                                      null comment '创建人编号（申请人）',
    creator_name               varchar(32)                                       null comment '创建人名称（申请人名称）',
    create_time                timestamp               default CURRENT_TIMESTAMP null comment '创建时间（申请时间）',
    operator_id                int unsigned                                      null comment '操作人编号',
    operator_name              varchar(32)                                       null comment '操作人名称',
    last_update_time           timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                   tinyint unsigned        default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后线下退款单信息表';

create index idx_order_code
    on ec_oms_exc_offline_refund_order (order_code);

create table ec_oms_exc_order
(
    id                        int unsigned auto_increment comment '主键ID'
        primary key,
    order_code                decimal(30) unsigned                          not null comment 'EC订单编号',
    exc_mark_time             timestamp                                     null comment '异常标记时间',
    exc_finish_time           timestamp                                     null comment '异常完成时间',
    aftersale_status          tinyint unsigned    default 0                 not null comment '售后处理状态（字典：ec_oms_aftersale_status）@0-未处理1-处理中2-已处理',
    response_status           tinyint unsigned    default 1                 not null comment '分销商响应状态(字典：ec_oms_distributor_response_status @0-待响应，@1-已响应)',
    mark_undo_time            timestamp                                     null comment '标记未处理时间',
    mark_doing_time           timestamp                                     null comment '标记处理中时间',
    mark_done_time            timestamp                                     null comment '标记已处理时间',
    revisit_time              timestamp                                     null comment '回访时间',
    emergency                 tinyint unsigned                              null comment '紧急程度（字典：ec_oms_emergency）@1-一般2-紧急',
    issue_subject_code        int unsigned                                  null comment '一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code），记录最新一条工单的数据',
    issue_type_code           int unsigned                                  null comment '二级问题编号（关联表ec_oms_issue_type_base.issue_type_code），记录最新一条工单的数据',
    issue_reason_code         int unsigned                                  null comment '问题原因编号（关联ec_oms_issue_reason_base.issue_reason_code），记录最新一条工单的数据',
    default_responsible_party tinyint unsigned    default 0                 null comment '责任方（字典：ec_oms_default_responsible_party）',
    is_refund                 tinyint unsigned    default 0                 not null comment '是否退款（字典：ec_oms_yes_no）@1-是，0-否',
    is_return_goods           tinyint unsigned    default 0                 not null comment '是否退货（字典：ec_oms_yes_no）@1-是，0-否',
    is_reissued               tinyint unsigned    default 0                 not null comment '是否补发（字典：ec_oms_yes_no）@1-是，0-否',
    is_pursue_responsibility  tinyint unsigned    default 0                 not null comment '是否追责（字典：ec_oms_yes_no）@1-是，0-否',
    assigned_times            tinyint unsigned    default 0                 not null comment '自动指派次数',
    is_assigned               tinyint unsigned    default 0                 not null comment '是否指派（字典：ec_oms_yes_no）@1-是，0-否',
    manager_id                int unsigned                                  null comment '指派处理人编号',
    manager_name              varchar(32)                                   null comment '指派处理人名称',
    has_voucher               tinyint unsigned    default 0                 not null comment '是否存在凭证，1-是，0-否',
    send_sms_fail_resaon      varchar(200)                                  null comment '短信发送失败原因',
    send_sms_time             timestamp                                     null comment '短信发送时间',
    send_sms_status           tinyint                                       null comment '短信发送状态（字典：ec_oms_send_sms_status）@1-成功，0-失败',
    return_normal_time        timestamp                                     null comment '恢复正常单时间',
    last_reply_time           timestamp                                     null comment '最后回复时间',
    refund_scope              tinyint unsigned    default 0                 null comment '退款范围（字典：ec_oms_refund_scope）@1- 全部退款、2-部分退款',
    create_source             tinyint unsigned    default 0                 null comment '售后单来源（字典：ec_oms_work_order_type）@0-其他、@1- BM新增、2-BM批导、3-系统对接、4-预退款登记、5-快捷登记、6-快递新增 、7-分销新增 8-客户自助',
    creator_id                int unsigned                                  null comment '创建人编号',
    creator_name              varchar(32)                                   null comment '创建人名称',
    create_time               timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id               int unsigned                                  null comment '操作人编号',
    operator_name             varchar(32)                                   null comment '操作人名称',
    last_update_time          timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    claims_status             tinyint(4) unsigned default 0                 null comment '最新快递理赔单状态(退款单或补发单，字典：ec_oms_claims_status:1-待审核、2-审核不通过、3-确认理赔、4-取消理赔、9-待提交)',
    work_system_status        tinyint(4) unsigned default 0                 null comment '最新快递工单状态(字典：ec_oms_work_system_status:1-待处理、2-处理中、3-待验收、4-已关闭、5-已取消)',
    operation_type            tinyint(4) unsigned default 0                 null comment '最新快递工单操作(字典：ec_oms_operation_type)',
    latest_ec_reply_id        int unsigned                                  null comment '最新内部回复id',
    latest_sam_reply_id       int unsigned                                  null comment '最新分销商回复id',
    latest_express_reply_id   int unsigned                                  null comment '最新快递商回复id',
    constraint idx_unq
        unique (order_code)
)
    comment '售后（异常）单信息表';

create index idx_afsta_mid_isass
    on ec_oms_exc_order (aftersale_status, manager_id, is_assigned)
    comment '客服统计查询索引';

create index idx_ctime_ocode_astat_lrtime
    on ec_oms_exc_order (create_time, order_code, aftersale_status, last_reply_time)
    comment '时间+售后状态+回复查询索引';

create index idx_exc_mark_time
    on ec_oms_exc_order (exc_mark_time);

create index idx_luptime
    on ec_oms_exc_order (last_update_time);

create index idx_mid_ctime
    on ec_oms_exc_order (manager_id, create_time);

create table ec_oms_exc_order_history
(
    id                        int unsigned auto_increment comment '主键ID'
        primary key,
    order_code                decimal(30) unsigned                          not null comment 'EC订单编号',
    exc_mark_time             timestamp                                     null comment '异常标记时间',
    exc_finish_time           timestamp                                     null comment '异常完成时间',
    aftersale_status          tinyint unsigned    default 0                 not null comment '售后处理状态（字典：ec_oms_aftersale_status）@0-未处理1-处理中2-已处理',
    response_status           tinyint unsigned    default 1                 not null comment '分销商响应状态(字典：ec_oms_distributor_response_status @0-待响应，@1-已响应)',
    mark_undo_time            timestamp                                     null comment '标记未处理时间',
    mark_doing_time           timestamp                                     null comment '标记处理中时间',
    mark_done_time            timestamp                                     null comment '标记已处理时间',
    revisit_time              timestamp                                     null comment '回访时间',
    emergency                 tinyint unsigned                              null comment '紧急程度（字典：ec_oms_emergency）@1-一般2-紧急',
    issue_subject_code        int unsigned                                  null comment '一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code），记录最新一条工单的数据',
    issue_type_code           int unsigned                                  null comment '二级问题编号（关联表ec_oms_issue_type_base.issue_type_code），记录最新一条工单的数据',
    issue_reason_code         int unsigned                                  null comment '问题原因编号（关联ec_oms_issue_reason_base.issue_reason_code），记录最新一条工单的数据',
    default_responsible_party tinyint unsigned    default 0                 null comment '责任方（字典：ec_oms_default_responsible_party）',
    is_refund                 tinyint unsigned    default 0                 not null comment '是否退款（字典：ec_oms_yes_no）@1-是，0-否',
    is_return_goods           tinyint unsigned    default 0                 not null comment '是否退货（字典：ec_oms_yes_no）@1-是，0-否',
    is_reissued               tinyint unsigned    default 0                 not null comment '是否补发（字典：ec_oms_yes_no）@1-是，0-否',
    is_pursue_responsibility  tinyint unsigned    default 0                 not null comment '是否追责（字典：ec_oms_yes_no）@1-是，0-否',
    assigned_times            tinyint unsigned    default 0                 not null comment '自动指派次数',
    is_assigned               tinyint unsigned    default 0                 not null comment '是否指派（字典：ec_oms_yes_no）@1-是，0-否',
    manager_id                int unsigned                                  null comment '指派处理人编号',
    manager_name              varchar(32)                                   null comment '指派处理人名称',
    has_voucher               tinyint unsigned    default 0                 not null comment '是否存在凭证，1-是，0-否',
    send_sms_fail_resaon      varchar(200)                                  null comment '短信发送失败原因',
    send_sms_time             timestamp                                     null comment '短信发送时间',
    send_sms_status           tinyint                                       null comment '短信发送状态（字典：ec_oms_send_sms_status）@1-成功，0-失败',
    return_normal_time        timestamp                                     null comment '恢复正常单时间',
    last_reply_time           timestamp                                     null comment '最后回复时间',
    refund_scope              tinyint unsigned    default 0                 null comment '退款范围（字典：ec_oms_refund_scope）@1- 全部退款、2-部分退款',
    create_source             tinyint unsigned    default 0                 null comment '售后单来源（字典：ec_oms_work_order_type）@0-其他、@1- BM新增、2-BM批导、3-系统对接、4-预退款登记、5-快捷登记、6-快递新增 、7-分销新增 8-客户自助',
    creator_id                int unsigned                                  null comment '创建人编号',
    creator_name              varchar(32)                                   null comment '创建人名称',
    create_time               timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id               int unsigned                                  null comment '操作人编号',
    operator_name             varchar(32)                                   null comment '操作人名称',
    last_update_time          timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    claims_status             tinyint(4) unsigned default 0                 null comment '最新快递理赔单状态(退款单或补发单，字典：ec_oms_claims_status:1-待审核、2-审核不通过、3-确认理赔、4-取消理赔、9-待提交)',
    work_system_status        tinyint(4) unsigned default 0                 null comment '最新快递工单状态(字典：ec_oms_work_system_status:1-待处理、2-处理中、3-待验收、4-已关闭、5-已取消)',
    operation_type            tinyint(4) unsigned default 0                 null comment '最新快递工单操作(字典：ec_oms_operation_type)',
    latest_ec_reply_id        int unsigned                                  null comment '最新内部回复id',
    latest_sam_reply_id       int unsigned                                  null comment '最新分销商回复id',
    latest_express_reply_id   int unsigned                                  null comment '最新快递商回复id',
    constraint idx_unq
        unique (order_code)
)
    comment '售后（异常）单信息归档表';

create index idx_afsta_mid_isass
    on ec_oms_exc_order_history (aftersale_status, manager_id, is_assigned);

create index idx_ctime_ocode_astat_lrtime
    on ec_oms_exc_order_history (create_time, order_code, aftersale_status, last_reply_time);

create index idx_exc_mark_time
    on ec_oms_exc_order_history (exc_mark_time);

create index idx_luptime
    on ec_oms_exc_order_history (last_update_time);

create table ec_oms_exc_product
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    work_order_code  bigint unsigned                            not null comment '售后工单编号（关联表ec_oms_exc_work_order.work_order_code）',
    order_code       decimal(30) unsigned                       not null comment 'EC订单编号',
    package_code     bigint unsigned                            null comment '套餐编号',
    package_name     varchar(255)                               null comment '套餐名称（优先存放店铺品名）',
    product_code     bigint unsigned                            not null comment '产品编号',
    product_name     varchar(255)                               not null comment '产品名称（优先存放店铺品名）',
    is_present       tinyint unsigned default 0                 not null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    buy_num          int unsigned     default 0                 not null comment '购买数量',
    exc_number       int unsigned     default 0                 not null comment '损坏数量',
    damaged_parts    varchar(32)                                null comment '破损部位（字典：ec_oms_damaged_parts）多个用英文逗号隔开',
    damaged_pic_path varchar(1024)                              null comment '损坏图片路径',
    remark           varchar(200)                               null comment '备注',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '损坏产品信息登记表';

create index idx_order_code
    on ec_oms_exc_product (order_code);

create index idx_work_order_code
    on ec_oms_exc_product (work_order_code);

create table ec_oms_exc_refund_ag
(
    refund_code            bigint unsigned                                   not null comment '退款单号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    sku_is_bigorder        tinyint unsigned        default 0                 not null comment '是否大订单（字典：ec_oms_sku_is_bigorder）@1-全部是 0-全部否2-部分否',
    order_status           tinyint unsigned                                  null comment 'SKU订单状态',
    sku_return_status      tinyint unsigned                                  null comment 'SKU退回调度状态（字典：ec_oms_sku_return_status）',
    sku_dispatch_status    tinyint unsigned                                  null comment 'SKU调度状态（字典：ec_oms_sku_dispatch_status）',
    return_status          tinyint unsigned                                  null comment '退回调度状态（字典：ec_oms_sku_return_status）',
    is_consistent          tinyint unsigned        default 1                 not null comment 'SKU是否一致（字典：ec_oms_yes_no）1-是，0-否',
    doc_num                tinyint unsigned        default 0                 not null comment '单据数量',
    update_fail_reason     varchar(256)                                      null comment 'AG回传失败原因',
    update_plat_status     tinyint unsigned        default 0                 not null comment 'AG回传到旗舰店状态（字典：ec_oms_update_plat_status）@0-未回传1-回传成功2-回传失败',
    sku_is_exc             tinyint unsigned        default 0                 not null comment '是否异常（字典：ec_oms_sku_is_exc）@1-全部是 0-全部否2-部分是',
    operation_type         tinyint unsigned                                  null comment '操作类型@1-自动2-人工3-强制',
    is_recover             tinyint unsigned        default 0                 not null comment '是否恢复（字典：ec_oms_yes_no）1-是，0-否',
    product_code           bigint unsigned                                   null comment '退款产品编号(冗余)',
    buy_num                int unsigned                                      null comment '购买数量(冗余)',
    shop_code              int unsigned                                      not null comment '店铺来源编号(冗余)',
    refund_num             int unsigned            default 0                 null comment '店铺退款数量(冗余)',
    refund_amount          decimal(10, 2) unsigned default 0.00              not null comment '店铺退款金额(冗余)',
    unshipped_num          int(10)                 default 0                 not null comment '未发发数量',
    wait_ship_num          int unsigned            default 0                 not null comment '待发数量',
    shipped_num            int unsigned            default 0                 not null comment '已发数量',
    product_convert_status tinyint unsigned        default 0                 not null comment '是否应用转品策略的订单（字典：ec_oms_yes_no）@1-是 0-否',
    creator_id             int unsigned                                      null comment '创建人编号',
    creator_name           varchar(32)                                       null comment '创建人名称',
    create_time            timestamp               default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id            int unsigned                                      null comment '操作人编号',
    operator_name          varchar(32)                                       null comment '操作人名称',
    last_update_time       timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag               tinyint unsigned        default 0                 not null comment '删除标记，1-是，0-否'
)
    comment 'AG退款拓展表';

create table ec_oms_exc_refund_ag_config
(
    id                        int unsigned auto_increment comment '主键ID'
        primary key,
    config_status             tinyint unsigned default 1                 not null comment '自动AG退款开关@1-开启，0-关闭',
    shop_codes                varchar(2048)                              not null comment '店铺编号，多个逗号隔开，0表示全部',
    is_bigorder               tinyint unsigned default 0                 not null comment '是否大订单（字典：ec_oms_is_bigorder）@1-全部是 0-全部否2-部分否',
    shop_trade_status         varchar(64)                                null comment '店铺交易状态(字典：ec_oms_tmall_order_status)，多个逗号分隔',
    is_same_quantity          tinyint(3)                                 not null comment '是否要求【SKU购买数量】等于【SKU发货数量】（字典：ec_oms_yes_no）@1-是 0-否',
    is_quantity_zero          tinyint(3)                                 not null comment '是否要求【SKU待发数量】等于0（字典：ec_oms_yes_no）@1-是 0-否',
    issue_subject_code        int unsigned                               null comment '一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code）',
    issue_type_code           int unsigned                               null comment '二级问题编号（关联表ec_oms_issue_type_base.issue_type_code）',
    issue_reason_code         int unsigned                               null comment '问题原因编号（关联表ec_oms_issue_reason_base.issue_reason_code）',
    default_responsible_party tinyint unsigned default 0                 null comment '默认责任方（字典：ec_oms_default_responsible_party）@1- 蓝月亮、2-快递公司、3-客户',
    aftersale_status          tinyint unsigned default 0                 not null comment '售后处理状态（字典：ec_oms_aftersale_status）@0-未处理1-处理中2-已处理',
    is_exc                    tinyint unsigned default 0                 not null comment '是否异常（字典：ec_oms_yes_no）@1-是 0-否',
    creator_id                int unsigned                               null comment '创建人编号（申请人）',
    creator_name              varchar(32)                                null comment '创建人名称（申请人名称）',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '创建时间（提交时间）',
    operator_id               int unsigned                               null comment '操作人编号',
    operator_name             varchar(32)                                null comment '操作人名称',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment 'AG退款配置表';

create table ec_oms_exc_refund_order
(
    refund_code               bigint unsigned                                   not null comment '退款单号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    work_order_code           bigint unsigned                                   not null comment '售后工单编号（关联表ec_oms_exc_work_order.work_order_code）',
    order_code                decimal(30) unsigned                              not null comment 'EC订单编号',
    shop_refund_order_id      varchar(64)                                       null comment '店铺退款单编号',
    exc_waybill_code          varchar(30)                                       not null comment '异常快递单号',
    refund_order_type         tinyint unsigned        default 1                 not null comment '退款单类型（字典：ec_oms_refund_order_type）@1- 系统抓取，2-人工新增 3-退货退款',
    refund_scope              tinyint unsigned        default 1                 not null comment '退款范围（字典：ec_oms_refund_scope）@1- 全部退款、2-部分退款',
    refund_amount             decimal(10, 2) unsigned default 0.00              not null comment '退款金额',
    refund_reason             varchar(32)                                       null comment '退款原因',
    is_pursue_responsibility  tinyint unsigned        default 0                 not null comment '是否追责（字典：ec_oms_yes_no）@1-是，0-否',
    default_responsible_party tinyint unsigned                                  null comment '责任方（字典：ec_oms_default_responsible_party）@1- 蓝月亮、2-快递公司、3-客户',
    responsibility_amount     decimal(10, 2) unsigned default 0.00              not null comment '责任金额',
    refund_time               timestamp                                         null comment '退款（完成）时间',
    is_valid                  tinyint unsigned        default 1                 not null comment '是否有效（字典：ec_oms_is_valid）@0-无效、1-有效',
    plat_refund_order_status  varchar(40)                                       null comment '平台退款单状态(字典：ec_oms_plat_refund_order_status)',
    plat_refund_apply_time    timestamp                                         null comment '平台退款申请时间',
    plat_refund_check_time    timestamp                                         null comment '平台退款审核时间',
    shop_total_fee            decimal(10, 2) unsigned default 0.00              not null comment '店铺交易总金额(系统抓取)',
    shop_order_id             varchar(64)                                       null comment '店铺订单编号(系统抓单时记录)',
    shop_good_status          varchar(32)                                       null comment '店铺货物状态，抓取（字典：ec_oms_shop_good_status）',
    shop_is_return_goods      tinyint unsigned        default 1                 not null comment '是否退货，抓取（字典：ec_oms_yes_no）@1-是，0-否',
    claims_status             tinyint(4) unsigned     default 0                 null comment '快递理赔单状态(字典：ec_oms_claims_status:1-待审核、2-审核不通过、3-确认理赔、4-取消理赔、9-待提交)',
    rejected_reason           varchar(255)                                      null comment '快递驳回理赔原因',
    creator_id                int unsigned                                      null comment '创建人编号',
    creator_name              varchar(32)                                       null comment '创建人名称',
    create_time               timestamp               default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id               int unsigned                                      null comment '操作人编号',
    operator_name             varchar(32)                                       null comment '操作人名称',
    last_update_time          timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned        default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后退款单信息表';

create index idx_last_up_t
    on ec_oms_exc_refund_order (last_update_time);

create index idx_order_code
    on ec_oms_exc_refund_order (order_code);

create index idx_pratime
    on ec_oms_exc_refund_order (plat_refund_apply_time);

create index idx_refund_time
    on ec_oms_exc_refund_order (refund_time);

create index idx_shop_order_id
    on ec_oms_exc_refund_order (shop_order_id);

create index idx_shop_refund_id
    on ec_oms_exc_refund_order (shop_refund_order_id);

create index idx_work_order_code
    on ec_oms_exc_refund_order (work_order_code);

create table ec_oms_exc_refund_order_sub
(
    id                int unsigned auto_increment comment '主键ID'
        primary key,
    refund_code       bigint unsigned                            not null comment '退款单号（关联表ec_oms_exc_refund_order.refund_code）',
    product_code      bigint unsigned                            null comment '退款产品编号',
    plat_product_code varchar(32)                                null comment '平台退款产品编号',
    product_name      varchar(255)                               null comment '退款产品名称（优先存放店铺品名）',
    is_present        tinyint unsigned default 0                 not null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    pro_one_price     decimal(14, 4)   default 0.0000            null comment '产品报价',
    buy_num           int unsigned                               null comment '购买数量',
    refund_num        int unsigned     default 0                 null comment '店铺退款数量',
    refund_amount     decimal(10, 2) unsigned                    null comment '店铺退款金额',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag          tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后退款商品明细表';

create index idx_luptime
    on ec_oms_exc_refund_order_sub (last_update_time);

create index idx_refund_code
    on ec_oms_exc_refund_order_sub (refund_code);

create table ec_oms_exc_refund_pdd
(
    refund_code        bigint unsigned                            not null comment '退款单号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    send_plat_status   varchar(10)      default ''                null comment 'PDD回传状态字段SUCCESS：代表EC系统订单状态为【已取消】，取消发货成功FAIL：代表EC系统已发货，取消发货状态失败 ',
    operation_type     tinyint unsigned default 0                 null comment '操作类型@0-无1-自动2-人工',
    update_plat_status tinyint unsigned default 0                 not null comment 'PDD回传状态（字典：ec_oms_pdd_update_plat_status）@0-未回传1-回传成功2-回传失败',
    update_plat_time   timestamp                                  null comment 'PDD回传时间',
    update_fail_reason varchar(256)     default ''                null comment 'PDD回传失败原因',
    update_num         tinyint unsigned default 0                 null comment '回传次数',
    operator_id        int unsigned                               null comment '操作人编号',
    operator_name      varchar(32)                                null comment '操作人名称',
    operator_time      timestamp        default CURRENT_TIMESTAMP null comment '操作时间',
    last_update_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment 'PDD退款拓展表';

create table ec_oms_exc_refund_sa
(
    refund_code             bigint unsigned                            not null comment '退款单号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    auto_add_present_status tinyint unsigned default 0                 not null comment '订单是否自动加赠（字典：ec_oms_yes_no）@1-是 0-否',
    is_contain_virtual      tinyint(3)       default 0                 not null comment '订单是否包含虚拟品（字典：ec_oms_yes_no）@1-是 0-否0',
    update_plat_status      tinyint unsigned default 0                 not null comment 'SA回传到旗舰店状态（字典：ec_oms_update_plat_status）@0-未回传1-回传成功2-回传失败3-无需回传',
    update_plat_time        timestamp                                  null comment 'SA回传到旗舰店时间',
    update_fail_reason      varchar(256)     default ''                null comment 'SA回传失败原因',
    update_num              tinyint unsigned default 0                 null comment '回传次数',
    stock_out_status        tinyint unsigned default 1                 not null comment '出库状态（字典：ec_oms_stock_out_status）@1-未出库，2-已出库',
    operation_type          tinyint unsigned default 0                 null comment '操作类型@0-无1-自动2-人工',
    creator_id              int unsigned                               null comment '创建人编号',
    creator_name            varchar(32)                                null comment '创建人名称',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id             int unsigned                               null comment '操作人编号',
    operator_name           varchar(32)                                null comment '操作人名称',
    last_update_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '京东SA退款拓展表';

create index idx_upstatus_luptime
    on ec_oms_exc_refund_sa (update_plat_status, last_update_time);

create table ec_oms_exc_refund_sa_config
(
    id                        int unsigned auto_increment comment '主键ID'
        primary key,
    config_status             tinyint unsigned default 1                 not null comment '自动SA退款开关@1-开启，0-关闭',
    shop_codes                varchar(2048)    default ''                not null comment '店铺编号，多个逗号隔开',
    plat_order_status         varchar(512)                               null comment '平台/店铺订单状态，多个逗号隔开（字典：ec_oms_plat_order_status）',
    order_status              varchar(64)                                not null comment '订单状态，多个逗号隔开（字典：ec_oms_order_status）0-待创建、1-待提交、2已删除、3待财审、4已取消、5待审单、6部分待审单、7待退回调度、8部分待退回调度、9待调度、10部分待调度、11待发货、12部分待发货、13发货中、14部分发货中、15已发货、16部分已发货、17已签收、18部分已签收、19交易成功、20部分交易成功、99不处理',
    is_bigorder               tinyint unsigned default 0                 not null comment '是否大订单（字典：ec_oms_yes_no）@1-是 0-否',
    auto_add_present_status   tinyint unsigned default 0                 not null comment '订单是否自动加赠（字典：ec_oms_yes_no）@1-是 0-否',
    is_contain_virtual        tinyint(3)       default 0                 not null comment '订单是否包含虚拟品（字典：ec_oms_yes_no）@1-是 0-否0',
    no_refund_pro_codes       varchar(2048)    default ''                not null comment '不支持退款的商品编号，多个逗号隔开',
    issue_subject_code        int unsigned                               null comment '一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code）',
    issue_type_code           int unsigned                               null comment '二级问题编号（关联表ec_oms_issue_type_base.issue_type_code）',
    issue_reason_code         int unsigned                               null comment '问题原因编号（关联表ec_oms_issue_reason_base.issue_reason_code）',
    default_responsible_party tinyint unsigned default 0                 null comment '默认责任方（字典：ec_oms_default_responsible_party）@1- 蓝月亮、2-快递公司、3-客户',
    aftersale_status          tinyint unsigned default 0                 not null comment '售后处理状态（字典：ec_oms_aftersale_status）@0-未处理1-处理中2-已处理',
    is_exc                    tinyint unsigned default 0                 not null comment '是否异常（字典：ec_oms_yes_no）@1-是 0-否',
    creator_id                int unsigned                               null comment '创建人编号（申请人）',
    creator_name              varchar(32)                                null comment '创建人名称（申请人名称）',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '创建时间（提交时间）',
    operator_id               int unsigned                               null comment '操作人编号',
    operator_name             varchar(32)                                null comment '操作人名称',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '京东SA退款配置表';

create table ec_oms_exc_reissue_order
(
    reissue_code              bigint unsigned                                   not null comment '补发单号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    work_order_code           bigint unsigned                                   not null comment '售后工单编号（关联表ec_oms_exc_work_order.work_order_code）',
    order_code                decimal(30) unsigned                              not null comment 'EC订单编号',
    exc_waybill_code          varchar(30)                                       not null comment '异常快递单号',
    reissue_order_status      tinyint unsigned        default 0                 not null comment '补发单状态（字典：ec_oms_reissue_order_status）@0-待登记、1-已登记补发、2-已取消',
    reissue_order_type        tinyint unsigned        default 1                 not null comment '补发单类型（字典：ec_oms_reissue_order_type）@1- 人工新增、2-人工导入',
    reissue_reason            varchar(20)                                       null comment '补发原因',
    is_actual_damage          tinyint unsigned        default 0                 not null comment '是否实际损失,改名为是否追责（字典：ec_oms_yes_no）@1-是，0-否',
    default_responsible_party tinyint unsigned                                  null comment '责任方（字典：ec_oms_default_responsible_party）@1- 蓝月亮、2-快递公司、3-客户',
    reissue_scope             tinyint unsigned        default 1                 not null comment '补发范围（字典：ec_oms_reissue_scope）@1-整单补发（全原件）2-整单补发（有非原件）3-部分补发（全原件）4-部分补发（有非原件）',
    province                  varchar(32)                                       not null comment '补发省份',
    city                      varchar(32)                                       not null comment '补发城市',
    district                  varchar(32)                                       null comment '补发区县',
    address                   varchar(255)                                      not null comment '补发详细地址',
    address_cipher            varchar(1024)                                     null comment '补发详细地址',
    receiver_name             varchar(32)                                       not null comment '补发收货人姓名',
    receiver_name_cipher      varchar(152)                                      null comment '补发收货人姓名',
    receiver_mobile           varchar(20)                                       not null comment '补发收货人手机',
    receiver_mobile_cipher    varchar(88)                                       null comment '补发收货人手机',
    reissue_order_code        decimal(30) unsigned                              not null comment '补发EC订单编号',
    receiver_phone            varchar(32)                                       null comment '补发收货人固定电话',
    receiver_phone_cipher     varchar(152)                                      null comment '补发收货人固定电话',
    claim_all_price           decimal(14, 2) unsigned default 0.00              null comment '理赔总金额，改名为责任金额',
    claims_status             tinyint(4) unsigned     default 0                 null comment '快递理赔单状态(字典：ec_oms_claims_status:1-待审核、2-审核不通过、3-确认理赔、4-取消理赔、9-待提交)',
    rejected_reason           varchar(255)                                      null comment '快递驳回理赔原因',
    creator_id                int unsigned                                      null comment '创建人编号',
    creator_name              varchar(32)                                       null comment '创建人名称',
    create_time               timestamp               default CURRENT_TIMESTAMP null comment '创建时间(补发申请时间)',
    operator_id               int unsigned                                      null comment '操作人编号',
    operator_name             varchar(32)                                       null comment '操作人名称',
    last_update_time          timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned        default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后补发单信息表';

create index idx_order_code
    on ec_oms_exc_reissue_order (order_code);

create index idx_reissue_order_code
    on ec_oms_exc_reissue_order (reissue_order_code);

create index idx_work_order_code
    on ec_oms_exc_reissue_order (work_order_code);

create table ec_oms_exc_reissue_order_sub
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    reissue_code     bigint unsigned                            not null comment '补发单号（关联表ec_oms_exc_reissue_order.reissue_code）',
    package_code     bigint unsigned                            null comment '套餐编号',
    package_name     varchar(255)                               null comment '套餐名称（优先存放店铺品名）',
    product_code     bigint unsigned                            not null comment '产品编号',
    product_name     varchar(255)                               not null comment '产品名称（优先存放店铺品名）',
    is_present       tinyint unsigned default 0                 not null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    buy_num          int unsigned     default 0                 not null comment '购买数量',
    shipped_num      int unsigned                               null comment '发货数量（取发货单数量，没有则null）',
    reissue_num      int unsigned     default 0                 not null comment '补发数量',
    is_original      tinyint unsigned default 1                 not null comment '是否原件商品（字典：ec_oms_is_original）@0-非原件、1-原件',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后补发单商品明细表';

create index idx_reissue_code
    on ec_oms_exc_reissue_order_sub (reissue_code);

create table ec_oms_exc_reply_progress
(
    id                  int unsigned auto_increment comment '主键ID'
        primary key,
    order_code          decimal(30) unsigned                          not null comment 'EC订单编号',
    work_order_code     bigint unsigned     default 0                 null comment '售后工单编号（关联表ec_oms_exc_work_order.work_order_code）',
    exc_waybill_code    varchar(30)                                   null comment '异常快递单号',
    is_sync_work_system tinyint(4) unsigned default 0                 null comment '是否同步快递（字典：ec_oms_yes_no）@1-是，0-否',
    operation_type      tinyint(4) unsigned default 0                 null comment '操作(字典：ec_oms_operation_type)',
    reply_content       varchar(300)                                  null comment '回复内容',
    aftersale_status    tinyint unsigned    default 0                 not null comment '回复时售后处理状态（字典：ec_oms_aftersale_status）@0-未处理1-处理中2-已处理',
    reply_type          tinyint(3)          default 1                 not null comment '沟通类型 区别外部ec(业务字典ec_oms_reply_type)@1-内部2-分销商3-快递商4-客户',
    reply_person_type   tinyint(3)          default 1                 not null comment '回复方(业务字典ec_oms_reply_person_type)@1-蓝月亮2-分销商3-快递商4-客户',
    creator_id          int unsigned                                  null comment '创建人编号（回复人）',
    creator_name        varchar(32)                                   null comment '创建人名称',
    create_time         timestamp           default CURRENT_TIMESTAMP null comment '创建时间（回复时间）',
    del_flag            tinyint unsigned    default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后单回复进度表';

create index idx_ctime
    on ec_oms_exc_reply_progress (create_time);

create index idx_order_code
    on ec_oms_exc_reply_progress (order_code);

create table ec_oms_exc_return_goods
(
    return_goods_code          bigint unsigned                            not null comment '退货单号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    work_order_code            bigint unsigned                            not null comment '售后工单编号（关联表ec_oms_exc_work_order.work_order_code）',
    order_code                 decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_return_order_id       varchar(64)                                null comment '店铺退货单编号',
    exc_waybill_code           varchar(30)                                not null comment '异常快递单号',
    return_goods_order_type    tinyint unsigned default 1                 not null comment '退货单类型（字典：ec_oms_return_goods_order_type）@1- 系统抓取，2-人工新增，3-人工导入',
    return_goods_order_status  tinyint unsigned default 0                 not null comment '退货单状态（字典：ec_oms_return_goods_order_status）@0-未登记、1-待退货入库、2-已退货入库3-已取消',
    return_goods_stage         tinyint unsigned default 1                 not null comment '退货阶段（字典：ec_oms_return_goods_stage）@1-在仓截件、2- 在途截件、3-签收后退回',
    return_goods_scope         tinyint unsigned default 1                 not null comment '退货范围（字典：ec_oms_return_goods_scope）@1-原件退回,2-部分退回',
    storehouse_code            int unsigned                               null comment '退货仓库编码',
    express_code               int unsigned                               null comment '退货快递公司编码',
    express_name               varchar(32)                                null comment '快递公司名称',
    shipment_responsible_party tinyint unsigned                           null comment '运费责任方（字典：ec_oms_shipment_responsible_party）@1- 蓝月亮、2-快递公司、3-客户',
    return_goods_waybill_code  varchar(30)                                not null comment '退货快递单号,消费者退货给我司时产生的新快递单号',
    return_goods_apply_time    timestamp                                  null comment '退货申请时间',
    return_goods_time          timestamp                                  null comment '退货入库时间',
    remark                     varchar(200)                               null comment '退货备注',
    return_diff_reason         varchar(20)      default ''                null comment '退回差异原因',
    refund_code                bigint unsigned                            null comment '退款单号（退货退款时，关联最新的有效的退款单）',
    is_valid                   tinyint unsigned default 1                 not null comment '是否有效（字典：ec_oms_is_valid）@0-无效、1-有效',
    creator_id                 int unsigned                               null comment '创建人编号',
    creator_name               varchar(32)                                null comment '创建人名称',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id                int unsigned                               null comment '操作人编号',
    operator_name              varchar(32)                                null comment '操作人名称',
    last_update_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                   tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后退货单信息表';

create index idx_code_status
    on ec_oms_exc_return_goods (refund_code, return_goods_order_status)
    comment '退款单号，退货状态索引';

create index idx_luptime
    on ec_oms_exc_return_goods (last_update_time);

create index idx_order_code
    on ec_oms_exc_return_goods (order_code);

create index idx_work_order_code
    on ec_oms_exc_return_goods (work_order_code);

create table ec_oms_exc_return_goods_sub
(
    id                       int unsigned auto_increment comment '主键ID'
        primary key,
    return_goods_code        bigint unsigned                            not null comment '退货单号（关联表ec_oms_exc_return_goods.return_goods_code）',
    package_code             bigint unsigned                            null comment '套餐编号',
    package_name             varchar(255)                               null comment '套餐名称（优先存放店铺品名）',
    product_code             bigint unsigned                            not null comment '产品编号',
    product_name             varchar(255)                               not null comment '产品名称（优先存放店铺品名）',
    is_present               tinyint unsigned default 0                 not null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    buy_num                  int unsigned     default 0                 not null comment '购买数量',
    shipped_num              int unsigned                               null comment '发货数量（取发货单数量，没有则null）',
    plan_return_num          int unsigned     default 0                 not null comment '计划退货数量',
    actual_return_num        int unsigned     default 0                 not null comment '实际退货数量',
    returned_qualified_count int unsigned     default 0                 not null comment '实际退货合格数量',
    unqualified_reason       tinyint unsigned                           null comment '产品不合格原因（字典：ec_oms_unqualified_reason)@1产品破损 2空瓶空袋 3漏液二分之一 4漏液三分之一 5漏液四分之一 6产品污染 7产品变形 8打码模糊 9其他',
    is_original              tinyint unsigned default 1                 not null comment '是否原件商品（字典：ec_oms_is_original）@0-非原件、1-原件',
    creator_id               int unsigned                               null comment '创建人编号',
    creator_name             varchar(32)                                null comment '创建人名称',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id              int unsigned                               null comment '操作人编号',
    operator_name            varchar(32)                                null comment '操作人名称',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                 tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后退货单商品明细表';

create index idx_luptime
    on ec_oms_exc_return_goods_sub (last_update_time);

create index idx_pkcode_pdcode
    on ec_oms_exc_return_goods_sub (package_code, product_code);

create index idx_return_goods_code
    on ec_oms_exc_return_goods_sub (return_goods_code);

create table ec_oms_exc_tmall_order_self_intercept
(
    self_intercept_id        int unsigned auto_increment comment '锁单主键ID'
        primary key,
    tid                      bigint unsigned                            null comment '天猫订单编号',
    shop_code                int unsigned                               null comment '店铺编号',
    seller_nick              varchar(20)                                null comment '店铺主账号',
    buyer_nick               varchar(32)                                null comment '买家账号名',
    callType                 varchar(20)                                null comment '同步或者异步类型',
    order_code               decimal(30) unsigned                       null comment '关联订单编号',
    callback_qianniu_result  tinyint unsigned default 0                 null comment '返回千牛结果(ecoms返回给千牛的结果)是否锁单成功 0 未返回 1 成功 2 失败',
    callback_qianniu_message varchar(50)      default ''                null comment '返回千牛结果为失败时时的原因',
    is_callback_success      tinyint unsigned                           null comment '回调千牛接口 是否成功',
    qianniu_error_code       int unsigned                               null comment '回调千牛接口返回错误码 4001参数无效 4002截单信息不存在 4003erp截单超时 4004服务不可用 4005需要商家授权',
    qianniu_error_msg        varchar(50)                                null comment '回调千牛接口返回错误信息',
    is_handle_self_intercept tinyint unsigned default 0                 null comment '处理千牛请求 0 未处理 1已处理',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '创建时间 预退款时间',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    callback_time            timestamp                                  null comment '回调千牛接口时间'
)
    comment '天猫预约锁单功能主表';

create index idx_luptime
    on ec_oms_exc_tmall_order_self_intercept (last_update_time);

create table ec_oms_exc_tmall_order_self_intercept_detail
(
    self_intercept_id int unsigned    not null comment '锁单主键ID,预约锁单主表id',
    tid               bigint unsigned not null comment '主订单id',
    sub_order_id      bigint unsigned not null comment '子订单id'
)
    comment '天猫预约锁单功能详情表';

create table ec_oms_exc_tmall_order_self_intercept_summary
(
    order_code              decimal(30) unsigned                       null comment '订单编号',
    tid                     bigint unsigned                            not null comment '天猫订单编号'
        primary key,
    shop_code               int unsigned                               null comment '店铺订单编号',
    callback_qianniu_result tinyint unsigned default 0                 null comment '返回千牛结果(ecoms返回给千牛的结果)是否锁单成功 0 未返回 1 成功 2 失败',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '创建时间 预退款时间'
)
    comment '天猫预约锁单功能主表汇总表';

create index idx_ctime
    on ec_oms_exc_tmall_order_self_intercept_summary (create_time);

create table ec_oms_exc_work_order
(
    work_order_code           bigint unsigned                               not null comment '售后工单编号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    order_code                decimal(30) unsigned                          not null comment 'EC订单编号',
    exc_waybill_code          varchar(30)                                   not null comment '异常快递单号',
    work_order_type           tinyint unsigned    default 1                 not null comment '工单来源/类型（字典：ec_oms_work_order_type）@0-其他、@1- BM新增、2-BM批导、3-系统对接、4-预退款登记、5-快捷登记、6-快递新增 、7-分销新增 8-客户自助',
    work_order_status         tinyint unsigned    default 1                 not null comment '工单状态0-待提交、1已提交',
    issue_subject_code        int unsigned                                  null comment '一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code',
    issue_type_code           int unsigned                                  null comment '二级问题编号（关联表ec_oms_issue_type_base.issue_type_code）',
    issue_reason_code         int unsigned                                  null comment '问题原因编号（关联ec_oms_issue_reason_base.issue_reason_code）',
    default_responsible_party tinyint unsigned                              null comment '责任方（字典：ec_oms_default_responsible_party）@1- 蓝月亮、2-快递公司、3-客户',
    is_refund                 tinyint             default 0                 null comment '是否退款（字典：ec_oms_yes_no）@1-是，0-否',
    is_return_goods           tinyint             default 0                 null comment '是否退货（字典：ec_oms_yes_no）@1-是，0-否',
    is_reissued               tinyint             default 0                 null comment '是否补发（字典：ec_oms_yes_no）@1-是，0-否',
    is_pursue_responsibility  tinyint             default 0                 null comment '是否追责（字典：ec_oms_yes_no）@1-是，0-否',
    reply_progress            varchar(200)                                  null comment '回复进度(内部沟通记录)',
    import_type               tinyint unsigned                              null comment '导入类型(字典: ec_oms_work_order_import_type)@1-导入且仅记录，2-导入并标记异常',
    is_sync_work_system       tinyint(4) unsigned default 0                 null comment '是否同步快递（字典：ec_oms_yes_no）@1-是，0-否',
    work_system_status        tinyint(4) unsigned default 0                 null comment '快递工单状态(字典：ec_oms_work_system_status:1-待处理、2-处理中、3-待验收、4-已关闭、5-已取消)',
    express_reply_record      varchar(200)                                  null comment '快递商沟通记录',
    operation_type            tinyint(4) unsigned default 0                 null comment '快递工单操作(字典：ec_oms_operation_type)',
    sync_error_msg            varchar(200)        default ''                null comment '快递工单同步失败消息',
    creator_id                int unsigned                                  null comment '创建人编号',
    creator_name              varchar(32)                                   null comment '创建人名称',
    create_time               timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id               int unsigned                                  null comment '操作人编号',
    operator_name             varchar(32)                                   null comment '操作人名称',
    last_update_time          timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned    default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '售后工单信息表';

create index idx_create_time
    on ec_oms_exc_work_order (create_time);

create index idx_exc_waybill_code
    on ec_oms_exc_work_order (exc_waybill_code);

create index idx_luptime
    on ec_oms_exc_work_order (last_update_time);

create index idx_order_code
    on ec_oms_exc_work_order (order_code);

create table ec_oms_finance_order_push_record
(
    id                     int unsigned auto_increment comment '主键ID'
        primary key,
    order_code             decimal(30) unsigned not null comment 'EC订单编号',
    order_last_update_time timestamp            null comment '订单最新更新时间（财审时间或审单时间）',
    constraint udx_order_code
        unique (order_code)
)
    comment '财务中台推送订单记录表';

create table ec_oms_generate_plat_order_exception
(
    id               bigint unsigned auto_increment comment '自增主键id'
        primary key,
    shop_order_id    varchar(64)                                null comment '店铺订单编号',
    shop_refund_id   varchar(64)                                null comment '店铺退款单编号',
    shop_code        int unsigned                               not null comment '店铺来源编号',
    plat_response    mediumtext                                 null comment '订单报文',
    response_type    tinyint unsigned                           null comment '报文类型 1-订单  2-退款单',
    handle_status    tinyint unsigned default 0                 null comment '处理状态 0-未处理  1-已处理',
    create_time      timestamp        default CURRENT_TIMESTAMP not null comment '报文创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    exception_reason varchar(500)                               null comment '异常原因'
)
    comment '第三方平台订单消费出错原始数据表';

create index idx_ctime
    on ec_oms_generate_plat_order_exception (create_time);

create index idx_lst
    on ec_oms_generate_plat_order_exception (last_update_time);

create index idx_ord
    on ec_oms_generate_plat_order_exception (shop_order_id);

create index refundid_code
    on ec_oms_generate_plat_order_exception (shop_refund_id, shop_code);

create table ec_oms_get_plat_job
(
    job_id           int unsigned auto_increment comment 'job_id 主键id'
        primary key,
    job_name         varchar(50)                                null comment '任务名称',
    job_description  varchar(250)                               null comment '描述',
    job_class        varchar(100)                               null comment '任务调用的JobHander名字',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    del_flag         tinyint unsigned default 0                 null comment ' 删除标志 0-未删除  1-删除'
)
    comment '调用抓单环境配置的jobhandler配置';

create table ec_oms_get_plat_job_log
(
    job_log_id    int unsigned auto_increment comment 'log_id主键id'
        primary key,
    job_id        int unsigned                        not null comment '调用的job配置表id',
    operator_id   int unsigned                        null comment '调用人id',
    operator_name varchar(32)                         null comment '调用人名称',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '调用抓单环境配置的jobhandler的执行人员记录';

create table ec_oms_get_plat_job_param
(
    job_param_id     int unsigned auto_increment comment 'job_param_id 主键id'
        primary key,
    job_id           int unsigned                               not null comment 'job配置表id',
    param_value      varchar(200)                               null comment '参数值',
    sortno           mediumint unsigned                         null comment '参数的顺序',
    remark           varchar(100)                               null comment '备注',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    del_flag         tinyint unsigned default 0                 null comment ' 删除标志 0-未删除  1-删除'
)
    comment '调用抓单环境配置的jobhandler配置';

create table ec_oms_get_plat_job_param_log
(
    log_param_log_id int unsigned auto_increment comment 'log_param_id主键id'
        primary key,
    job_log_id       int unsigned                        not null comment '调用的job_log_id',
    job_param_id     int unsigned                        null comment '调用的job_param_id',
    operator_id      int unsigned                        null comment '调用人id',
    operator_name    varchar(32)                         null comment '调用人名称',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '调用抓单环境配置的jobhandler的执行人员记录';

create table ec_oms_hot_consul_account
(
    account_code     int unsigned                               not null comment '客服账号'
        primary key,
    account_name     varchar(32)                                not null comment '客服账号名称',
    account_type     tinyint unsigned                           not null comment '账号类型，字典ec_oms_hot_account_type;1-售前，2-售后',
    shop_code        int unsigned                               not null comment '店铺编号，关联ec_oms_channel_shop_base',
    is_frozen        tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    remark           varchar(200)                               null comment '备注',
    create_code      int unsigned                               null comment '创建人编码',
    create_name      varchar(32)                                null comment '创建人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_code    int unsigned                               null comment '更新人编码',
    operator_name    varchar(32)                                null comment '更新人姓名',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标记 1：删除 0：未删除'
)
    comment '客服账号表';

create table ec_oms_hot_consul_account_group_leader
(
    id           int unsigned auto_increment comment '主键ID'
        primary key,
    account_code int unsigned               not null comment '客服账号，关联ec_oms_hot_consul_account',
    leader_code  int unsigned               null comment '组长编码',
    leader_name  varchar(32)                null comment '组长姓名',
    email        varchar(50)                null comment '组长邮箱',
    del_flag     tinyint unsigned default 0 null comment '删除标记 1：删除 0：未删除'
)
    comment '客服账号组长关系表';

create index idx_account_code
    on ec_oms_hot_consul_account_group_leader (account_code);

create table ec_oms_hot_consul_day_shop
(
    id          int unsigned auto_increment comment '主键ID'
        primary key,
    every_day   date                                       null comment '日期',
    shop_code   int unsigned                               not null comment '店铺编号，关联ec_oms_channel_shop_base',
    account_sum int unsigned                               not null comment '账号总数',
    create_time timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag    tinyint unsigned default 0                 null comment '删除标记 1：删除 0：未删除'
)
    comment '每天店铺客服账号总数信息表';

create index idx_every_day_shop
    on ec_oms_hot_consul_day_shop (every_day, shop_code);

create table ec_oms_hot_consul_day_shop_acc
(
    id           int unsigned auto_increment comment '主键ID'
        primary key,
    every_day    date                       null comment '日期',
    shop_code    int unsigned               not null comment '店铺编号，关联ec_oms_channel_shop_base',
    account_code int unsigned               not null comment '客服账号，关联ec_oms_hot_consul_account',
    account_name varchar(32)                not null comment '客服账号名称',
    del_flag     tinyint unsigned default 0 null comment '删除标记 1：删除 0：未删除'
)
    comment '每天店铺客服账号表';

create index idx_every_day_shop
    on ec_oms_hot_consul_day_shop_acc (every_day, shop_code);

create table ec_oms_hot_consul_day_shop_acc_leader
(
    id           int unsigned auto_increment comment '主键ID'
        primary key,
    every_day    date                       null comment '日期',
    shop_code    int unsigned               not null comment '店铺编号，关联ec_oms_channel_shop_base',
    account_code int unsigned               not null comment '客服账号，关联ec_oms_hot_consul_account',
    leader_code  int unsigned               null comment '组长编码',
    leader_name  varchar(32)                null comment '组长姓名',
    del_flag     tinyint unsigned default 0 null comment '删除标记 1：删除 0：未删除'
)
    comment '每天店铺客服组长表';

create index idx_every_day_shop
    on ec_oms_hot_consul_day_shop_acc_leader (every_day, shop_code);

create table ec_oms_hot_consul_email_template
(
    template_code    int unsigned                               not null comment '模板编号'
        primary key,
    template_type    tinyint unsigned default 0                 not null comment '模板类型，字典ec_oms_hot_template_type：1-上传异常通知， 2-打标异常通知，3-上传及打标汇总通知',
    template_name    varchar(50)                                not null comment '邮件模板名称',
    notice_type      tinyint unsigned default 0                 not null comment '通知维度类型，字典ec_oms_hot_notice_type：1-日报， 2-周报，3-月报',
    week_day         tinyint unsigned default 0                 not null comment '星期几，字典ec_oms_hot_week_day：1到7对应周一到周日',
    send_time        timestamp                                  null comment '发送时间',
    remark           varchar(200)                               null comment '备注',
    create_code      int unsigned                               null comment '创建人编码',
    create_name      varchar(32)                                null comment '创建人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_code    int unsigned                               null comment '更新人编码',
    operator_name    varchar(32)                                null comment '更新人姓名',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标记 1：删除 0：未删除'
)
    comment '热点分析邮件模板配置表';

create table ec_oms_hot_consul_email_template_send
(
    id             int unsigned auto_increment comment '主键ID'
        primary key,
    template_code  int unsigned               not null comment '模板编号，关联ec_oms_hot_consul_email_template',
    recipient_type tinyint unsigned default 0 not null comment '接收人类型，字典ec_oms_hot_recipient_type：0-收件人，1-抄送人',
    email          varchar(50)                null comment '邮箱',
    del_flag       tinyint unsigned default 0 null comment '删除标记 1：删除 0：未删除'
)
    comment '邮件模板收件人/抄送人表';

create index idx_template_code
    on ec_oms_hot_consul_email_template_send (template_code);

create table ec_oms_hot_consul_email_template_shop
(
    id            int unsigned auto_increment comment '主键ID'
        primary key,
    template_code int unsigned               not null comment '模板编号，关联ec_oms_hot_consul_email_template',
    shop_code     int unsigned               not null comment '店铺编号，关联ec_oms_channel_shop_base',
    del_flag      tinyint unsigned default 0 null comment '删除标记 1：删除 0：未删除'
)
    comment '邮件模板店铺关系表';

create index idx_template_code
    on ec_oms_hot_consul_email_template_shop (template_code);

create table ec_oms_hot_consul_qa_mark
(
    id           int unsigned auto_increment comment '主键ID'
        primary key,
    shop_code    int unsigned                        not null comment '店铺编号，关联ec_oms_channel_shop_base',
    account_code int unsigned                        not null comment '客服账号，关联ec_oms_hot_consul_account',
    create_code  int unsigned                        null comment '创建人编码',
    create_name  varchar(32)                         null comment '创建人姓名',
    create_time  timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '问答管理打标记录表';

create index idx_shop_code
    on ec_oms_hot_consul_qa_mark (shop_code);

create table ec_oms_hot_consul_qa_upload
(
    upload_code        bigint unsigned                            not null comment '上传编号'
        primary key,
    upload_type        tinyint unsigned default 0                 not null comment '上传方式，字典ec_oms_hot_upload_type：1-Excel文件， 2-TXT文件',
    shop_code          int unsigned                               not null comment '店铺编号，关联ec_oms_channel_shop_base',
    analytical_results tinyint unsigned default 2                 not null comment '解析结果，字典ec_oms_hot_analytical_results：0-失败，1-成功，2=解析中',
    error_reason       varchar(512)                               null comment '失败原因',
    results_time       datetime                                   null comment '解析结果返回时间',
    file_type          varchar(10)                                null comment '文件类型(文件后缀)',
    md5_code           varchar(50)                                null comment '文件md5值',
    file_url           varchar(255)                               null comment '文件url',
    create_code        int unsigned                               null comment '创建人编码',
    create_name        varchar(32)                                null comment '创建人姓名',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '问答管理上传记录表';

create index idx_md5_code
    on ec_oms_hot_consul_qa_upload (md5_code);

create index idx_shop_code
    on ec_oms_hot_consul_qa_upload (shop_code);

create table ec_oms_hot_consul_qa_upload_detail
(
    id           int unsigned auto_increment comment '主键ID'
        primary key,
    upload_code  bigint unsigned not null comment '上传编号，关联ec_oms_hot_consul_qa_upload',
    account_code int unsigned    not null comment '客服账号，关联ec_oms_hot_consul_account'
)
    comment '问答管理上传客服明细表';

create index idx_account_code
    on ec_oms_hot_consul_qa_upload_detail (account_code);

create index idx_upload_code
    on ec_oms_hot_consul_qa_upload_detail (upload_code);

create table ec_oms_invoice
(
    id                              int unsigned auto_increment comment '主键ID'
        primary key,
    order_code                      decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_order_id                   varchar(64)                                not null comment '店铺订单编号',
    shop_code                       int unsigned                               not null comment '店铺来源编号',
    invoice_type                    tinyint unsigned default 1                 not null comment '发票类型（字典：ec_oms_invoice_type）@1-电子普票，2-纸质普票，3纸质专票',
    invoice_status                  tinyint unsigned default 1                 not null comment '发票状态（字典：ec_oms_invoice_status）@1-待提交2-待审核3-待开票4-开票中5-开票成功6-开票失败7-已取消8-审核不通过9-待冲红10-冲红成功11-冲红失败12-已作废',
    buyer_type                      tinyint unsigned default 1                 not null comment '买家类型（字典：ec_oms_buyer_type）@1-个人，2-企业',
    invoice_code                    bigint unsigned                            null comment '发票申请编号，发票申请时更新，发票合并时编号相同',
    invoice_title                   varchar(64)      default ''                not null comment '发票抬头',
    taxpayer_number                 varchar(64)                                null comment '纳税人识别号',
    buyer_bank                      varchar(128)                               null comment '购买方开户行',
    buyer_bank_account              varchar(128)                               null comment '购买方开户行帐号',
    buyer_bank_account_cipher       varchar(536)                               null comment '购买方开户行帐号',
    buyer_phone                     varchar(32)                                null comment '购买方固话',
    buyer_phone_cipher              varchar(152)                               null comment '购买方固话',
    buyer_address                   varchar(128)                               null comment '购买方地址',
    buyer_address_cipher            varchar(536)                               null comment '购买方地址',
    invoice_receiver                varchar(32)                                null comment '收票人',
    invoice_receiver_cipher         varchar(152)                               null comment '收票人',
    invoice_receiver_phone          varchar(20)                                null comment '收票人手机',
    invoice_receiver_phone_cipher   varchar(88)                                null comment '收票人手机',
    invoice_receiver_mail           varchar(128)                               null comment '收票人邮箱',
    invoice_receiver_province       varchar(32)                                null comment '收票人省份',
    invoice_receiver_city           varchar(32)                                null comment '收票人城市',
    invoice_receiver_district       varchar(32)                                null comment '收票人区/县',
    invoice_receiver_address        varchar(255)                               null comment '收票地址',
    invoice_receiver_address_cipher varchar(1024)                              null comment '收票地址',
    invoice_remark                  varchar(200)                               null comment '发票备注',
    customer_service_remark         varchar(200)                               null comment '客服发票备注',
    is_merge                        tinyint unsigned default 0                 not null comment '是否合并（字典：ec_oms_yes_no）@1-是，0-否',
    merge_code                      bigint unsigned                            null comment '合并编号',
    is_suspend                      tinyint unsigned default 0                 not null comment '是否暂停（字典：ec_oms_yes_no）@1-是，0-否',
    is_outport                      tinyint unsigned default 0                 not null comment '是否导出（字典：ec_oms_yes_no）@1-是，0-否',
    is_blue                         tinyint unsigned default 1                 not null comment '是否蓝票（字典：ec_oms_yes_no）@1-是，0-否',
    is_receive                      tinyint unsigned default 0                 not null comment '财务中台是否接收（字典：ec_oms_yes_no）@1-是，0-否',
    verify_id                       int unsigned                               null comment '审核人编号',
    verify_name                     varchar(32)                                null comment '审核人姓名',
    verify_time                     timestamp                                  null comment '审核时间',
    invoice_url                     varchar(255)                               null comment '发票地址',
    audit_failed_reason             varchar(255)                               null comment '审核不通过原因',
    invoice_failed_reason           varchar(255)                               null comment '开票失败原因',
    submit_time                     timestamp                                  null comment '发票提交时间',
    cancel_time                     timestamp                                  null comment '发票取消时间',
    flush_time                      timestamp                                  null comment '发票冲红时间',
    success_time                    timestamp                                  null comment '开票成功时间',
    is_edit                         tinyint unsigned default 0                 not null comment '是否人工修改（字典：ec_oms_yes_no）@1-是，0-否',
    invoice_title_modify_times      tinyint unsigned default 0                 not null comment '发票抬头修改次数，用于限制',
    send_sms_fail_resaon            varchar(200)                               null comment '短信发送失败原因',
    send_sms_time                   timestamp                                  null comment '短信发送时间',
    send_sms_status                 tinyint unsigned default 99                not null comment '短信发送状态（字典：ec_oms_send_sms_status）@1-成功，0-失败 ,99-未发送',
    creator_id                      int unsigned                               null comment '创建人编号/申请人编号',
    creator_name                    varchar(32)                                null comment '创建人名称/申请人编号',
    create_time                     timestamp        default CURRENT_TIMESTAMP null comment '创建时间/申请时间',
    operator_id                     int unsigned                               null comment '操作人编号',
    operator_name                   varchar(32)                                null comment '操作人名称',
    last_update_time                timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    invoice_word                    varchar(32)                                null comment '发票代码',
    invoice_number                  varchar(32)                                null comment '发票号码',
    blue_invoice_word               varchar(32)                                null comment '蓝票发票代码',
    blue_invoice_number             varchar(32)                                null comment '蓝票发票号码',
    callback_status                 tinyint(3)       default 0                 not null comment '回传状态：0-未回传，1-回传成功，2-回传失败',
    no_tax_money                    decimal(13, 2)                             null comment '未税金额',
    tax_money                       decimal(13, 2)                             null comment '税额',
    total_tax_money                 decimal(13, 2)                             null comment '价税合计',
    tax_rate                        decimal(13, 2)                             null comment '税率',
    print_status                    tinyint unsigned default 0                 not null comment '打单状态（字典ec_oms_invoice_print_status 0-未打印 1-打印中 2-打印成功 3-打印失败 4-已发货）',
    paper_invoice_remark            varchar(255)     default ''                null comment '纸票备注',
    express_name                    varchar(32)      default ''                null comment '快递名称(最新)',
    print_fail_reason               varchar(255)     default ''                null comment '打印失败原因',
    paper_invoice_cancel_reason     varchar(255)     default ''                null comment '取消纸票原因',
    delivery_time                   timestamp                                  null comment '纸质发票发货时间',
    apply_source                    tinyint unsigned                           null comment '申请来源（字典ec_oms_invoice_apply_source 1-手动新增、2-系统对接、3-消费者自助申请）',
    create_type                     tinyint unsigned default 1                 not null comment '开票依据（字典ec_oms_invoice_create_type 1-订单 2-发货单）',
    logistics_order_code            decimal(30) unsigned                       null comment '物流发货单号'
)
    comment '发票申请表';

create index idx_ctime_scode_ocode
    on ec_oms_invoice (create_time, shop_code, order_code);

create index idx_icode_istat_suspend_recei
    on ec_oms_invoice (invoice_code, order_code, invoice_status, is_suspend, is_receive);

create index idx_itype_csta_ista_scode
    on ec_oms_invoice (invoice_type, callback_status, invoice_status, shop_code);

create index idx_merge_code
    on ec_oms_invoice (merge_code)
    comment '合并编号索引';

create index idx_order_code
    on ec_oms_invoice (order_code);

create index idx_shop_order_id
    on ec_oms_invoice (shop_order_id);

create table ec_oms_invoice_apply_record
(
    id                   int unsigned auto_increment comment '主键ID'
        primary key,
    invoice_code         bigint unsigned                            not null comment '发票申请编号',
    order_code           decimal(30) unsigned                       null comment 'EC订单编号，当合并时此值为空',
    merge_code           bigint unsigned                            null comment '合并编号，当多张发票合并时必填',
    apply_type           tinyint unsigned default 1                 not null comment '申请类型,@1-发票申请，2-冲红',
    creator_id           int unsigned                               null comment '创建人编号',
    creator_name         varchar(32)                                null comment '创建人名称',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间（回复时间）',
    create_type          tinyint unsigned default 1                 not null comment '开票依据（字典ec_oms_invoice_create_type 1-订单 2-发货单）',
    logistics_order_code decimal(30) unsigned                       null comment '物流发货单号'
)
    comment '发票申请记录';

create index idx_invoice_code
    on ec_oms_invoice_apply_record (invoice_code);

create table ec_oms_invoice_express_apply_record
(
    id                   int unsigned auto_increment comment '主键ID'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC订单编号',
    order_serial_no      varchar(64)                                not null comment '客户订单号',
    mailno               varchar(30)                                not null comment '运单号',
    creator_id           int unsigned                               null comment '创建人编号/申请人编号',
    creator_name         varchar(32)                                null comment '创建人名称/申请人编号',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间/申请时间',
    create_type          tinyint unsigned default 1                 not null comment '开票依据（字典ec_oms_invoice_create_type 1-订单 2-发货单）',
    logistics_order_code decimal(30) unsigned                       null comment '物流发货单号'
)
    comment '发票快递面单申请记录';

create table ec_oms_invoice_wait_flush
(
    id                   int unsigned auto_increment comment '主键ID'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC订单编号',
    handle_status        tinyint unsigned default 0                 not null comment '处理状态@0-待处理 1-已处理 2-已取消',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_type          tinyint unsigned default 1                 not null comment '开票依据（字典ec_oms_invoice_create_type 1-订单 2-发货单）',
    logistics_order_code decimal(30) unsigned                       null comment '物流发货单号'
)
    comment '发票等待冲红记录表';

create index idx_order_code
    on ec_oms_invoice_wait_flush (order_code);

create table ec_oms_invoice_waybill
(
    order_code           decimal(30)                not null comment 'EC订单编码',
    waybill_code         varchar(30)                not null comment '快递单号',
    is_subscribe         tinyint unsigned default 0 not null comment '是否订阅，1-是，0-否',
    create_type          tinyint unsigned default 1 not null comment '开票依据（字典ec_oms_invoice_create_type 1-订单 2-发货单）',
    logistics_order_code decimal(30) unsigned       null comment '物流发货单号',
    primary key (order_code, waybill_code)
)
    comment '发票快递单号关联信息';

create table ec_oms_issue_reason_base
(
    issue_reason_code         int unsigned                               not null comment '问题原因编号，eg（30001）'
        primary key,
    issue_reason              varchar(50)                                not null comment '问题原因',
    default_responsible_party tinyint unsigned default 0                 null comment '责任方（字典：ec_oms_default_responsible_party）',
    is_frozen                 tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    creator_id                int unsigned                               null comment '创建人编号',
    creator_name              varchar(32)                                null comment '创建人名称',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id               int unsigned                               null comment '操作人编号',
    operator_name             varchar(32)                                null comment '操作人名称',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '问题原因主数据表';

create table ec_oms_issue_subject_base
(
    issue_subject_code        int unsigned                               not null comment '一级问题编号，eg（10001）'
        primary key,
    issue_subject             varchar(40)                                not null comment '一级问题',
    sort                      smallint(4) unsigned                       not null comment '排序编码',
    default_responsible_party tinyint unsigned default 0                 null comment '【废弃】默认责任方（字典：ec_oms_default_responsible_party）',
    remark                    varchar(200)                               null comment '备注',
    is_frozen                 tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    creator_id                int unsigned                               null comment '创建人编号',
    creator_name              varchar(32)                                null comment '创建人名称',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id               int unsigned                               null comment '操作人编号',
    operator_name             varchar(32)                                null comment '操作人名称',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '一级问题主数据表';

create table ec_oms_issue_type_base
(
    issue_type_code    int unsigned                               not null comment '二级编号，eg（10001）'
        primary key,
    issue_type         varchar(40)                                not null comment '二级问题',
    issue_subject_code int unsigned                               not null comment '所属一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code）',
    sort               smallint(4) unsigned                       not null comment '排序编码',
    remark             varchar(200)                               null comment '备注',
    app_scope          tinyint unsigned default 1                 not null comment '问题应用分类（字典：ec_oms_issue_app_scope）@1-仅内部使用，2-允许分销商选择，3-允许同步快递商，4-允许所有相关方使用',
    is_common          tinyint unsigned default 0                 not null comment '是否常用（字典：ec_oms_yes_no）@0-否 1-是',
    common_sort        smallint(4) unsigned                       null comment '常用排序',
    is_frozen          tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    creator_id         int unsigned                               null comment '创建人编号',
    creator_name       varchar(32)                                null comment '创建人名称',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id        int unsigned                               null comment '操作人编号',
    operator_name      varchar(32)                                null comment '操作人名称',
    last_update_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '二级问题主数据表';

create index idx_issue_subject_code
    on ec_oms_issue_type_base (issue_subject_code);

create table ec_oms_issue_type_reason_relation
(
    id                int unsigned auto_increment comment '主键ID'
        primary key,
    issue_type_code   int unsigned                   not null comment '二级编号，关联ec_oms_issue_type_base',
    issue_reason_code int unsigned                   not null comment '问题原因编号，关联ec_oms_issue_reason_base',
    is_default        tinyint unsigned     default 0 not null comment '是否默认项（字典：ec_oms_yes_no）@0-否 1-是',
    sort              smallint(4) unsigned default 0 not null comment '排序',
    del_flag          tinyint unsigned     default 0 not null comment '删除标记，1-是，0-否'
)
    comment '二级问题与问题原因多对多关系表';

create index idx_issue_reason_code
    on ec_oms_issue_type_reason_relation (issue_reason_code);

create index idx_issue_type_code
    on ec_oms_issue_type_reason_relation (issue_type_code);

create table ec_oms_jd_im_pop_chatlog
(
    id          int unsigned auto_increment comment '自增主键'
        primary key,
    shop_code   int unsigned                        null comment '店铺编号',
    channel     smallint unsigned                   null comment '消息通道。区分消息是顾客还是客服发送。 11:客户发送的普通消息 12:客户接收到的转接消息 13:客户发送的留言消息 14:app-sdk客户普通消息 - 在线咨询 15:app-sdk客户普通消息 - 离线咨询 16:app-sdk客户普通消息 - 语音消息 21:客服发送的普通消息 22:客服发送的自动回复 23:客服快捷回复  24:发给发起转接客服的消息 25:发给被转接客服的消息 26:客服发送的留言消息 27: 客服的欢迎语 28:客服发送的离线消息 29:客服之间对话 31:客服邀评信息',
    customer    varchar(32)                         null comment '咨询的顾客',
    waiter      varchar(32)                         null comment '客服账号',
    content     varchar(255)                        null comment '聊天内容',
    sid         varchar(64)                         null comment '会话ID。',
    sku_id      bigint(10) unsigned                 null comment '商品id',
    time_parse  timestamp                           null comment '创建时间转换的',
    time        bigint                              null comment '消息发送时间 long',
    waiter_send tinyint unsigned                    null comment '是否是客服发送 1 是/2 不是',
    create_time timestamp default CURRENT_TIMESTAMP null comment 'ec创建时间'
)
    comment '京东客服聊天记录表';

create index idx_cut_wait
    on ec_oms_jd_im_pop_chatlog (shop_code, customer, waiter);

create index idx_sid
    on ec_oms_jd_im_pop_chatlog (sid);

create index idx_time
    on ec_oms_jd_im_pop_chatlog (time);

create index idx_time_p
    on ec_oms_jd_im_pop_chatlog (time_parse);

create table ec_oms_jd_order_split_record
(
    id                   int(11) unsigned auto_increment comment '编号'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC订单编号',
    parent_order_id      decimal(30) unsigned                       not null comment '父单订单编号',
    child_order_id       decimal(30) unsigned                       not null comment '子单订单编号',
    logistics_order_code decimal(30) unsigned                       not null comment '子单对应物流发货单号',
    num                  varchar(64)                                null comment '子单产品数量',
    outter_id            varchar(255)                               null comment '子单产品outter_id编号',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '京东拆单记录表';

create table ec_oms_jd_product_info
(
    id                     int(10) auto_increment comment '自增主键'
        primary key,
    ware_id                bigint(14)    not null comment '商品id',
    shop_code              int(8)        null comment '店铺编码',
    shop_name              varchar(50)   null comment '店铺名称',
    sku_id                 bigint(15)    null comment 'skuId',
    status                 tinyint(3)    null comment '1:上架 2:下架 4:删除',
    sale_attrs             mediumtext    null comment '销售属性集合',
    features               mediumtext    null comment '特殊属性集合',
    outer_Id               varchar(20)   null comment '外部ID',
    bar_code               varchar(20)   null comment '条形码',
    brand_name             varchar(255)  null comment '品牌名称',
    img_tag                int(8)        null comment '图片标签',
    market_price           decimal(8, 2) null comment '市场价',
    cost_price             decimal(8, 2) null comment '成本价',
    jd_price               decimal(8, 2) null comment '京东价',
    stock_num              int(8)        null comment '总库存数',
    category_id            int(8)        null comment '类目ID',
    category_sec_id        int(8)        null comment '二级叶子类目',
    multi_category_id      int(8)        null comment '末级类目ID',
    shop_id                int(10)       null comment '商家对应的shopID',
    promise_id             int(10)       null comment '时效模板ID',
    logo                   varchar(255)  null comment '商品主图',
    sku_name               varchar(255)  null comment 'sku名称',
    ware_title             varchar(255)  null comment '商品名称',
    fixed_delivery_time    timestamp     null comment '大件商品固定发货时效 订单开始日期,订单结束日期,发货日期,完成发货天数',
    relative_delivery_time timestamp     null comment '大件商品相对发货时效 完成发货天数',
    parent_id              bigint(15)    null comment '商品父ID 仅供销商品，普通商品没有',
    modified               timestamp     null comment '商品最后一次修改时间',
    created                timestamp     null comment '商品创建时间',
    multi_cate_props       mediumtext    null comment '末级类目属性列表',
    capacity               varchar(20)   null comment '容量 在有特殊要求的类目下必填，最多支持6位小数。',
    title                  varchar(255)  null comment '商品名称',
    brand_id               int(8)        null comment '品牌ID',
    transport_id           int(8)        null comment '运费模板ID',
    ware_status            int(5)        null comment '商品状态 1:删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败',
    item_num               int(8)        null comment '商品货号',
    ware_location          varchar(255)  null comment '商品产地',
    offline_time           timestamp     null comment '最后下架时间',
    online_time            timestamp     null comment '最后上架时间',
    col_type               tinyint(3)    null comment '合作模式',
    delivery               varchar(255)  null comment '发货地',
    ad_words               mediumtext    null comment '商品广告词',
    images                 mediumtext    null comment '商品图片',
    shop_categorys         mediumtext    null comment '商品店内分类 商家接口获取到的最末级的分类',
    sell_point             varchar(255)  null comment '卖点',
    ware_tax               mediumtext    null comment '税率',
    after_sale_desc        varchar(255)  null comment '售后图文详情',
    zhuang_ba_mobile_desc  text          null comment '移动版装吧商详',
    mobile_zhuang_ba_id    varchar(50)   null comment '移动版装吧实例ID',
    mobile_desc            text          null comment '移动端详情',
    introduction           text          null comment 'PC端详情',
    zhuang_ba_introduction text          null comment '商品描述装吧实例ID',
    introduction_use_flag  tinyint(3)    null comment '商品描述使用标识 0：使用默认的商品描述,1：使用装吧商详',
    after_sales            varchar(255)  null comment '售后服务',
    zhuang_ba_id           varchar(50)   null comment '商品描述装吧实例ID',
    mobile_desc_use_flag   tinyint(3)    null comment '移动版商品描述使用标识 0：使用默认的移动商详；1：使用装吧移动版商详',
    fit_case_html_pc       text          null comment '装修案例PC版描述',
    fit_case_html_app      text          null comment '装修案例移动版描述',
    special_services       mediumtext    null comment '特色服务 装修类目才可填写,装修类必填,最大为5,每个值最长为8个字符',
    ware_group_id          int(8)        null comment '商品门店组ID 仅供销商品，普通商品没有',
    business_type          varchar(20)   null comment '商品业务类型 仅供销商品，普通商品没有',
    design_concept         varchar(255)  null comment '商品设计理念 适用范围是toplife类目',
    is_archival            tinyint(255)  null comment '是否归档商品 归档商品不能进行修改 0否 1是',
    template_ids           varchar(255)  null comment '关联板式id',
    create_time            timestamp     null comment '数据库创建时间',
    last_update_time       timestamp     null on update CURRENT_TIMESTAMP comment '数据库更新时间'
)
    comment '京东商品信息';

create index idx_ware_id_shop_code
    on ec_oms_jd_product_info (ware_id, shop_code);

create table ec_oms_job_task_info
(
    job_id                   int unsigned                               not null comment '任务编号'
        primary key,
    job_desc                 varchar(50)                                not null comment '任务描述',
    job_handler              varchar(50)                                not null comment '任务执行器',
    job_param                varchar(255)                               null comment '任务参数',
    job_param_start_time_pos tinyint(3)                                 null comment '开始时间参数位置（从0开始）',
    job_param_end_time_pos   tinyint(3)                                 null comment '结束时间参数位置（从0开始）',
    ec_shop_code             int unsigned                               null comment '任务对应店铺编号，按序号排列，5位数字（10000）',
    ec_task_type             tinyint unsigned                           null comment '任务类型：抓取正常单0、抓取售后单1',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    del_flag                 tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '抓单定时任务信息表' charset = utf8;

create table ec_oms_master_data_import
(
    id                    int(10) auto_increment comment '主键id'
        primary key,
    import_code           int(10)       null comment '标识上传的批次号',
    product_code          bigint        null comment '商品编号',
    is_frozen             tinyint(3)    null comment '是否冻结（字典：ec_oms_yes_no）@1-是，0-否',
    import_operation_hint varchar(1024) null comment '导入失败原因',
    import_time           timestamp     null comment '导入时间'
);

create table ec_oms_monitor_record
(
    id               bigint unsigned auto_increment comment 'id'
        primary key,
    business_type    tinyint unsigned default 0                 not null comment '业务类型@1-订单重复2-补发异常3-回传异常',
    order_code       decimal(30) unsigned                       null comment 'EC订单编号',
    param1           varchar(64)                                null comment '参数字段1',
    param2           varchar(64)                                null comment '参数字段2',
    handle_status    tinyint unsigned default 0                 not null comment '是否处理  0 - 未处理  1 - 处理',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment 'OMS定时监控记录表';

create index idx_order_code
    on ec_oms_monitor_record (order_code);

create index idx_param1
    on ec_oms_monitor_record (param1);

create table ec_oms_monitor_task
(
    id               int auto_increment comment 'id'
        primary key,
    task_name        varchar(50)                                not null comment '任务名',
    task_description varchar(255)                               null comment '任务描述',
    send_type        varchar(4)                                 not null comment '提醒方式 0-邮箱  1-企微 (字典：ec_oms_monitor_task_send_type）)',
    create_code      int unsigned                               null comment '创建人编码',
    create_name      varchar(32)                                null comment '创建人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code     int(10)                                    null comment '修改人/操作人编码',
    changed_name     varchar(32)                                null comment '修改人/操作人姓名',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '任务表';

create table ec_oms_monitor_task_receive
(
    id            int auto_increment comment 'id'
        primary key,
    task_id       int                        not null comment '关联任务id',
    receive_code  int                        not null comment '收件人编号',
    receive_name  varchar(50)                not null comment '姓名',
    receive_email varchar(128)               null comment '邮箱',
    receive_dept  varchar(128)               null comment '所属部门',
    receive_type  tinyint(2)                 not null comment '收件人类型 0-收件 1-抄送 （字典：ec_oms_monitor_task_receive_type）',
    del_flag      tinyint unsigned default 0 null comment '删除标识 0-有效 1-删除'
)
    comment '信息接收表';

create table ec_oms_notice
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    notice_title     varchar(100)                               not null comment '公告标题',
    notice_type      tinyint unsigned default 1                 not null comment '公告类型 （字典：ec_oms_notice_type）1-商品宣导',
    propaganda_type  tinyint unsigned default 0                 not null comment '宣导类型 （字典：ec_oms_propaganda_type）1-新品宣导，2-组品规范，3-价格策略，4-活动规范，5-其他',
    publish_time     timestamp        default CURRENT_TIMESTAMP null comment '发布时间',
    notice_content   text                                       not null comment '公告内容',
    is_top           tinyint unsigned default 0                 not null comment '是否置顶@1-是 0-否',
    is_recall        tinyint unsigned default 0                 not null comment '是否撤回（字典：ec_oms_yes_no）@0-否 1-是',
    is_push          tinyint unsigned default 0                 not null comment '是否推送（字典：ec_oms_yes_no）@0-否 1-是',
    push_type        varchar(100)                               null comment '推送方式（1-企业微信，2-邮件）多个逗号拼接',
    creator_id       int                                        null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int                                        null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记@1-是 0-否'
)
    comment 'ec公告表';

create table ec_oms_notice_object
(
    id                 int unsigned auto_increment comment '主键ID'
        primary key,
    notice_id          int(11) unsigned           not null comment '公告id，关联ec_oms_notice',
    notice_object_type tinyint unsigned default 1 not null comment '通知对象类型 （字典：ec_oms_notice_object_type）1-店铺',
    object_code        varchar(32)                not null comment '对象编号',
    del_flag           tinyint unsigned default 0 not null comment '删除标记@1-是 0-否'
)
    comment '公告与通知对象关系表';

create index idx_notice_id
    on ec_oms_notice_object (notice_id);

create table ec_oms_notice_push_time
(
    id        int unsigned auto_increment comment '主键ID'
        primary key,
    notice_id int(11) unsigned           not null comment '公告id，关联ec_oms_notice',
    push_time timestamp                  null comment '推送时间',
    is_push   tinyint unsigned default 0 not null comment '是否已推送@1-是 0-否',
    fail_num  int(10)          default 0 null comment '推送失败次数',
    del_flag  tinyint unsigned default 0 not null comment '删除标记@1-是 0-否'
)
    comment '公告与推送时间关系表';

create index idx_notice_id
    on ec_oms_notice_push_time (notice_id);

create table ec_oms_notice_push_user
(
    id        int unsigned auto_increment comment '主键ID'
        primary key,
    notice_id int(11) unsigned           not null comment '公告id，关联ec_oms_notice',
    user_code varchar(50)                null comment '推送人唯一标识',
    user_name varchar(20)                null comment '推送人名称',
    email     varchar(50)                null comment '邮箱',
    org_name  varchar(255)               null comment '部门名称',
    is_push   tinyint(3)       default 0 null comment '是否已推送 1-是 0-否',
    fail_num  int(10)          default 0 null comment '推送失败次数',
    del_flag  tinyint unsigned default 0 not null comment '删除标记@1-是 0-否'
)
    comment '公告与通知对象关系表';

create index idx_notice_id
    on ec_oms_notice_push_user (notice_id);

create table ec_oms_notice_user
(
    id            int unsigned auto_increment comment '主键ID'
        primary key,
    notice_id     int                  not null comment '公告id，关联ec_oms_notice',
    user_code     int                  not null comment '用户编号',
    is_read       tinyint(3) default 0 not null comment '是否已读@1-是 0-否',
    is_collection tinyint(3) default 0 not null comment '是否收藏@1-是 0-否',
    constraint idx_notice_id_user_code
        unique (notice_id, user_code)
)
    comment '公告与用户关系表';

create table ec_oms_old_order_relation
(
    order_code       decimal(30)              not null comment '订单编号'
        primary key,
    old_order_id     varchar(64) charset utf8 not null comment '旧OMS外部订单id',
    old_order_source varchar(32) charset utf8 not null comment '旧OMS外部订单来源'
)
    comment '新旧订单关联表';

create table ec_oms_order
(
    order_code                  decimal(30) unsigned                       not null comment 'EC订单编号'
        primary key,
    shop_order_id               varchar(64)                                not null comment '店铺订单编号，若为合单则置为EC订单编号(order_code)',
    shop_code                   int unsigned                               not null comment '店铺来源编号',
    relate_order_code           decimal(30) unsigned                       not null comment '拆合关联单号 默认为order_code,拆单后为原单的order_code，合单后为合单的order_code',
    plat_order_status           varchar(64)                                null comment '各平台状态（字典：ec_oms_plat_order_status）',
    breed_num                   tinyint unsigned default 0                 null comment '品种数',
    pro_total_num               int unsigned     default 0                 null comment '件总数',
    gross_weight                decimal(10, 3)   default 0.000             null comment '毛重(kg)',
    buyer_nick                  varchar(64)                                null comment '买家昵称/ID',
    has_buyer_message           tinyint unsigned default 0                 null comment '是否有买家留言（字典：ec_oms_yes_no）@1-是，0-否',
    buyer_message               varchar(1024)    default ''                null comment '买家留言内容',
    seller_message              varchar(1024)    default ''                null comment '卖家备注',
    invoice_type                tinyint unsigned default 0                 null comment '【废弃】发票买家类型（字典：ec_oms_buyer_type）@1-个人，2-企业',
    invoice_title               varchar(1)       default ''                null comment '【废弃】发票抬头',
    country                     varchar(32)                                null comment '收货人国籍',
    province                    varchar(32)                                null comment '收货人省份',
    city                        varchar(32)                                null comment '收货人城市',
    district                    varchar(32)                                null comment '收货人区县',
    town                        varchar(32)                                null comment '收货人城镇',
    village                     varchar(32)                                null comment '社区/村',
    address                     varchar(255)                               null comment '收货人详细地址',
    address_cipher              varchar(1048)                              null comment '地址',
    post_code                   varchar(15)                                null comment '邮政编码',
    receiver_name               varchar(32)      default ''                not null comment '收货人姓名',
    receiver_name_cipher        varchar(256)                               null comment '收货人姓名',
    receiver_mobile             varchar(20)                                null comment '收货人手机',
    receiver_mobile_cipher      varchar(256)                               null comment '收货人姓名',
    receiver_phone              varchar(32)                                null comment '收货人固定电话',
    receiver_phone_cipher       varchar(152)                               null comment '收货人固定电话',
    send_channel                tinyint unsigned                           null comment '发货渠道编码',
    storehouse_code             int(10)                                    null comment '仓库编码',
    storehouse_name             varchar(32)                                null comment '仓库名称',
    express_code                int                                        null comment '快递公司编码',
    express_name                varchar(32)                                null comment '快递公司名称',
    waybill_code                varchar(1024)                              null comment '快递单号，多个逗号分隔',
    order_all_price             decimal(14, 4)   default 0.0000            not null comment '报价总金额',
    order_shop_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment '店铺承担产品总优惠金额',
    order_plat_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment '平台承担产品总优惠金额',
    order_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '店铺承担订单优惠',
    order_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment '平台承担订单优惠',
    shop_all_discount_amt       decimal(12, 2)   default 0.00              not null comment '店铺总优惠',
    plat_all_discount_amt       decimal(12, 2)   default 0.00              not null comment '平台总优惠',
    order_pro_pay_amt           decimal(14, 4)   default 0.0000            not null comment '产品实付总金额',
    order_pay_amt               decimal(14, 4)   default 0.0000            not null comment '订单实付金额',
    order_received_amt          decimal(14, 4)   default 0.0000            not null comment '订单实收金额',
    order_all_shipment          decimal(14, 4)   default 0.0000            not null comment '订单总邮费',
    price_control_discrepancy   decimal(14, 4)   default 0.0000            not null comment '价格管控差异',
    split_order                 decimal(30) unsigned                       null comment '该单为子单时：存原单的order_code；该单为原单时：存合单的order_code',
    merge_order                 varchar(1299)                              null comment '该单为合单时：存原单的order_code(多个逗号分隔)；该单为原单时：存子单的order_code(多个逗号分隔)',
    client_code                 varchar(32)                                null comment '平台客户编码',
    pro_codes                   varchar(1024)                              null comment '产品编号（“,"分割）',
    shop_pro_name               varchar(2048)                              null comment '网店品名（"||"分隔）',
    remark                      varchar(500)                               null comment '订单备注',
    import_cause                tinyint unsigned                           null comment '导入原因（字典：ec_oms_import_cause）',
    import_nopass_cause         varchar(500)                               null comment '财审不通过原因',
    import_examine_code         int unsigned                               null comment '审核人编号',
    import_examine_name         varchar(32)                                null comment '审核人名称',
    import_operation_hint       varchar(64)                                null comment '导入订单失败原因，页面显示操作提示，多个用逗号隔开',
    dispatch_fail_reason        varchar(256)                               null comment '调度失败原因',
    dispatch_type               tinyint unsigned                           null comment '调度类型（字典：ec_oms_dispatch_type）',
    hang_emp_code               int                                        null comment '挂起人编号',
    hang_emp_name               varchar(32)                                null comment '挂起人名称',
    create_time                 timestamp        default CURRENT_TIMESTAMP null comment '记录创建时间',
    last_update_time            timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                    tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    creator_id                  int unsigned                               null comment '创建人编号',
    creator_name                varchar(32)                                null comment '创建人名称',
    reissue_relate_order_code   decimal(30) unsigned                       null comment '补发关联单号,为原单/合单的EC订单编号，订单类型为补发单时填入',
    sale_channel                varchar(30)                                null comment '终端客户/分销平台(记录订单最终销售渠道)',
    return_reason               varchar(64)                                null comment '退回原因',
    apply_file_code             varchar(255)                               null comment '申请文件编码'
)
    comment '统一订单表';

create index idx2_order_shop_order_id
    on ec_oms_order (shop_order_id, shop_code)
    comment '店铺订单编号、店铺组合索引';

create index idx_buyer_nick
    on ec_oms_order (buyer_nick);

create index idx_client_ct
    on ec_oms_order (client_code, create_time);

create index idx_create_time
    on ec_oms_order (create_time);

create index idx_lut
    on ec_oms_order (last_update_time);

create index idx_pre_wcode
    on ec_oms_order (waybill_code);

create index idx_receiver_mobile
    on ec_oms_order (receiver_mobile);

create index idx_relate_order_code
    on ec_oms_order (relate_order_code);

create index idx_scode_isdel
    on ec_oms_order (shop_code, del_flag);

create index idx_split_order
    on ec_oms_order (split_order);

create table ec_oms_order_2b_expand
(
    order_code             decimal(30) unsigned                          not null comment 'EC订单编号'
        primary key,
    distri_channel_code    varchar(10)                                   null comment '分销渠道编号，关联oms_b2b_client_distri_channel.distri_channel_code',
    client_storehouse_code varchar(10)                                   null comment '客户仓库编号',
    operation_audit_status tinyint(4) unsigned default 0                 not null comment '运营审核状态 1-待审核，2-审核通过，3-审核不通过',
    operation_auditor_id   int unsigned                                  null comment '运营审核人员工编号',
    operation_auditor      varchar(32)                                   null comment '运营审核人',
    merchant_received_amt  decimal(14, 2)      default 0.00              null comment '商家实收金额',
    recommend_code         bigint(11) unsigned                           null comment '推荐码',
    recommend_user_code    int(9) unsigned                               null comment '推荐人编号',
    recommend_name         varchar(5)                                    null comment '推荐人姓名',
    last_update_time       timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '统一订单表2b拓展信息表';

create table ec_oms_order_aikucun_product_detail
(
    activityId varchar(50)  not null comment '活动ID',
    adorderId  varchar(50)  not null comment '外部平台订单号',
    kuanhao    varchar(50)  not null comment '内部平台商品ID',
    num        int(10)      not null comment '订单商品数',
    skuid      varchar(30)  null comment '外部平台商品ID',
    name       varchar(255) null comment '商品名称',
    brandname  varchar(100) not null comment '品牌',
    barcode    varchar(50)  not null comment '条码'
);

create index idx_adorderId_skuid
    on ec_oms_order_aikucun_product_detail (adorderId, skuid)
    comment '订单号 商品编号联合索引';

create index idx_oid_kuanhao
    on ec_oms_order_aikucun_product_detail (adorderId, kuanhao);

create table ec_oms_order_bm_expand
(
    order_code            decimal(30) unsigned not null comment 'EC订单编号'
        primary key,
    recommend_code        varchar(32)          null comment '推荐码（目前只用于自建商城、手机号码）',
    bm_shop_code          varchar(32)          null comment '自提店铺编码',
    delivery_type         tinyint unsigned     null comment '配送方式(1.送货上门 2.自提)',
    customer_code         varchar(32)          null comment '月亮商城的消费者编码',
    send_goods_time_type  tinyint unsigned     null comment '发货时间类型(1.即时发货 2.延时发货)',
    delay_send_goods_time timestamp            null comment '延时发货时间',
    receive_code          varchar(16)          null comment '签收码'
)
    comment '天使派单、月亮商城订单拓展表';

create table ec_oms_order_convert_relation
(
    id               int unsigned auto_increment comment '主键Id'
        primary key,
    order_code       decimal(30) unsigned                not null comment 'EC订单编号',
    plan_code        bigint unsigned                     not null comment '策略编号',
    operator_id      int unsigned                        null comment '操作人编号',
    operator_name    varchar(32)                         null comment '操作人名称',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '订单转品应用关系表';

create index idx_order_code
    on ec_oms_order_convert_relation (order_code);

create table ec_oms_order_convert_relation_tmp
(
    id               int unsigned auto_increment comment '主键Id'
        primary key,
    order_code       decimal(30) unsigned                not null comment 'EC订单编号',
    plan_code        bigint unsigned                     not null comment '策略编号',
    operator_id      int unsigned                        null comment '操作人编号',
    operator_name    varchar(32)                         null comment '操作人名称',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '订单转品应用关系表';

create index idx_order_code
    on ec_oms_order_convert_relation_tmp (order_code);

create table ec_oms_order_delivery_guomei
(
    order_no varchar(64) not null comment '国美店铺订单编号'
        primary key,
    order_id varchar(20) not null comment '国美配送单号，与店铺订单编号一对一'
)
    comment '国美店铺单号和配送单号的关系映射表';

create table ec_oms_order_delivery_register_info
(
    id                    int unsigned auto_increment comment '主键id'
        primary key,
    order_code            decimal(30)                                null comment 'EC订单编号',
    shop_order_id         varchar(64)                                not null comment '店铺订单编号',
    shop_code             int unsigned                               not null comment '店铺来源编号',
    request_delivery_date timestamp                                  null comment '要求送达日期',
    start_delivery_date   timestamp                                  null comment '开始送货时间',
    end_delivery_date     timestamp                                  null comment '结束送货时间',
    is_appointment        tinyint unsigned default 0                 not null comment '是否预约（字典：ec_oms_yes_no）@1-是，0-否',
    appointment_day       smallint unsigned                          null comment '预约提前几天',
    is_upstairs           tinyint unsigned default 0                 not null comment '是否上楼（字典：ec_oms_yes_no）@1-是，0-否',
    floor_num             varchar(10)                                null comment '楼层',
    is_lift               tinyint unsigned default 0                 not null comment '是否有电梯（字典：ec_oms_yes_no）@1-是，0-否',
    is_limit_car          tinyint unsigned default 0                 not null comment '是否限制车辆（字典：ec_oms_yes_no）@1-是，0-否',
    car_limit_remark      varchar(200)                               null comment '车辆限制说明',
    is_limit_row          tinyint unsigned default 0                 not null comment '是否限行（字典：ec_oms_yes_no）@1-是，0-否',
    limit_row_remark      varchar(200)                               null comment '限行说明',
    is_unloading          tinyint unsigned default 0                 not null comment '是否卸货（字典：ec_oms_yes_no）@1-是，0-否',
    is_move               tinyint unsigned default 0                 not null comment '是否平移搬运（字典：ec_oms_yes_no）@1-是，0-否',
    move_range            varchar(100)                               null comment '搬运距离，单位m',
    weekend_take          tinyint unsigned default 0                 not null comment '是否周末收货（字典：ec_oms_yes_no）@1-是，0-否',
    sign_type             varchar(200)                               null comment '签收方式',
    bill_image1           varchar(512)                               null comment '单据图片1',
    bill_image2           varchar(512)                               null comment '单据图片2',
    bill_file             varchar(512)                               null comment '随行单据附件',
    bill_file_name        varchar(256)                               null comment '随行单据附件文件名称',
    remark                varchar(200)                               null comment '备注',
    register_id           int                                        null comment '登记人id',
    register_name         varchar(32)                                null comment '登记人姓名',
    register_status       tinyint          default 0                 not null comment '登记状态(0:未登记，1：已登记，2：已提交)',
    register_time         timestamp        default CURRENT_TIMESTAMP null comment '登记时间',
    export_status         tinyint unsigned default 0                 not null comment '导出状态(1：已导出,0:未导出)',
    export_time           timestamp                                  null comment '导出时间',
    export_user_code      int                                        null comment '导出人编号',
    export_user_name      varchar(32)                                null comment '导出人名称',
    client_code           varchar(15)                                null comment '客户编号',
    creator_id            int                                        null comment '创建人编号',
    creator_name          varchar(32)                                null comment '创建人名称',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id           int                                        null comment '操作人编号',
    operator_name         varchar(32)                                null comment '操作人名称',
    last_update_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag              tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '配送信息登记表';

create index idx_order_code
    on ec_oms_order_delivery_register_info (order_code);

create table ec_oms_order_delivery_register_info_sub
(
    id                   int unsigned auto_increment comment '主键id'
        primary key,
    order_code           decimal(30)                   null comment 'EC订单编号',
    logistics_order_code decimal(30)                   null comment '发货单编号',
    sap_order_code       varchar(20)                   null comment 'sap订单编号',
    send_status          varchar(10)                   null comment 'SAP发货状态',
    waybill_code         varchar(1024)                 null comment '发运单号（快递单号）',
    waybill_number       varchar(64)                   null comment '发货单号',
    apply_document_no    varchar(100)                  null comment '申请文件编号',
    delivery_date        timestamp                     null comment '发货时间',
    transport_area_code  varchar(32)                   null comment '运输区域编码',
    store_name           varchar(32)                   null comment '仓库名称',
    store_code           varchar(32)                   null comment '发货仓库编码',
    store_desc           varchar(32)                   null comment '仓库描述',
    plan_arrival_date    timestamp                     null comment '计划到货日期',
    real_arrival_date    timestamp                     null comment '实际到货日期',
    order_start_time     timestamp                     null comment '订单创建时间',
    order_transfer_date  timestamp                     null comment '订单转单日期',
    verify_date          timestamp                     null comment '验货时间',
    print_date           timestamp                     null comment '打印时间',
    is_success           tinyint unsigned              null comment '是否推送成功（字典：ec_oms_yes_no）@1-是，0-否',
    weight               decimal(8, 2)                 null comment 'sap重量kg',
    oms_weight           decimal(8, 2)                 null comment 'oms重量',
    sap_bulk             decimal(20, 4)                null comment 'SAP体积cm3',
    oms_bulk             decimal(20, 4)                null comment 'oms体积',
    carton_num           decimal(12, 4) unsigned       null comment '发货箱数',
    client_code          varchar(15)                   null comment '客户编号',
    deliver_type         tinyint                       null comment '发货渠道类型1京东仓，2百世仓，3苏宁仓，4WMS发货，5sap发货，6派单发货',
    dispatch_status      tinyint                       null comment '调度状态',
    return_status        tinyint(4) unsigned default 0 null comment '退回调度状态（字典：ec_oms_return_status）@0-未退回调度1-退回调度中2-退回调度成功3-退回调度失败9-退回调度出错',
    last_update_time     timestamp                     null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag             tinyint             default 0 not null comment '删除标记，1-是，0-否'
)
    comment '配送信息登记表明细';

create index idx_order_code
    on ec_oms_order_delivery_register_info_sub (order_code);

create table ec_oms_order_discount
(
    id                      int unsigned auto_increment comment '主键id'
        primary key,
    order_code              decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_order_id           varchar(64)                                not null comment '店铺订单编号',
    shop_code               int unsigned                               not null comment '店铺来源编号',
    product_code            bigint unsigned                            null comment '产品编号',
    outter_id               varchar(32)                                null comment '外部平台商品编号',
    order_product_detail_id int unsigned                               null comment '对应平台产品明细id',
    discount_code           varchar(48)                                null comment '优惠编码',
    discount_name           varchar(32)                                null comment '优惠名称',
    discount_amount         decimal(12, 4)                             null comment '优惠金额',
    discount_type           tinyint(4) unsigned                        null comment '优惠类型 平台承担订单优惠1 ,店铺承担订单优惠2, 平台承担产品优惠3, 店铺承担产品优惠4',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                tinyint unsigned default 0                 not null comment '删除标记 1：删除 0：未删除'
)
    comment '平台店铺优惠汇总表';

create index idx_ctime
    on ec_oms_order_discount (create_time);

create index idx_luptime
    on ec_oms_order_discount (last_update_time);

create index idx_order_code
    on ec_oms_order_discount (order_code);

create table ec_oms_order_discount_config
(
    id                    int(10) auto_increment comment '主键ID'
        primary key,
    shop_code             varchar(128) null comment '店铺编号，多个逗号隔开',
    discount_code         varchar(64)  null comment '优惠编码',
    discount_name         varchar(64)  null comment '优惠名称',
    discount_amount_field varchar(64)  null comment '优惠金额字段名称',
    discount_type         tinyint      null comment '优惠类型 平台承担订单优惠1 ,店铺承担订单优惠2, 平台承担产品优惠3, 店铺承担产品优惠4',
    discount_kind         tinyint      null comment '优惠种类  1-订单优惠  2-产品优惠'
)
    comment '订单/商品优惠配置表';

create index dc_shop_code
    on ec_oms_order_discount_config (shop_code);

create table ec_oms_order_discount_jd
(
    discount_id   bigint(64) unsigned auto_increment comment '优惠id'
        primary key,
    shop_order_id varchar(32)   null comment '外部平台订单编号',
    sku_id        varchar(32)   null comment '外部平台sku编号',
    coupon_type   varchar(32)   null comment '外部平台优惠类型',
    coupon_price  decimal(8, 2) null comment '外部平台优惠价格'
)
    comment '京东优惠券信息(暂不使用)';

create index idx_orderId
    on ec_oms_order_discount_jd (shop_order_id);

create table ec_oms_order_discount_tmp
(
    id                      int unsigned auto_increment comment '主键id'
        primary key,
    order_code              decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_order_id           varchar(64)                                not null comment '店铺订单编号',
    shop_code               int unsigned                               not null comment '店铺来源编号',
    product_code            bigint unsigned                            null comment '产品编号',
    outter_id               varchar(32)                                null comment '外部平台商品编号',
    order_product_detail_id int unsigned                               null comment '对应平台产品明细id',
    discount_code           varchar(48)                                null comment '优惠编码',
    discount_name           varchar(32)                                null comment '优惠名称',
    discount_amount         decimal(12, 4)                             null comment '优惠金额',
    discount_type           tinyint(4) unsigned                        null comment '优惠类型 平台承担订单优惠1 ,店铺承担订单优惠2, 平台承担产品优惠3, 店铺承担产品优惠4',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                tinyint unsigned default 0                 not null comment '删除标记 1：删除 0：未删除'
)
    comment '平台店铺优惠汇总表';

create index idx_ctime
    on ec_oms_order_discount_tmp (create_time);

create index idx_luptime
    on ec_oms_order_discount_tmp (last_update_time);

create index idx_order_code
    on ec_oms_order_discount_tmp (order_code);

create table ec_oms_order_guangfa_waybill_status
(
    serial_no             varchar(64)                not null comment '批次号',
    sub_order_id          varchar(64)                not null comment '平台子订单号',
    update_waybill_status tinyint unsigned default 1 null comment '回传签收状态 0-未回传 1-已回传',
    primary key (serial_no, sub_order_id)
)
    comment '广发订单快递签收回传状态表';

create table ec_oms_order_import
(
    id                      int unsigned auto_increment comment '主键id'
        primary key,
    import_code             bigint unsigned                        not null comment '标识上传订单的批次号',
    num                     smallint unsigned                      not null comment '序号，标识本批导入订单是否需合并',
    business_type           tinyint unsigned        default 1      not null comment '业务类型（字典：ec_oms_business_type）@1-普通订单，2-销售订单，3-分销订单，4-临时销售订单',
    shop_order_id           varchar(64)                            null comment '店铺订单编号',
    shop_code               int unsigned                           not null comment '店铺来源编号',
    relate_shop_order_id    varchar(64)                            null comment '关联订单编号 默认为shop_order_id,拆单合单后为原单的shop_order_id',
    import_operation_hint   varchar(64)                            null comment '导入订单失败原因，页面显示操作提示，多个用逗号隔开',
    import_cause            tinyint unsigned                       null comment '导入原因（字典：ec_oms_import_cause）1-对公转账大订单2-运费链接大订单3-营销活动订单4-新平台5-活动差价6-其他',
    client_code             varchar(32)                            null comment '客户编码',
    buyer_nick              varchar(64)                            null comment '买家昵称',
    has_buyer_message       tinyint unsigned        default 0      null comment '是否有买家留言（字典：ec_oms_yes_no）@1-是，0-否',
    buyer_message           varchar(1024)                          null comment '买家留言内容',
    seller_message          varchar(1024)           default ''     null comment '卖家留言',
    receiver_name           varchar(32)             default ''     not null comment '收货人姓名',
    receiver_name_cipher    varchar(152)                           null comment '收货人姓名',
    receiver_mobile         varchar(20)                            null comment '收货人手机',
    receiver_mobile_cipher  varchar(88)                            null comment '收货人手机',
    receiver_phone          varchar(32)                            null comment '收货人固定电话',
    receiver_phone_cipher   varchar(152)                           null comment '收货人固定电话',
    province                varchar(32)                            null comment '收货人省份',
    city                    varchar(32)                            null comment '收货人城市',
    district                varchar(32)                            null comment '收货人区县',
    town                    varchar(32)                            null comment '收货人城镇',
    village                 varchar(32)                            null comment '社区/村',
    address                 varchar(255)                           null comment '收货人详细地址',
    address_cipher          varchar(1024)                          null comment '收货人详细地址',
    product_code            bigint unsigned                        null comment '产品编号',
    shop_pro_name           varchar(255)                           null comment '商品名',
    buy_num                 int unsigned                           null comment '购买数量',
    is_present              tinyint unsigned        default 0      null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    payment_type            tinyint unsigned        default 1      not null comment '支付方式 （字典：ec_oms_payment_type）1-在线支付 2-货到付款 3-信用额支付4-临时收款单支付''             支付方式 （字典：ec_oms_payment_type）1-在线支付 2-货到付款 3-信用额支付4-临时收款单支付',
    pro_one_price           decimal(14, 4) unsigned                null comment '产品报价',
    pro_shop_discount_amt   decimal(14, 4) unsigned default 0.0000 not null comment '店铺承担产品优惠金额',
    pro_plat_discount_amt   decimal(14, 4) unsigned default 0.0000 not null comment '平台承担产品优惠金额',
    order_shop_discount_amt decimal(14, 4) unsigned default 0.0000 not null comment '店铺承担订单优惠',
    order_plat_discount_amt decimal(14, 4)          default 0.0000 not null comment '平台承担订单优惠',
    order_all_shipment      decimal(14, 4) unsigned default 0.0000 not null comment '订单总邮费',
    remark                  varchar(500)                           null comment '客服备注/对应订单的卖家留言',
    plat_start_time         timestamp                              null comment '订单创建时间',
    pay_time                timestamp                              null comment '订单支付时间',
    order_import_time       timestamp                              null comment '订单导入时间',
    sale_channel            varchar(30)                            null comment '终端客户/分销平台(记录订单最终销售渠道)',
    sort                    smallint(4) unsigned    default 0      not null comment '排序编码',
    apply_file_code         varchar(64)                            null comment '申请文件编码',
    distri_channel_code     varchar(10)                            null comment '分销渠道编号，关联oms_b2b_client_distri_channel.distri_channel_code',
    client_storehouse_code  varchar(10)                            null comment '仓库编号',
    merchant_received_amt   decimal(14, 2)          default 0.00   null comment '商家实收金额',
    is_original_receive     tinyint unsigned        default 0      not null comment '是否使用原单收货信息（ec_oms_yes） 1-是 0-否',
    recommend_code          bigint(11) unsigned                    null comment '推荐码',
    recommend_user_code     int(9) unsigned                        null comment '推荐人编号',
    recommend_name          varchar(5)                             null comment '推荐人姓名'
)
    comment '订单导入临时表';

create index idx_order_import_code
    on ec_oms_order_import (import_code);

create table ec_oms_order_message_inspection
(
    order_code                    decimal(30) unsigned                       not null comment 'EC订单编号'
        primary key,
    message_intentions            varchar(16)                                null comment '留言意图(多个以'',''隔开)（字典：ec_oms_message_intentions）@1-指定快递2-指定配送方式3-发货时间要求4-发票5-包装和质量要求6-其他',
    algorithm_message_intentions  varchar(16)                                null comment '算法识别留言意图(多个以'',''隔开)（字典：ec_oms_message_intentions）@1-指定快递2-指定配送方式3-发货时间要求4-发票5-包装和质量要求6-其他',
    algorithm_expect_delivery     varchar(255)                               null comment '算法识别期望快递',
    algorithm_not_expect_delivery varchar(255)                               null comment '算法识别不期望快递',
    expect_delivery               varchar(255)                               null comment '期望快递',
    not_expect_delivery           varchar(255)                               null comment '不期望快递',
    storehouse_code               int unsigned                               null comment '仓库编码（识别匹配结果）',
    storehouse_name               varchar(32)                                null comment '仓库名称（识别匹配结果）',
    express_code                  int unsigned                               null comment '快递公司编码（识别匹配结果）',
    express_name                  varchar(32)                                null comment '快递公司名称（识别匹配结果）',
    expect_result                 tinyint unsigned default 0                 not null comment '预期指定结果（字典：ec_oms_expect_result）@1-自动匹配指定成功，2-自动跨仓指定成功，3-人工指定成功，4-指定失败',
    quality_status                tinyint unsigned default 0                 not null comment '质检状态（字典：ec_oms_quality_status）@1-已检查，0-未检查',
    is_corrected                  tinyint unsigned default 0                 not null comment '是否修正（字典：ec_oms_yes_no）@1-是，0-否',
    plat_start_time               timestamp                                  not null comment '外部平台订单创建时间（冗余order_status.plat_start_time）',
    corrector_id                  int unsigned                               null comment '修正人编号',
    corrector_name                varchar(32)                                null comment '修正人',
    corrector_time                timestamp                                  null comment '修正时间',
    quality_id                    int unsigned                               null comment '质检人编号',
    quality_name                  varchar(32)                                null comment '质检人',
    quality_time                  timestamp                                  null comment '质检时间',
    send_sms_status               tinyint          default 99                not null comment '短信发送状态（字典：ec_oms_send_sms_status）@99-未发送，@1-发送成功，0-发送失败',
    send_sms_time                 timestamp                                  null comment '短信发送时间',
    send_sms_fail_resaon          varchar(200)                               null comment '短信发送失败原因',
    create_time                   timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time              timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '订单留言识别质检';

create index idx_corrector_time
    on ec_oms_order_message_inspection (corrector_time);

create index idx_plat_stime
    on ec_oms_order_message_inspection (plat_start_time);

create index idx_quality_time
    on ec_oms_order_message_inspection (quality_time);

create table ec_oms_order_oper_log
(
    id             bigint unsigned auto_increment comment 'id'
        primary key,
    oper_user_id   int unsigned                               null comment '操作人ID',
    oper_user_name varchar(32)                                null comment '操作人姓名',
    oper_time      timestamp        default CURRENT_TIMESTAMP null comment '操作时间',
    oper_type      smallint unsigned                          null comment '操作类型（字典：ec_oms_oper_type）',
    oper_content   varchar(512)                               null comment '操作内容',
    order_code     decimal(30)                                null comment '记录的ID（EC订单编号）',
    is_exc         tinyint unsigned default 0                 null comment '是否是异常捕获的日志@1-是0-否'
)
    comment '订单操作日志记录表';

create index idx_log_order_code
    on ec_oms_order_oper_log (order_code)
    comment 'EC订单编号索引';

create index idx_oper_time
    on ec_oms_order_oper_log (oper_time);

create table ec_oms_order_oper_log_test
(
    id             bigint unsigned auto_increment comment 'id'
        primary key,
    oper_user_id   int unsigned                               null comment '操作人ID',
    oper_user_name varchar(32)                                null comment '操作人姓名',
    oper_time      timestamp        default CURRENT_TIMESTAMP null comment '操作时间',
    oper_type      smallint unsigned                          null comment '操作类型（字典：ec_oms_oper_type）',
    oper_content   varchar(512)                               null comment '操作内容',
    order_code     decimal(30)                                null comment '记录的ID（EC订单编号）',
    is_exc         tinyint unsigned default 0                 null comment '是否是异常捕获的日志@1-是0-否'
);

create table ec_oms_order_oper_log_tmp
(
    id             bigint unsigned auto_increment comment 'id'
        primary key,
    oper_user_id   int unsigned                               null comment '操作人ID',
    oper_user_name varchar(32)                                null comment '操作人姓名',
    oper_time      timestamp        default CURRENT_TIMESTAMP null comment '操作时间',
    oper_type      smallint unsigned                          null comment '操作类型（字典：ec_oms_oper_type）',
    oper_content   varchar(512)                               null comment '操作内容',
    order_code     decimal(30)                                null comment '记录的ID（EC订单编号）',
    is_exc         tinyint unsigned default 0                 null comment '是否是异常捕获的日志@1-是0-否'
)
    comment '订单操作日志记录表';

create index idx_log_order_code
    on ec_oms_order_oper_log_tmp (order_code)
    comment 'EC订单编号索引';

create index idx_oper_time
    on ec_oms_order_oper_log_tmp (oper_time);

create table ec_oms_order_original_product_detail
(
    id                        int unsigned auto_increment comment '主键Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_code                 int(11) unsigned                           null comment '平台来源',
    shop_order_id             varchar(64)                                null comment '外部平台订单编号',
    product_code              bigint unsigned                            null comment '产品编号',
    shop_pro_name             varchar(255)                               null comment '商品名',
    buy_num                   int unsigned                               null comment '购买数量',
    gross_weight              decimal(10, 3)   default 0.000             null comment '商品总毛重(kg)',
    pro_type                  tinyint unsigned                           null comment '产品类型（1-单品、2-套餐，3-虚拟商品）',
    outter_id                 varchar(64)                                null comment '商品编号ID',
    is_present                tinyint unsigned default 0                 null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '产品报价',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '报价金额',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '店铺承担产品优惠金额',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment '平台承担产品优惠金额',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '产品实付金额',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '店铺承担订单优惠【分摊】',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment '平台承担订单优惠【分摊】',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '店铺优惠',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment '平台优惠',
    shipment                  decimal(12, 2)   default 0.00              not null comment '运费',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '统一订单原始产品明细表（转品前）';

create index idx_luptime
    on ec_oms_order_original_product_detail (last_update_time);

create index idx_original_pro_order_code
    on ec_oms_order_original_product_detail (order_code);

create table ec_oms_order_original_product_detail_tmp
(
    id                        int unsigned auto_increment comment '主键Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_code                 int(11) unsigned                           null comment '平台来源',
    shop_order_id             varchar(64)                                null comment '外部平台订单编号',
    product_code              bigint unsigned                            null comment '产品编号',
    shop_pro_name             varchar(255)                               null comment '商品名',
    buy_num                   int unsigned                               null comment '购买数量',
    gross_weight              decimal(10, 2)   default 0.00              null comment '商品总毛重(kg)',
    pro_type                  tinyint unsigned                           null comment '产品类型（1-单品、2-套餐，3-虚拟商品）',
    outter_id                 varchar(64)                                null comment '商品编号ID',
    is_present                tinyint unsigned default 0                 null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '产品报价',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '报价金额',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '店铺承担产品优惠金额',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment '平台承担产品优惠金额',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '产品实付金额',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '店铺承担订单优惠【分摊】',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment '平台承担订单优惠【分摊】',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '店铺优惠',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment '平台优惠',
    shipment                  decimal(12, 2)   default 0.00              not null comment '运费',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '统一订单原始产品明细表（转品前）';

create index idx_luptime
    on ec_oms_order_original_product_detail_tmp (last_update_time);

create index idx_original_pro_order_code
    on ec_oms_order_original_product_detail_tmp (order_code);

create table ec_oms_order_pinduoduo_product_details
(
    id               int unsigned auto_increment comment '主键Id'
        primary key,
    shop_order_id    varchar(64)                         not null comment '拼多多店铺订单编号',
    shop_code        int unsigned                        not null comment '店铺编号',
    goods_id         bigint                              null comment '商品编号',
    sku_id           bigint                              null comment '商品规格编码',
    outer_id         varchar(20)                         null comment '商家外部编码(sku)',
    outer_goods_id   varchar(20)                         null comment '商家外部编码(商品)',
    goods_name       varchar(255)                        null comment '商品名称',
    goods_price      decimal(14, 4)                      null comment '商品销售价格',
    goods_spec       varchar(20)                         null comment '商品规格',
    goods_count      int(10)                             null comment '商品数量',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '拼多多订单产品明细列表';

create index idx_shop_order_id
    on ec_oms_order_pinduoduo_product_details (shop_order_id);

create table ec_oms_order_presale_strategy
(
    id                   int unsigned auto_increment comment 'id'
        primary key,
    strategy_code        bigint unsigned                            null comment '策略编号',
    strategy_name        varchar(64)                                null comment '策略名称',
    time_type            int unsigned                               null comment '策略时间类型,0付款时间',
    begin_time           timestamp        default CURRENT_TIMESTAMP null comment '开始时间',
    end_time             timestamp        default CURRENT_TIMESTAMP null comment '结束时间',
    strategy_action      tinyint(3)       default 0                 null comment '策略动作（字典 ec_oms_presale_strategy_action）0-整单自动挂起 1-自动拆预售品挂起',
    is_auto_relieve_hand tinyint unsigned                           not null comment '是否自动解挂',
    relieve_hand_time    timestamp                                  null comment '解挂时间',
    is_all_product       tinyint unsigned                           not null comment '是否所有商品（b2c 2.5版本已弃用）',
    buyer_range          tinyint(3)       default 0                 null comment '买家范围（字典ec_oms_retention_product_buyer_range） 0-全部 1-指定部分买家',
    product_type         tinyint(3)       default 0                 null comment '指定商品类型（字典ec_oms_presale_product_type） 0-预售商品 1-非预售商品',
    operator_id          int                                        null comment '操作人编号',
    operator_name        varchar(32)                                null comment '操作人名称',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    constraint idx_strategy_code
        unique (strategy_code) comment '策略编号索引'
)
    comment '订单预售策略表';

create index idx_begin_time
    on ec_oms_order_presale_strategy (begin_time)
    comment '策略开始时间索引';

create index idx_end_time
    on ec_oms_order_presale_strategy (end_time)
    comment '结束时间索引';

create index idx_strategy_name
    on ec_oms_order_presale_strategy (strategy_name)
    comment '策略名称索引';

create table ec_oms_order_presale_strategy_buyer_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '所属策略编号',
    buyer_id         varchar(64)                                null comment '指定买家ID',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '预售策略买家信息表';

create index idx_strategy_code
    on ec_oms_order_presale_strategy_buyer_sub (strategy_code, buyer_id);

create table ec_oms_order_presale_strategy_detail
(
    order_code                 decimal(30) unsigned                       not null comment '订单编号'
        primary key,
    strategy_code              bigint unsigned                            null comment '策略编号',
    is_auto_relieve_hand       tinyint unsigned                           null comment '是否自动解挂',
    relieve_hand_time          timestamp                                  null comment '解挂时间',
    handle_relieve_hand_status tinyint unsigned default 0                 null comment '是否处理自动解挂状态',
    plat_start_time            timestamp                                  null comment '外部平台订单创建时间',
    pay_time                   timestamp                                  null comment '订单支付时间',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后处理时间',
    operator_id                int(10)                                    null comment '操作人ID',
    operator_name              varchar(32)                                null comment '操作人姓名'
)
    comment '订单预售策略表详情表';

create index idx_pay_time
    on ec_oms_order_presale_strategy_detail (pay_time);

create index idx_plat_start_time
    on ec_oms_order_presale_strategy_detail (plat_start_time);

create index idx_rtime_ishand_hanstus
    on ec_oms_order_presale_strategy_detail (relieve_hand_time, is_auto_relieve_hand, handle_relieve_hand_status);

create index idx_strategy_code
    on ec_oms_order_presale_strategy_detail (strategy_code);

create table ec_oms_order_presale_strategy_product_sub
(
    id               int unsigned auto_increment comment '唯一标识'
        primary key,
    strategy_code    bigint unsigned                            null comment '所属策略编号',
    product_code     bigint unsigned                            null comment '商品编号',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单预售策略商品信息表';

create index idx_strategy_code
    on ec_oms_order_presale_strategy_product_sub (strategy_code)
    comment '策略编号索引';

create table ec_oms_order_presale_strategy_shop_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint unsigned                            null comment '所属策略编号',
    shop_code        int(30) unsigned                           null comment '店铺编号',
    shop_name        varchar(64)                                null comment '店铺名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '预售品策略店铺信息表';

create index idx_shop_code
    on ec_oms_order_presale_strategy_shop_sub (shop_code);

create index idx_strategy_code
    on ec_oms_order_presale_strategy_shop_sub (strategy_code);

create table ec_oms_order_present_record
(
    id                   int unsigned auto_increment comment '主键ID'
        primary key,
    plan_code            bigint                                     not null comment '策略编码',
    order_code           decimal(30)                                not null comment 'EC订单编号',
    target_product_code  bigint unsigned                            null comment '目标产品编码',
    present_product_code bigint unsigned                            not null comment '赠品产品编号',
    present_product_num  int unsigned                               not null comment '赠品产品数量',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '平台订单赠品记录表';

create index idx_plan_code
    on ec_oms_order_present_record (plan_code);

create table ec_oms_order_product_detail
(
    id                        int unsigned auto_increment comment '主键Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC订单编号',
    product_code              bigint unsigned                            null comment '产品编号',
    shop_pro_name             varchar(255)                               null comment '商品名',
    buy_num                   int unsigned                               null comment '购买数量',
    actual_num                int unsigned     default 0                 null comment '实际需发货数量',
    gross_weight              decimal(10, 3)   default 0.000             null comment '商品总毛重(kg)',
    pro_type                  tinyint unsigned                           null comment '产品类型（1-单品、2-套餐，3-虚拟商品）',
    outter_id                 varchar(64)                                null comment '商品编号ID',
    add_present_type          tinyint unsigned                           null comment '添加赠品的方式@1-自动、2-手动、3-导入',
    is_present                tinyint unsigned default 0                 null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    is_convert                tinyint unsigned default 0                 null comment '是否转品（字典：ec_oms_yes_no）@1-是，0-否',
    original_id               int unsigned                               null comment '转品前产品记录ID',
    original_product_code     bigint                                     null comment '源产品编号，如果是转品，则存转品前的product_code,如果没转品则填入product_code',
    sys_price                 decimal(12, 4)   default 0.0000            not null comment 'oms-b2b 系统标价',
    price_logic               tinyint unsigned default 0                 not null comment 'b2b价格取值逻辑 @0-无1-特殊价格策略2-产品的等级价格3-销售等级默认折扣率计算的价格(弃用)4-零售价(弃用)5-分销约定价6-等级重量价',
    is_price_structure        tinyint unsigned default 0                 null comment '抓单2b产品价格体系是否配置 1-配置  0-没配置',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '产品报价',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '报价金额',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '店铺承担产品优惠金额',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment '平台承担产品优惠金额',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '产品实付金额',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '店铺承担订单优惠【分摊】',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment '平台承担订单优惠【分摊】',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '店铺优惠',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment '平台优惠',
    shipment                  decimal(12, 2)   default 0.00              not null comment '运费',
    pro_pay_type              tinyint unsigned default 0                 not null comment '商品支付类型 @0-其它，1-可抵扣金额支付',
    batch_scope_text          varchar(25)      default ''                not null comment '批次范围文本',
    last_update_time          timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '统一订单产品明细表';

create index idx_luptime
    on ec_oms_order_product_detail (last_update_time);

create index idx_order_code
    on ec_oms_order_product_detail (order_code);

create table ec_oms_order_product_detail_tmp
(
    id                        int unsigned auto_increment comment '主键Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC订单编号',
    product_code              bigint unsigned                            null comment '产品编号',
    shop_pro_name             varchar(255)                               null comment '商品名',
    buy_num                   int unsigned                               null comment '购买数量',
    actual_num                int unsigned     default 0                 null comment '实际需发货数量',
    gross_weight              decimal(10, 2)   default 0.00              null comment '商品总毛重(kg)',
    pro_type                  tinyint unsigned                           null comment '产品类型（1-单品、2-套餐，3-虚拟商品）',
    outter_id                 varchar(64)                                null comment '商品编号ID',
    add_present_type          tinyint unsigned                           null comment '添加赠品的方式@1-自动、2-手动、3-导入',
    is_present                tinyint unsigned default 0                 null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    is_convert                tinyint unsigned default 0                 null comment '是否转品（字典：ec_oms_yes_no）@1-是，0-否',
    original_id               int unsigned                               null comment '转品前产品记录ID',
    original_product_code     bigint                                     null comment '源产品编号，如果是转品，则存转品前的product_code,如果没转品则填入product_code',
    sys_price                 decimal(12, 4)   default 0.0000            not null comment 'oms-b2b 系统标价',
    price_logic               tinyint unsigned default 0                 not null comment 'b2b价格取值逻辑 @0-无1-特殊价格策略2-产品的等级价格3-销售等级默认折扣率计算的价格(弃用)4-零售价(弃用)5-分销约定价6-等级重量价',
    is_price_structure        tinyint unsigned default 0                 null comment '抓单2b产品价格体系是否配置 1-配置  0-没配置',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '产品报价',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '报价金额',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '店铺承担产品优惠金额',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment '平台承担产品优惠金额',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '产品实付金额',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '店铺承担订单优惠【分摊】',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment '平台承担订单优惠【分摊】',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '店铺优惠',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment '平台优惠',
    shipment                  decimal(12, 2)   default 0.00              not null comment '运费',
    pro_pay_type              tinyint unsigned default 0                 not null comment '商品支付类型 @0-其它，1-可抵扣金额支付',
    batch_scope_text          varchar(25)      default ''                not null comment '批次范围文本',
    last_update_time          timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '统一订单产品明细表';

create index idx_luptime
    on ec_oms_order_product_detail_tmp (last_update_time);

create index idx_order_code
    on ec_oms_order_product_detail_tmp (order_code);

create table ec_oms_order_product_recovery
(
    id               int unsigned auto_increment comment '主键Id'
        primary key,
    exc_order_code   decimal(30) unsigned                       not null comment '售后单对应的EC订单编号',
    order_code       decimal(30) unsigned                       not null comment 'EC订单编号',
    order_product_id int unsigned                               not null comment '订单商品明细ID',
    product_code     bigint unsigned                            null comment '产品编号',
    product_name     varchar(255)                               null comment '商品名',
    recovery_num     int(10)                                    null comment '恢复发货数量',
    is_present       tinyint unsigned default 0                 null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    pro_one_price    decimal(14, 4)   default 0.0000            not null comment '产品报价',
    pro_all_price    decimal(14, 4)   default 0.0000            not null comment '报价金额',
    creator_id       int unsigned                               null comment '创建人编号（恢复人）',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    order_status     tinyint unsigned                           not null comment '订单状态（字典：ec_oms_order_status）0-待创建、1-待提交、2已删除、3待财审、4已取消、5待审单、6部分待审单、7待退回调度、8部分待退回调度、9待调度、10部分待调度、11待发货、12部分待发货、13发货中、14部分发货中、15已发货、16部分已发货、17已签收、18部分已签收、19交易成功、20部分交易成功、99不处理',
    shop_order_id    varchar(64)                                not null comment '店铺订单编号，若为合单则置为EC订单编号(order_code)'
)
    comment '统一订单产品恢复记录表';

create index idx_pro_recovery_exc_order_code
    on ec_oms_order_product_recovery (exc_order_code);

create table ec_oms_order_risk_batch
(
    risk_batch          bigint unsigned                            not null comment '风险批次'
        primary key,
    risk_reason         varchar(255)                               null comment '风险原因',
    need_persuade       tinyint(3)       default 0                 null comment '是否需要劝退，（字典 ec_oms_yes_no）1-是，0-否',
    risk_voucher        varchar(512)                               null comment '风险凭证',
    risk_voucher2       varchar(512)                               null comment '风险凭证2',
    risk_voucher3       varchar(512)                               null comment '风险凭证3',
    is_audit_regist     tinyint unsigned default 0                 not null comment '是否审批登记 （字典：ec_oms_yes_no）@0-否 1-是',
    audit_voucher       varchar(512)                               null comment '审批凭证',
    audit_voucher2      varchar(512)                               null comment '审批凭证2',
    audit_voucher3      varchar(512)                               null comment '审批凭证3',
    audit_creator_id    int(10)                                    null comment '审批创建人编号',
    audit_creator_name  varchar(32)                                null comment '审批创建人名称',
    audit_create_time   timestamp                                  null comment '审批创建时间',
    audit_operator_id   int(10)                                    null comment '审批操作人编号',
    audit_operator_name varchar(32)                                null comment '审批操作人名称',
    audit_operator_time timestamp                                  null comment '审批更新时间',
    creator_id          int unsigned                               null comment '创建人编号',
    creator_name        varchar(32)                                null comment '创建人名称',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id         int unsigned                               null comment '操作人编号',
    operator_name       varchar(32)                                null comment '操作人名称',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag            tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单风控批次表';

create table ec_oms_order_risk_control
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_code        int unsigned                               null comment '店铺来源编号',
    risk_code        int unsigned                               not null comment '风险编号',
    risk_tips        tinyint unsigned                           not null comment '风险提示（ec_oms_risk_tips）',
    risk_action      tinyint unsigned default 0                 not null comment '有风险系统动作（ec_oms_risk_action）0-无，1-自动取消订单，2-自动挂起，3-自动审单',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '订单风控关系表';

create index idx_ocode_rti
    on ec_oms_order_risk_control (order_code, risk_tips);

create index idx_risk_code
    on ec_oms_order_risk_control (risk_code);

create index idx_risk_tips
    on ec_oms_order_risk_control (risk_tips);

create index idx_scode_rti_ocode
    on ec_oms_order_risk_control (shop_code, risk_tips, order_code);

create table ec_oms_order_risk_control_tmp
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC订单编号',
    risk_code        int unsigned                               not null comment '风险编号',
    risk_tips        tinyint unsigned                           not null comment '风险提示（ec_oms_risk_tips）',
    risk_action      tinyint unsigned default 0                 not null comment '有风险系统动作（ec_oms_risk_action）0-无，1-自动取消订单，2-自动挂起，3-自动审单',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '订单风控关系表';

create index idx_ocode_rti
    on ec_oms_order_risk_control_tmp (order_code, risk_tips);

create index idx_risk_tips
    on ec_oms_order_risk_control_tmp (risk_tips);

create table ec_oms_order_send_delivery_wechat_subscription_log
(
    id                   int unsigned auto_increment comment '主键ID'
        primary key,
    order_code           decimal(30)                         not null comment '订单编号,主键',
    shop_order_id        varchar(64)                         not null comment '店铺订单号',
    logistics_order_code decimal(30)                         not null comment '物流发货单号',
    response_msg         varchar(255)                        null comment '请求接口返回描述',
    create_time          timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '微信公众号发货通知记录表';

create table ec_oms_order_service_order_reply_relation
(
    reply_id    int unsigned    not null comment '回复记录id'
        primary key,
    relate_id   bigint unsigned not null comment '客户服务单的id或问题补充的id',
    relate_type tinyint         not null comment '关联类型 1-服务单 2-问题补充'
)
    comment '客户服务单与回复记录关联表';

create table ec_oms_order_status
(
    order_code                 decimal(30) unsigned                         not null comment 'EC订单编号'
        primary key,
    order_type                 tinyint unsigned   default 1                 not null comment '订单类型（字典：ec_oms_order_type）@1-正常订单、2-补发订单、3-导入订单',
    business_type              tinyint unsigned   default 1                 not null comment '业务类型（字典：ec_oms_business_type）@1-普通订单，2-销售订单，3-分销订单，4-临时销售订单',
    order_status               tinyint unsigned                             not null comment '订单状态（字典：ec_oms_order_status）0-待创建、1-待提交、2已删除、22待运营审核、3待财审、4已取消、21待风控、5待审单、6部分待审单、7待退回调度、8部分待退回调度、9待调度、10部分待调度、11待发货、12部分待发货、13发货中、14部分发货中、15已发货、16部分已发货、17已签收、18部分已签收、19交易成功、20部分交易成功、99不处理',
    place_order_status         tinyint unsigned   default 1                 not null comment '下单状态（字典：out_ec_place_order_status）0-待确认，1-已下单，2-退回待确认',
    is_outec                   tinyint unsigned   default 0                 not null comment '是否外部EC订单（字典：ec_oms_yes_no）@1-是 0-否',
    handle_type                tinyint unsigned   default 1                 not null comment '拆合类型（字典：ec_oms_handle_type）（1-原始单、2-子单、3-合单）',
    split_type                 tinyint unsigned   default 0                 not null comment '拆单方式（字典：ec_oms_split_type）（0:未拆分，1：套餐拆分，2：SAP拆分）',
    sap_split_type             tinyint unsigned   default 0                 not null comment 'SAP拆分订单类型 （字典：ec_oms_sap_split_type）@ 0-默认类型  1-整件子单  2-零件子单  3-赠品子单',
    hang_status                tinyint unsigned   default 0                 not null comment '挂起状态(字典：hang_status)（1-已挂起、0-未挂起）主要针对客服等操作人员运行的状态',
    hang_up_type               varchar(8)                                   null comment '挂起类型 多个挂起类型时用“,”隔开 0-区域挂起 1-预售挂起  2-人工挂起 3-风险挂起（字典:ec_oms_hang_up_type）',
    is_valid                   tinyint unsigned   default 1                 not null comment '是否有效（字典：ec_oms_yes_no）@1-是 0-否，主要针对程序运行的状态',
    is_exc                     tinyint unsigned   default 0                 not null comment '是否异常（字典：ec_oms_yes_no）@1-是 0-否',
    is_bigorder                tinyint unsigned   default 0                 not null comment '是否大订单（字典：ec_oms_yes_no）@1-是 0-否',
    is_beyond_area             tinyint unsigned   default 0                 not null comment '是否超区 （字典：ec_oms_yes_no）@1-是 0-否',
    product_convert_status     tinyint unsigned   default 0                 not null comment '是否应用转品策略的订单（字典：ec_oms_yes_no）@1-是 0-否',
    auto_add_present_status    tinyint unsigned   default 0                 not null comment '自动添加赠品状态（字典：ec_oms_yes_no）@1-是 0-否',
    is_auto_examine_adopt      tinyint unsigned   default 0                 not null comment '是否执行自动财务审核功能 （字典：ec_oms_yes_no）@1-是 0-否',
    examine_adopt_status       tinyint unsigned   default 0                 null comment '财审状态（字典：ec_oms_examine_adopt_status） 0-待提交，1-已提交，2-审核通过，3-审核不通过',
    auto_examine_adopt_reason  tinyint unsigned                             null comment '自动财审不通过原因 （字典：ec_oms_auto_examine_adopt_reason） 0-赠品不足  1-信用额度不足  2-客户无效  3-无操作权限',
    examine_adopt_time         timestamp                                    null comment '订单财审时间',
    import_commit_order_time   timestamp                                    null comment '导入订单提交时间',
    verify_status              tinyint unsigned   default 1                 not null comment '审单状态（字典：ec_oms_verify_status）（ 0-已取消,1-待审单,2-已审单）',
    verify_time                timestamp                                    null comment '订单审核时间',
    is_same_receipt_batch      tinyint unsigned   default 0                 not null comment '是否同批收款（字典：ec_oms_yes_no）@1-是 0-否',
    receipt_batch_no           bigint unsigned                              null comment '收款批次编号 时间戳+5位编号',
    temporary_receipt_no       bigint unsigned                              null comment '临时收款单编号 时间戳+5位编号',
    add_receipt_batch_time     timestamp                                    null comment '添加同批收款单时间',
    add_temporary_receipt_time timestamp                                    null comment '添加临时收款单时间',
    payment_type               tinyint unsigned   default 1                 not null comment '支付方式 （字典：ec_oms_payment_type）1-在线支付 2-货到付款 3-信用额支付4-临时收款单支付''             支付方式 （字典：ec_oms_payment_type）1-在线支付 2-货到付款 3-信用额支付4-临时收款单支付',
    payment_status             tinyint unsigned   default 0                 not null comment '支付状态 （字典：ec_oms_payment_status） 1-已支付  0--未支付',
    pay_time                   timestamp                                    null comment '订单支付时间',
    plat_start_time            timestamp                                    not null comment '外部平台订单创建时间',
    plat_end_time              timestamp                                    null comment '外部平台订单结束时间',
    plat_update_time           timestamp                                    null comment '外部平台订单修改时间',
    plat_delivery_time         timestamp                                    null comment '外部平台订单发货时间',
    send_sms_status            tinyint unsigned   default 99                not null comment '短信发送状态（字典：ec_oms_send_sms_status）@1-成功，0-失败 ,99-未发送',
    send_sms_time              timestamp                                    null comment '短信发送时间',
    send_sms_fail_resaon       varchar(200)                                 null comment '短信发送失败原因',
    is_return_order            tinyint unsigned   default 0                 not null comment '是否是退回订单（字典：ec_oms_yes_no）@1-是 0-否',
    is_price_structure         tinyint unsigned                             null comment '抓单2b产品价格体系是否配置 1-配置  0-没配置',
    is_risk                    tinyint(3)         default 4                 null comment '是否有风险（ec_oms_is_risk）0-否 1-是 2-待人工识别 3-算法识别无风险 4-待算法识别',
    risk_tips                  tinyint unsigned                             null comment '风险提示（ec_oms_risk_tips）',
    risk_batch                 bigint unsigned                              null comment '风险批次',
    risk_control               tinyint(3)         default 0                 null comment '风控状态（ec_oms_risk_control）0-待算法识别 1-算法识别无风险 2-待人工识别 3-识别待登记 4-已识别并登记',
    is_presale_order           tinyint(3)         default 0                 not null comment '是否为预售单（字典：ec_oms_yes_no）@1-是 0-否',
    order_sign                 tinyint unsigned   default 0                 not null comment '订单标记（字典ec_oms_order_sign） 0-无，1-直播订单，2-大促活动',
    delivery_limitation        mediumint unsigned default 0                 not null comment '发货时效(回传快递单号)，单位小时',
    logistics_collection       mediumint unsigned default 0                 not null comment '发货时效(物流揽收)，单位小时',
    is_original_receive        tinyint unsigned   default 0                 not null comment '是否使用原单收货信息（ec_oms_yes） 1-是 0-否',
    last_update_time           timestamp          default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '统一订单业务状态表';

create index idx_examine_adopt_time
    on ec_oms_order_status (examine_adopt_time);

create index idx_last_up_t
    on ec_oms_order_status (last_update_time);

create index idx_ost_isv_ise_hst_oty
    on ec_oms_order_status (order_status, hang_status, is_valid, is_exc, order_type);

create index idx_pay_time_rtips
    on ec_oms_order_status (pay_time, risk_tips)
    comment '订单风控管理查询索引';

create index idx_plat_delivery_time
    on ec_oms_order_status (plat_delivery_time);

create index idx_plat_end_time
    on ec_oms_order_status (plat_end_time);

create index idx_plat_st_t
    on ec_oms_order_status (plat_start_time);

create index idx_risk_batch
    on ec_oms_order_status (risk_batch);

create index idx_verify_time
    on ec_oms_order_status (verify_time);

create table ec_oms_order_strategy_scapling
(
    strategy_code        varchar(32)                not null comment '策略编号'
        primary key,
    strategy_name        varchar(64)                null comment '策略名称',
    strategy_start_time  timestamp                  null comment '策略开始时间',
    strategy_end_time    timestamp                  null comment '策略结束时间',
    strategy_type        varchar(10)                null comment '黄牛判断逻辑 订单-1 商品-2',
    min_value_order      int(10)                    null comment '订单最小阈值',
    middle_value_order   int(10)                    null comment '订单中间阈值',
    max_value_order      int(10)                    null comment '订单最大阈值',
    min_value_product    int(10)                    null comment '商品最小阈值',
    middle_value_product int(10)                    null comment '商品中间阈值',
    max_value_product    int(10)                    null comment '商品最大阈值',
    channel_codes        varchar(1024)              null comment '渠道编号',
    shop_codes           varchar(1024)              null comment '店铺编号',
    product_codes        varchar(1024)              null comment '商品编号',
    creator_id           int(10)                    null comment '创建人编号',
    creator_name         varchar(32)                null comment '创建人名称',
    create_time          timestamp                  null comment '创建时间',
    operator_id          int(10)                    null comment '操作人编号',
    operator_name        varchar(32)                null comment '操作人名称',
    last_update_time     timestamp                  null comment '最后更新时间',
    del_flag             tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '黄牛订单策略管理';

create table ec_oms_order_tmall
(
    tid                    bigint unsigned            not null comment '天猫订单ID'
        primary key,
    status                 varchar(32)                null comment '天猫订单状态',
    type                   varchar(32)                null comment '天猫订单类型',
    seller_nick            varchar(32)                null comment '卖家昵称',
    buyer_nick             varchar(32)                null comment '买家昵称',
    created                timestamp                  null comment '创建时间',
    modified               timestamp                  null comment '更新时间',
    jdp_hashcode           varchar(64)                null comment '数据标志',
    jdp_response           mediumtext                 null comment '订单数据',
    jdp_created            timestamp                  null comment '数据库创建时间',
    jdp_modified           timestamp                  null comment '数据库修改时间',
    update_delivery_status tinyint unsigned default 0 null comment '回传物流状态 0-未回传 1-已回传'
)
    comment '天猫订单';

create index idx_jdbctime
    on ec_oms_order_tmall (jdp_created);

create index ind_jdp_tb_trade_jdp_modified
    on ec_oms_order_tmall (jdp_modified);

create index ind_jdp_tb_trade_modified
    on ec_oms_order_tmall (modified);

create index ind_jdp_tb_trade_seller_nick_jdp_modified
    on ec_oms_order_tmall (seller_nick, jdp_modified);

create index ind_jdp_tb_trade_seller_nick_modified
    on ec_oms_order_tmall (seller_nick, modified);

create table ec_oms_order_tmall_gongxiao
(
    fenxiao_id             bigint unsigned            not null comment '分销订单id'
        primary key,
    status                 varchar(64)                null comment '订单状态',
    tc_order_id            varchar(32)                null comment 'tcorderid',
    supplier_username      varchar(32)                null comment '供销商名称',
    distributor_username   varchar(32)                null comment '销售者名称',
    created                timestamp                  null comment '创建时间',
    modified               timestamp                  null comment '修改时间',
    jdp_hashcode           varchar(128)               null comment '数据标识',
    jdp_response           mediumtext                 null comment '订单数据',
    jdp_modified           timestamp                  null comment '订单同步修改时间',
    jdp_created            timestamp                  null comment '订单同步创建时间',
    update_delivery_status tinyint unsigned default 0 null comment '回传状态'
)
    comment '天猫供销抓单记录 仅做保存使用';

create index idx_tcoid
    on ec_oms_order_tmall_gongxiao (tc_order_id);

create index ind_jdp_fx_trade_jdp_modified
    on ec_oms_order_tmall_gongxiao (jdp_modified);

create index ind_jdp_fx_trade_modified
    on ec_oms_order_tmall_gongxiao (modified);

create index ind_jdp_fx_trade_supplier_username_jdp_modified
    on ec_oms_order_tmall_gongxiao (supplier_username, jdp_modified);

create index ind_jdp_fx_trade_supplier_username_modified
    on ec_oms_order_tmall_gongxiao (supplier_username, modified);

create table ec_oms_order_tmall_gongxiao_sub_purchase_order
(
    sub_fenxiao_id        bigint unsigned                     null comment '分销平台的父采购单主键',
    fenxiao_id            bigint                              not null comment '分销平台的子采购单主键'
        primary key,
    item_id               bigint                              null comment '分销平台上的产品id',
    item_outer_id         bigint                              null comment '分销平台上商品商家编码',
    convert_item_outer_id bigint(255) unsigned                null comment '转品后的产品编号;默认等于item_outer_id',
    auction_price         decimal(12, 4)                      null comment '分销商店铺中宝贝一口价',
    bill_fee              decimal(12, 4)                      null comment '发票应开金额',
    num                   int                                 null comment '产品的采购数量',
    buyer_payment         decimal(12, 4)                      null comment '买家支付给分销商的总金额',
    discount_fee          decimal(12, 4)                      null comment '优惠活动的折扣金额',
    distributor_payment   decimal(12, 4)                      null comment '分销商实付金额',
    total_fee             decimal(12, 4)                      null comment '采购单总额',
    created               timestamp                           null comment '采购单创建时间',
    price                 decimal(12, 4)                      null comment '产品的采购价格',
    promotion_type        tinyint                             null comment '优惠活动类型0=无优惠1=限时折',
    refund_fee            decimal(12, 4)                      null comment '退款金额',
    tc_discount_fee       decimal(12, 4)                      null comment '优惠金额',
    title                 varchar(200)                        null comment '采购的产品标题',
    last_update_time      timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '天猫供销子订单详细信息列表';

create index idx_luptime
    on ec_oms_order_tmall_gongxiao_sub_purchase_order (last_update_time);

create index idx_subord
    on ec_oms_order_tmall_gongxiao_sub_purchase_order (sub_fenxiao_id);

create table ec_oms_order_tmall_gongxiao_sub_purchase_order_tmp
(
    sub_fenxiao_id      bigint unsigned                     null comment '分销平台的父采购单主键',
    fenxiao_id          bigint                              not null comment '分销平台的子采购单主键'
        primary key,
    item_id             bigint                              null comment '分销平台上的产品id',
    item_outer_id       bigint                              null comment '分销平台上商品商家编码',
    auction_price       decimal(12, 4)                      null comment '分销商店铺中宝贝一口价',
    bill_fee            decimal(12, 4)                      null comment '发票应开金额',
    num                 int                                 null comment '产品的采购数量',
    buyer_payment       decimal(12, 4)                      null comment '买家支付给分销商的总金额',
    discount_fee        decimal(12, 4)                      null comment '优惠活动的折扣金额',
    distributor_payment decimal(12, 4)                      null comment '分销商实付金额',
    total_fee           decimal(12, 4)                      null comment '采购单总额',
    created             timestamp                           null comment '采购单创建时间',
    price               decimal(12, 4)                      null comment '产品的采购价格',
    promotion_type      tinyint                             null comment '优惠活动类型0=无优惠1=限时折',
    refund_fee          decimal(12, 4)                      null comment '退款金额',
    tc_discount_fee     decimal(12, 4)                      null comment '优惠金额',
    title               varchar(200)                        null comment '采购的产品标题',
    last_update_time    timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '天猫供销子订单详细信息列表';

create index idx_luptime
    on ec_oms_order_tmall_gongxiao_sub_purchase_order_tmp (last_update_time);

create index idx_subord
    on ec_oms_order_tmall_gongxiao_sub_purchase_order_tmp (sub_fenxiao_id);

create table ec_oms_order_tmall_product_detail
(
    tid                           bigint unsigned            not null comment '天猫平台订单编号',
    oid                           bigint unsigned            not null comment '子订单编号',
    outer_iid                     varchar(20)                null comment '商家外部编码',
    outer_sku_id                  varchar(20)                null comment '商家外部编码主要编码',
    num_iid                       bigint unsigned            null comment '商品数字ID',
    num                           int unsigned               null comment '购买数量',
    price                         decimal(10, 2)             null comment '商品价格。精确到2位小数',
    total_fee                     decimal(10, 2)             null comment '应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。',
    adjust_fee                    decimal(10, 2)             null comment '卖家手动调整金额',
    discount_fee                  decimal(10, 2)             null comment '子订单级订单优惠金额。',
    divide_order_fee              decimal(10, 2)             null comment '分摊之后的实付金额',
    part_mjz_discount             decimal(10, 2)             null comment '优惠分摊',
    payment                       decimal(10, 2)             null comment '子订单实付金额',
    update_delivery_status        tinyint unsigned default 0 null comment '回传物流状态 0-未回传 1-已回传',
    update_notice_delivery_status tinyint(2)       default 0 null comment '多包裹通知回传物流状态 0-未回传 1-已回传',
    primary key (tid, oid)
)
    comment '天猫订单产品明细';

create index idx_oid
    on ec_oms_order_tmall_product_detail (oid);

create table ec_oms_order_vitual_mobile_import
(
    id                    int(10) auto_increment comment '主键id'
        primary key,
    import_code           int(10)       null comment '标识上传订单的批次号',
    shop_order_id         varchar(64)   null comment '店铺订单编号',
    shop_code             varchar(64)   null comment '店铺编号',
    order_code            varchar(64)   null comment 'ec订单编号',
    import_operation_hint varchar(1024) null comment '导入订单失败原因',
    import_time           timestamp     null comment '导入时间'
)
    comment '虚拟号批量更新导入临时表';

create table ec_oms_order_waybill
(
    id                   int unsigned auto_increment comment '主键Id'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC订单编号',
    logistics_order_code decimal(30)                                not null comment '物流发货单号',
    external_order       varchar(32)                                null comment '外仓发货单号',
    waybill_code         varchar(2048)                              null comment '快递单号，多个用逗号隔开',
    send_status          tinyint unsigned default 2                 not null comment '发货状态 @1-调度失败 2-待调度 3-待发货 4-发货中 5-已发货 6-已签收7-退回中8-退回失败9-退回成功',
    send_channel         tinyint unsigned                           null comment '发货渠道',
    storehouse_code      int(10)                                    null comment '仓库编码',
    storehouse_name      varchar(32)                                null comment '仓库名称',
    express_code         int unsigned                               null comment '快递公司编码',
    express_name         varchar(32)                                null comment '快递公司名称',
    dispatch_type        tinyint unsigned                           null comment '调度类型（字典：ec_oms_dispatch_type）',
    dispatch_fail_reason varchar(256)                               null comment '调度失败原因',
    dispatch_time        timestamp                                  null comment '订单调度时间',
    dispatch_status      tinyint unsigned                           null comment '调度状态（字典：ec_oms_dispatch_status）@1-待调度2-调度中3-已调度4-调度失败',
    delivery_time        timestamp                                  null comment '订单发货时间',
    receipt_time         timestamp                                  null comment '订单签收时间',
    is_bigorder          tinyint unsigned default 0                 not null comment '是否大订单（字典：ec_oms_yes_no）@1-是 0-否',
    gross_weight         decimal(10, 3)   default 0.000             null comment '毛重(kg)',
    update_plat_status   tinyint unsigned default 0                 not null comment '回传到旗舰店状态（字典：ec_oms_update_plat_status）@0-未回传1-回传成功2-回传失败  3 继续回传',
    return_status        tinyint unsigned default 0                 null comment '退回调度状态（字典：ec_oms_return_status）@0-未退回调度1-退回调度中2-退回调度成功3-退回调度失败9-退回调度出错',
    is_valid             tinyint unsigned default 1                 not null comment '是否有效（字典：ec_oms_is_valid）@0-无效、1-有效',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '统一订单发货单明细';

create index idx_delivery_time
    on ec_oms_order_waybill (delivery_time);

create index idx_external_order
    on ec_oms_order_waybill (external_order);

create index idx_logistics_order_code
    on ec_oms_order_waybill (logistics_order_code);

create index idx_luptime
    on ec_oms_order_waybill (last_update_time);

create index idx_mul_1111
    on ec_oms_order_waybill (del_flag, is_valid, delivery_time, send_status, express_code, send_channel,
                             update_plat_status);

create index idx_order_code
    on ec_oms_order_waybill (order_code);

create index idx_upsta_dtime
    on ec_oms_order_waybill (update_plat_status, delivery_time);

create index idx_wbcode
    on ec_oms_order_waybill (waybill_code);

create table ec_oms_order_waybill_relation
(
    id           int unsigned auto_increment comment '主键Id'
        primary key,
    order_code   decimal(30) unsigned not null comment 'EC订单编号',
    waybill_code varchar(30)          null comment '快递单号'
)
    comment '多包裹订单与快递单号关系表';

create index idx_order_code
    on ec_oms_order_waybill_relation (order_code);

create index idx_waybill_code
    on ec_oms_order_waybill_relation (waybill_code);

create table ec_oms_order_waybill_relation_tmp
(
    id           int unsigned auto_increment comment '主键Id'
        primary key,
    order_code   decimal(30) unsigned not null comment 'EC订单编号',
    waybill_code varchar(30)          null comment '快递单号'
)
    comment '多包裹订单与快递单号关系表';

create index idx_order_code
    on ec_oms_order_waybill_relation_tmp (order_code);

create index idx_waybill_code
    on ec_oms_order_waybill_relation_tmp (waybill_code);

create table ec_oms_order_waybill_tmp
(
    id                   int unsigned auto_increment comment '主键Id'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC订单编号',
    logistics_order_code decimal(30)                                not null comment '物流发货单号',
    external_order       varchar(32)                                null comment '外仓发货单号',
    waybill_code         varchar(2048)                              null comment '快递单号，多个用逗号隔开',
    send_status          tinyint unsigned default 2                 not null comment '发货状态 @1-调度失败 2-待调度 3-待发货 4-发货中 5-已发货 6-已签收7-退回中8-退回失败9-退回成功',
    send_channel         tinyint unsigned                           null comment '发货渠道',
    storehouse_code      int(10)                                    null comment '仓库编码',
    storehouse_name      varchar(32)                                null comment '仓库名称',
    express_code         int unsigned                               null comment '快递公司编码',
    express_name         varchar(32)                                null comment '快递公司名称',
    dispatch_type        tinyint unsigned                           null comment '调度类型（字典：ec_oms_dispatch_type）',
    dispatch_fail_reason varchar(256)                               null comment '调度失败原因',
    dispatch_time        timestamp                                  null comment '订单调度时间',
    dispatch_status      tinyint unsigned                           null comment '调度状态（字典：ec_oms_dispatch_status）@1-待调度2-调度中3-已调度4-调度失败',
    delivery_time        timestamp                                  null comment '订单发货时间',
    receipt_time         timestamp                                  null comment '订单签收时间',
    is_bigorder          tinyint unsigned default 0                 not null comment '是否大订单（字典：ec_oms_yes_no）@1-是 0-否',
    gross_weight         decimal(8, 2)    default 0.00              null comment '毛重(kg)',
    update_plat_status   tinyint unsigned default 0                 not null comment '回传到旗舰店状态（字典：ec_oms_update_plat_status）@0-未回传1-回传成功2-回传失败  3 继续回传',
    return_status        tinyint unsigned default 0                 null comment '退回调度状态（字典：ec_oms_return_status）@0-未退回调度1-退回调度中2-退回调度成功3-退回调度失败9-退回调度出错',
    is_valid             tinyint unsigned default 1                 not null comment '是否有效（字典：ec_oms_is_valid）@0-无效、1-有效',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '统一订单发货单明细';

create index idx_external_order
    on ec_oms_order_waybill_tmp (external_order);

create index idx_logistics_order_code
    on ec_oms_order_waybill_tmp (logistics_order_code);

create index idx_luptime
    on ec_oms_order_waybill_tmp (last_update_time);

create index idx_mul_1111
    on ec_oms_order_waybill_tmp (del_flag, is_valid, delivery_time, send_status, express_code, send_channel,
                                 update_plat_status);

create index idx_order_code
    on ec_oms_order_waybill_tmp (order_code);

create index idx_upsta_dtime
    on ec_oms_order_waybill_tmp (update_plat_status, delivery_time);

create index idx_wbcode
    on ec_oms_order_waybill_tmp (waybill_code);

create table ec_oms_order_weixin_product_detail_record
(
    order_id         varchar(30)    not null comment '外部平台店铺订单号',
    shop_code        int(8)         not null comment '店铺编码',
    original_price   decimal(12, 2) null comment '单件原价',
    sale_price       decimal(12, 2) null comment '单件现价',
    settlement_price decimal(12, 2) null comment '单件结算价',
    pay_price        decimal(12, 2) null comment '单件支付金额',
    welfare_product  decimal(12, 2) null comment '商品级平台补贴',
    welfare_order    decimal(12, 2) null comment '订单级平台补贴',
    outer_sku_id     varchar(8)     not null comment 'EC商品编码',
    sku_id           varchar(30)    null comment '外部商品编码',
    spu_id           varchar(30)    null comment '智慧零售侧SPUID',
    spu_name         varchar(255)   null comment '商品名称',
    quantity         int(8)         null comment '商品数量',
    create_time      timestamp      null comment '创建时间',
    update_time      timestamp      null comment '更新时间',
    primary key (order_id, outer_sku_id)
);

create table ec_oms_order_youzan_product_detail
(
    tid         varchar(30)     not null comment '有赞平台订单编号',
    oid         bigint unsigned not null comment '子订单编号',
    outerItemId varchar(20)     not null comment '商品内部数字ID',
    itemId      bigint unsigned not null comment '商家外部ID',
    num         int unsigned    null comment '购买数量',
    price       decimal(10, 2)  null comment '商品价格。精确到2位小数',
    payment     decimal(10, 2)  null comment '子订单实付金额',
    primary key (tid, itemId, outerItemId)
)
    comment '有赞订单产品明细记录表';

create index idx_oid
    on ec_oms_order_youzan_product_detail (oid);

create table ec_oms_order_zhenkunhang_product_detail
(
    purchase_order_id varchar(30)  not null comment '震坤行平台采购单号',
    plan_item_number  varchar(30)  null comment '计划行号',
    item_line_number  varchar(30)  null comment '订单行号',
    material_describe varchar(255) null comment '物料号描述	',
    unit              varchar(10)  null comment '单位',
    number            int(8)       null comment '计划发货数量	',
    zkh_sku           varchar(30)  not null comment '物料号',
    oms_sku           varchar(30)  not null comment '商品编码',
    primary key (purchase_order_id, oms_sku, zkh_sku)
);

create table ec_oms_package_issue_base
(
    package_issue_code int unsigned                               not null comment '包裹问题编号'
        primary key,
    package_issue_name varchar(50)                                not null comment '包裹问题',
    issue_subject_code int unsigned                               null comment '一级问题主题编号',
    issue_type_code    int unsigned                               null comment '二级问题主体编号',
    sort               int unsigned     default 0                 not null comment '排序',
    is_frozen          tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@1-是，0-否',
    creator_id         int                                        null comment '创建人编号',
    creator_name       varchar(32)                                null comment '创建人名称',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id        int                                        null comment '操作人编号',
    operator_name      varchar(32)                                null comment '操作人名称',
    last_update_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    constraint idx_package_issue_name
        unique (package_issue_name) comment '名称索引'
)
    comment '包裹问题主数据';

create index idx_type_code
    on ec_oms_package_issue_base (issue_type_code)
    comment '二级问题索引';

create table ec_oms_package_issue_handle_method
(
    id                 int unsigned auto_increment comment '自增主键'
        primary key,
    package_issue_code int unsigned                           not null comment '包裹问题编号',
    receive_status     tinyint unsigned                       not null comment '应用客户收货情况（字典ec_oms_packege_issue_receive_status 1-未收到货 2-已收到货 3-已拒收）',
    handle_method      tinyint unsigned                       not null comment '处理方式（字典ec_oms_package_issue_handle_method 1-联系快递核实 2-催促快递派送 3-要求送货上门 4-部分退款补偿 5-破损产品补发 6-部分退款补偿 7-换货 8-补发 9-其他）',
    tips               varchar(200) default ''                not null comment '处理方式描述提示文案',
    sort               int unsigned                           not null comment '排序',
    creator_id         int                                    null comment '创建人编号',
    creator_name       varchar(32)                            null comment '创建人名称',
    create_time        timestamp    default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '包裹问题处理方式';

create index idx_code_status
    on ec_oms_package_issue_handle_method (package_issue_code, receive_status)
    comment '包裹主数据编号索引';

create table ec_oms_package_issue_info
(
    id                 int unsigned auto_increment comment '自增id'
        primary key,
    package_issue_code int unsigned                           not null comment '包裹问题编号',
    receive_status     tinyint unsigned                       not null comment '应用客户收货情况（字典ec_oms_package_issue_receive_status 1-未收到货 2-已收到货 3-已拒收）',
    tips               varchar(200) default ''                not null comment '包裹问题描述提示文案',
    creator_id         int                                    null comment '创建人编号',
    creator_name       varchar(32)                            null comment '创建人名称',
    create_time        timestamp    default CURRENT_TIMESTAMP null comment '创建时间',
    constraint idx_unique
        unique (package_issue_code, receive_status) comment '收货状态索引'
)
    comment '包裹问题信息';

create table ec_oms_pdd_refund_config
(
    id                        int unsigned auto_increment comment 'id'
        primary key,
    config_status             tinyint unsigned default 1                 not null comment '自动PDD退款开关@1-开启，0-关闭',
    shop_codes                varchar(2048)    default ''                not null comment '店铺编号，多个逗号隔开',
    plat_order_status         varchar(512)                               null comment '平台/店铺订单状态，多个逗号隔开（字典：ec_oms_plat_order_status）',
    order_status              varchar(65)                                not null comment '订单状态（字典：ec_oms_order_status）0-待创建、1-待提交、2已删除、3待财审、4已取消、5待审单、6部分待审单、7待退回调度、8部分待退回调度、9待调度、10部分待调度、11待发货、12部分待发货、13发货中、14部分发货中、15已发货、16部分已发货、17已签收、18部分已签收、19交易成功、20部分交易成功、99不处理',
    is_bigorder               tinyint unsigned default 0                 not null comment '是否大订单（字典：ec_oms_yes_no）@1-是 0-否',
    auto_add_present_status   tinyint unsigned default 0                 not null comment '订单是否自动加赠（字典：ec_oms_yes_no）@1-是 0-否',
    aftersale_status          tinyint unsigned default 0                 not null comment '售后处理状态（字典：ec_oms_aftersale_status）@0-未处理1-处理中2-已处理',
    is_exc                    tinyint unsigned default 0                 not null comment '是否异常（字典：ec_oms_yes_no）@1-是 0-否',
    issue_subject_code        int unsigned                               null comment '一级问题编号（关联表ec_oms_issue_subject_base.issue_subject_code）',
    issue_type_code           int unsigned                               null comment '二级问题编号（关联表ec_oms_issue_type_base.issue_type_code）',
    issue_reason_code         int unsigned                               null comment '问题原因编号（关联表ec_oms_issue_reason_base.issue_reason_code）',
    default_responsible_party tinyint unsigned default 0                 null comment '默认责任方（字典：ec_oms_default_responsible_party）@1- 蓝月亮、2-快递公司、3-客户',
    oper_user_id              int unsigned                               null comment '操作人ID',
    oper_user_name            varchar(32)                                null comment '操作人姓名',
    oper_time                 timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '拼多多退款配置信息记录表';

create table ec_oms_plat_address_modify_record
(
    shop_order_id          varchar(64)                                not null comment '店铺订单编号'
        primary key,
    shop_code              int(10)                                    null comment '店铺编号',
    province               varchar(32)                                null comment '收货人省份',
    city                   varchar(32)                                null comment '收货人城市',
    district               varchar(32)                                null comment '收货人区县',
    town                   varchar(32)                                null comment '收货人城镇',
    village                varchar(32)                                null comment '社区/村',
    address                varchar(255)                               null comment '收货人详细地址',
    address_cipher         varchar(1024)                              null comment '收货人详细地址',
    post_code              varchar(10)                                null comment '邮政编码',
    receiver_name          varchar(32)      default ''                not null comment '收货人姓名',
    receiver_name_cipher   varchar(152)                               null comment '收货人姓名',
    receiver_phone         varchar(32)                                null comment '收货人电话',
    receiver_phone_cipher  varchar(152)                               null comment '收货人电话',
    oaid                   varchar(500)                               null comment '天猫解密用',
    receiver_name_orginal  varchar(255)                               null comment '原收货人名称',
    receiver_phone_orginal varchar(255)                               null comment '原手机号',
    address_orginal        varchar(255)                               null comment '原详细地址',
    province_orginal       varchar(32)                                null comment '原省份',
    city_orginal           varchar(32)                                null comment '原市区',
    district_orginal       varchar(32)                                null comment '原区域',
    town_orginal           varchar(32)                                null comment '原城镇',
    village_orginal        varchar(32)                                null comment '原社区/村',
    post_code_orginal      varchar(10)                                null comment '原邮政编码',
    oaid_orginal           varchar(500)                               null comment '原oaid',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag               tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '平台地址修改记录表';

create table ec_oms_plat_api_measure
(
    id          int(10) auto_increment comment '主键id'
        primary key,
    api_name    varchar(256) null comment 'api名称',
    create_date timestamp    not null on update CURRENT_TIMESTAMP comment '创建时间'
)
    comment '外部API调用频率表';

create table ec_oms_plat_api_measure_config
(
    api_name                 varchar(256)   not null comment 'api名称'
        primary key,
    shop_code                varchar(256)   null comment '店铺编号',
    charge_standard          decimal(12, 4) null comment '收费标准（元/次）',
    max_call_count_one_day   int(10)        null comment '1天调用最大阈值',
    max_call_count_one_week  int(10)        null comment '1周调用最大阈值',
    max_call_count_one_month int(10)        null comment '1个月调用最大阈值',
    create_date              timestamp      not null on update CURRENT_TIMESTAMP comment '创建时间'
)
    comment '外部API监控配置表';

create table ec_oms_plat_authorization_config
(
    shop_code   int(10)      not null comment '店铺编号'
        primary key,
    shop_type   varchar(32)  null comment '店铺类型',
    plat_params varchar(128) null comment '获取code的平台参数'
)
    comment '平台授权配置表';

create table ec_oms_plat_callback_monitor_config
(
    shop_code                   bigint     not null comment '店铺编号',
    max_callback_count_one_hour int(10)    null comment '1小时回传失败最大阈值',
    max_callback_count_one_day  int(10)    null comment '1天回传失败最大阈值',
    create_date                 timestamp  not null on update CURRENT_TIMESTAMP comment '创建时间',
    callback_type               tinyint(3) not null comment '回传类型  1：物流  2：发票',
    primary key (shop_code, callback_type)
)
    comment '物流/发票回传失败监控配置表';

create table ec_oms_plat_change_plan
(
    shop_code         int(10)                   not null comment '店铺编号'
        primary key,
    shop_english_code varchar(32)               not null comment '店铺英文编码',
    ec_start_time     datetime                  not null comment 'ec新系统开始时间',
    del_flag          tinyint unsigned zerofill not null comment '删除标志'
)
    comment '平台切换计划';

create table ec_oms_plat_change_plan_pre
(
    shop_code         int(10)                   not null comment '店铺编号'
        primary key,
    shop_english_code varchar(32)               not null,
    ec_start_time     datetime                  not null comment 'ec新系统开始时间',
    del_flag          tinyint unsigned zerofill not null comment '删除标志'
)
    comment '平台切换计划';

create table ec_oms_plat_city_code_mapping
(
    id        int(10) auto_increment comment '主键id'
        primary key,
    shop_code int(10)     not null comment '店铺编码',
    city      varchar(64) null comment '城市',
    city_code int(10)     null comment '城市编码'
)
    comment '城市代码映射表';

create table ec_oms_plat_district_code_mapping
(
    id            int(10) auto_increment comment '主键id'
        primary key,
    shop_code     int(10)     not null comment '店铺编码',
    district      varchar(64) null comment '区县',
    district_code int(10)     null comment '区县编码'
)
    comment '区县代码映射表';

create table ec_oms_plat_doudian_push_message
(
    id               int unsigned auto_increment comment '自增id'
        primary key,
    shop_code        int unsigned                               not null comment '店铺编号',
    tag              smallint(255) unsigned                     not null comment '消息种类',
    msg_id           varchar(64)                                null comment '消息记录ID',
    data             json                                       null comment '消息体',
    is_handle        tinyint unsigned default 0                 null comment '是否处理了该数据 0 未处理  1 处理成功 2 处理失败',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '店铺推送消息';

create table ec_oms_plat_express_company_code
(
    id                int unsigned auto_increment comment '主键id'
        primary key,
    express_code      int unsigned null comment 'ec_oms快递公司编码',
    plat_shop_code    int unsigned null comment '平台代号',
    plat_company_code varchar(20)  null comment '平台快递公司代号',
    plat_company_name varchar(20)  null comment '平台快递公司名称'
)
    comment '物流回传平台快递公司编码转换配置';

create index Index_2
    on ec_oms_plat_express_company_code (id, express_code, plat_shop_code);

create index Index_express_shop
    on ec_oms_plat_express_company_code (express_code);

create table ec_oms_plat_huihong_mapping
(
    id            int(10) auto_increment comment '主键id'
        primary key,
    shop_order_id varchar(64)          null comment '店铺订单编号',
    outter_id     varchar(64)          null comment '外部平台商品id',
    line_id       varchar(64)          null comment '订单行号',
    is_mark       tinyint(3) default 0 not null comment '是否标记  0-否  1-是  默认否'
)
    comment '汇鸿平台映射表';

create table ec_oms_plat_jdgongxiao_code_mapping
(
    shop_order_id varchar(64) not null comment '店铺订单id'
        primary key,
    purchase_id   varchar(64) not null comment '采购单id',
    trade_no      varchar(64) not null comment '业务流水号（uuid）提供给京东排查问题用'
);

create table ec_oms_plat_order_decrypt_data
(
    order_code                       decimal(32) unsigned                not null comment '订单编号'
        primary key,
    shop_order_id                    varchar(32)                         not null comment '外部平台订单编号',
    shop_code                        int unsigned                        not null comment '店铺编号',
    address_decrypted                varchar(255)                        null comment '地址明文',
    address_decrypted_cipher         varchar(1024)                       null comment '地址明文',
    receiver_name_decrypted          varchar(32)                         null comment '收件人明文',
    receiver_name_decrypted_cipher   varchar(152)                        null comment '收件人明文',
    receiver_mobile_decrypted        varchar(20)                         null comment '收件人手机明文',
    receiver_mobile_decrypted_cipher varchar(88)                         null comment '收件人手机明文',
    create_time                      timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    decrypt_time                     timestamp default CURRENT_TIMESTAMP null comment '解密时间'
)
    comment '订单明文信息';

create index idx_ct
    on ec_oms_plat_order_decrypt_data (create_time);

create index ind_pri
    on ec_oms_plat_order_decrypt_data (shop_order_id, shop_code);

create table ec_oms_plat_order_encrypt_data
(
    shop_order_id                    varchar(32)                                not null comment '外部平台订单编号',
    shop_code                        int unsigned                               not null comment '店铺编号',
    order_code                       decimal(32) unsigned                       not null comment '订单编号'
        primary key,
    address_encrypted                varchar(2000)                              null comment '地址密文',
    receiver_name_encrypted          varchar(1024)                              null comment '收件人姓名密文',
    receiver_mobile_encrypted        varchar(1024)                              null comment '收件人手机密文',
    address_decrypted                varchar(255)                               null comment '地址明文',
    address_decrypted_cipher         varchar(1024)                              null comment '地址明文',
    receiver_name_decrypted          varchar(32)                                null comment '收件人明文',
    receiver_name_decrypted_cipher   varchar(152)                               null comment '收件人明文',
    receiver_mobile_decrypted        varchar(20)                                null comment '收件人手机明文',
    receiver_mobile_decrypted_cipher varchar(88)                                null comment '收件人手机明文',
    decrypted_time                   timestamp                                  null comment '解密时间',
    create_time                      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time                 timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_use                           tinyint unsigned default 1                 null comment '是否应用该加密密文和解密密文  1 使用 0 不使用',
    decrypted_status                 tinyint(3)       default 0                 null comment '解密状态(0-未解密,1-解密成功,2-解密失败)',
    plat_name                        varchar(20)                                null comment '平台类型名称',
    oaid                             varchar(500)                               null comment '天猫解密用',
    sid                              varchar(3000)                              null comment '苏宁解密用',
    decrypt_type                     tinyint(4) unsigned                        null comment '解密方式 1人工解密 2自动解密',
    decrypt_amt                      tinyint unsigned default 0                 null comment '解密次数'
)
    comment '订单密文信息';

create index idx_ctime_pname_destats_isuse
    on ec_oms_plat_order_encrypt_data (create_time, plat_name, decrypted_status, is_use);

create index idx_isuse_pname_ctime_damt
    on ec_oms_plat_order_encrypt_data (is_use, plat_name, create_time, decrypt_amt);

create index idx_luptime
    on ec_oms_plat_order_encrypt_data (last_update_time);

create index idx_mobile
    on ec_oms_plat_order_encrypt_data (receiver_mobile_decrypted);

create index ind_pri
    on ec_oms_plat_order_encrypt_data (shop_order_id, shop_code);

create index inx_time
    on ec_oms_plat_order_encrypt_data (decrypted_time);

create table ec_oms_plat_order_record
(
    shop_order_id          varchar(64)                                not null comment 'EC订单编号',
    shop_code              int unsigned                               not null comment '店铺来源编号',
    plat_response          mediumtext                                 null comment '订单报文',
    plat_create_time       timestamp                                  null comment '平台订单创建时间',
    plat_update_time       timestamp                                  null comment '平台订单更新时间',
    plat_pay_time          timestamp                                  null comment '平台订单付款时间',
    ec_oms_create_time     timestamp        default CURRENT_TIMESTAMP not null comment '报文创建时间',
    ec_oms_update_time     timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '报文更新时间',
    update_delivery_status tinyint unsigned default 0                 null comment '回传物流状态 0-未回传 1-已回传',
    primary key (shop_order_id, shop_code)
)
    comment '第三方平台订单原始数据表';

create index idx_ec_plat_order_record_plat_pay_time
    on ec_oms_plat_order_record (plat_pay_time);

create table ec_oms_plat_order_record_original
(
    shop_order_id      varchar(64)                         not null comment '外部订单编号',
    shop_code          int unsigned                        not null comment '店铺来源编号',
    plat_response      mediumtext                          null comment '订单报文',
    ec_oms_create_time timestamp default CURRENT_TIMESTAMP not null comment '报文创建时间',
    primary key (shop_order_id, shop_code)
)
    comment '第三方平台订单原始数据报文流水表';

create table ec_oms_plat_order_record_tmall_presale
(
    tid          bigint unsigned                     not null comment '天猫订单ID'
        primary key,
    status       varchar(32)                         null comment '天猫订单状态
            可选值:TRADE_NO_CREATE_PAY(没有创建支付宝交易)，WAIT_BUYER_PAY(等待买家付款)，WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)，WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)，TRADE_BUYER_SIGNED(买家已签收,货到付款专用)，TRADE_FINISHED(交易成功)，TRADE_CLOSED(付款以后用户退款成功，交易自动关闭)，TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)，PAY_PENDING(国际信用卡支付付款确认中)',
    type         varchar(32)                         null comment '天猫订单类型
            可选值: fixed(一口价) auction(拍卖) guarantee_trade(一口价、拍卖) auto_delivery(自动发货) independent_simple_trade(旺店入门版交易) independent_shop_trade(旺店标准版交易) ec(直冲) cod(货到付款) fenxiao(分销) game_equipment(游戏装备) shopex_trade(ShopEX交易) netcn_trade(万网交易) external_trade(统一外部交易)o2o_offlinetrade（O2O交易）step (万人团)nopaid(无付款订单)pre_auth_type(预授权0元购机交易)',
    seller_nick  varchar(32)                         null comment '卖家昵称',
    buyer_nick   varchar(32)                         null comment '买家昵称',
    jdp_hashcode varchar(64)                         null comment '数据标志',
    jdp_response mediumtext                          null comment '订单数据',
    jdp_created  timestamp                           null comment '天猫订单创建时间',
    jdp_modified timestamp                           null comment '天猫订单修改时间',
    created      timestamp default CURRENT_TIMESTAMP not null comment '记录创建时间',
    modified     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '记录更新时间'
)
    comment '天猫原始預售订单';

create table ec_oms_plat_order_repeat_alarm
(
    id            int auto_increment comment '主键id'
        primary key,
    shop_order_id varchar(64)                         not null comment '外部平台订单编号',
    plat_pay_time timestamp                           null comment '付款时间/订单开始时间',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    constraint uniq_shop_ord_pay
        unique (shop_order_id, plat_pay_time)
)
    comment '平台订单重复判断表';

create table ec_oms_plat_pddgongxiao_code_mapping
(
    shop_order_id varchar(64) not null comment '店铺订单编号'
        primary key,
    plat_shop_id  varchar(64) not null comment '第三方平台店铺ID'
)
    comment '拼多多供销平台订单店铺映射表';

create table ec_oms_plat_product_detail
(
    plat_product_id           int unsigned auto_increment comment '主键Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC订单编号',
    shop_order_id             varchar(64)                                null comment '外部平台订单编号',
    shop_code                 int                                        null comment '平台来源',
    product_code              bigint unsigned                            null comment '产品编号',
    shop_pro_name             varchar(255)                               null comment '商品名',
    buy_num                   int(10)                                    null comment '购买数量',
    pro_type                  tinyint unsigned                           null comment '产品类型（1-单品、2-套餐，3-虚拟商品）',
    outter_id                 varchar(64)                                null comment '商品编号ID',
    is_present                tinyint unsigned default 0                 null comment '是否是赠品（字典：ec_oms_yes_no）@1-是，0-否',
    pro_one_price             decimal(14, 4)   default 0.0000            null comment '产品报价',
    pro_all_price             decimal(14, 4)   default 0.0000            null comment '报价金额',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            null comment '店铺承担产品优惠金额',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            null comment '平台承担产品优惠金额',
    pro_pay_amt               decimal(14, 4)   default 0.0000            null comment '产品实付金额',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '店铺承担订单优惠【分摊】',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment '平台承担订单优惠【分摊】',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '店铺优惠',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment '平台优惠',
    shipment                  decimal(12, 2)   default 0.00              not null comment '运费',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    delivery_actual_num       int unsigned     default 0                 null comment '已回传发货数量',
    del_flag                  tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '平台订单产品明细表';

create index Index_ordcode
    on ec_oms_plat_product_detail (order_code, product_code);

create index Index_shop
    on ec_oms_plat_product_detail (shop_order_id, shop_code);

create index idx_luptime
    on ec_oms_plat_product_detail (last_update_time);

create table ec_oms_plat_province_code_mapping
(
    id            int(10) auto_increment comment '主键id'
        primary key,
    shop_code     int(10)     not null comment '店铺编码',
    province      varchar(64) null comment '省份',
    province_code int(10)     null comment '省份编码'
)
    comment '省代码映射表';

create table ec_oms_plat_purchase_order
(
    purchase_id      int(11) unsigned auto_increment comment '采购单id'
        primary key,
    shop_order_id    varchar(100)                        null comment '采购单号(店铺订单编号)',
    business_type    tinyint                             null comment '销售业务类型（字典：ec_oms_business_type）@1-普通订单，2-销售订单，3-分销订单，4-临时销售订单',
    shop_code        int(11) unsigned                    null comment '店铺编号',
    client_code      varchar(16)                         null comment '客户编号',
    po_type          tinyint unsigned                    null comment '单据类型 10-普通 直?，70-补差订单',
    plat_start_time  timestamp                           null comment '采购单创建日期',
    purchase_contact varchar(32)                         null comment '采购联系人',
    buyer_message    varchar(500)                        null comment '买家留言',
    seller_message   varchar(500)                        null comment '卖家备注',
    create_time      timestamp default CURRENT_TIMESTAMP null comment 'ec创建时间',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    constraint ind_pri
        unique (shop_code, shop_order_id)
)
    comment '采购单信息';

create table ec_oms_plat_purchase_order_detail
(
    purchase_detail_id int(11) unsigned auto_increment comment '采购单明细id'
        primary key,
    purchase_id        int(11) unsigned null comment '所属采购单id',
    product_code       varchar(100)     null comment '产品编号',
    plat_product_code  varchar(100)     null comment '外部产品编号',
    barcode            varchar(255)     null comment '条形码',
    shop_pro_name      varchar(512)     null comment '产品名称',
    pro_one_price      decimal(14, 4)   null comment '产品报价(单个)',
    buy_num            decimal(11, 4)   null comment '采购数量',
    constraint idx_pro_plat
        unique (purchase_id, product_code, plat_product_code)
)
    comment '采购单明细信息';

create table ec_oms_plat_receipt
(
    receipt_id         int(11) unsigned auto_increment comment '收货单id'
        primary key,
    shop_order_id      varchar(100)                                  null comment '平台订单编号',
    shop_code          int(11) unsigned                              null comment '店铺编号',
    received_code      varchar(100)                                  null comment '收货单号',
    purchase_time      timestamp                                     null comment '采购时间',
    received_time      timestamp                                     null comment '收货时间',
    receipt_start_time timestamp                                     null comment '收货单创建时间',
    purchase_contact   varchar(32)                                   null comment '采购联系人',
    po_type            smallint unsigned                             null comment '单据类型 猫超 10-普通 直?，70-补差订 单',
    handle_status      tinyint(4) unsigned default 0                 null comment '处理状态(0：未处理,1：处理成功,2：处理失败)',
    create_time        timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time   timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    constraint ind_pri
        unique (shop_code, received_code)
)
    comment '发送到sap的收货单';

create table ec_oms_plat_receipt_detail
(
    receipt_detail_id int(11) unsigned auto_increment comment '收货单明细id'
        primary key,
    receipt_id        int(11) unsigned                                null comment '对应的收货单id',
    product_code      int(11) unsigned                                null comment '产品编号',
    plat_product_code varchar(100)                                    null comment '平台产品编号',
    received_qty      decimal(11, 4) unsigned                         null comment '收货数量',
    barcode           varchar(255)                                    null comment '条形码 猫超',
    handle_status     tinyint(255) unsigned default 0                 null comment '处理状态  0 未处理  1 处理成功  2 处理失败',
    create_time       timestamp             default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time  timestamp             default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    constraint idx_pro_plat
        unique (receipt_id, product_code, plat_product_code)
)
    comment '发送到sap的采购单/发货单明细';

create table ec_oms_plat_refund_record
(
    shop_order_id      varchar(64)                         not null comment '外部平台编号',
    shop_code          int unsigned                        not null comment '店铺来源编号',
    shop_refund_id     varchar(64)                         not null comment '退款订单编号',
    plat_status        varchar(32)                         null comment '平台退款单状态',
    plat_response      mediumtext                          null comment '退款订单报文',
    plat_update_time   timestamp                           null comment '平台退款单更新时间',
    plat_apply_time    timestamp                           null comment '平台订单申请退款时间',
    ec_oms_create_time timestamp default CURRENT_TIMESTAMP not null comment '报文创建时间',
    ec_oms_update_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '报文更新时间',
    primary key (shop_order_id, shop_code, shop_refund_id)
)
    comment '第三方平台售后订单原始数据表 仅做记录用';

create index Index_1
    on ec_oms_plat_refund_record (shop_order_id, shop_code);

create index idx_ec_plat_order_record_plat_apply_time
    on ec_oms_plat_refund_record (plat_apply_time);

create table ec_oms_plat_suning_receipt_detail_order
(
    received_code         varchar(32)                         not null comment '苏宁收货单号。苏宁收货单号',
    shop_code             int(10)                             null comment '店铺编号',
    reject_qty            decimal(14, 4)                      null comment '拒收数量。拒收数量',
    received_item         varchar(32)                         not null comment '苏宁收货单行号。苏宁收货单行号',
    order_item            varchar(32)                         null comment '采购订单行号。采购订单行号',
    rcpt_qty              decimal(14, 4)                      null comment '实收数量。实收数量',
    supplier_product_code varchar(32)                         null comment '供应商商品编码。供应商商品编码',
    sn_product_code       varchar(32)                         null comment '苏宁的产品编号',
    create_time           timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time      timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    is_handle             tinyint   default 0                 null comment '是否已推送sap',
    barcode               varchar(256)                        null comment '条形码',
    primary key (received_code, received_item)
)
    comment '收货单行详情数据';

create table ec_oms_plat_suning_receipt_order
(
    received_code    varchar(32)                         not null comment '苏宁收货单号。苏宁收货单号'
        primary key,
    co_code          varchar(32)                         null comment '购货方。购货方',
    sn_order_code    varchar(32)                         null comment '采购订单号。采购订单号',
    shop_code        int(10)                             null,
    order_type       varchar(32)                         null comment '采购订单类型。采购订单类型',
    received_date    timestamp                           null on update CURRENT_TIMESTAMP comment '苏宁收货日期。苏宁收货日期',
    store_code       varchar(32)                         null comment '苏宁门店库。苏宁门店库',
    supplier_code    varchar(32)                         null comment '供应商编码',
    vendor_ref_no    varchar(32)                         null comment '供应商发货单单号。供应商发货单单号',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    is_handle        tinyint   default 0                 null comment '是否已回传sap'
)
    comment '苏宁收货单头部信息详情';

create table ec_oms_plat_tmall_invoice_apply_log
(
    id               int unsigned auto_increment comment '自增主键'
        primary key,
    shop_order_id    varchar(64)                                null comment '外部平台订单号',
    shop_code        int unsigned                               null comment '平台编号',
    handle_status    tinyint unsigned default 0                 null comment '处理状态(1 成功,0失败)',
    apply            mediumtext                                 null comment '发票信息',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '天猫发票处理登记记录';

create table ec_oms_plat_tmall_packages_delivery
(
    id                     int(10) auto_increment comment '主键ID'
        primary key,
    waybill_code           varchar(1024)                        null comment '快递单号',
    order_code             decimal(30)                          null comment 'EC订单编号',
    company_code           varchar(256)                         null comment '快递公司编码',
    tid                    bigint                               null comment '天猫平台订单编号',
    oid                    bigint                               null comment '子订单编号',
    import_type            tinyint(3)                           null comment '回传类型 1-订单拆包；2-赠品；3-补发',
    shop_code              int(10)                              null comment '店铺编号',
    update_delivery_status tinyint(3) default 0                 null comment '多包裹通知回传物流状态 0-未回传 1-已回传 2-失败',
    create_time            timestamp  default CURRENT_TIMESTAMP null comment '记录创建时间',
    last_update_time       timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '天猫多包裹通知回传表';

create index idx_ctime
    on ec_oms_plat_tmall_packages_delivery (create_time);

create index idx_oid
    on ec_oms_plat_tmall_packages_delivery (oid);

create index idx_tid
    on ec_oms_plat_tmall_packages_delivery (tid);

create index idx_updstat_ctime
    on ec_oms_plat_tmall_packages_delivery (update_delivery_status, create_time);

create index pd_order_code
    on ec_oms_plat_tmall_packages_delivery (order_code);

create table ec_oms_plat_tmall_presale_order
(
    shop_order_id               varchar(64)                                not null comment '店铺订单编号，若为合单则置为EC订单编号(order_code)',
    shop_code                   int unsigned                               not null comment '店铺来源编号',
    plat_order_status           varchar(64)                                null comment '淘宝订单状态（字典：ec_oms_plat_order_status）',
    breed_num                   tinyint unsigned default 0                 null comment '品种数',
    pro_total_num               int unsigned     default 0                 null comment '件总数',
    gross_weight                decimal(10, 3)   default 0.000             null comment '毛重(kg)',
    buyer_nick                  varchar(64)                                null comment '买家昵称/ID',
    has_buyer_message           tinyint unsigned default 0                 null comment '是否有买家留言（字典：ec_oms_yes_no）@1-是，0-否',
    buyer_message               varchar(1024)                              null comment '买家留言内容',
    seller_message              varchar(1024)                              null comment '卖家备注',
    country                     varchar(32)                                null comment '收货人国籍',
    province                    varchar(32)                                null comment '收货人省份',
    city                        varchar(32)                                null comment '收货人城市',
    district                    varchar(32)                                null comment '收货人区县',
    town                        varchar(32)                                null comment '收货人城镇',
    village                     varchar(32)                                null comment '社区/村',
    address                     varchar(255)                               null comment '收货人详细地址',
    address_cipher              varchar(1024)                              null comment '收货人详细地址',
    post_code                   varchar(10)                                null comment '邮政编码',
    receiver_name               varchar(32)      default ''                not null comment '收货人姓名',
    receiver_name_cipher        varchar(152)                               null comment '收货人姓名',
    receiver_mobile             varchar(15)                                null comment '收货人手机',
    receiver_mobile_cipher      varchar(64)                                null comment '收货人手机',
    receiver_phone              varchar(32)                                null comment '收货人固定电话',
    receiver_phone_cipher       varchar(152)                               null comment '收货人固定电话',
    order_all_price             decimal(14, 4)   default 0.0000            not null comment '报价总金额',
    order_shop_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment '店铺承担产品总优惠金额',
    order_plat_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment '平台承担产品总优惠金额',
    order_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '店铺承担订单优惠',
    order_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment '平台承担订单优惠',
    order_pro_pay_amt           decimal(14, 4)   default 0.0000            not null comment '产品实付总金额',
    order_pay_amt               decimal(14, 4)   default 0.0000            not null comment '订单实付金额',
    order_received_amt          decimal(14, 4)   default 0.0000            not null comment '订单实收金额',
    order_all_shipment          decimal(14, 4)   default 0.0000            not null comment '订单总邮费',
    pro_codes                   varchar(1024)                              null comment '产品编号（“,"分割）',
    shop_pro_name               varchar(2048)                              null comment '网店品名（"||"分隔）',
    step_trade_status           varchar(32)                                null comment '分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)',
    taobao_order_type           varchar(32)                                null comment '淘宝订单交易类型',
    good_sku                    varchar(1024)    default ''                null comment '商品SKU',
    plat_start_time             timestamp                                  not null comment '外部平台订单创建时间',
    plat_end_time               timestamp                                  null comment '外部平台订单结束时间',
    plat_pay_time               timestamp                                  null comment '外部平台订单支付时间',
    plat_update_time            timestamp                                  null comment '外部平台订单修改时间',
    create_time                 timestamp        default CURRENT_TIMESTAMP null comment '记录创建时间',
    last_update_time            timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                    tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    creator_id                  int unsigned                               null comment '创建人编号',
    creator_name                varchar(32)      default ''                not null comment '创建人名称',
    primary key (shop_order_id, shop_code)
)
    comment '统一天猫预售订单表';

create index idx_crt
    on ec_oms_plat_tmall_presale_order (create_time);

create index idx_order_shop_order_id
    on ec_oms_plat_tmall_presale_order (shop_order_id, shop_code);

create table ec_oms_plat_tmall_presale_product_detail
(
    plat_product_id       int unsigned auto_increment comment '主键Id'
        primary key,
    shop_order_id         varchar(64)                                null comment '外部平台订单编号',
    shop_code             int                                        null comment '平台来源',
    product_code          bigint unsigned                            null comment '产品编号',
    shop_pro_name         varchar(255)                               null comment '商品名',
    buy_num               int(10)                                    null comment '购买数量',
    pro_type              tinyint unsigned                           null comment '产品类型（1-单品、2-套餐，3-虚拟商品）',
    outter_id             varchar(32)                                null comment '商品编号ID',
    pro_one_price         decimal(14, 4)   default 0.0000            null comment '产品报价',
    pro_all_price         decimal(14, 4)   default 0.0000            null comment '报价金额',
    pro_shop_discount_amt decimal(14, 4)   default 0.0000            null comment '店铺承担产品优惠金额',
    pro_plat_discount_amt decimal(14, 4)   default 0.0000            null comment '平台承担产品优惠金额',
    pro_pay_amt           decimal(14, 4)   default 0.0000            null comment '产品实付金额',
    last_update_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag              tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '天猫预售订单产品明细表';

create index Index_shop
    on ec_oms_plat_tmall_presale_product_detail (shop_order_id, shop_code);

create table ec_oms_plat_tmall_tmc_message
(
    id               bigint unsigned                            not null comment '消息ID'
        primary key,
    topic            varchar(64)                                null comment '消息所属主题',
    pub_time         timestamp                                  null comment '消息发布时间',
    outgoing_time    timestamp                                  null comment '暂时未知作用',
    user_id          bigint unsigned                            null comment '消息所属的用户编号',
    user_nick        varchar(50)                                null comment '用户的昵称',
    data_id          varchar(50)                                null comment '订单编号tid',
    content          mediumtext                                 null comment '消息内容主体',
    message          mediumtext                                 null comment '接收到的消息内容',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    ec_handle_status tinyint unsigned default 0                 null comment 'ec处理状态'
)
    comment '天猫推送的消息保存列表';

create index idx_dataid
    on ec_oms_plat_tmall_tmc_message (data_id);

create index idx_lst
    on ec_oms_plat_tmall_tmc_message (last_update_time);

create index idx_topic_sellernick
    on ec_oms_plat_tmall_tmc_message (topic, user_nick);

create table ec_oms_plat_token_info
(
    id                      int unsigned auto_increment comment '编号'
        primary key,
    shop_code               int                    not null comment '平台来源',
    shop_name               varchar(32)            null comment '平台名称',
    client_code             varchar(15) default '' null comment '大客户编号',
    app_key                 varchar(64) default '' null comment '授权appkey',
    app_secret              varchar(64) default '' null comment '授权appSecret',
    access_token            varchar(128)           null comment '接口授权令牌',
    refresh_token           varchar(128)           null comment '接口刷新授权令牌',
    token_expire_time       timestamp              null comment 'access_token失效时间',
    refresh_expire_time     timestamp              null comment 'refresh_token失效时间',
    create_time             timestamp              null comment '创建时间',
    update_time             timestamp              null comment '更新时间',
    is_use                  tinyint(6)  default 1  not null comment 'token是否在使用监控,0-不使用,1-使用',
    token_redis_key         varchar(64)            null comment 'token保存在redis中的key',
    refresh_token_redis_key varchar(64)            null comment 'refreshToken保存在redis中的key',
    plat_shop_id            varchar(12)            null comment '平台店铺编码'
)
    comment '接口授权token信息表';

create index plat_source
    on ec_oms_plat_token_info (shop_code);

create table ec_oms_plat_tuyue_code_mapping
(
    shop_order_id varchar(64) not null comment '店铺订单编号'
        primary key,
    delivery_code varchar(64) not null comment '单据编号'
)
    comment '涂月编号映射表';

create table ec_oms_plat_tuyue_product_detail
(
    item_id       varchar(32)  not null comment '商品编号ID',
    qty           int          null comment '购买数量',
    item_name     varchar(255) not null comment '商品名称',
    item_code     bigint       not null comment '平台商品编号',
    refund        tinyint(3)   null comment '是否退款 0:未退款 1:退款成功 2:退款中',
    shop_order_id varchar(64)  not null comment '店铺订单号',
    primary key (item_id, shop_order_id)
)
    comment '涂月产品明细表';

create table ec_oms_plat_yunji_mobile_record
(
    order_id        varchar(64)                         not null comment '订单id'
        primary key,
    receiver_mobile varchar(32)                         not null comment '解密前手机号',
    create_time     timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '云集手机号解密记录表';

create table ec_oms_prd_convert_plan
(
    plan_code            bigint                                     not null comment '策略表主键'
        primary key,
    plan_name            varchar(32)                                not null comment '策略名字',
    shop_code            int unsigned                               null comment '店铺编号(已弃用，现用ec_oms_prd_convert_plan_shop)',
    plan_type            tinyint unsigned default 1                 not null comment '策略类型  1-数量不封顶  2-数量封顶',
    plan_use_type        tinyint unsigned default 1                 not null comment '策略使用类型，1-自动转品，2-手动转品',
    plan_start_time      timestamp                                  null comment '策略开始时间',
    plan_end_time        timestamp                                  null comment '策略结束时间',
    is_limit_num         tinyint unsigned default 0                 not null comment '是否限制转品总量1-是 0-否',
    use_num              int unsigned                               null comment '已使用转品数量(已弃用，现用ec_oms_prd_convert_plan_shop)',
    limit_num            int unsigned                               null comment '转品总量(已弃用，现用ec_oms_prd_convert_plan_shop)',
    is_limit_ship_region tinyint(3)                                 null comment '是否限制收货地区 1-是 0-否 字典（ec_oms_yes_no）',
    province_code        varchar(128)                               null comment '允许转品的收货省份编码,多个以逗号分隔',
    province_name        varchar(128)                               null comment '允许转品的收货省份名称，多个以逗号分隔',
    creator_id           int unsigned                               null comment '创建人编号',
    creator_name         varchar(32)                                null comment '创建人名称',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id          int unsigned                               null comment '操作人编号',
    operator_name        varchar(32)                                null comment '操作人名称',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '订单产品转品策略配置';

create table ec_oms_prd_convert_plan_shop
(
    id        int unsigned auto_increment comment '主键'
        primary key,
    plan_code bigint                     not null comment '策略表主键，关联ec_oms_prd_convert_plan',
    shop_code int unsigned               null comment '店铺编号',
    use_num   int unsigned               null comment '已使用转品数量',
    limit_num int unsigned               null comment '转品总量',
    del_flag  tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '订单产品转品策略配置店铺表';

create index idx_plan_code
    on ec_oms_prd_convert_plan_shop (plan_code);

create table ec_oms_prd_convert_plan_sub
(
    id                  int unsigned auto_increment comment '策略详情表主键'
        primary key,
    plan_code           bigint unsigned            not null comment '策略编号',
    before_product_code bigint unsigned            null comment '转品前产品编号',
    before_num          int unsigned               null comment '转品前产品数量',
    after_product_code  bigint unsigned            null comment '转品后产品编号',
    after_num           int unsigned               null comment '转品后产品数量',
    row_group           tinyint(5) unsigned        null comment '分组，一条转品策略为一组',
    del_flag            tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '订单产品转品策略配置关联表';

create index idx_plan_code
    on ec_oms_prd_convert_plan_sub (plan_code);

create table ec_oms_product_base
(
    product_code         bigint unsigned                             not null comment '商品编号（10000004）'
        primary key,
    product_type         tinyint unsigned  default 1                 not null comment '商品类型（字典：ec_oms_product_type）@1-单品，2-套餐，3-虚拟商品',
    product_name         varchar(100)                                not null comment '商品名称',
    product_short_name   varchar(40)                                 not null comment '商品简称',
    category_first       smallint unsigned                           null comment '一级分类（字典：ec_oms_product_category）eg:100,第一位1表示单品，2表套餐，3-表虚拟商品',
    category_second      mediumint unsigned                          null comment '二级分类（字典：ec_oms_product_category）eg:100001',
    category_thrid       int unsigned                                null comment '三级分类（字典：ec_oms_product_category）eg:100001001',
    is_frozen            tinyint unsigned  default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@1-是，0-否',
    retail_price         decimal(16, 4)                              not null comment '建议零售价',
    supply_price         decimal(16, 4)                              null comment '建议供货价',
    claim_price          decimal(16, 4)                              not null comment '快递理赔价',
    claim_price_type     tinyint unsigned  default 1                 not null comment '快递理赔价取值逻辑（字典：ec_oms_claim_price_type）@1-取值固定值、2-取值产品实收单价',
    volume_box           decimal(8, 4)     default 0.0000            not null comment '体积(箱)m3，保留4位小数',
    box_length           decimal(8, 4)     default 0.0000            not null comment '长度(箱)m，保留4位小数',
    box_width            decimal(8, 4)     default 0.0000            not null comment '宽度(箱)m，保留4位小数',
    box_height           decimal(8, 4)     default 0.0000            not null comment '高度(箱)m，保留4位小数',
    volume_unit          decimal(8, 4)     default 0.0000            not null comment '体积(支)m3，保留4位小数',
    unit_length          decimal(8, 4)     default 0.0000            not null comment '长度(支)m，保留4位小数',
    unit_width           decimal(8, 4)     default 0.0000            not null comment '宽度(支)m，保留4位小数',
    unit_height          decimal(8, 4)     default 0.0000            not null comment '高度(支)m，保留4位小数',
    net_weight           decimal(10, 3)    default 0.000             not null comment '净重(KG)，保留3位小数',
    gross_weight         decimal(10, 3)    default 0.000             not null comment '毛重(KG)，保留3位小数',
    unit                 tinyint unsigned                            null comment '计量单位，（字典：ec_oms_product_unit）@1-支、2-瓶、3-套、4-组、5-箱，6-个，7-件，8-张',
    shelf_life           smallint unsigned                           null comment '保质期(天)',
    barcode              varchar(20)                                 null comment '产品条形码',
    box_barcode          varchar(20)                                 null comment '外箱条形码',
    carton               smallint unsigned default 0                 not null comment '箱规',
    is_present           tinyint unsigned  default 0                 not null comment '是否可为赠品 （字典：ec_oms_yes_no）@0-否 1-是',
    pic_url              varchar(512)      default ''                not null comment '商品图片路径',
    estimated_usage_days smallint unsigned                           null comment '单人预估使用天数',
    history_product_code bigint unsigned                             null comment '历史编号',
    is_spe_supply        tinyint unsigned  default 0                 not null comment '是否专供 （字典：ec_oms_yes_no）@0-否 1-是',
    is_new               tinyint unsigned  default 0                 not null comment '是否新品 （字典：ec_oms_yes_no）@0-否 1-是',
    remark               varchar(100)                                null comment '备注',
    creator_id           int                                         null comment '创建人编号',
    creator_name         varchar(32)                                 null comment '创建人名称',
    create_time          timestamp         default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id          int                                         null comment '操作人编号',
    operator_name        varchar(32)                                 null comment '操作人名称',
    last_update_time     timestamp         default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '单品主数据表';

create table ec_oms_product_base_20210208
(
    product_code         bigint unsigned                             not null comment '商品编号（10000004）'
        primary key,
    product_type         tinyint unsigned  default 1                 not null comment '商品类型（字典：ec_oms_product_type）@1-单品，2-套餐，3-虚拟商品',
    product_name         varchar(100)                                not null comment '商品名称',
    product_short_name   varchar(30)                                 not null comment '商品简称',
    category_first       smallint unsigned                           null comment '一级分类（字典：ec_oms_product_category）eg:100,第一位1表示单品，2表套餐，3-表虚拟商品',
    category_second      mediumint unsigned                          null comment '二级分类（字典：ec_oms_product_category）eg:100001',
    category_thrid       int unsigned                                null comment '三级分类（字典：ec_oms_product_category）eg:100001001',
    is_frozen            tinyint unsigned  default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@1-是，0-否',
    retail_price         decimal(16, 4)                              not null comment '标准零售价',
    supply_price         decimal(16, 4)                              null comment '标准供货价',
    claim_price          decimal(16, 4)                              not null comment '快递理赔价',
    claim_price_type     tinyint unsigned  default 1                 not null comment '快递理赔价取值逻辑（字典：ec_oms_claim_price_type）@1-取值固定值、2-取值产品实收单价',
    volume_box           decimal(8, 4)     default 0.0000            not null comment '体积(箱)m3，保留4位小数',
    box_length           decimal(8, 4)     default 0.0000            not null comment '长度(箱)m，保留4位小数',
    box_width            decimal(8, 4)     default 0.0000            not null comment '宽度(箱)m，保留4位小数',
    box_height           decimal(8, 4)     default 0.0000            not null comment '高度(箱)m，保留4位小数',
    volume_unit          decimal(8, 4)     default 0.0000            not null comment '体积(支)m3，保留4位小数',
    unit_length          decimal(8, 4)     default 0.0000            not null comment '长度(支)m，保留4位小数',
    unit_width           decimal(8, 4)     default 0.0000            not null comment '宽度(支)m，保留4位小数',
    unit_height          decimal(8, 4)     default 0.0000            not null comment '高度(支)m，保留4位小数',
    net_weight           decimal(8, 2)     default 0.00              not null comment '净重(KG)，保留2位小数',
    gross_weight         decimal(8, 2)     default 0.00              not null comment '毛重(KG)，保留2位小数',
    unit                 tinyint unsigned                            null comment '计量单位，（字典：ec_oms_product_unit）@1-支、2-瓶、3-套、4-组、5-箱',
    shelf_life           smallint unsigned                           null comment '保质期(天)',
    barcode              varchar(20)                                 null comment '产品条形码',
    box_barcode          varchar(20)                                 null comment '外箱条形码',
    carton               smallint unsigned default 0                 not null comment '箱规',
    is_present           tinyint unsigned  default 0                 not null comment '是否可为赠品 （字典：ec_oms_yes_no）@0-否 1-是',
    pic_url              varchar(512)      default ''                not null comment '商品图片路径',
    estimated_usage_days smallint unsigned                           null comment '单人预估使用天数',
    history_product_code bigint unsigned                             null comment '历史编号',
    is_spe_supply        tinyint unsigned  default 0                 not null comment '是否专供 （字典：ec_oms_yes_no）@0-否 1-是',
    remark               varchar(100)                                null comment '备注',
    creator_id           int                                         null comment '创建人编号',
    creator_name         varchar(32)                                 null comment '创建人名称',
    create_time          timestamp         default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id          int                                         null comment '操作人编号',
    operator_name        varchar(32)                                 null comment '操作人名称',
    last_update_time     timestamp         default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '单品主数据表_临时表(20210208更新前数据备份)';

create table ec_oms_product_base_distri_shop
(
    id            int unsigned auto_increment comment '主键ID'
        primary key,
    product_code  bigint unsigned            not null comment '商品编号（关联ec_oms_product_base）',
    shop_code     int unsigned               not null comment '店铺编号（关联ec_oms_channel_shop_base）',
    relation_type tinyint unsigned default 1 not null comment '关系类型 1-可分销，0-分销',
    del_flag      tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '产品可分销店铺关系表';

create index idx_product_shop_code
    on ec_oms_product_base_distri_shop (product_code, shop_code);

create table ec_oms_product_base_shop
(
    id           int unsigned auto_increment comment '主键ID'
        primary key,
    plan_code    int unsigned               not null comment '批次',
    product_code bigint unsigned            not null comment '商品编号（关联ec_oms_product_base）',
    shop_code    int unsigned               not null comment '店铺编号（关联ec_oms_channel_shop_base）',
    del_flag     tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '产品专供店铺关系表';

create index idx_plan_code
    on ec_oms_product_base_shop (plan_code);

create index idx_product_shop_code
    on ec_oms_product_base_shop (product_code, shop_code);

create table ec_oms_product_base_temp
(
    product_code bigint unsigned not null comment '商品编号（10000004）'
        primary key,
    retail_price decimal(16, 4)  not null comment '标准零售价',
    claim_price  decimal(16, 4)  null comment '快递理赔价'
)
    comment '单品主数据表_标零价临时表';

create table ec_oms_product_evaluation_jd
(
    comment_id       varchar(64)                         not null comment '京东的评论唯一标识符'
        primary key,
    shop_sap_code    int                                 null comment '京东sap编号',
    shop_name        varchar(64)                         null comment '店铺名称',
    sku_id           varchar(32)                         null comment '店铺商品ID',
    sku_image        varchar(256)                        null comment '店铺商品图片',
    sku_name         varchar(64)                         null comment '店铺商品名称',
    shop_order_id    bigint unsigned                     not null comment '订单ID',
    nick_name        varchar(30)                         null comment '评价者昵称',
    content          varchar(500)                        null comment '评价内容',
    jd_create_time   timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    reply_count      int unsigned                        not null comment '回复数',
    reply_status     int(10)                             not null comment '回复状态(1：正常、-1：删除)',
    useful_count     int unsigned                        not null comment '点赞数',
    reply_score      int unsigned                        null comment '评价等级(好-4,5/中-2,3/差评-1)',
    is_vender_reply  tinyint unsigned                    not null comment '商家是否回复',
    audit_status     int(10)                             not null comment '审核状态(-1:不通过(删除) 1:通过 2:审核中)',
    pin              varchar(256)                        null comment '评价用户唯一标识',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间'
)
    comment '京东商品信息评价主表';

create index idx_shop_order_id
    on ec_oms_product_evaluation_jd (shop_order_id);

create index idx_sku_id
    on ec_oms_product_evaluation_jd (sku_id);

create table ec_oms_product_evaluation_jd_images
(
    id             int unsigned auto_increment comment '编号'
        primary key,
    comment_id     varchar(64)                         not null comment '所属京东的评论唯一标识符',
    jd_id          varchar(64)                         null comment '晒单id',
    img_url        varchar(256)                        null comment '图片地址',
    img_title      varchar(30)                         null comment '晒单主题',
    jd_create_time timestamp default CURRENT_TIMESTAMP null comment 'Jd系统创建时间',
    create_time    timestamp default CURRENT_TIMESTAMP null comment 'Ec系统创建时间'
)
    comment '京东商品信息评价图片明细表';

create index idx_comment_id
    on ec_oms_product_evaluation_jd_images (comment_id);

create table ec_oms_product_evaluation_jd_replies
(
    id              int unsigned auto_increment comment '编号'
        primary key,
    comment_id      varchar(64)                         not null comment '所属京东的评论唯一标识符',
    content         varchar(500)                        null comment '评价内容',
    reply_id        varchar(30)                         null comment '回复id',
    create_time     timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    nick_name       varchar(30)                         null comment '评价者昵称',
    parent_reply_id varchar(30)                         null comment '回复父id',
    jd_create_time  timestamp default CURRENT_TIMESTAMP null comment 'Jd系统创建时间'
)
    comment '京东商品信息评价子评价表';

create index idx_comment_id
    on ec_oms_product_evaluation_jd_replies (comment_id);

create table ec_oms_product_plat_match_base
(
    match_id          int(11) unsigned auto_increment comment '主键id'
        primary key,
    shop_code         int(11) unsigned                           not null comment '外部平台代号',
    plat_product_code varchar(64)                                not null comment '外部平台产品编号',
    product_code      bigint unsigned                            not null comment 'oms产品/套餐编号',
    operator_id       int unsigned                               null comment '操作人编号',
    operator_name     varchar(32)                                null comment '操作人姓名',
    last_update_time  timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag          tinyint unsigned default 0                 not null comment '删除标识  0-否 1-删除',
    constraint Index_uniq
        unique (shop_code, plat_product_code, product_code),
    constraint Index_uniq_2
        unique (shop_code, plat_product_code)
)
    comment '外部平台产品配对表';

create index idx_order_source
    on ec_oms_product_plat_match_base (shop_code);

create table ec_oms_product_price_strategy
(
    strategy_code    bigint unsigned                            not null comment '策略编号,年月日+5位序号'
        primary key,
    strategy_name    varchar(128)                               not null comment '策略名称/标题',
    start_time       datetime                                   not null comment '开始时间',
    end_time         datetime                                   not null comment '结束时间',
    strategy_remark  varchar(1000)                              null comment '策略内容/备注',
    is_stop          tinyint unsigned default 0                 not null comment '是否停用 0-否 1-是',
    creator_id       int                                        null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int                                        null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '产品价格策略表';

create table ec_oms_product_price_strategy_detail
(
    id                    int unsigned auto_increment comment 'id'
        primary key,
    strategy_code         bigint unsigned            not null comment '策略编号，关联ec_oms_product_price_strategy',
    product_code          bigint unsigned            not null comment '商品编号，关联ec_oms_product_base',
    daily_page_price      decimal(16, 4)             not null comment '日常页面价（默认/C端）',
    activity_play         varchar(128)               not null comment '活动玩法（默认/C端）',
    daily_hand_price      decimal(16, 4)             not null comment '日常到手价（默认/C端）',
    postage               varchar(32)                not null comment '邮费（默认/C端）',
    contrast              varchar(128)               null comment '与原策略对比（默认/C端）',
    daily_page_price_b    decimal(16, 4)             null comment '日常页面价（B端）',
    activity_play_b       varchar(128)               null comment '活动玩法（B端）',
    daily_hand_price_b    decimal(16, 4)             null comment '日常到手价（B端）',
    contrast_b            varchar(128)               null comment '与原策略对比（B端）',
    sale_page_price       decimal(16, 4)             null comment '大促页面价',
    sale_activity_play    varchar(128)               null comment '大促玩法',
    sale_daily_hand_price decimal(16, 4)             null comment '大促到手价',
    packaging_form        tinyint unsigned default 0 null comment '包装形态（字典：ec_oms_packaging_form）1-全袋，2-瓶+袋，3-全瓶，4-整箱，5-其他',
    remark                varchar(512)               null comment '备注',
    del_flag              tinyint unsigned default 0 null comment '删除标识 0-有效 1-删除'
)
    comment '产品价格策略明细表';

create index idx_strategy_code
    on ec_oms_product_price_strategy_detail (strategy_code);

create table ec_oms_product_price_structure_base
(
    price_id         bigint unsigned auto_increment comment '主键Id'
        primary key,
    client_code      varchar(15)                                null comment '客户编号',
    price_type       tinyint unsigned                           null comment '价格类型  1-体系价格  2-特殊价格',
    start_time       timestamp                                  null comment '生效时间',
    end_time         timestamp                                  null comment '失效时间',
    product_code     bigint unsigned                            not null comment '产品编号',
    price            decimal(16, 4)                             not null comment '产品价格',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名字',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标志  1-是  0-否'
)
    comment 'B2B客户产品价格管理';

create index idx_client
    on ec_oms_product_price_structure_base (client_code);

create index idx_client_product
    on ec_oms_product_price_structure_base (client_code, product_code);

create index idx_end_time
    on ec_oms_product_price_structure_base (end_time);

create index idx_star_time
    on ec_oms_product_price_structure_base (start_time);

create table ec_oms_product_review_jd
(
    review_id        int(10) auto_increment comment '主键自增'
        primary key,
    shop_code        int(10)                             not null comment '店铺编号',
    comment_id       varchar(40)                         not null comment '评价信息主键',
    skuid            bigint unsigned                     not null comment '店铺商品ID',
    nickName         varchar(30)                         null comment '评价者昵称',
    score            varchar(10)                         null comment '评价结果/等级',
    creationTime     timestamp                           null comment '评价创建时间',
    content          varchar(500)                        null comment '评价内容',
    reply_count      int unsigned                        null comment '回复数',
    status           varchar(5)                          null comment '评价状态',
    useful_count     int unsigned                        null comment '点赞数',
    is_vender_reply  varchar(5)                          null comment '商家是否回复',
    imiage_status    varchar(300)                        null comment '晒单审核状态',
    pin              varchar(300)                        null comment '用户pin',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    constraint idx_comment_id
        unique (comment_id)
)
    comment '京东商品信息评价主表';

create table ec_oms_product_review_jd_images
(
    id        int unsigned not null comment '晒单id'
        primary key,
    review_id int unsigned not null comment '评价信息主表外键',
    imgUrl    varchar(300) null comment '晒单图片地址',
    imgTitle  varchar(300) null comment '晒单主题'
)
    comment '子表明细2 京东晒单';

create table ec_oms_product_review_jd_reply
(
    replyId      bigint unsigned not null comment '回复 ID 明细主键'
        primary key,
    review_id    int unsigned    not null comment '评价信息主表外键',
    content      varchar(500)    null comment '回复内容',
    creationTime timestamp       null comment '创建时间',
    nickName     varchar(50)     null comment '回复用户昵称'
)
    comment '子表明细1 京东回复';

create table ec_oms_product_review_tmall
(
    shop_code        int unsigned                        not null comment '店铺编号',
    num_iid          bigint unsigned                     not null comment '店铺商品ID',
    tid              bigint unsigned                     not null comment '交易ID',
    oid              bigint unsigned                     not null comment '订单ID',
    role             varchar(8)                          null comment '评价者角色',
    nick             varchar(30)                         null comment '评价者昵称',
    result           varchar(10)                         null comment '评价结果/等级',
    created          timestamp                           not null comment '评价创建时间',
    rated_nick       varchar(30)                         null comment '被评价者昵称',
    content          varchar(500)                        null comment '评价内容',
    reply            varchar(500)                        null comment '评价解释',
    valid_score      varchar(5)                          null comment '评价是否记分可取值：true(参与记分)和false(不参与记分)',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    primary key (oid, created)
)
    comment '天猫商品信息评价表';

create table ec_oms_product_sub_base
(
    id               int unsigned auto_increment comment '主键'
        primary key,
    product_code     bigint unsigned                            not null comment '单品编号，对应ec_oms_product_base表中product_type=1的商品编号',
    package_code     bigint unsigned                            not null comment '套餐编号，对应ec_oms_product_base表中product_type=2的商品编号',
    product_num      smallint unsigned                          null comment '套餐中产品数量',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '商品(套餐)明细主数据表';

create index idx_luptime
    on ec_oms_product_sub_base (last_update_time);

create index idx_package_code
    on ec_oms_product_sub_base (package_code);

create index idx_product_code
    on ec_oms_product_sub_base (product_code);

create table ec_oms_refund_tmall
(
    refundId      bigint unsigned     not null comment '退款单编号'
        primary key,
    tid           bigint unsigned     null comment '淘宝交易单号',
    status        varchar(32)         null comment '退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
    sellerNick    varchar(20)         null comment '卖家店铺名称',
    orderStatus   varchar(64)         null comment '退款对应的订单交易状态',
    refundPhase   varchar(16)         null comment '退款阶段，可选值：onsale/aftersale',
    title         varchar(40)         null comment '产品名称',
    outerId       varchar(32)         null comment '商家编号',
    numIid        bigint(21) unsigned null comment '申请退款的商品数字编号',
    price         decimal(8, 2)       null comment '退货价格',
    num           int unsigned        null comment '购买数量',
    refundFee     decimal(8, 2)       null comment '退还金额(退还给买家的金额)。精确到2位小数;单位:元',
    totalFee      decimal(8, 2)       null comment '交易总金额',
    oid           bigint              null comment '子订单号。如果是单笔交易oid会等于tid',
    hasGoodReturn varchar(16)         null comment '买家是否需要退货。可选值:true(1-是),false(0-否)',
    alipayNo      varchar(64)         null comment '支付宝单号',
    advanceStatus tinyint unsigned    null comment '退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;',
    csStatus      tinyint unsigned    null comment '不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成 4;客服主管复审失败5;客服处理完成6;',
    goodStatus    varchar(32)         null comment '货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)',
    payment       decimal(8, 2)       null comment '支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元',
    reason        varchar(128)        null comment '退款原因',
    desception    varchar(512)        null comment '退款说明',
    modified      timestamp           null comment '修改时间',
    created       timestamp           null comment '创建时间'
)
    comment '天猫退款单信息';

create index idx_tid
    on ec_oms_refund_tmall (tid);

create table ec_oms_refund_tmall_gongxiao
(
    sub_order_id       bigint       not null comment '分销单id'
        primary key,
    refund_create_time timestamp    null comment '创建时间',
    refund_status      int(10)      null comment '退款单状态',
    supplier_nick      varchar(32)  null comment '供销商名称',
    distributor_nick   varchar(32)  null comment '销售商名称',
    modified           datetime     null comment '修改时间',
    jdp_hashcode       varchar(128) null comment '数据标识',
    jdp_response       mediumtext   null comment '售后单数据',
    jdp_modified       timestamp    null comment '订单同步修改时间',
    jdp_created        timestamp    null comment '订单同步创建时间'
)
    comment '天猫供销抓退款单记录 仅做保存使用';

create index ind_jdp_fx_refund_jdp_modified
    on ec_oms_refund_tmall_gongxiao (jdp_modified);

create index ind_jdp_fx_refund_modified
    on ec_oms_refund_tmall_gongxiao (modified);

create index ind_jdp_fx_refund_supplier_nick_jdp_modified
    on ec_oms_refund_tmall_gongxiao (supplier_nick, jdp_modified);

create index ind_jdp_fx_refund_supplier_nick_modified
    on ec_oms_refund_tmall_gongxiao (supplier_nick, modified);

create table ec_oms_retention_product_inventory_warning
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    content          varchar(64)      default ''                not null comment '通知内容',
    warning_num      int(11) unsigned default 0                 null comment '库存预警值',
    is_send_operator tinyint(3)       default 1                 null comment '是否通知策略更新人，1-是，0-否',
    operator_id      int                                        null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '呆滞品库存预警信息表';

create table ec_oms_retention_product_inventory_warning_push_user
(
    id         int unsigned auto_increment comment '主键ID'
        primary key,
    warning_id int(11) unsigned           not null comment '呆滞品库存预警信息id 关联ec_oms_retention_product_inventory_wraning',
    user_code  varchar(50)                null comment '推送人唯一标识',
    user_name  varchar(20)                null comment '推送人名称',
    email      varchar(50)                null comment '邮箱',
    org_name   varchar(255)               null comment '部门名称',
    del_flag   tinyint unsigned default 0 not null comment '删除标记@1-是 0-否'
)
    comment '呆滞品库存预警推送用户信息表';

create index idx_warning_id
    on ec_oms_retention_product_inventory_warning_push_user (warning_id);

create table ec_oms_retention_product_strategy
(
    id                  int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code       bigint unsigned                            not null comment '策略编号',
    strategy_name       varchar(64)                                not null comment '策略名称',
    time_type           int unsigned     default 0                 not null comment '策略时间类型,0付款时间',
    strategy_begin_time timestamp        default CURRENT_TIMESTAMP not null comment '策略开始时间',
    strategy_end_time   timestamp        default CURRENT_TIMESTAMP not null comment '策略结束时间',
    product_code        bigint                                     not null comment '商品编号',
    batch_begin_time    date                                       null comment '批次开始时间',
    batch_end_time      date                                       null comment '批次结束时间',
    buyer_range         tinyint(3)       default 0                 not null comment '买家范围（字典ec_oms_retention_product_buyer_range） 0-全部 1-指定部分买家',
    is_stop             tinyint(3)       default 0                 not null comment '是否停用（ec_oms_yes） 1-是 0-否',
    is_split            tinyint(3)       default 0                 not null comment '是否拆单（ec_oms_yes） 1-是 0-否',
    split_action        varchar(10)      default ''                null comment '拆单动作（字典ec_oms_retention_product_split_action） 1-自动拆套装品 2-自动拆呆滞品(多个以逗号分隔)',
    operator_id         int                                        null comment '操作人编号',
    operator_name       varchar(32)                                null comment '操作人名称',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag            tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '呆滞品策略表';

create index idx_begin_time
    on ec_oms_retention_product_strategy (strategy_begin_time);

create index idx_end_time
    on ec_oms_retention_product_strategy (strategy_end_time);

create index idx_strategy_code
    on ec_oms_retention_product_strategy (strategy_code);

create index idx_strategy_name
    on ec_oms_retention_product_strategy (strategy_name);

create table ec_oms_retention_product_strategy_buyer_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '所属策略编号',
    buyer_id         varchar(64)                                null comment '指定买家ID',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '呆滞品策略买家信息表';

create index idx_strategy_code
    on ec_oms_retention_product_strategy_buyer_sub (strategy_code);

create table ec_oms_retention_product_strategy_record
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC订单编号，关联ec_oms_order',
    strategy_code    bigint unsigned                            not null comment '策略编号，关联ec_oms_retention_product_strategy',
    product_code     bigint unsigned                            not null comment '商品编号',
    use_num          int unsigned                               null comment '使用数量',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '订单应用呆滞品策略明细表';

create index idx_order_code
    on ec_oms_retention_product_strategy_record (order_code);

create index idx_strategy_code
    on ec_oms_retention_product_strategy_record (strategy_code);

create table ec_oms_retention_product_strategy_shop_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '所属策略编号',
    shop_code        int(30) unsigned                           not null comment '店铺编号',
    shop_name        varchar(64)                                not null comment '店铺名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '呆滞品策略店铺信息表';

create index idx_shop_code
    on ec_oms_retention_product_strategy_shop_sub (shop_code);

create index idx_strategy_code
    on ec_oms_retention_product_strategy_shop_sub (strategy_code);

create table ec_oms_retention_product_strategy_storehouse_express_sub
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code    bigint                               not null comment '所属策略编号',
    storehouse_code  int(10)                              not null comment '仓库编号',
    provinces        varchar(1024)                        not null comment '省份编号，多个逗号分隔',
    province_names   varchar(1024)                        not null comment '省份名称，多个逗号分隔',
    express_code     int(10)                              null comment '快递',
    express_name     varchar(32)                          null comment '快递公司名称',
    create_time      timestamp  default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint(3) default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '呆滞品策略仓库省份快递信息表';

create index idx_strategy_code
    on ec_oms_retention_product_strategy_storehouse_express_sub (strategy_code);

create table ec_oms_retention_product_strategy_storehouse_sub
(
    id                  int unsigned auto_increment comment '主键id'
        primary key,
    strategy_code       bigint                               not null comment '所属策略编号',
    storehouse_code     int(10)                              not null comment '仓库编号',
    storehouse_name     varchar(32)                          null comment '仓库名称',
    retention_count     int(10)    default 0                 not null comment '呆滞品sku数量',
    retention_use_count int(10)    default 0                 not null comment '呆滞品sku已使用数量',
    provinces           varchar(1024)                        null comment '【2c-3.1弃用】省份编号，多个逗号分隔',
    province_names      varchar(1024)                        null comment '【2c-3.1弃用】省份名称，多个逗号分隔',
    express_code        int(10)                              null comment '【2c-3.1弃用】快递',
    express_name        varchar(32)                          null comment '【2c-3.1弃用】快递公司名称',
    is_push             tinyint(3) default 0                 null comment '是否已推送 1-是 0-否',
    fail_num            int(10)    default 0                 null comment '推送失败次数',
    create_time         timestamp  default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time    timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag            tinyint(3) default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '呆滞品策略仓库信息表';

create index idx_strategy_code
    on ec_oms_retention_product_strategy_storehouse_sub (strategy_code);

create table ec_oms_risk_email_reminder_time
(
    id                 int(10) auto_increment comment '主键ID'
        primary key,
    template_id        int(10)              null comment '邮件模板关联表id（ec_oms_risk_email_template）',
    reminder_time      varchar(32)          null comment '提醒时间 生成规则 一级下拉框值_二级值，价格风控汇总时为三级关联',
    next_reminder_time timestamp            null comment '下一次提醒时间',
    del_flag           tinyint(3) default 0 null comment '删除标记，（字典 ec_oms_yes_no）1-是，0-否'
)
    comment '风险邮件提醒时间表';

create index idx_template_email
    on ec_oms_risk_email_reminder_time (template_id);

create table ec_oms_risk_email_template
(
    id               int(10) auto_increment comment '主键ID'
        primary key,
    mail_title       varchar(128)                         null comment '邮件标题',
    shop_codes       varchar(512)                         null comment '店铺编号，多个以逗号隔开',
    risk_types       varchar(32)                          null comment '风险名称，多个以逗号隔开',
    need_sms_remind  tinyint(3) default 0                 null comment '是否需要短信提醒，（字典 ec_oms_yes_no）1-是，0-否',
    need_qw_remind   tinyint(3) default 0                 null comment '是否需要企业微信提醒，（字典 ec_oms_yes_no）1-是，0-否',
    creator_id       int                                  null comment '创建人编号',
    creator_name     varchar(32)                          null comment '创建人名称',
    create_time      timestamp  default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int                                  null comment '操作人编号',
    operator_name    varchar(32)                          null comment '操作人名称',
    last_update_time timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最近更新时间',
    del_flag         tinyint(3) default 0                 null comment '删除标记，（字典 ec_oms_yes_no）1-是，0-否'
)
    comment '风险邮件模板表';

create table ec_oms_risk_email_template_remind_config
(
    id                   int unsigned auto_increment comment '主键Id'
        primary key,
    qw_interval_time     smallint(3) unsigned                       null comment '企微通知间隔时间',
    qw_min_interval_time smallint(3) unsigned                       null comment '企微通知间隔时间(价格极低)',
    qw_content           varchar(50)                                null comment '企微通知内容，为null则取字典(ec_oms_risk_email_template_remind_config)qw默认通知内容',
    qw_count             int(8) unsigned  default 0                 not null comment '触发企微首次推送的单量值',
    qw_min_count         int(8) unsigned  default 0                 not null comment '触发企微首次推送的单量值(价格极低)',
    sms_interval_time    smallint(3) unsigned                       null comment '短信通知间隔时间',
    sms_content          varchar(50)                                null comment '短信通知内容(业务上无法更改，字段备用与记录)，使用自动短信模板(风险订单处理提醒短信)的内容',
    sms_count            int(8) unsigned  default 0                 not null comment '触发短信首次推送的单量值',
    creator_id           int unsigned                               null comment '创建人编号',
    creator_name         varchar(32)                                null comment '创建人名称',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id          int                                        null comment '操作人编号',
    operator_name        varchar(32)                                null comment '操作人名称',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最近更新时间',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '风险邮件模板企微和短信通知配置表';

create table ec_oms_risk_order_import
(
    id                     int(10) auto_increment comment '主键id'
        primary key,
    import_code            int(10)       null comment '标识上传订单的批次号',
    shop_order_id          varchar(64)   null comment '店铺订单编号',
    shop_code              varchar(64)   null comment '店铺编号',
    is_risk                varchar(64)   null comment '是否有风险',
    risk_tips              varchar(64)   null comment '风险提示',
    risk_batch             varchar(64)   null comment '风险批次序号',
    risk_reason            varchar(256)  null comment '风险原因',
    import_operation_hint  varchar(1024) null comment '导入订单失败原因',
    risk_order_import_time timestamp     null comment '风险订单导入时间',
    risk_control           tinyint(3)    null
)
    comment '主数据批量冻结/取消冻结导入临时表';

create table ec_oms_risk_reason_import
(
    id                      int(10) auto_increment comment '主键id'
        primary key,
    order_code              decimal(30)          null comment 'EC订单编号',
    import_code             int(10)              null comment '标识上传订单的批次号',
    shop_order_id           varchar(64)          null comment '店铺订单编号',
    shop_code               varchar(64)          null comment '店铺编号',
    is_risk                 varchar(64)          null comment '是否有风险',
    risk_tips               varchar(64)          null comment '风险提示',
    risk_batch              varchar(64)          null comment '风险批次序号',
    risk_reason             varchar(256)         null comment '风险原因',
    need_persuade           tinyint(3) default 0 null comment '是否需要劝退，（字典 ec_oms_yes_no）1-是，0-否',
    register_status         varchar(32)          null comment '登记状态',
    import_operation_hint   varchar(1024)        null comment '导入订单失败原因',
    risk_reason_import_time timestamp            null comment '风险订单导入时间'
)
    comment '导入风险原因表';

create table ec_oms_risk_send_person
(
    id          int(10) auto_increment comment '主键ID'
        primary key,
    person_type tinyint(3)           null comment '数据类型 字典（ec_oms_risk_person_type）0-收件人 1-抄送人',
    template_id int(10)              null comment '邮件模板关联表id（ec_oms_risk_email_template）',
    user_code   int(10)              null comment '员工编号',
    user_name   varchar(32)          null comment '员工姓名',
    email       varchar(32)          null comment '邮箱',
    del_flag    tinyint(3) default 0 null comment '删除标记，（字典 ec_oms_yes_no）1-是，0-否'
)
    comment '风险邮件发送人表';

create index idx_type_relate
    on ec_oms_risk_send_person (person_type, template_id);

create table ec_oms_risk_shop_prd_plan
(
    plan_code         bigint                                     not null comment '策略表主键'
        primary key,
    plan_name         varchar(32)                                not null comment '策略名字',
    plan_start_time   timestamp                                  null comment '策略开始时间',
    plan_end_time     timestamp                                  null comment '策略结束时间',
    shop_code         int unsigned     default 222               null comment '店铺编号（关联ec_oms_channel_shop_base）',
    product_code      bigint unsigned                            not null comment '商品编号（关联ec_oms_product_base）',
    discount_rate     decimal(5, 2)    default 0.00              not null comment '商品折扣率监控值，保留2位小数(如12.34%，存值为12.34)',
    min_discount_rate decimal(5, 2)    default 0.00              not null comment '商品折扣率保底监控值，保留2位小数(如12.34%，存值为12.34)',
    creator_id        int unsigned                               null comment '创建人编号',
    creator_name      varchar(32)                                null comment '创建人名称',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id       int unsigned                               null comment '操作人编号',
    operator_name     varchar(32)                                null comment '操作人名称',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag          tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '商品折扣风控策略表';

create index idx_pcode_del
    on ec_oms_risk_shop_prd_plan (product_code, del_flag)
    comment '商品风控折扣匹配索引';

create table ec_oms_risk_shop_prd_plan_sub
(
    id               int(10) auto_increment comment '主键'
        primary key,
    plan_code        bigint                              not null comment '策略编号（关联ec_oms_risk_shop_prd_plan策略编号）',
    shop_code        int(10)                             not null comment '店铺编号（关联ec_oms_channel_shop_base）',
    creator_id       int unsigned                        null comment '创建人编号',
    creator_name     varchar(32)                         null comment '创建人名称',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                        null comment '操作人编号',
    operator_name    varchar(32)                         null comment '操作人名称',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '商品折扣风控策略关联店铺表';

create index idx_plan_code
    on ec_oms_risk_shop_prd_plan_sub (plan_code);

create table ec_oms_risk_template_reminder_time
(
    id                 int(10) auto_increment comment '主键ID'
        primary key,
    template_id        int(10)              null comment '风险模板关联表id（ec_oms_risk_email_template）',
    shop_code          int(10)              null comment '店铺编号',
    is_push            tinyint(3) default 0 null comment '是否已推送过一次 1-是 0-否',
    type               tinyint unsigned     not null comment '提醒类型，1-企微，2-短信',
    next_reminder_time timestamp            null comment '下一次提醒时间',
    del_flag           tinyint(3) default 0 null comment '删除标记，（字典 ec_oms_yes_no）1-是，0-否'
)
    comment '风险模板企微和短信提醒时间表';

create index idx_template_shop
    on ec_oms_risk_template_reminder_time (template_id, shop_code);

create table ec_oms_scapling_order
(
    order_code       decimal(30) unsigned                       not null comment 'EC订单编号'
        primary key,
    rule_desc        varchar(255)                               null comment '判别为黄牛的规则描述',
    deal_flag        tinyint unsigned default 0                 null comment '处理标识@1-是，0-否',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '黄牛订单表-存储算法判别为黄牛订单的数据';

create index idx_create_time
    on ec_oms_scapling_order (create_time);

create index idx_last_update_time
    on ec_oms_scapling_order (last_update_time);

create table ec_oms_scapling_plan
(
    plan_code        int unsigned auto_increment comment '策略编码'
        primary key,
    strategy_code    varchar(32)                                null comment '系统自动生成策略编号',
    plan_name        varchar(50)                                null comment '策略名称',
    shop_code        int unsigned                               null comment '店铺编码',
    plan_type        tinyint unsigned default 1                 null comment '策略类型@1-订单2-商品',
    plan_status      tinyint unsigned default 1                 null comment '策略状态@1-启用0-停用',
    plan_start_date  timestamp                                  null comment '有效开始日期',
    plan_end_date    timestamp                                  null comment '有效截止日期',
    threshold_0      int(10)          default 1                 null comment '最小阈值',
    threshold_1      int(10)          default 1                 null comment '中间阈值',
    threshold_2      int(10)          default 1                 null comment '最大阈值',
    creator_id       int(11) unsigned                           null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标记，1-是，0-否',
    operator_id      int                                        null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    threshold_risk   int(10)                                    null comment '推风险阈值'
)
    comment '异常订单(黄牛订单)策略配置表';

create table ec_oms_scapling_product_base
(
    plan_code        int unsigned auto_increment comment '策略编码'
        primary key,
    strategy_code    varchar(32)                                null comment '系统自动生成策略编号',
    product_code     bigint unsigned                            not null comment '商品编码',
    shop_code        int unsigned                               not null comment '店铺编码',
    plan_status      tinyint unsigned default 1                 not null comment '策略状态@1-启用0-停用',
    plan_start_date  timestamp                                  null comment '有效开始日期',
    plan_end_date    timestamp                                  null comment '有效截止日期',
    creator_id       int(11) unsigned                           null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag         tinyint unsigned                           null comment '删除标记，1-是，0-否',
    operator_id      int(11) unsigned                           null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '异常订单(黄牛订单)过滤商品表';

create index idx_product_code
    on ec_oms_scapling_product_base (product_code);

create index idx_shop_code
    on ec_oms_scapling_product_base (shop_code);

create table ec_oms_scapling_risk_config
(
    id                       int(10) auto_increment comment '主键id'
        primary key,
    channel_codes            varchar(1024)              null comment '渠道编号',
    shop_codes               varchar(1024)              null comment '店铺编号',
    order_status             tinyint(3)                 null comment '订单状态',
    risk_action              varchar(64)                null comment '有风险系统动作',
    is_exc                   tinyint(3)                 null comment '是否标记异常 是-1 否-0',
    is_add_work_order        tinyint(3)                 null comment '没有任何售后工单，是否新增售后工单 是-1 否-0',
    is_update_work_order     tinyint(3)                 null comment '已有售后工单，是否新增售后工单 是-1 否-0*',
    is_update_add_work_order tinyint(3)                 null comment '已有售后工单，是否更新售后工单 是-1 否-0',
    issue_subject            int(10)                    null comment '问题主体/一级问题',
    issue_type               int(10)                    null comment '问题类型/二级问题',
    issue_reason_code        int unsigned               null comment '问题原因编号',
    responsible_party        tinyint(3)                 null comment '责任方',
    aftersale_status         tinyint(3)                 null comment '售后处理状态',
    reply_progress           varchar(512)               null comment '回复进度',
    is_risk                  tinyint(3)                 null comment '是否有风险',
    remark                   varchar(64)                null comment '客服备注',
    creator_id               int(10)                    null comment '创建人编号',
    creator_name             varchar(32)                null comment '创建人名称',
    create_time              timestamp                  null comment '创建时间',
    del_flag                 tinyint unsigned default 0 not null comment '删除标记，1-是，0-否'
)
    comment '黄牛风险自动配置';

create table ec_oms_schedule
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    schedule_date    date                                       not null comment '排班日期',
    remark           varchar(200)                               null comment '备注',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '排班管理表';

create index idx_schedule_date
    on ec_oms_schedule (schedule_date);

create table ec_oms_schedule_sub
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    group_code       int unsigned                               not null comment '客服组编号（关联表ec_oms_customer_service_group.group_code）',
    customer_code    int unsigned                               not null comment '客服编号(关联：ec_oms_customer_service.customer_code)',
    schedule_date    date                                       not null comment '排班日期',
    classes_code     int unsigned                               not null comment '班次编号',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '排班管理明细表';

create index idx_schedule_date
    on ec_oms_schedule_sub (schedule_date);

create table ec_oms_self_help_link_config
(
    id               int unsigned auto_increment comment '自增主键'
        primary key,
    link_type        tinyint unsigned default 1                 not null comment '链接类型（字典ec_oms_self_help_link_type，@1-物流信息自助查）',
    title            varchar(100)                               not null comment '链接标题',
    short_link       varchar(128)                               not null comment '短链',
    remark           varchar(200)     default ''                null comment '备注',
    shop_code        int unsigned     default 0                 not null comment '店铺编号',
    start_time       timestamp                                  not null comment '生效时间',
    end_time         timestamp                                  not null comment '失效时间',
    version          varchar(32)                                not null comment 'UUID版本号',
    data_type        tinyint(3)       default 0                 not null comment '数据维度 0-客户维度 1-店铺维度',
    creator_id       int                                        null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int                                        null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标记，1-是，0-否'
)
    comment '客户自助工具链接配置';

create index idx_time
    on ec_oms_self_help_link_config (start_time, end_time)
    comment '时间索引';

create table ec_oms_self_help_link_detail
(
    id           int unsigned auto_increment comment '自增主键'
        primary key,
    config_id    int(10)                                null comment '关联配置id',
    shop_code    int unsigned default 0                 not null comment '店铺编号',
    client_code  varchar(15)                            null comment '客户编号',
    creator_id   int                                    null comment '创建人编号',
    creator_name varchar(32)                            null comment '创建人名称',
    create_time  timestamp    default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '客户自助工具链接配置扩展表';

create index idx_query_condition
    on ec_oms_self_help_link_detail (config_id, client_code)
    comment '查询索引';

create table ec_oms_self_help_query_log
(
    id                     bigint unsigned auto_increment comment '自增id'
        primary key,
    config_id              int unsigned                           null comment '配置id',
    title                  varchar(100) default ''                not null comment '链接标题',
    open_id                varchar(64)  default ''                not null comment '用户信息(公众号openid)',
    receiver_mobile        varchar(20)  default ''                not null comment '收货人手机号码',
    receiver_mobile_cipher varchar(88)                            null comment '收货人手机号码',
    shop_order_id          varchar(64)  default ''                not null comment '店铺订单编号',
    create_time            timestamp    default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '客户自助物流查询埋点日志表';

create index idx_time
    on ec_oms_self_help_query_log (create_time)
    comment '时间索引';

create index idx_title
    on ec_oms_self_help_query_log (title)
    comment '标题索引';

create table ec_oms_self_help_service_order
(
    id                 bigint unsigned auto_increment comment '自增主键'
        primary key,
    order_code         decimal(30) unsigned                   not null comment 'EC订单编号',
    waybill_code       varchar(30)                            not null comment '快递单号',
    shop_order_id      varchar(64)                            not null comment '店铺订单编号',
    shop_code          int unsigned                           not null comment '店铺编号',
    work_order_code    bigint unsigned                        not null comment '售后工单编号',
    package_issue_code int unsigned                           not null comment '包裹问题编号',
    package_issue_desc varchar(500)                           not null comment '包裹问题描述',
    receive_status     tinyint unsigned                       not null comment '应用客户收货情况（字典ec_oms_packege_issue_receive_status 1-未收到货 2-已收到货 3-已拒收）',
    handle_method      tinyint unsigned                       not null comment '处理方式（字典ec_oms_packege_issue_handle_method 1-联系快递核实 2-催促快递派送 3-要求送货上门 4-部分退款补偿 5-破损产品补发 6-部分退款补偿 7-换货 8-补发 9-其他）',
    handle_method_desc varchar(500) default ''                null comment '处理方式描述',
    create_time        timestamp    default CURRENT_TIMESTAMP not null comment '创建时间',
    constraint idx_unique_code
        unique (order_code, waybill_code) comment '订单编号索引'
)
    comment '客户自助服务单';

create table ec_oms_self_help_service_order_complement
(
    id               bigint unsigned auto_increment comment '自增主键'
        primary key,
    service_order_id bigint unsigned                     not null comment '服务单id',
    complement_desc  varchar(500)                        not null comment '问题补充描述',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '客户自助服务单问题补充扩展表';

create index idx_create_time
    on ec_oms_self_help_service_order_complement (create_time)
    comment '创建时间索引';

create index idx_service_order_id
    on ec_oms_self_help_service_order_complement (service_order_id)
    comment '服务单id索引';

create table ec_oms_sms_account_base
(
    account_code      int unsigned                               not null comment '账号编号'
        primary key,
    account_name      varchar(20)                                not null comment '短信账号名称',
    sms_account       varchar(50)                                not null comment '短信账号',
    sms_password      varchar(50)                                not null comment '短信账号密码',
    is_allow_for_auto tinyint unsigned default 1                 not null comment '是否可用于自动短信（字典：ec_oms_yes_no）@0-否 1-是',
    remark            varchar(200)                               null comment '备注',
    is_frozen         tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    creator_id        int unsigned                               null comment '创建人编号',
    creator_name      varchar(32)                                null comment '创建人名称',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id       int unsigned                               null comment '操作人编号',
    operator_name     varchar(32)                                null comment '操作人名称',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '短信账号主数据表';

create table ec_oms_sms_management
(
    id                  bigint unsigned auto_increment comment '主键ID'
        primary key,
    phone_number        varchar(20)                                not null comment '手机号码',
    phone_number_cipher varchar(88)                                null comment '手机号码',
    receive_name        varchar(32)                                null comment '收货人姓名',
    receive_name_cipher varchar(152)                               null comment '收货人姓名',
    content             varchar(1024)                              null comment '最近内容',
    handle_status       tinyint unsigned default 0                 not null comment '处理状态（字典：ec_oms_handle_status）@0-未处理1-已处理',
    receive_send_status tinyint unsigned                           null comment '收发状态（字典：ec_oms_receive_send_status）@0-待回复1-已发送',
    send_sms_status     tinyint unsigned default 1                 not null comment '短信发送状态（字典：ec_oms_send_sms_status）@1-成功，0-失败',
    send_time           timestamp                                  null comment '发送时间',
    receive_time        timestamp                                  null comment '接收时间',
    remark              varchar(200)                               null comment '备注',
    operator_id         int unsigned                               null comment '操作人编号',
    operator_name       varchar(32)                                null comment '操作人名称',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    shop_code           varchar(10)                                null comment '店铺编号',
    shop_name           varchar(50)                                null comment '店铺名称'
)
    comment '短信收发管理主表';

create index idx_phone_number
    on ec_oms_sms_management (phone_number);

create index idx_receive_time
    on ec_oms_sms_management (receive_time);

create index idx_send_time
    on ec_oms_sms_management (send_time);

create table ec_oms_sms_management_sub
(
    id                   bigint unsigned auto_increment comment '主键ID'
        primary key,
    phone_number         varchar(20)                                not null comment '手机号码',
    phone_number_cipher  varchar(88)                                null comment '手机号码',
    receive_name         varchar(32)                                null comment '收货人姓名',
    receive_name_cipher  varchar(152)                               null comment '收货人姓名',
    content              varchar(1024)                              null comment '短信内容',
    is_customer_send     tinyint unsigned default 0                 not null comment '是否客户发送（字典：ec_oms_yes_no）@0-否 1-是',
    is_staff_send        tinyint unsigned default 0                 not null comment '是否我司发送（字典：ec_oms_yes_no）@0-否 1-是',
    receive_send_time    timestamp                                  not null comment '收发时间',
    send_sms_status      tinyint unsigned default 1                 not null comment '短信发送状态（字典：ec_oms_send_sms_status）@1-成功，0-失败',
    send_sms_fail_resaon varchar(200)                               null comment '短信发送失败原因',
    business_type        tinyint unsigned                           null comment '业务类型，枚举',
    business_code        varchar(32)                                null comment '业务流水号',
    creator_id           int unsigned                               null comment '创建人编号',
    creator_name         varchar(32)                                null comment '创建人名称',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    template_type        tinyint unsigned                           null comment '模板分类/自动短信分类（字典：ec_oms_template_type）',
    template_code        int unsigned                               null comment '模板编码'
)
    comment '短信收发管理子表';

create index idx_business_code
    on ec_oms_sms_management_sub (business_code);

create index idx_phone_number
    on ec_oms_sms_management_sub (phone_number);

create index idx_send_sms_status
    on ec_oms_sms_management_sub (send_sms_status);

create table ec_oms_sms_manual_config
(
    id                     int unsigned auto_increment comment '主键ID'
        primary key,
    verify_account_code    int unsigned                               null comment '审单短信账号编号',
    aftersale_account_code int unsigned                               null comment '售后短信账号编号',
    operator_id            int unsigned                               null comment '操作人编号',
    operator_name          varchar(32)                                null comment '操作人名称',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag               tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '人工短信配置关系表';

create table ec_oms_sms_template
(
    template_code    int unsigned                               not null comment '模板编码'
        primary key,
    business_type    tinyint unsigned default 1                 not null comment '业务类型@1-人工短信模板，2-自动短信模板',
    template_type    tinyint unsigned default 1                 not null comment '模板分类/自动短信分类（字典：ec_oms_template_type|ec_oms_auto_template_type）@1-审单，2-售后',
    template_name    varchar(50)                                not null comment '模板名称/自动短信名称',
    template_content varchar(200)                               not null comment '短信模板内容',
    is_frozen        tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    shop_codes       varchar(1024)                              null comment '关联的店铺编号，多个逗号分隔',
    multi_shop_codes varchar(1024)                              null comment '多个发货单号关联的店铺编号，多个逗号分隔',
    available_plat   varchar(1024)                              null comment '适用平台（字典：ec_oms_sms_plat）xuanwu玄武douyin抖音pingduoduo拼多多',
    pass_plat        varchar(1024)                              null comment '已通过平台(字典：ec_oms_sms_plat_pass)',
    unpass_plat      varchar(1024)                              null comment '未通过平台(字典：ec_oms_sms_plat_no_pass)',
    checking_plat    varchar(1024)                              null comment '审核中平台(字典：ec_oms_sms_plat_checking)',
    remark           varchar(200)                               null comment '备注',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '短信模板管理表';

create table ec_oms_sms_template_backup
(
    template_code    int unsigned                               not null comment '模板编码'
        primary key,
    business_type    tinyint unsigned default 1                 not null comment '业务类型@1-人工短信模板，2-自动短信模板',
    template_type    tinyint unsigned default 1                 not null comment '模板分类/自动短信分类（字典：ec_oms_template_type|ec_oms_auto_template_type）@1-审单，2-售后',
    template_name    varchar(50)                                not null comment '模板名称/自动短信名称',
    template_content varchar(200)                               not null comment '短信模板内容',
    is_frozen        tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）@0-否 1-是',
    shop_codes       varchar(1024)                              null comment '关联的店铺编号，多个逗号分隔',
    multi_shop_codes varchar(1024)                              null comment '多个发货单号关联的店铺编号，多个逗号分隔',
    available_plat   varchar(1024)                              null comment '适用平台（字典：ec_oms_sms_plat）xuanwu玄武douyin抖音pingduoduo拼多多',
    pass_plat        varchar(1024)                              null comment '已通过平台(字典：ec_oms_sms_plat_pass)',
    unpass_plat      varchar(1024)                              null comment '未通过平台(字典：ec_oms_sms_plat_no_pass)',
    checking_plat    varchar(1024)                              null comment '审核中平台(字典：ec_oms_sms_plat_checking)',
    remark           varchar(200)                               null comment '备注',
    creator_id       int unsigned                               null comment '创建人编号',
    creator_name     varchar(32)                                null comment '创建人名称',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int unsigned                               null comment '操作人编号',
    operator_name    varchar(32)                                null comment '操作人名称',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '短信模板管理表';

create table ec_oms_sms_template_plat_register
(
    id                     int(10) auto_increment comment '自增主键'
        primary key,
    ec_template_id         int(10)                             null comment 'EC短信模板CODE',
    ec_template_name       varchar(255)                        null comment 'EC短信模板名称',
    plat_code              varchar(255)                        null comment '平台代码',
    plat_template_id       varchar(50)                         null comment '模板ID',
    apply_template_id      varchar(30)                         null comment '模板申请单ID',
    plat_check_status      tinyint(3)                          null comment '平台审核状态  0审核中 1 已通过 2 未通过',
    update_time            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    plat_check_status_name varchar(255)                        null comment '平台审核状态名'
)
    comment '短信模板';

create table ec_oms_sms_template_plat_register_backup
(
    id                     int(10) auto_increment comment '自增主键'
        primary key,
    ec_template_id         int(10)                             null comment 'EC短信模板CODE',
    ec_template_name       varchar(255)                        null comment 'EC短信模板名称',
    plat_code              varchar(255)                        null comment '平台代码',
    plat_template_id       varchar(30)                         null comment '模板ID',
    apply_template_id      varchar(30)                         null comment '模板申请单ID',
    plat_check_status      tinyint(3)                          null comment '平台审核状态  0审核中 1 已通过 2 未通过',
    update_time            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    plat_check_status_name varchar(255)                        null comment '平台审核状态名'
);

create table ec_oms_task_log
(
    id          bigint unsigned auto_increment comment '主键ID'
        primary key,
    log_type    tinyint unsigned                    null comment '日志类型(字典 ec_oms_task_log_type @0-自动审单 1-AG退款自动处理 2-处理修改订单地址任务 3-SA退款自动处理 4-OMS物流回传平台 5-OMS发票回传平台 ...)',
    handle_num  int unsigned                        null comment '处理业务量',
    success_num int unsigned                        null comment '处理业务量',
    time_cost   double(10, 3) unsigned              null comment '耗时（秒）',
    ip          int unsigned                        null comment '服务器ip',
    start_time  timestamp                           null comment '执行开始时间',
    end_time    timestamp                           null comment '执行结束时间',
    create_time timestamp default CURRENT_TIMESTAMP not null comment '日志创建时间'
)
    comment '定时器执行日志表';

create index idx_time
    on ec_oms_task_log (start_time, end_time)
    comment '执行时间索引';

create table ec_oms_temporary_receipt_order
(
    receipt_code         bigint unsigned                            not null comment '收款单号'
        primary key,
    bill_num             int unsigned                               null comment '单据总数',
    receipt_total_amount decimal(10, 2) unsigned                    null comment '收款总金额',
    receipt_batch_no     bigint                                     null comment '同批收款单编号',
    remark               varchar(255)                               null comment '备注',
    verify_code          int unsigned                               null comment '审核人编码',
    verify_name          varchar(50)                                null comment '审核人名称',
    verify_time          datetime                                   null comment '审核时间',
    verify_opinion       tinyint unsigned default 2                 null comment '审核意见 0-不通过 1-通过 2-待审核',
    verify_explain       varchar(255)                               null comment '审核说明',
    creator_id           int unsigned                               null comment '创建人编号',
    creator_name         varchar(32)                                null comment '创建人名称',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id          int unsigned                               null comment '操作人编号',
    operator_name        varchar(32)                                null comment '操作人名称',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag             tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '临时收款单信息表';

create table ec_oms_temporary_receipt_order_sub
(
    id                     bigint unsigned auto_increment comment 'id'
        primary key,
    receipt_code           bigint unsigned                            null comment '收款单号',
    receipt_method         tinyint unsigned                           null comment '收款方式（字典：ec_oms_receipt_method） 0-对公转账 1-运费链接 2-虚拟充值',
    receipt_amount         decimal(10, 2) unsigned                    null comment '收款金额',
    transaction_serial_num varchar(32)                                null comment '交易流水号',
    order_code             varchar(32)                                null comment '运费链接订单号',
    pay_company            varchar(100)                               null comment '付款公司',
    pay_date               date                                       null comment '付款日期',
    receipt_bill_pic       varchar(255)                               null comment '回款单图片',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag               tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
)
    comment '临时收款单明细';

create index idx_receipt_code
    on ec_oms_temporary_receipt_order_sub (receipt_code);

create table ec_oms_tmall_product_base
(
    num_iid          bigint unsigned                            not null comment '商品id'
        primary key,
    outer_id         bigint                                     null comment '商家外部编码',
    price            decimal(10, 2) unsigned                    null comment '商品价格',
    num              int unsigned                               null comment '商品数量（库存）',
    sold_quantity    int unsigned                               null comment '商品销量',
    approve_status   tinyint unsigned                           null comment '商品上传后的状态 1-onsale出售中，2-instock库中',
    cid              bigint unsigned                            null comment '商品所属的叶子类目 id',
    has_discount     tinyint unsigned                           null comment '支持会员打折   1 true   0 false',
    freight_payer    varchar(10)                                null comment '运费承担方式',
    is_virtual       tinyint unsigned                           null comment '虚拟商品的状态字段 1 true   0 false',
    item_weigh       decimal(8, 4) unsigned                     null comment '商品的重量 单位为kg',
    item_size        varchar(50)                                null comment '表示商品的体积',
    post_fee         decimal(10, 2) unsigned                    null comment '运费',
    nick             varchar(20)                                null comment '店铺名称',
    shop_code        int unsigned                               null comment '店铺编号 由店铺名称匹对',
    has_sku          tinyint unsigned                           not null comment '是否在ec_oms_tmall_produc_sku_base有关联的sku列表  0-否  1-是',
    modified         timestamp                                  null comment '商品修改时间',
    list_time        timestamp                                  null comment '上架时间',
    delist_time      timestamp                                  null comment '下架时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment 'ec最后更新时间',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment 'ec创建时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    detail_url       varchar(128)                               null comment '商品url',
    express_fee      decimal(10, 2) unsigned                    null comment '快递费用',
    has_invoice      tinyint unsigned                           null comment '是否有发票  0-否  1-是',
    ems_fee          decimal(10, 2) unsigned                    null comment 'ems费用,'
)
    comment '天猫商品数据基本信息';

create table ec_oms_tmall_product_base_desc_text
(
    num_iid          bigint unsigned                            not null comment '商品id'
        primary key,
    title            varchar(256)                               null comment '商品标题',
    input_pids       varchar(256)                               null comment '用户自行输入的类目属性ID串',
    input_str        varchar(256)                               null comment '用户自行输入的子属性名和属性值',
    sell_point       varchar(256)                               null comment '商品卖点信息',
    pic_url          varchar(256)                               null comment '商品主图片',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    props_name       varchar(2000)                              null comment '属性名称'
)
    comment '天猫商品数据文本描述信息';

create table ec_oms_tmall_product_props_dict
(
    id               int(8) unsigned auto_increment comment '编号'
        primary key,
    num_iid          bigint unsigned                            not null comment '商品id',
    props_key        varchar(64)                                null comment '商品属性键名',
    props_value      varchar(128)                               null comment '商品属性键值',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '天猫商品属性映射表';

create table ec_oms_tmall_product_sku_base
(
    num_iid          bigint unsigned                            not null comment '关联的商品id',
    sku_id           bigint unsigned                            not null comment 'sku的id'
        primary key,
    outer_id         bigint unsigned                            null comment '商家外部编码',
    created          timestamp                                  null comment '创建时间',
    modified         timestamp                                  null comment 'sku最后修改日期',
    price            decimal(8, 2) unsigned                     null comment '属于这个sku的商品的价格',
    properties_name  varchar(256)                               null comment 'sku所对应的销售属性的中文名字串',
    quantity         int unsigned                               null comment '属于这个sku的商品的数量',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment 'ec最后更新时间',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment 'ec创建时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否',
    properties       varchar(256)                               null comment '销售属性组合字符串'
)
    comment '天猫商品数据sku基本信息';

create table ec_oms_update_plat_delievery_params
(
    id               int unsigned auto_increment comment '主键id'
        primary key,
    params_type      mediumint unsigned not null comment '查询条件类型',
    query_field_type varchar(32)        null comment '查询字段',
    query_field_desc varchar(255)       null comment '查询字段名称',
    query_args       varchar(64)        null comment '查询字段相对应的参数值',
    constraint Index_unq
        unique (params_type, query_field_type)
)
    comment '回传物流查询条件';

create table ec_oms_update_plat_delivery_fail_log
(
    order_code                decimal(30)                                not null comment '订单编号,主键',
    relate_shop_order_id      varchar(64)                                null comment '关联订单编号 原单',
    shop_code                 int unsigned                               not null comment '店铺来源编号',
    update_fail_handle_status tinyint unsigned default 0                 null comment '更新旗舰店状态失败处理状态  0-未处理  1-已处理',
    fail_reason               varchar(1024)                              null comment '失败原因',
    fail_times                tinyint unsigned default 1                 null comment '失败次数',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id               int                                        null comment '操作人编号',
    operator_name             varchar(32)                                null comment '操作人名称',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    callback_type             tinyint(3)                                 not null comment '回传类型',
    primary key (order_code, callback_type)
)
    comment '回传旗舰店物流信息的失败日志' charset = utf8;

create index idx_ltime_upstat
    on ec_oms_update_plat_delivery_fail_log (last_update_time, update_fail_handle_status)
    comment '优化回传失败订单查询索引';

create table ec_oms_vip_order_additional_info
(
    shop_order_id             varchar(64)  not null comment '店铺订单号'
        primary key,
    hebao_identification_code varchar(64)  null comment '合包标识号',
    create_transport          varchar(10)  null comment '是否可获取电子面单',
    ship_or_cancel            varchar(10)  null comment '是否可发货可取消',
    print                     varchar(255) null comment '是否可打印电子面单'
)
    comment '唯品会订单额外信息';

create table ec_oms_vip_order_details_additional_info
(
    id            int auto_increment comment 'ID'
        primary key,
    shop_order_id varchar(64)  not null comment '店铺订单号',
    outer_sku_id  varchar(64)  null comment 'skuid',
    outer_spu_id  varchar(64)  null comment 'spuid',
    transport_no  varchar(64)  null comment '合包标识号',
    carriers_name varchar(64)  null comment '是否可获取电子面单',
    carriers_code varchar(64)  null comment '是否可发货可取消',
    amount        int(10)      null comment '数量',
    print         varchar(255) null comment '是否可打印电子面单',
    stat          varchar(10)  null comment '状态：1.已获取运单，2.已发货'
)
    comment '唯品会订单明细额外信息';

create table ec_oms_vip_sku_stock
(
    id                int auto_increment comment 'id'
        primary key,
    shop_code         int(5)                              null comment '店铺编@旗舰店10017 家清10018',
    spu_id            varchar(32) charset utf8mb4         null comment '商品编码',
    sku_id            varchar(32) charset utf8mb4         null comment 'sku编码',
    product_style_num int                                 null comment '商品款号',
    product_code      int                                 null comment '商家sku',
    product_name      varchar(256) charset utf8mb4        null comment '商品名称',
    leaving_stock     int                                 null comment '库存总数',
    nationwide_stock  int                                 null comment '商家全国仓库存',
    nationwide_occupy int                                 null comment '商家全国仓库存已占用数',
    chongqing_stock   int                                 null comment '重庆电商仓',
    chongqing_occupy  int                                 null comment '重庆电商仓已占用数',
    kunshan_stock     int                                 null comment '昆山电商仓',
    kunshan_occupy    int                                 null comment '昆山电商已占用数',
    tianjin_stock     int                                 null comment '天津电商仓',
    tianjin_occupy    int                                 null comment '天津电商仓已占用数',
    guangzhou_stock   int                                 null comment '广州电商仓',
    guangzhou_occupy  int                                 null comment '广州电商仓已占用数',
    sku_safe_stock    int                                 null comment 'SKU安全库存值',
    sku_top_stock     int                                 null comment 'SKU库存峰值',
    del_flag          tinyint   default 0                 not null comment '删除标识0-不删除 1-删除',
    create_time       timestamp default CURRENT_TIMESTAMP not null comment '创建日期',
    update_time       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改日期'
)
    comment '唯品会商品库存表' collate = utf8mb4_danish_ci;

create index idx_mall_vip_sku_stock_sku_id
    on ec_oms_vip_sku_stock (sku_id);

create table ec_oms_vip_stock_syn_log
(
    id            bigint auto_increment comment 'id'
        primary key,
    sku_id        varchar(32)                         null comment 'sku编码',
    request_type  tinyint                             null comment '接口类型1-查询店铺sku库存 2-全量更新sku库存',
    request_data  text                                null comment '请求报文',
    response_data text                                null comment '响应报文',
    request_time  timestamp default CURRENT_TIMESTAMP not null comment '请求时间'
)
    comment '唯品会同步库存日志表' charset = utf8;

create index idx_mall_vip_stock_syn_log_sku_id
    on ec_oms_vip_stock_syn_log (sku_id);

create table external_ext_order
(
    order_code          decimal(30) unsigned                          not null comment 'EC订单编号'
        primary key,
    cancel_result       tinyint(4) unsigned default 0                 null comment '实际取消结果（字典：external_ext_order_cancel_result）@0-取消中，1-取消成功，2-取消失败',
    cancel_fail_reason  varchar(128)                                  null comment '取消失败原因',
    operator_login_name varchar(32)                                   null comment '操作人账号',
    handle_status       tinyint unsigned    default 0                 not null comment '是否处理  0 - 未处理  1 - 处理',
    operator_name       varchar(36)                                   null comment '操作人名称',
    operate_time        timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    last_update_time    timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '外部ec订单扩展表';

create table external_ext_work_order
(
    work_order_code    bigint unsigned                     not null comment '售后工单编号(按日期+6位数字生成，eg:191111000001)'
        primary key,
    order_code         decimal(30) unsigned                not null comment 'EC订单编号',
    product_code       bigint                              null comment '商品编号',
    issue_description  varchar(200)                        null comment '问题描述',
    customer_demand    tinyint(3)                          null comment '客户诉求(业务字典out_ec_customer_demand_type)@1-最终需退款2-最终需补发3-需协助处理',
    creator_login_name varchar(32)                         null comment '创建人账号',
    creator_name       varchar(36)                         null comment '创建人名称',
    create_time        timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time   timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '外部ec售后工单扩展表';

create index idx_order_code
    on external_ext_work_order (order_code);

create table external_sale_expense_record
(
    id                bigint(11) auto_increment comment '主键'
        primary key,
    client_code       varchar(15)                          not null comment '客户编号',
    sale_date         date                                 null comment '销售日期',
    status            tinyint(3) default 0                 null comment '记录状态 0-待记录 1-已记录 2-已确定 字典（sale_fee_record_status）',
    promotion_expense decimal(14, 2)                       null comment '推广费用',
    other_expense     decimal(14, 2)                       null comment '其他费用',
    remark            varchar(350)                         null comment '备注',
    registrant        varchar(32)                          null comment '登记人',
    registrant_code   varchar(32)                          null comment '登记人账号',
    registrant_time   timestamp                            null comment '登记时间',
    last_update_time  timestamp                            null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_time       timestamp  default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '销售费用记录表';

create index idx_client_code_and_date
    on external_sale_expense_record (client_code, sale_date)
    comment '客户编号销售日期组合索引';

create table external_sys_menu
(
    id          int(8) unsigned auto_increment comment '编号'
        primary key,
    parent_id   int(8)                     null comment '父ID',
    parent_ids  varchar(2000)              null comment '树ID',
    text        varchar(100)               not null comment '菜单名称',
    sort        decimal                    not null comment '排序',
    url         varchar(2000)              null comment '链接',
    target_type varchar(32)                null comment '页面打开方式',
    icon        varchar(100)               null comment '图标',
    is_show     tinyint(1)       default 1 null comment '是否显示 1：显示 0：隐藏',
    permission  varchar(200)               null comment '权限标识',
    remarks     varchar(255)               null comment '备注',
    menu_type   tinyint unsigned default 1 null comment '菜单类型 0-目录 1-模块 2-页面 3-功能',
    create_time datetime                   null comment '创建时间',
    op_time     datetime                   null comment '更新时间',
    del_flag    tinyint(1)       default 0 null comment '删除标记 1：删除 0：未删除'
)
    comment '外部EC菜单信息表';

create index idx_parent_id
    on external_sys_menu (parent_id);

create table external_sys_role
(
    id            int(8) unsigned auto_increment comment '编号'
        primary key,
    code          varchar(50)                                not null comment '角色代码',
    name          varchar(100)                               not null comment '角色名称',
    enabled       tinyint unsigned default 1                 null comment '是否可用1：可用 0：停用',
    remarks       varchar(255)                               null comment '备注',
    client_code   varchar(15)                                null comment '客户编号，但是SAM系统创建的角色时不能为空',
    create_source tinyint unsigned default 1                 null comment '数据创建来源1-EC 2-SAM',
    is_frozen     tinyint(3)       default 0                 null comment '是否冻结 0-否 1-是',
    create_code   int(11) unsigned                           null comment '创建人编码',
    create_name   varchar(32)                                null comment '创建人姓名',
    create_time   timestamp                                  null comment '创建时间',
    op_code       int                                        null comment '更新人编码',
    op_name       varchar(32)                                null comment '更新人姓名',
    op_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag      tinyint unsigned default 0                 null comment '删除标记1：删除 0：未删除',
    constraint code_UNIQUE
        unique (code)
)
    comment '外部EC角色表';

create index idx_client_code
    on external_sys_role (client_code)
    comment '客户编码';

create table external_sys_role_data
(
    role_id     int(8) unsigned not null comment '角色ID',
    client_code varchar(15)     not null comment '客户编号',
    primary key (role_id, client_code)
)
    comment '外部EC角色数据关系表';

create table external_sys_role_menu
(
    role_id int(8) unsigned not null comment '角色ID',
    menu_id int(8) unsigned not null comment '菜单ID',
    primary key (role_id, menu_id)
)
    comment '外部EC角色菜单关系表';

create table external_sys_user
(
    id               int auto_increment comment '编号'
        primary key,
    login_name       varchar(32)                         not null comment '登录账号',
    password         varchar(80)                         not null comment '密码',
    name             varchar(36)                         not null comment '用户名',
    account_status   tinyint   default 1                 not null comment '账号是否有效（字典：ec_oms_yes_no）@1-是，0-否',
    client_code      varchar(15)                         not null comment '客户编号',
    account_type     tinyint   default 1                 not null comment '账号类型1-主账号，2-子账号',
    user             varchar(36)                         null comment '使用人',
    user_phone       varchar(15)                         not null comment '使用人手机',
    user_email       varchar(50)                         null comment '使用人邮箱',
    user_position    varchar(32)                         null comment '使用人职位',
    account_end_time datetime                            null comment '账号失效时间临时字段',
    remarks          varchar(255)                        null comment '备注',
    creator_code     int                                 null comment '创建人编码',
    creator_name     varchar(32)                         null comment '创建人姓名',
    create_time      timestamp                           null comment '创建时间',
    operator_code    int                                 null comment '更新人编码',
    operator_name    varchar(32)                         null comment '更新人姓名',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag         tinyint                             not null comment '是否删除（字典：ec_oms_yes_no）@1-是，0-否',
    constraint idx_login_name
        unique (login_name) comment '登录名索引'
)
    comment '外部EC用户表';

create index idx_client_code
    on external_sys_user (client_code)
    comment '客户编码索引';

create table external_sys_user_role
(
    user_id int(8) unsigned not null comment '用户ID',
    role_id int(8) unsigned not null comment '角色ID',
    primary key (user_id, role_id)
)
    comment '外部EC用户角色关系表';

create table fact_ec_upload_send_time
(
    order_source varchar(100) null,
    source_name  varchar(100) null,
    send_time    varchar(100) null,
    lanjian_time varchar(100) null,
    zoujian_time varchar(100) null,
    shendan_time varchar(100) null,
    send_desc    varchar(100) null,
    lanjian_desc varchar(100) null,
    zoujian_desc varchar(100) null,
    time         varchar(100) null,
    time_type    varchar(100) null,
    extends      varchar(100) null,
    etl_datetime timestamp(6) null,
    shop_code    varchar(5)   null
);

create table fact_upload_ec_hd_send_time_test
(
    uuid         varchar(100) null,
    data_date    varchar(100) null,
    start_date   varchar(100) null,
    end_date     varchar(100) null,
    extends      varchar(100) null,
    lanjian_desc varchar(100) null,
    lanjian_time varchar(100) null,
    loadtime     varchar(100) null,
    order_source varchar(100) null,
    send_desc    varchar(100) null,
    send_time    varchar(100) null,
    shendan_time varchar(100) null,
    source_name  varchar(100) null,
    time         varchar(100) null,
    time_type    varchar(100) null,
    zoujian_desc varchar(100) null,
    zoujian_time varchar(100) null,
    etl_datetime varchar(100) null,
    is_valid     varchar(2)   null,
    shop_code    varchar(5)   null
);

create table fact_upload_platform_shop_info
(
    uuid              varchar(32) null comment 'uuid',
    datadate          varchar(50) null comment '日期',
    ec_platform       varchar(50) null comment '平台',
    loadtime          date        null comment '操作时间',
    plat_form         varchar(50) null comment '渠道名称',
    shop_english_code varchar(50) null comment '店铺英文',
    shop_group        varchar(50) null comment '店铺组',
    shop_name         varchar(50) null comment '店铺名称',
    uoload_date       varchar(50) null comment '上传时间'
)
    comment '平台（京东/阿里系）与店铺关系维表' charset = utf8;

create table help_topic
(
    help_topic_id    int unsigned      not null
        primary key,
    name             char(64)          not null,
    help_category_id smallint unsigned not null,
    description      text              not null,
    example          text              not null,
    url              text              not null,
    constraint name
        unique (name)
)
    comment 'help topics' charset = utf8;

create table mall_area_update_record
(
    record_id         int(10) auto_increment comment '地址更新主键ID'
        primary key,
    pre_code          varchar(30)                          null comment '修改前编码',
    pre_desc          varchar(50)                          null comment '修改前名称',
    post_code         varchar(30)                          null comment '修改后编码',
    post_desc         varchar(50)                          null comment '修改后名称',
    area_type         tinyint(2)                           null comment '地址类型（1-省份，2-城市，3-区县，4-乡镇\街道，5-村/社区，10-省份增强，20-城市增强，30-区县增强，40-街道增强，11-省份增强回改，21-城市增强回改，31-区县增强回改，41-街道增强回改）',
    pre_full_address  varchar(50)                          null comment '前完整地址',
    post_full_address varchar(50)                          null comment '后完整地址',
    remark            varchar(100)                         null comment '修改备注',
    create_code       varchar(50)                          null comment '创建人编码',
    create_name       varchar(100)                         null comment '创建人名称',
    create_time       timestamp  default CURRENT_TIMESTAMP null comment '创建时间',
    change_code       varchar(50)                          null comment '修改人编码',
    change_name       varchar(100)                         null comment '修改人姓名',
    change_time       timestamp  default CURRENT_TIMESTAMP null comment '修改时间',
    del_flag          tinyint(1) default 0                 null comment '删除标志（1-删除；0-未删除）'
)
    comment '地址修改记录表,数据清洗后用于更新历史数据设置信息' charset = utf8;

create index idx_post_code
    on mall_area_update_record (post_code);

create index idx_pre_code
    on mall_area_update_record (pre_code);

create table mall_express_info_kuaiyun
(
    id                   bigint auto_increment comment '编号'
        primary key,
    order_code           decimal(30)                         not null comment '发货单编号',
    express_company      varchar(64)                         null comment '承运商',
    way_code             varchar(32)                         null comment '发运单号',
    send_good_date       varchar(20)                         null comment '实际发货日期字符串',
    plan_received_date   varchar(20)                         null comment '预计到货日期字符串',
    is_received_complete varchar(4)                          null comment '是否完整签收',
    received_date        varchar(20)                         null comment '实际到货日期字符串',
    exception_in_way     varchar(64)                         null comment '在途异常情况',
    good_damage_num      int                                 null comment '货损数量（箱）',
    delay_reason         varchar(128)                        null comment '延迟原因',
    remarks              varchar(300)                        null comment '备注',
    creater_name         varchar(32)                         null comment '创建人',
    creater_code         int                                 null comment '创建人编码',
    create_time          timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改时间'
)
    comment '大订单在途信息--快递快运' charset = utf8;

create index idx_kuaiyun_create_time
    on mall_express_info_kuaiyun (create_time);

create index idx_kuaiyun_order_code
    on mall_express_info_kuaiyun (order_code);

create table mall_express_info_wuliu
(
    id                   bigint auto_increment comment '编号'
        primary key,
    order_code           decimal(30)                         not null comment '发货单编号',
    express_company      varchar(64)                         null comment '承运商',
    way_code             varchar(32)                         null comment '发运单号',
    send_good_date       varchar(20)                         null comment '发货日期字符串',
    plan_received_date   varchar(20)                         null comment '计划到货日期字符串',
    send_good_code       varchar(32)                         null comment '发货单号',
    day1_city            varchar(20)                         null comment '第一天到达城市',
    day2_city            varchar(20)                         null comment '第二天到达城市',
    day3_city            varchar(20)                         null comment '第三天到达城市',
    day4_city            varchar(20)                         null comment '第四天到达城市',
    day5_city            varchar(20)                         null comment '第五天到达城市',
    day6_city            varchar(20)                         null comment '第六天到达城市',
    day7_city            varchar(20)                         null comment '第七天到达城市',
    is_received_complete varchar(4)                          null comment '是否完整签收',
    received_date        varchar(20)                         null comment '收货日期字符串',
    exception_in_way     varchar(64)                         null comment '在途异常情况',
    remarks              varchar(128)                        null comment '备注',
    creater_name         varchar(32)                         null comment '创建人',
    creater_code         int                                 null comment '创建人编码',
    create_time          timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改时间'
)
    comment '大订单在途信息--物流' charset = utf8;

create index idx_wuliu_create_time
    on mall_express_info_wuliu (create_time);

create index idx_wuliu_order_code
    on mall_express_info_wuliu (order_code);

create table mall_sys_menu_btn_temp
(
    id           int unsigned auto_increment comment '主键'
        primary key,
    btn_name     varchar(64)          null comment '菜单按钮名称',
    parents_id   varchar(64)          null comment '所属菜单id',
    parents_code varchar(64)          null comment '所属菜单编码',
    app_code     varchar(20)          null comment '所属应用类型',
    changed_code varchar(20)          null comment '最后修改人',
    changed_name varchar(32)          null comment '最后修改人名称',
    changed_time datetime             null comment '最后修改时间',
    permission   varchar(50)          null comment '权限标识（填写菜单按钮标签id）',
    del_flag     tinyint(2) default 0 null comment '删除标记 1 -已删除 0 -未删除',
    relation_id  int(11) unsigned     null comment '关联id(子系统菜单主键)'
)
    comment 'portal菜单按钮表' charset = utf8;

create table mall_sys_menu_temp
(
    menu_id              int(10) auto_increment comment '菜单ID'
        primary key,
    menu_code            varchar(64)                     null comment '菜单编码',
    menu_name            varchar(64)                     null comment '菜单名称',
    menu_label           varchar(64)                     null comment '菜单显示的名称',
    ifleaf               varchar(5)                      null comment '是否子叶 0否 1是',
    menu_level           int(6)                          null comment '菜单级别',
    display_order        int(6)                          null comment '菜单排序',
    function_path        varchar(550)                    null comment '菜单功能路径',
    function_desc        varchar(256)                    null comment '功能描述',
    menu_type            varchar(20)                     null comment '菜单类型 app:app类菜单 pc:pc类菜单',
    icon_img             varchar(255)                    null comment '图标的路径',
    menu_url             varchar(500)                    null comment 'vw链接(app时连接页面)',
    parents_id           int(10)                         null comment '父节点ID',
    parents_code         varchar(64)                     null comment '父节点编码',
    menu_seq             varchar(256)                    null comment '菜单序列',
    app_code             varchar(20)                     null comment '所属应用类型',
    sys_code             varchar(32)                     null comment '所属子系统编码',
    changed_code         varchar(20)                     null comment '最后修改人',
    changed_name         varchar(100)                    null comment '最后修改人名称',
    changed_time         datetime                        null comment '最后修改时间',
    del_flag             varchar(10)         default '0' null comment '删除标记 1 -已删除 0 -未删除',
    if_down_shelf        tinyint(1) unsigned default 0   null comment '是否下架（0-否；1-是）',
    business_charge_code varchar(20)                     null comment '业务负责人编码',
    business_charge_name varchar(32)                     null comment '业务负责人姓名',
    require_charge_code  varchar(20)                     null comment '需求负责人编码',
    require_charge_name  varchar(32)                     null comment '需求负责人姓名',
    relation_id          int(11) unsigned                null comment '关联id(子系统菜单主键)',
    relation_id_seq      varchar(50)                     null comment '关联id 的seq(子系统菜单主键)'
)
    comment 'portal菜单表导入' charset = utf8;

create index idx_dflag_ifleaf_menuseq
    on mall_sys_menu_temp (del_flag, ifleaf, menu_seq);

create table mall_sys_role_temp
(
    role_id     int(10) auto_increment comment '角色ID'
        primary key,
    role_code   varchar(64)  null comment '角色编码',
    role_name   varchar(64)  null comment '角色名称',
    app_code    varchar(64)  null comment '所属应用系统编码',
    role_desc   varchar(255) null comment '角色描述',
    create_user varchar(64)  null comment '创建人',
    create_time datetime     null comment '创建时间'
)
    comment 'portal角色表导入' charset = utf8;

create table mall_unit_tmall_tmc_message
(
    id               bigint unsigned                     not null comment '消息ID'
        primary key,
    topic            varchar(64)                         null comment '消息所属主题',
    pub_time         timestamp                           null comment '消息发布时间',
    outgoing_time    timestamp                           null comment '暂时未知作用',
    user_id          bigint unsigned                     null comment '消息所属的用户编号',
    user_nick        varchar(64)                         null comment '用户的昵称',
    data_id          varchar(64)                         null comment '订单编号tid',
    content          mediumtext                          null comment '消息内容主体',
    message          mediumtext                          null comment '接收到的消息内容',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment '天猫推送的消息保存列表mallorder';

create index idx_dataid
    on mall_unit_tmall_tmc_message (data_id);

create index idx_lst
    on mall_unit_tmall_tmc_message (last_update_time);

create index idx_topic_sellernick
    on mall_unit_tmall_tmc_message (topic, user_nick);

create table need_sms_order
(
    order_code      decimal(30) unsigned not null comment 'EC订单编号'
        primary key,
    shop_name       varchar(50)          not null comment '店铺全称',
    shop_order_id   varchar(64)          not null comment '店铺订单编号，若为合单则置为EC订单编号(order_code)',
    receiver_mobile varchar(20)          null comment '收货人手机',
    province        varchar(32)          null comment '收货人省份',
    city            varchar(32)          null comment '收货人城市',
    district        varchar(32)          null comment '收货人区县',
    plat_start_time timestamp            not null comment '外部平台订单创建时间'
)
    comment 'need_sms_order';

create index idx_mobile
    on need_sms_order (receiver_mobile);

create table need_sms_order11
(
    order_code      decimal(30) unsigned not null comment 'EC订单编号'
        primary key,
    shop_name       varchar(50)          not null comment '店铺全称',
    shop_order_id   varchar(64)          not null comment '店铺订单编号，若为合单则置为EC订单编号(order_code)',
    receiver_mobile varchar(20)          null comment '收货人手机',
    province        varchar(32)          null comment '收货人省份',
    city            varchar(32)          null comment '收货人城市',
    district        varchar(32)          null comment '收货人区县',
    plat_start_time timestamp            not null comment '外部平台订单创建时间'
)
    comment 'need_sms_order';

create index idx_mobile
    on need_sms_order11 (receiver_mobile);

create table need_sms_order12
(
    order_code      decimal(30) unsigned not null comment 'EC订单编号'
        primary key,
    shop_name       varchar(50)          not null comment '店铺全称',
    shop_order_id   varchar(64)          not null comment '店铺订单编号，若为合单则置为EC订单编号(order_code)',
    receiver_mobile varchar(20)          null comment '收货人手机',
    province        varchar(32)          null comment '收货人省份',
    city            varchar(32)          null comment '收货人城市',
    district        varchar(32)          null comment '收货人区县',
    plat_start_time timestamp            not null comment '外部平台订单创建时间'
)
    comment 'need_sms_order';

create index idx_mobile
    on need_sms_order12 (receiver_mobile);

create table oms_b2b_announcement_client
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    announcement_id  int                                   not null comment '公告id',
    client_code      varchar(15) default '0'               not null comment '客户编号',
    is_read          tinyint(3)  default 0                 not null comment '是否已读（字典：ec_oms_yes_no）@0-否 1-是',
    creator_id       int                                   null comment '创建人编号',
    creator_name     varchar(32)                           null comment '创建人名称',
    create_time      timestamp   default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id      int                                   null comment '操作人编号',
    operator_name    varchar(32)                           null comment '操作人名称',
    last_update_time timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint     default 0                 not null comment '删除标记@1-是 0-否'
)
    comment '公告与客户关系表';

create table oms_b2b_announcement_management
(
    id               int unsigned auto_increment comment '主键ID'
        primary key,
    inform_title     varchar(30)                          not null comment '通知标题',
    publish_status   tinyint(3) default 1                 not null comment '发布状态 （字典：oms_b2b_announcement_status）1-待发布 2-执行中 3-发布完成 4-已撤回',
    publish_time     timestamp  default CURRENT_TIMESTAMP null comment '发布时间',
    content          text                                 not null comment '公告内容',
    is_repeat_notice tinyint(3) default 0                 not null comment '是否重复提醒（字典：ec_oms_yes_no）@0-否 1-是',
    stop_repeat_time timestamp                            null comment '重复停止时间',
    creator_id       int                                  null comment '创建人编号',
    creator_name     varchar(32)                          null comment '创建人名称',
    create_time      timestamp  default CURRENT_TIMESTAMP null comment '创建时间',
    withdraw_id      int                                  null comment '撤回人编号',
    withdraw_name    varchar(32)                          null comment '撤回人名称',
    withdraw_time    timestamp                            null comment '撤回时间',
    operator_id      int                                  null comment '操作人编号',
    operator_name    varchar(32)                          null comment '操作人名称',
    last_update_time timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint    default 0                 not null comment '删除标记@1-是 0-否'
)
    comment '公告管理表';

create table oms_b2b_announcement_notification_object
(
    id                       int unsigned auto_increment comment '主键ID'
        primary key,
    announcement_id          int                                   not null comment '公告id',
    notification_object_type tinyint(3)  default 1                 not null comment '通知对象类型 （字典：oms_b2b_notification_object_type）1-店铺 2-分销商',
    object_code              varchar(15) default '0'               not null comment '对象编号',
    creator_id               int                                   null comment '创建人编号',
    creator_name             varchar(32)                           null comment '创建人名称',
    create_time              timestamp   default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id              int                                   null comment '操作人编号',
    operator_name            varchar(32)                           null comment '操作人名称',
    last_update_time         timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag                 tinyint     default 0                 not null comment '删除标记@1-是 0-否'
)
    comment '公告与通知对象关系表';

create table oms_b2b_base_level_info
(
    id                     int unsigned auto_increment comment 'id'
        primary key,
    b2b_type               tinyint unsigned                           not null comment 'b2b类型 1-销售 2-分销',
    level_num              tinyint unsigned                           null comment '等级',
    level_name             varchar(100)                               null comment '等级名称',
    control_price_discount decimal(4, 3)    default 0.001             not null comment '管控价折扣率',
    default_discount       decimal(10, 2) unsigned                    null comment '默认折扣率【废弃】',
    is_frozen              tinyint(3)       default 0                 null comment '是否冻结 0-否 1-是',
    is_use_agree_price     tinyint(3)       default 1                 null comment '是否使用约定价 1-是 0-否',
    create_code            int unsigned                               null comment '创建人编码',
    create_name            varchar(50)                                null comment '创建人姓名',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code           int(10)                                    null comment '修改人/操作人编码',
    changed_name           varchar(50)                                null comment '修改人/操作人姓名',
    changed_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag               tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'OMS-B2B销售/分销等级主数据';

create index idx_b2b_type_level_num
    on oms_b2b_base_level_info (b2b_type, level_num);

create table oms_b2b_base_level_magnitude
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    b2b_type      tinyint unsigned default 1                 null comment 'b2b类型 1-销售 2-分销',
    level_num     tinyint unsigned                           not null comment '等级',
    magnitude_num tinyint unsigned                           not null comment '量级',
    min_weight    decimal(12, 2)   default 0.00              not null comment '订单重量最小值(kg)',
    max_weight    decimal(12, 2)   default 0.00              not null comment '订单重量最大值(kg)',
    create_code   int unsigned                               null comment '创建人编码',
    create_name   varchar(32)                                null comment '创建人姓名',
    create_time   timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code  int(10)                                    null comment '修改人/操作人编码',
    changed_name  varchar(32)                                null comment '修改人/操作人姓名',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag      tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售/分销等级量级关系表';

create index idx_b2b_type_level_num
    on oms_b2b_base_level_magnitude (b2b_type, level_num);

create table oms_b2b_base_present_info
(
    id           int unsigned auto_increment comment 'id'
        primary key,
    b2b_type     tinyint unsigned                           not null comment 'B2B类型 1-销售 2-分销',
    product_code varchar(64)                                null comment '赠品产品编码',
    is_frozen    tinyint unsigned                           null comment '是否冻结 0-否 1-是',
    create_code  int unsigned                               null comment '建档人编码',
    create_name  varchar(255)                               null comment '建档人姓名',
    create_time  timestamp        default CURRENT_TIMESTAMP null comment '建档时间',
    changed_code int unsigned                               null comment '操作人编码',
    changed_name varchar(255)                               null comment '操作人姓名',
    changed_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag     tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售/分销赠品主数据管理表';

create index idx_product_code
    on oms_b2b_base_present_info (product_code);

create table oms_b2b_base_product_info
(
    base_id          int unsigned auto_increment comment 'id'
        primary key,
    b2b_type         tinyint unsigned                           not null comment 'B2B类型 1-销售 2-分销',
    product_code     varchar(64)                                not null comment '产品编码',
    is_frozen        tinyint unsigned                           null comment '是否冻结 0-否 1-是',
    control_price    decimal(10, 2) unsigned                    null comment '管控价',
    importor_code    int unsigned                               null comment '导入人编号【弃用】',
    importor_name    varchar(32)                                null comment '导入人姓名【弃用】',
    import_time      timestamp                                  null comment '导入时间【弃用】',
    import_no        bigint(19) unsigned                        null comment '导入编号【弃用】',
    auditor_code     int unsigned                               null comment '审核人编号【弃用】',
    auditor_name     varchar(32)                                null comment '审核人姓名【弃用】',
    audit_time       timestamp                                  null comment '审核时间【弃用】',
    audit_status     tinyint unsigned default 1                 not null comment '审核状态 (字典: ec_oms_b2b_price_audit_status)【弃用】',
    auditor_opinion  varchar(1024)                              null comment '审核人意见【弃用】',
    source_type      tinyint unsigned default 1                 not null comment '来源类型 @1-手动新增, 2-导入【弃用】',
    create_code      int unsigned                               null comment '建档人编码',
    create_name      varchar(50)                                null comment '建档人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '建档时间',
    changed_code     int unsigned                               null comment '操作人编码',
    changed_name     varchar(50)                                null comment '操作人姓名',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    valid_start_time timestamp                                  null comment '生效时间【弃用】',
    valid_end_time   timestamp                                  null comment '失效时间【弃用】',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售/分销商品主数据';

create index idx_import_no
    on oms_b2b_base_product_info (import_no);

create index idx_import_time
    on oms_b2b_base_product_info (import_time);

create index idx_product_code
    on oms_b2b_base_product_info (product_code);

create index idx_valid_end_time
    on oms_b2b_base_product_info (valid_end_time);

create index idx_valid_start_time
    on oms_b2b_base_product_info (valid_start_time);

create table oms_b2b_base_product_info_import
(
    base_id          int unsigned auto_increment comment 'id'
        primary key,
    b2b_type         tinyint unsigned                           not null comment 'B2B类型 1-销售 2-分销',
    product_code     varchar(64)                                not null comment '产品编码',
    is_frozen        tinyint unsigned                           null comment '是否冻结 0-否 1-是',
    control_price    decimal(10, 2) unsigned                    null comment '管控价',
    importor_code    int unsigned                               null comment '导入人编号',
    importor_name    varchar(32)                                null comment '导入人姓名',
    import_time      timestamp                                  null comment '导入时间',
    import_no        bigint(19) unsigned                        null comment '导入编号',
    auditor_code     int unsigned                               null comment '审核人编号',
    auditor_name     varchar(32)                                null comment '审核人姓名',
    audit_time       timestamp                                  null comment '审核时间',
    audit_status     tinyint unsigned default 1                 not null comment '审核状态 (字典: ec_oms_b2b_price_audit_status)',
    auditor_opinion  varchar(1024)                              null comment '审核人意见',
    source_type      tinyint unsigned default 1                 not null comment '来源类型 @1-手动新增, 2-导入',
    create_code      int unsigned                               null comment '建档人编码',
    create_name      varchar(32)                                null comment '建档人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '建档时间',
    changed_code     int unsigned                               null comment '操作人编码',
    changed_name     varchar(32)                                null comment '操作人姓名',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    valid_start_time timestamp                                  null comment '生效时间',
    valid_end_time   timestamp                                  null comment '失效时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售/分销商品主数据导入记录表';

create index idx_import_no
    on oms_b2b_base_product_info_import (import_no);

create index idx_import_time
    on oms_b2b_base_product_info_import (import_time);

create index idx_product_code
    on oms_b2b_base_product_info_import (product_code);

create index idx_valid_end_time
    on oms_b2b_base_product_info_import (valid_end_time);

create index idx_valid_start_time
    on oms_b2b_base_product_info_import (valid_start_time);

create table oms_b2b_base_product_level_price
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    base_id       int unsigned               not null comment '销售/分销产品数据主键id',
    level         tinyint unsigned           not null comment '销售/分销等级',
    level_price   decimal(10, 2) unsigned    null comment '等级价格',
    pricing_logic tinyint unsigned default 1 not null comment '管控价取价逻辑,字典:ec_b2b_pricing_logic，@1-取值【管控价折扣率】计算值，2-取值固定值'
)
    comment 'B2B销售/分销商品等级价格';

create index idx_base_id
    on oms_b2b_base_product_level_price (base_id);

create table oms_b2b_base_product_level_price_import
(
    id          int unsigned auto_increment comment 'id'
        primary key,
    base_id     int unsigned            not null comment '销售/分销产品数据主键id',
    level       tinyint unsigned        not null comment '销售/分销等级',
    level_price decimal(10, 2) unsigned null comment '等级价格'
)
    comment 'B2B销售/分销商品等级价格导入记录';

create index idx_base_id
    on oms_b2b_base_product_level_price_import (base_id);

create table oms_b2b_base_strategy_client
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    strategy_code bigint unsigned                            not null comment '策略编号,关联oms_b2b_base_strategy_info.strategy_code',
    client_code   varchar(15)                                null comment '客户编码',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag      tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售/分销特殊价格策略客户关系表';

create index idx_strategy_client_code
    on oms_b2b_base_strategy_client (strategy_code, client_code, del_flag);

create table oms_b2b_base_strategy_info
(
    strategy_code   bigint unsigned                            not null comment '策略编号,年月日+5位序号'
        primary key,
    strategy_name   varchar(100)                               null comment '策略名称',
    b2b_type        tinyint unsigned                           not null comment 'B2B类型 1-销售 2-分销',
    start_time      datetime                                   null comment '开始时间',
    end_time        datetime                                   null comment '结束时间',
    strategy_remark varchar(255)                               null comment '策略说明',
    client_code     varchar(15)                                null comment '【废弃，数据迁移至表oms_b2b_base_strategy_client】客户编码',
    is_stop         tinyint unsigned default 0                 null comment '是否停用 0-否 1-是',
    is_limit_num    tinyint unsigned default 0                 null comment '是否限量，业务字典ec_oms_yes_no,@0-否，1-是',
    prd_num         int unsigned                               null comment '包含商品数量',
    create_code     int unsigned                               null comment '建档人编码',
    create_name     varchar(255)                               null comment '建档人姓名',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '建档时间',
    changed_code    int unsigned                               null comment '操作人编码',
    changed_name    varchar(255)                               null comment '操作人姓名',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag        tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售/分销特殊价格策略管理主数据表';

create index idx_client_code
    on oms_b2b_base_strategy_info (client_code);

create table oms_b2b_base_strategy_level_price
(
    id              int unsigned auto_increment comment 'id'
        primary key,
    strategy_code   bigint unsigned                            not null comment '策略编号，关联oms_b2b_base_strategy_info',
    product_code    bigint unsigned                            not null comment '商品编号',
    magnitude_num   tinyint unsigned                           not null comment '量级',
    min_weight      decimal(12, 2)   default 0.00              not null comment '订单重量最小值(kg)',
    max_weight      decimal(12, 2)   default 0.00              not null comment '订单重量最大值(kg)',
    magnitude_price decimal(10, 2) unsigned                    null comment '量级价格',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag        tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售/分销等级量级关系表';

create index idx_strategy_code
    on oms_b2b_base_strategy_level_price (strategy_code);

create table oms_b2b_base_strategy_price
(
    id             int unsigned auto_increment comment 'id'
        primary key,
    strategy_code  bigint unsigned                            null comment '策略编号',
    config_code    varchar(30)                                null comment '配置编号,策略编号+商品编号',
    product_code   varchar(64)                                null comment '产品编码',
    strategy_price decimal(10, 2) unsigned                    null comment '策略价格',
    limit_num      int unsigned                               null comment '允许取特殊价商品总数',
    use_num        int unsigned                               null comment '取特殊价商品已用数量',
    is_stop        tinyint unsigned default 0                 not null comment '是否停用（字典：ec_oms_yes_no）0-否 1-是',
    changed_code   int unsigned                               null comment '操作人编码',
    changed_name   varchar(50)                                null comment '操作人姓名',
    changed_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间'
)
    comment 'B2B特殊策略关联商品价格表';

create index idx_config_code
    on oms_b2b_base_strategy_price (config_code);

create index idx_product_code
    on oms_b2b_base_strategy_price (product_code);

create index idx_strategy_code
    on oms_b2b_base_strategy_price (strategy_code);

create table oms_b2b_client_agreed_price_update
(
    update_list_code bigint unsigned                            not null comment '更新单号，格式;202012310001'
        primary key,
    update_list_name varchar(100)                               not null comment '更新单名称',
    list_size        int unsigned     default 0                 not null comment '更新单包含配置数量',
    client_code      varchar(15)                                not null comment '客户编号',
    valid_start_time timestamp                                  not null comment '更新单生效时间',
    valid_end_time   timestamp                                  not null comment '更新单失效时间',
    create_code      int unsigned                               null comment '创建人编码',
    create_name      varchar(50)                                null comment '创建人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code     int unsigned                               null comment '操作人编码',
    changed_name     varchar(50)                                null comment '操作人姓名',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '客户分销约定价更新单信息表';

create table oms_b2b_client_agreed_price_update_product
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    update_list_code bigint unsigned                            not null comment '更新单号，关联oms_b2b_client_agreed_price_info',
    client_code      varchar(15)                                not null comment '客户编号',
    product_code     bigint unsigned                            not null comment '商品编号',
    config_code      varchar(30)                                not null comment '配置单号,更新单编号+商品编号',
    agreed_price     decimal(10, 2) unsigned                    not null comment '约定价格',
    is_same          tinyint unsigned default 1                 not null comment '配置和更新单时间一致性,业务字典ec_oms_yes_no@0-否 1-是',
    valid_start_time timestamp                                  not null comment '配置生效时间',
    valid_end_time   timestamp                                  not null comment '配置失效时间',
    create_code      int unsigned                               null comment '创建人编码',
    create_name      varchar(50)                                null comment '创建人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code     int unsigned                               null comment '操作人编码',
    changed_name     varchar(50)                                null comment '操作人姓名',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标识 0-有效 1-删除'
)
    comment '客户分销约定价更新单配置表（子表）';

create index idx_client_pro
    on oms_b2b_client_agreed_price_update_product (client_code, product_code);

create index idx_update_code
    on oms_b2b_client_agreed_price_update_product (update_list_code);

create table oms_b2b_client_apply
(
    application_code           varchar(16)                                   not null comment '申请编号NF/UF+当前年月日+4位顺序码'
        primary key,
    client_code                varchar(15)                                   null comment '客户编号',
    application_type           tinyint(1) unsigned default 0                 not null comment '申请类型 0-建档 1-改档（字典：ec_oms_application_type）',
    application_status         tinyint unsigned                              null comment '申请状态 0-待核算审核 1-待预算审核 2-被驳回 3-待提交 4-审核通过 5-已取消（字典：ec_oms_application_status）',
    client_short_name          varchar(50)                                   null comment '客户简称',
    is_auto_audit              tinyint(1)                                    null comment '是否自动财审 0-否 1-是 （字典：ec_oms_yes_no）',
    buyer_nick                 varchar(50)                                   null comment '买家ID',
    begin_cooperation_time     datetime                                      null comment '合作开始时间',
    end_cooperation_time       datetime                                      null comment '合作结束时间',
    shop_code                  int unsigned                                  null comment '店铺编号，关联ec_oms_channel_shop_base.shop_code',
    shop_name                  varchar(50)                                   null comment '店铺名称',
    other_contact              varchar(100)                                  null comment '其他联系方式',
    mobile_phone               int(11) unsigned                              null comment '手机号码',
    client_remark              varchar(200)                                  null comment '备注',
    is_delivery                tinyint unsigned                              null comment '是否登记配送信息 0-否 1-是（字典：ec_oms_yes_no）',
    day_need                   smallint unsigned                             null comment '要求送达天数',
    delivery_start_time        datetime                                      null comment '要求送货时间开始时间 只存时分，日期默认2000-1-1',
    delivery_end_time          datetime                                      null comment '要求送货时间结束时间 只存时分，日期默认2000-1-1',
    is_appointment             tinyint unsigned                              null comment '是否需要预约 0-否 1-是（字典：ec_oms_yes_no）',
    appointment_day            smallint unsigned                             null comment '预约提前天数',
    is_upstairs                tinyint unsigned                              null comment '是否上楼 0-否 1-是（字典：ec_oms_yes_no）',
    floor_num                  varchar(10)                                   null comment '楼层',
    is_lift                    tinyint unsigned                              null comment '是否有电梯 0-否 1-是（字典：ec_oms_yes_no）',
    is_limit_car               tinyint unsigned                              null comment '是否限制车辆 0-否 1-是（字典：ec_oms_yes_no）',
    car_limit_remark           varchar(100)                                  null comment '车辆限制说明',
    is_limit_row               tinyint unsigned                              null comment '是否限行 0-否 1-是（字典：ec_oms_yes_no）',
    limit_row_remark           varchar(100)                                  null comment '道路限行说明',
    is_unloading               tinyint unsigned                              null comment '是否需卸货 0-否 1-是（字典：ec_oms_yes_no）',
    is_move                    tinyint unsigned                              null comment '是否平移搬运 0-否 1-是（字典：ec_oms_yes_no）',
    move_range                 varchar(100)                                  null comment '搬运距离(字典 ship_move_range) ',
    weekend_take               tinyint unsigned                              null comment '周末是否可收货 0-否 1-是（字典：ec_oms_yes_no）',
    is_twining                 tinyint unsigned    default 0                 null comment '是否缠膜 0-否 1-是（字典：ec_oms_yes_no）',
    sign_method                varchar(100)                                  null comment '签收交接方式',
    delivery_remark            varchar(255)                                  null comment '配送备注',
    is_open_invoice            tinyint unsigned                              null comment '是否开发票 0-否 1-是（字典：ec_oms_yes_no）',
    invoice_type               tinyint unsigned                              null comment '开票类型 0-个人 1-企业 （字典b2b_invoice_type）',
    invoice_info_type          tinyint unsigned                              null comment '发票类型（字典：ec_oms_invoice_info_type）1-增值税普通发票(电子)、2-增值税专用发票(电子)、3-增值税专用发票(纸质)',
    invoice_name               varchar(100)                                  null comment '开票公司名称',
    invoice_duty_paragraph     varchar(100)                                  null comment '开票公司税号',
    invoice_address            varchar(255)                                  null comment '开票公司地址',
    invoice_phone              varchar(50)                                   null comment '开票公司电话',
    invoice_bank               varchar(50)                                   null comment '开票银行开户行',
    invoice_account            varchar(100)                                  null comment '开票银行账号',
    receive_invoice_name       varchar(50)                                   null comment '收票人姓名',
    receive_invoice_email      varchar(50)                                   null comment '收票人邮箱',
    receive_invoice_phone      varchar(50)                                   null comment '收票人电话',
    receive_province_name      varchar(50)                                   null comment '收票省份名称',
    receive_city_name          varchar(50)                                   null comment '收票城市名称',
    receive_county_name        varchar(50)                                   null comment '收票区县名称',
    receive_invoice_address    varchar(255)                                  null comment '收票详细地址',
    b2b_type                   varchar(8)                                    null comment '1-销售 2-分销（字典：b2b_type都选时（1,2））',
    distribution_level         tinyint(3)                                    null comment '分销等级',
    b2b_level                  tinyint unsigned                              null comment '销售等级',
    manage_distri_channel      tinyint unsigned    default 0                 not null comment '管控分销渠道（字典：ec_oms_yes_no）@1-是，0-否',
    distri_channel_codes       varchar(255)                                  null comment '分销渠道编号，多个英文逗号分隔',
    distri_commission_ratio    decimal(5, 4)                                 null comment '分销佣金比例',
    is_pay                     tinyint unsigned                              null comment '是否结算 0-否 1-是（字典：ec_oms_yes_no）',
    pay_type                   tinyint unsigned                              null comment '结算方式 0-账期定期批量结算 1-先款后货每单结算（字典：ec_application_pay_type）',
    pay_day                    smallint unsigned                             null comment '结算周期（天）',
    refund_type                tinyint unsigned                              null comment '退款额度类型(字典：ec_b2b_refund_type) 1-返充至可抵扣 2-返充至预存款',
    is_operation_audit         tinyint unsigned    default 0                 null comment '运营审核订单（字典：ec_oms_yes_no）0-否 1-是',
    business_licence_pic1      varchar(512)                                  null comment '营业执照图片1路径',
    business_licence_pic1_name varchar(256)                                  null comment '营业执照图片1名称',
    business_licence_pic2      varchar(512)                                  null comment '营业执照图片2路径',
    business_licence_pic2_name varchar(256)                                  null comment '营业执照图片2名称',
    business_licence_pic3      varchar(512)                                  null comment '营业执照图片3路径',
    business_licence_pic3_name varchar(256)                                  null comment '营业执照图片3名称',
    edit_description           varchar(400)                                  null comment '修改说明',
    edit_pic_url_1             varchar(255)                                  null comment '凭证附件1',
    edit_pic_name_1            varchar(255)                                  null comment '凭证附件名1',
    edit_pic_url_2             varchar(255)                                  null comment '凭证附件2',
    edit_pic_name_2            varchar(255)                                  null comment '凭证附件名2',
    edit_pic_url_3             varchar(255)                                  null comment '凭证附件3',
    edit_pic_name_3            varchar(255)                                  null comment '凭证附件名3',
    update_module              varchar(16)                                   null comment '修改模块，多个模块用","分隔  枚举型 0-基本信息 1-分销/销售信息 2-结算信息 3-发票信息 4-配送要求 5-营业执照',
    commit_time                timestamp           default CURRENT_TIMESTAMP null comment '申请提交时间',
    create_code                int unsigned                                  null comment '创建人编码',
    create_name                varchar(32)                                   null comment '创建人姓名',
    create_time                timestamp           default CURRENT_TIMESTAMP not null comment '创建时间',
    changed_code               int(10)                                       null comment '修改人/操作人编码',
    changed_name               varchar(32)                                   null comment '修改人/操作人姓名',
    changed_time               timestamp           default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag                   tinyint unsigned    default 0                 not null comment '删除标识 0-有效 1-删除'
)
    comment '档案申请表';

create table oms_b2b_client_apply_audit
(
    id               int(11) unsigned auto_increment comment 'id'
        primary key,
    application_code varchar(16)                         not null comment '申请编号',
    audit_result     tinyint(2) unsigned                 null comment '审核结果0-提交 1-通过 2-驳回（字典ec_oms_sam_declaration_operate_result）',
    oper_node        varchar(64)                         null comment '操作节点',
    remark           varchar(300)                        null comment '操作备注/修改说明/驳回原因',
    edit_pic_url_1   varchar(255)                        null comment '修改凭证1',
    edit_pic_url_2   varchar(255)                        null comment '修改凭证2',
    edit_pic_url_3   varchar(255)                        null comment '修改凭证3',
    create_code      int unsigned                        null comment '创建人编码',
    create_name      varchar(32)                         null comment '创建人姓名',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '审记录表';

create index idx_appcode
    on oms_b2b_client_apply_audit (application_code);

create table oms_b2b_client_apply_settlement
(
    id               int(11) unsigned auto_increment comment 'id'
        primary key,
    application_code varchar(16)  not null comment '申请编号',
    account_company  varchar(80)  null comment '付款公司名称',
    account_bank     varchar(100) null comment '付款银行开户行',
    account_card     varchar(800) null comment '付款/收款账号'
)
    comment '客户付款信息表';

create table oms_b2b_client_declaration
(
    id                  int(24) unsigned auto_increment comment '主键id'
        primary key,
    declaration_code    varchar(15)                                not null comment '提报单号，TB+销售日期年月日+5位顺序码',
    distri_channel_code varchar(10)                                not null comment '分销渠道编号',
    sale_date           timestamp                                  not null comment '销售日期',
    client_code         varchar(15)                                not null comment '客户编号',
    remarks             varchar(200)                               not null comment '备注，不能超过200',
    declaration_status  tinyint unsigned default 0                 not null comment '（字典ec_oms_sam_declaration_status 0-待提交；1-待运营审核；2-待财务审核；3-运营驳回；4-财务驳回 5-已结束）',
    has_deduction       tinyint(1)       default 0                 not null comment '是否已扣减库存,因为驳回（库存不变）后重新提交变成待运营审核，此时不再重复扣减库存。',
    declaration_time    timestamp                                  not null comment '提报时间',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    create_code         varchar(50)                                not null comment '保存对应【外部账号管理】存储的【登录账号，长度32】，其他对应【员工工号】',
    create_name         varchar(50)                                null comment '创建人姓名',
    changed_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间，',
    del_flag            tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除',
    constraint uniq_declaration_code
        unique (declaration_code)
)
    comment '提报单';

create index idx_ccode_dccode
    on oms_b2b_client_declaration (client_code, distri_channel_code);

create index idx_createcode
    on oms_b2b_client_declaration (create_code);

create index idx_dstatus_dcc_ctime
    on oms_b2b_client_declaration (declaration_status, distri_channel_code, create_time);

create index idx_saledate
    on oms_b2b_client_declaration (sale_date);

create table oms_b2b_client_declaration_info
(
    id                     int(24) unsigned auto_increment comment '主键id'
        primary key,
    declaration_code       varchar(15) not null comment '提报单号，TB+销售日期年月日+5位顺序码',
    product_code           bigint      not null comment '产品编号',
    sale_num               int(10)     not null comment '销售数量',
    outbound_num           int(10)     not null comment '出库数量',
    client_storehouse_code varchar(10) not null comment '供货仓库编号',
    constraint uniq_dcode_pcode
        unique (declaration_code, product_code, client_storehouse_code)
)
    comment '提报单信息表';

create table oms_b2b_client_declaration_log
(
    id               int(24) unsigned auto_increment comment '主键id'
        primary key,
    declaration_code varchar(15)                                not null comment '提报单号，TB+销售日期年月日+5位顺序码',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '操作时间',
    operate_name     tinyint unsigned default 0                 not null comment '操作名称:0-提报人、1-运营审核、2-财务审核',
    operate_result   tinyint unsigned default 0                 not null comment '操作结果:0-提交、1-通过、2-驳回',
    reason           varchar(300)                               null comment '驳回原因，不能超过300',
    create_name      varchar(36)                                not null comment '保存对应【外部账号管理】存储的【使用人，长度36】，其他对应【员工姓名36】',
    create_code      varchar(50)                                not null comment '保存对应【外部账号管理】存储的【登录账号，长度32】，其他对应【员工工号】'
)
    comment '提报单记录表';

create index idx_dcode_ctime
    on oms_b2b_client_declaration_log (declaration_code, create_time);

create table oms_b2b_client_distri_channel
(
    distri_channel_code varchar(10)                                not null comment '分销渠道编号，生成规则：QD+渠道新增4位顺序码'
        primary key,
    distri_channel_name varchar(50)                                not null comment '分销渠道名称',
    is_frozen           tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）0-否 1-是',
    create_code         int unsigned                               null comment '创建人编码',
    create_name         varchar(50)                                null comment '创建人姓名',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code        int(10)                                    null comment '修改人/操作人编码',
    changed_name        varchar(50)                                null comment '修改人/操作人姓名',
    changed_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag            tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '客户分销渠道主数据表';

create table oms_b2b_client_distri_channel_charge
(
    id                  int unsigned auto_increment comment '主键ID'
        primary key,
    distri_channel_code varchar(10)                                not null comment '分销渠道编号，关联oms_b2b_client_distri_channel.distri_channel_code',
    charge_code         int(10)                                    null comment '负责人编码',
    charge_name         varchar(30)                                not null comment '负责人姓名',
    charge_phone        varchar(20)                                not null comment '负责人电话',
    charge_phone_cipher varchar(88)                                null comment '负责人电话',
    changed_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag            tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '客户分销渠道运营负责人信息表';

create table oms_b2b_client_inventory
(
    id                     int(24) unsigned auto_increment comment '主键id'
        primary key,
    inventory_code         varchar(13)                                not null comment '盘点单号，P+仓库编号后5位+年份+3位顺序码',
    client_storehouse_code varchar(10)                                not null comment '仓库编号',
    client_code            varchar(15)                                not null comment '客户编号',
    inventory_status       tinyint unsigned default 0                 not null comment '盘点状态：0-待提交；1-待审核；2-被驳回；3-一已结束',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间，盘点开始时间',
    commit_time            timestamp        default CURRENT_TIMESTAMP null comment '单据提交时间，盘点结束时间',
    create_code            varchar(50)                                not null comment '创建人登录账号',
    create_name            varchar(50)                                null comment '创建人姓名',
    changed_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag               tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除',
    constraint uniq_inventory_code
        unique (inventory_code)
)
    comment '盘点单';

create index idx_createtime_committime
    on oms_b2b_client_inventory (create_time, commit_time);

create index idx_cscode_istatus
    on oms_b2b_client_inventory (client_storehouse_code, inventory_status);

create table oms_b2b_client_inventory_info
(
    id             int(24) unsigned auto_increment comment '主键id'
        primary key,
    inventory_code varchar(13)  not null comment '盘点单号，P+仓库编号后5位+年份+3位顺序码',
    product_code   bigint       not null comment '产品编号',
    inventory_num  int(10)      not null comment '盘点数量',
    remarks        varchar(200) not null comment '备注，不能超过200',
    stock_num      int(10)      not null comment '盘点时刻的库存数量',
    constraint uniq_icode_pcode
        unique (inventory_code, product_code)
)
    comment '盘点单信息表';

create table oms_b2b_client_inventory_log
(
    id             int(24) unsigned auto_increment comment '主键id'
        primary key,
    inventory_code varchar(13)                         not null comment '盘点单号，P+仓库编号后5位+年份+3位顺序码',
    create_time    timestamp default CURRENT_TIMESTAMP null comment '操作时间',
    operate_name   tinyint(3)                          not null comment '操作名称:盘点人、运营审核',
    operate_result tinyint(3)                          not null comment '操作结果:提交、通过|驳回',
    reason         varchar(300)                        not null comment '驳回原因，不能超过300',
    create_code    varchar(50)                         not null comment '保存对应【外部账号管理】存储的【登录账号，长度32】，其他对应【员工工号】',
    create_name    varchar(36)                         not null comment '保存对应【外部账号管理】存储的【使用人，长度36】，其他对应【员工姓名36】'
)
    comment '盘点单记录表';

create index idx_icode_ctime
    on oms_b2b_client_inventory_log (inventory_code, create_time);

create table oms_b2b_client_order_delivery
(
    order_code          decimal(30) unsigned                       not null comment 'EC订单编号'
        primary key,
    delivery_status     tinyint unsigned default 1                 not null comment '登记状态(字典：oms_b2b_client_order_delivery_status)，0-无需登记，1-未登记，2-蓝月亮登记中，3-客户登记中，4-已提交',
    arrive_day          date                                       null comment '要求送达日期',
    delivery_start_time time                                       null comment '要求送货时间开始时间 只存时分',
    delivery_end_time   time                                       null comment '要求送货时间结束时间 只存时分',
    is_appointment      tinyint unsigned default 0                 not null comment '是否需要预约（字典：ec_oms_yes_no）0-否 1-是',
    appointment_day     smallint unsigned                          null comment '预约提前天数',
    is_upstairs         tinyint unsigned default 0                 not null comment '是否上楼（字典：ec_oms_yes_no）0-否 1-是',
    floor_num           varchar(10)                                null comment '楼层',
    is_lift             tinyint unsigned default 0                 null comment '是否有电梯（字典：ec_oms_yes_no）0-否 1-是',
    is_limit_car        tinyint unsigned default 0                 not null comment '是否限制车辆（字典：ec_oms_yes_no）0-否 1-是',
    car_limit_remark    varchar(500)                               null comment '车辆限制说明',
    is_limit_row        tinyint unsigned default 0                 not null comment '是否限行（字典：ec_oms_yes_no）0-否 1-是',
    limit_row_remark    varchar(500)                               null comment '道路限行说明',
    is_unloading        tinyint unsigned default 0                 not null comment '是否需卸货（字典：ec_oms_yes_no）0-否 1-是',
    is_move             tinyint unsigned default 0                 not null comment '是否平移搬运（字典：ec_oms_yes_no）0-否 1-是',
    move_range          varchar(100)                               null comment '搬运距离(字典：ship_move_range)',
    weekend_take        tinyint unsigned default 0                 not null comment '周末是否可收货 0-否 1-是',
    sign_method         varchar(300)     default ''                not null comment '签收交接方式(字典：oms_b2b_client_order_delivery_sign_method)',
    version             varchar(32)                                null comment '版本号，一次登记为一个版本号',
    create_code         varchar(10)                                null comment '创建人编码',
    create_name         varchar(32)                                null comment '创建人姓名',
    create_account      varchar(32)                                null comment '创建人账号',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    operator_id         varchar(10)                                null comment '操作人编号',
    operator_name       varchar(32)                                null comment '操作人名称',
    operator_account    varchar(32)                                null comment '操作人账号',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    is_bluemoon_del     tinyint(3)       default 0                 not null comment '是否物调删除，1-是，0-否'
)
    comment '客户登记配送要求表';

create index idx_delivery_status
    on oms_b2b_client_order_delivery (delivery_status);

create table oms_b2b_client_stock
(
    id                     int(24) unsigned auto_increment comment '主键id'
        primary key,
    client_storehouse_code varchar(10)                         not null comment '仓库编号',
    product_code           bigint                              not null comment '产品编号',
    stock_num              int(10)                             not null comment '库存数量',
    create_time            timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    changed_time           timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    create_code            varchar(50)                         not null comment '创建人登录账号(实际收货人)',
    create_name            varchar(50)                         null comment '创建人姓名',
    constraint uniq_cscode_pcode
        unique (client_storehouse_code, product_code)
)
    comment '库存表';

create index idx_stocknum
    on oms_b2b_client_stock (stock_num);

create table oms_b2b_client_stock_log
(
    id                     int(24) unsigned auto_increment comment '主键id'
        primary key,
    relate_code            varchar(68)                                not null comment '业务编号',
    client_storehouse_code varchar(10)                                not null comment '仓库编号',
    product_code           bigint                                     not null comment '产品编号',
    changed_code           varchar(50)                                null comment '修改人编码',
    changed_name           varchar(50)                                null comment '修改人姓名',
    stock_num_before       int(10)                                    not null comment '变更前库存数量',
    stock_num_after        int(10)                                    not null comment '变更后库存数量',
    changed_type           tinyint unsigned default 0                 not null comment '字典表ec_oms_stock_log_changed_type，变更业务：0-入库；1-盘点；2-提报；3-初始化',
    platform_type          tinyint unsigned default 0                 not null comment '字典表ec_oms_stock_log_platform_type，平台：0-微信小程序；1-web端',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间,数据修改时间'
)
    comment '库存流水表';

create index idx_dcode_ctime
    on oms_b2b_client_stock_log (relate_code, create_time);

create table oms_b2b_client_storehouse
(
    client_storehouse_code varchar(10)                                not null comment '仓库编号，生成规则：CK+客户编号后4位+客户仓库数量3位顺序码'
        primary key,
    storehouse_name        varchar(50)                                not null comment '仓库名称',
    supply_city_code       varchar(1024)                              not null comment '供货城市编号，多个英文逗号分隔',
    supply_city_name       varchar(1024)                              not null comment '供货城市名称，多个逗号分隔',
    client_code            varchar(15)                                not null comment '客户编号',
    is_frozen              tinyint unsigned default 0                 not null comment '是否冻结（字典：ec_oms_yes_no）0-否 1-是',
    charge_name            varchar(30)                                not null comment '负责人姓名',
    charge_phone           varchar(20)                                not null comment '负责人电话',
    charge_phone_cipher    varchar(88)                                null comment '负责人电话',
    storehouse_tel         varchar(30)                                null comment '仓库固话',
    province_code          int(10)                                    not null comment '省份编码',
    province_name          varchar(50)                                not null comment '省份名称',
    city_code              int(10)                                    not null comment '城市编码',
    city_name              varchar(50)                                not null comment '城市名称',
    county_code            int(10)                                    not null comment '区县编码',
    county_name            varchar(50)                                not null comment '区县名称',
    town                   varchar(32)                                null comment '街道乡镇',
    village                varchar(32)                                null comment '社区/村',
    address                varchar(255)                               not null comment '详细地址',
    day_need               smallint unsigned                          not null comment '要求送达天数',
    delivery_start_time    time                                       not null comment '要求送货时间开始时间 只存时分',
    delivery_end_time      time                                       not null comment '要求送货时间结束时间 只存时分',
    is_appointment         tinyint unsigned default 0                 not null comment '是否需要预约（字典：ec_oms_yes_no）0-否 1-是',
    appointment_day        smallint unsigned                          null comment '预约提前天数',
    is_upstairs            tinyint unsigned default 0                 not null comment '是否上楼（字典：ec_oms_yes_no）0-否 1-是',
    floor_num              varchar(10)                                null comment '楼层',
    is_lift                tinyint unsigned default 0                 not null comment '是否有电梯（字典：ec_oms_yes_no）0-否 1-是',
    is_limit_car           tinyint unsigned default 0                 not null comment '是否限制车辆（字典：ec_oms_yes_no）0-否 1-是',
    car_limit_remark       varchar(500)                               null comment '车辆限制说明',
    is_limit_row           tinyint unsigned default 0                 not null comment '是否限行（字典：ec_oms_yes_no）0-否 1-是',
    limit_row_remark       varchar(500)                               null comment '道路限行说明',
    is_unloading           tinyint unsigned default 0                 not null comment '是否需卸货（字典：ec_oms_yes_no）0-否 1-是',
    is_move                tinyint unsigned default 0                 not null comment '是否平移搬运（字典：ec_oms_yes_no）0-否 1-是',
    move_range             varchar(100)                               null comment '搬运距离(字典：ship_move_range)',
    weekend_take           tinyint unsigned default 0                 not null comment '周末是否可收货 0-否 1-是',
    sign_method            varchar(300)     default ''                not null comment '签收交接方式',
    create_code            int unsigned                               null comment '创建人编码',
    create_name            varchar(50)                                null comment '创建人姓名',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code           int(10)                                    null comment '修改人/操作人编码',
    changed_name           varchar(50)                                null comment '修改人/操作人姓名',
    changed_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag               tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '客户仓库信息表';

create index idx_client_code
    on oms_b2b_client_storehouse (client_code)
    comment '客户编号索引';

create table oms_b2b_delivery_register_info
(
    id                  int auto_increment comment '主键ID'
        primary key,
    order_code          varchar(32)                        null comment '订单编号',
    order_id            varchar(64)                        null comment '外部订单id',
    order_source        varchar(34)                        null comment '外部订单来源',
    delivery_date       datetime                           null comment '要求送达日期',
    start_delivery_date datetime                           null comment '开始送货时间',
    end_delivery_date   datetime                           null comment '结束送货时间',
    is_appointment      tinyint                            null comment '是否预约(1:是，0：否)',
    appointment_day     int(10)                            null comment '预约提前几天',
    is_upstairs         tinyint                            null comment '是否上楼(1：是，0：否)',
    floor_num           varchar(10)                        null comment '楼层',
    is_lift             tinyint                            null comment '是否有电梯(1:有，0：没有)',
    is_limit_car        tinyint                            null comment '是否限制车辆(1:是，0：否)',
    car_limit_remark    varchar(200)                       null comment '车辆限制说明',
    is_limit_row        tinyint                            null comment '是否限行(1:是，0：否)',
    limit_row_remark    varchar(200)                       null comment '限行说明',
    is_unloading        tinyint                            null comment '是否卸货(1:是，0：否)',
    is_move             tinyint                            null comment '是否平移搬运(1:是，0：否)',
    move_range          int(10)                            null comment '搬运距离',
    weekend_take        tinyint                            null comment '是否周末收货(1:是，0：否)',
    sign_type           varchar(200)                       null comment '签收方式',
    bill_image1         varchar(1024)                      null comment '单据图片1',
    bill_image2         varchar(1024)                      null comment '单据图片2',
    remark              varchar(512)                       null comment '备注',
    register_id         varchar(64)                        null comment '登记人id',
    register_name       varchar(50)                        null comment '登记人姓名',
    register_status     tinyint  default 0                 null comment '登记状态(0:未登记，1：已登记，2：已提交)',
    register_time       datetime default CURRENT_TIMESTAMP null comment '登记时间',
    export_status       tinyint                            null comment '导出状态(1：已导出,2:未导出)',
    export_time         datetime                           null comment '导出时间',
    export_user_code    int(10)                            null comment '导出人编号',
    export_user_name    varchar(50)                        null comment '导出人名称',
    changed_time        datetime default CURRENT_TIMESTAMP null comment '修改/操作时间',
    changed_code        int(10)                            null comment '修改人/操作人编码',
    changed_name        varchar(50)                        null comment '修改人/操作人姓名',
    client_code         varchar(15)                        null comment '客户编号',
    del_flag            tinyint  default 0                 null comment '删除标识  1-删除',
    create_time         datetime                           null comment '创建时间',
    create_code         int(10)                            null comment '创建人编码',
    create_name         varchar(50)                        null comment '创建人姓名',
    bill_file           varchar(1024)                      null comment '随行单据附件'
)
    comment '配送信息登记表';

create index idx_oid_osr
    on oms_b2b_delivery_register_info (order_id, order_source);

create index idx_ordercode
    on oms_b2b_delivery_register_info (order_code);

create table oms_b2b_finance_amount_stock
(
    id                    int auto_increment comment '主键ID'
        primary key,
    client_code           varchar(10)                                null comment '客户编码',
    available_credit      decimal(10, 2)                             null comment '预存款金额',
    line_credit           decimal(10, 2)                             null comment '授信额度/可透支额度',
    accumulative_amount   decimal(16, 2)                             null comment '累计预存款金额',
    deductible_amount     decimal(10, 2)                             null comment '可抵扣金额',
    sum_deductible_amount decimal(16, 2)                             null comment '累计可抵扣金额',
    create_code           int unsigned                               null comment '创建人编码',
    create_name           varchar(255)                               null comment '创建人姓名',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code          int unsigned                               null comment '操作人编码',
    changed_name          varchar(255)                               null comment '操作人姓名',
    changed_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag              tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除',
    constraint idx_client_code
        unique (client_code)
)
    comment 'B2B客户额度管理信息表';

create table oms_b2b_finance_client_daily_balance
(
    id                  int unsigned auto_increment comment 'id'
        primary key,
    client_code         varchar(15)                              not null comment '客户编码',
    every_day           date                                     not null comment '日期',
    credit_balance      decimal(10, 2) default 0.00              not null comment '预存款金额余额',
    deductible_amount   decimal(10, 2) default 0.00              not null comment '可抵扣金额余额',
    line_credit_balance decimal(10, 2) default 0.00              not null comment '可透支额度余额',
    last_update_time    timestamp      default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    constraint idx_client_code_every_day
        unique (client_code, every_day)
)
    comment 'B2B客户每天余额信息表';

create table oms_b2b_finance_clinent_quota_monitor_balance
(
    client_code      varchar(10)   default ''                not null comment '监控客户编号'
        primary key,
    warn_money_one   decimal(8, 2) default 0.00              null comment '提醒金额',
    warn_money_two   decimal(8, 2) default 0.00              null comment '提醒金额',
    create_time      timestamp     default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp     default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间'
)
    comment '客户额度监控表';

create table oms_b2b_finance_clinent_quota_monitor_receiver
(
    client_code varchar(10)                         not null comment '监控客户编号',
    email       varchar(64)                         not null comment '预警收件人',
    create_time timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    primary key (client_code, email)
)
    comment '客户额度监控预警邮件接收人表';

create table oms_b2b_finance_clinent_quota_monitor_sender
(
    email       varchar(64)                         not null comment '邮件发件人'
        primary key,
    password    varchar(255)                        null comment '邮箱密码',
    create_time timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '客户额度监控预警邮件发送人表';

create table oms_b2b_finance_debited_quota_fail_log
(
    id                        int(11) unsigned auto_increment comment '主键id'
        primary key,
    client_code               varchar(10)                                null comment '客户编码',
    current_deductible_amount decimal(10, 2)                             null comment '当前可抵扣金额',
    current_available_credit  decimal(10, 2)                             null comment '当前预存款金额',
    fail_start_time           timestamp                                  not null comment '扣款失败时间',
    auto_execute_job_id       int unsigned                               null comment '补抓任务编号',
    auto_execute_flag         tinyint unsigned default 0                 null comment '补抓标识 0-未补抓 1-已补抓',
    auto_execute_time         timestamp                                  null comment '补抓执行时间',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag                  tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B客户额度扣款失败日志表';

create table oms_b2b_finance_receipt_settlement_detail
(
    id                bigint unsigned auto_increment comment 'id'
        primary key,
    client_code       varchar(15)                                null comment '客户编号',
    order_id          varchar(64)                                null comment '外部订单编号',
    order_source      varchar(32)                                null comment '订单来源',
    order_code        varchar(64)                                null comment '内部订单编号',
    order_payment     decimal(20, 2)                             null comment '订单总金额  扣减的金额',
    credit_balance    decimal(10, 2)                             null comment '预存款金额余额',
    deductible_amount decimal(10, 2)   default 0.00              not null comment '可抵扣金额余额',
    pay_type          tinyint unsigned default 2                 not null comment '支付类型,字典ec_b2b_pay_type@1-可抵扣金额支付，2-预存款金额支付',
    is_return         tinyint unsigned default 0                 null comment '是否已经进行额度返还（字典：ec_oms_yes_no）@1-是 0-否',
    return_payment    decimal(20, 2)   default 0.00              null comment '返还扣款金额，全部返还则等于order_payment',
    create_code       int unsigned                               null comment '创建人编码',
    create_name       varchar(255)                               null comment '创建人姓名',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag          tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B先款后货订单结算明细';

create index idx_chatime
    on oms_b2b_finance_receipt_settlement_detail (changed_time);

create index idx_client_ctime
    on oms_b2b_finance_receipt_settlement_detail (client_code, create_time);

create index idx_client_ctime_code
    on oms_b2b_finance_receipt_settlement_detail (client_code, create_time);

create index idx_create_time
    on oms_b2b_finance_receipt_settlement_detail (create_time);

create index idx_ctime_ocode
    on oms_b2b_finance_receipt_settlement_detail (create_time, order_code);

create index idx_order_code
    on oms_b2b_finance_receipt_settlement_detail (order_code);

create index idx_order_id_source
    on oms_b2b_finance_receipt_settlement_detail (order_id, order_source);

create table oms_b2b_finance_recharge_base
(
    recharge_code         bigint unsigned                            not null comment '充值单号,年月日+5位序号'
        primary key,
    unique_code           varchar(25)                                null comment '财务同步充值单唯一编号',
    recharge_status       tinyint unsigned                           null comment '状态,字典b2b_recharge_status@0-已取消 1-待审核 2-审核通过 3-审核不通过',
    client_code           varchar(15)                                null comment '客户编号',
    company_full_name     varchar(100)                               null comment '公司名称',
    recharge_type         tinyint unsigned default 2                 not null comment '充值类型，字典：ec_b2b_recharge_type@1-可抵扣金额,2-预存款金额',
    bill_num              int unsigned                               null comment '单据总数',
    recharge_total_amount decimal(10, 2)                             null comment '充值总金额',
    credit_balance        decimal(10, 2)                             null comment '预存款金额余额',
    deductible_amount     decimal(10, 2)   default 0.00              not null comment '可抵扣金额余额',
    recharge_source       tinyint unsigned default 1                 not null comment '充值来源,字典ec_b2b_recharge_source@1-人工充值，2-系统返还,3-FNC推送充值,4-FNC推送扣款，5-售后退款',
    order_code            decimal(30)                                null comment 'EC订单编号，关联ec_oms_order',
    remark                varchar(255)                               null comment '备注',
    verify_code           int unsigned                               null comment '审核人编码',
    verify_name           varchar(50)                                null comment '审核人名称',
    verify_time           datetime                                   null comment '审核时间',
    verify_opinion        tinyint unsigned                           null comment '审核意见 0-不通过 1-通过',
    verify_explain        varchar(255)                               null comment '审核说明',
    create_code           int unsigned                               null comment '创建人编码',
    create_name           varchar(50)                                null comment '创建人姓名',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code          int(10)                                    null comment '修改人/操作人编码',
    changed_name          varchar(50)                                null comment '修改人/操作人姓名',
    changed_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag              tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B客户信用额度充值信息表';

create index idx_client_code
    on oms_b2b_finance_recharge_base (client_code);

create table oms_b2b_finance_recharge_sub
(
    id                     int auto_increment comment 'id'
        primary key,
    recharge_code          bigint unsigned                               null comment '充值单号',
    recharge_method        tinyint unsigned                              null comment '充值方式:(业务字典b2b_recharge_method) 0-对公转账 1-运费链接 2-虚拟充值 3-扣款/退款',
    recharge_amount        decimal(10, 2)                                null comment '充值金额/系统返还的单据金额',
    transaction_serial_num varchar(32)                                   null comment '交易流水号/系统返还依据，记录订单对应的扣款明细id',
    order_code             varchar(32)                                   null comment '运费链接订单号',
    pay_company            varchar(100)                                  null comment '付款公司',
    pay_date               date                                          null comment '付款日期',
    return_bill_pic        varchar(512)                                  null comment '汇款单图片',
    del_flag               tinyint(2) unsigned default 0                 null comment '是否删除（0，有效；1，删除）',
    last_update_time       timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间'
)
    comment 'B2B客户信用额度充值明细表';

create index idx_luptime
    on oms_b2b_finance_recharge_sub (last_update_time);

create index idx_recharge_code
    on oms_b2b_finance_recharge_sub (recharge_code);

create table oms_b2b_finance_settlement_detail
(
    id                bigint unsigned auto_increment comment 'id'
        primary key,
    settlement_code   bigint unsigned  null comment '结算单号,年月日+5位序号',
    order_id          varchar(64)      null comment '外部订单编号',
    order_source      varchar(32)      null comment '订单来源',
    order_code        varchar(64)      null comment '内部订单编号',
    buyer_nick        varchar(64)      null comment '买家id',
    order_total_price decimal(20, 2)   null comment '报价总金额',
    post_fee          decimal(20, 2)   null comment '运费',
    order_payment     decimal(20, 2)   null comment '订单总金额',
    get_price_type    tinyint unsigned null comment '取数逻辑 1-特殊价格 2-等级价格 ',
    product_code      varchar(32)      null comment '商品编号',
    buy_num           int(11) unsigned null comment '购买数量',
    level_price       decimal(10, 2)   null comment '等级价格',
    pro_price         decimal(10, 2)   null comment '产品报价'
)
    comment 'B2B结算管理结算明细';

create index idx_order_code
    on oms_b2b_finance_settlement_detail (order_code);

create index idx_order_id_source
    on oms_b2b_finance_settlement_detail (order_id, order_source);

create index idx_product_code
    on oms_b2b_finance_settlement_detail (product_code);

create index idx_settlement_code
    on oms_b2b_finance_settlement_detail (settlement_code);

create table oms_b2b_finance_settlement_info
(
    settlement_code bigint unsigned                            not null comment '结算单号,年月日+5位序号'
        primary key,
    b2b_type        tinyint unsigned                           null comment 'b2b类型 1-销售 2-分销',
    client_code     varchar(15)                                null comment '客户编号',
    settlement_type tinyint unsigned                           null comment '结算方式 0-账期定期批量结算',
    order_num       int unsigned                               null comment '订单总数',
    total_amount    decimal(10, 2)                             null comment '结算总金额',
    before_amount   decimal(10, 2)                             null comment '结算前信用额度',
    after_amount    decimal(10, 2)                             null comment '结算后信用额度',
    create_code     int unsigned                               null comment '创建人编码',
    create_name     varchar(255)                               null comment '创建人姓名',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code    int unsigned                               null comment '操作人编码',
    changed_name    varchar(255)                               null comment '操作人姓名',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag        tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B结算管理记录表';

create index idx_client_code
    on oms_b2b_finance_settlement_info (client_code);

create table oms_b2b_finance_settlement_oper_info
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    client_code   varchar(15)                                null comment '客户编码',
    order_id      varchar(64)                                null comment '外部订单编号',
    order_source  varchar(32)                                null comment '订单来源',
    order_code    varchar(64)                                null comment '内部订单编号',
    product_code  varchar(32)                                null comment '商品编号',
    is_settlement tinyint unsigned                           null comment '是否已结算 0-否 1-是',
    is_delay      tinyint unsigned                           null comment '是否延期结算 0-否 1-是',
    delay_reason  varchar(255)                               null comment '延期结算原因',
    delay_code    bigint unsigned                            null comment '延期结算编号',
    create_code   int unsigned                               null comment '延期结算人编码',
    create_name   varchar(255)                               null comment '延期结算人姓名',
    create_time   timestamp        default CURRENT_TIMESTAMP null comment '延期结算时间',
    changed_code  int unsigned                               null comment '操作人编码',
    changed_name  varchar(255)                               null comment '操作人姓名',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag      tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B已结算/延期结算记录表';

create index idx_client_code
    on oms_b2b_finance_settlement_oper_info (client_code);

create index idx_order_code
    on oms_b2b_finance_settlement_oper_info (order_code);

create index idx_order_id_source
    on oms_b2b_finance_settlement_oper_info (order_id, order_source);

create index idx_product_code
    on oms_b2b_finance_settlement_oper_info (product_code);

create table oms_b2b_level_price_update
(
    update_list_code bigint unsigned                            not null comment '更新单号,年月日+4位序号，格式;202012310001'
        primary key,
    update_list_name varchar(100)                               not null comment '更新单名称',
    list_size        int unsigned     default 0                 not null comment '更新单包含配置数量',
    b2b_type         tinyint unsigned default 1                 not null comment 'b2b类型 1-销售 2-分销',
    update_status    tinyint unsigned default 0                 not null comment '更新单状态,业务字典ec_b2b_update_status @0-待提交、1-待审核、2-审核通过、3-审核不通过',
    level_num        tinyint unsigned                           not null comment '等级/量级',
    valid_start_time timestamp                                  not null comment '更新单生效时间',
    valid_end_time   timestamp                                  not null comment '更新单失效时间',
    auditor_code     int unsigned                               null comment '审核人编号',
    auditor_name     varchar(32)                                null comment '审核人姓名',
    audit_time       timestamp                                  null comment '审核时间',
    auditor_opinion  varchar(512)                               null comment '审核不通过原因',
    create_code      int unsigned                               null comment '创建人编码',
    create_name      varchar(32)                                null comment '创建人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code     int(10)                                    null comment '修改人/操作人编码',
    changed_name     varchar(32)                                null comment '修改人/操作人姓名',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售重量价/分销等级管控价更新单表';

create table oms_b2b_level_price_update_product
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    update_list_code bigint unsigned                            not null comment '更新单号，关联oms_b2b_level_price_update',
    product_code     bigint unsigned                            not null comment '商品编号',
    level_price      decimal(10, 2) unsigned                    null comment '等级管控价',
    config_code      varchar(30)                                not null comment '配置单号,更新单编号+商品编号',
    is_same          tinyint unsigned default 1                 not null comment '配置和更新单时间一致性,业务字典ec_oms_yes_no@0-否 1-是',
    valid_start_time timestamp                                  null comment '配置生效时间',
    valid_end_time   timestamp                                  null comment '配置失效时间',
    is_stop          tinyint unsigned default 0                 null comment '是否停用（字典：ec_oms_yes_no）0-否 1-是',
    create_code      int unsigned                               null comment '创建人编码',
    create_name      varchar(32)                                null comment '创建人姓名',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code     int unsigned                               null comment '操作人编码',
    changed_name     varchar(32)                                null comment '操作人姓名',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售重量价/分销等级管控价更新单商品配置表';

create index idx_update_code
    on oms_b2b_level_price_update_product (update_list_code, product_code);

create table oms_b2b_level_price_update_product_magnitude
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    update_list_code bigint unsigned                            not null comment '更新单号，关联oms_b2b_level_price_update',
    product_code     bigint unsigned                            not null comment '商品编号',
    magnitude_num    tinyint unsigned                           not null comment '量级',
    magnitude_price  decimal(10, 2) unsigned                    null comment '量级价格',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag         tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B销售重量价更新单商品配置的等级量级价表';

create index idx_update_code
    on oms_b2b_level_price_update_product_magnitude (update_list_code, product_code);

create table oms_b2b_oper_client_account
(
    id                  int unsigned auto_increment comment 'id'
        primary key,
    client_code         varchar(15)      null comment '客户编号',
    account_type        tinyint unsigned null comment '账号类型 0-付款 1-收款',
    account_company     varchar(100)     null comment '账户公司名称',
    account_bank        varchar(100)     null comment '账户银行开户行',
    account_card        varchar(100)     null comment '付款/收款账号',
    account_card_cipher varchar(408)     null comment '付款/收款账号'
)
    comment 'B2B客户档案管理收/付款账号表';

create index idx_client_code
    on oms_b2b_oper_client_account (client_code);

create table oms_b2b_oper_client_base
(
    client_code                    varchar(15)                                not null comment '客户编号'
        primary key,
    client_status                  tinyint unsigned                           null comment '档案状态 0-待补充 1-已齐全',
    sap_code                       varchar(30)                                null comment 'sap客户编号',
    buyer_nick                     varchar(50)                                null comment '买家ID',
    client_name                    varchar(50)                                null comment '客户姓名',
    client_name_cipher             varchar(216)                               null comment '客户姓名',
    mobile_phone                   bigint(11)                                 null comment '手机号码',
    mobile_phone_cipher            varchar(512)                               null comment '手机号码',
    client_short_name              varchar(50)                                null comment '客户简称',
    company_full_name              varchar(100)                               null comment '公司名称',
    province_code                  int(10)                                    null comment '省份编码',
    province_name                  varchar(50)                                null comment '省份名称',
    city_code                      int(10)                                    null comment '城市编码',
    city_name                      varchar(50)                                null comment '城市名称',
    county_code                    int(10)                                    null comment '区县编码',
    county_name                    varchar(50)                                null comment '区县名称',
    company_address                varchar(255)                               null comment '公司详细地址',
    company_address_cipher         varchar(1024)                              null comment '公司详细地址',
    is_frozen                      tinyint unsigned                           null comment '是否冻结 0-否 1-是',
    other_contact                  varchar(100)                               null comment '其他联系方式',
    remark                         varchar(255)                               null comment '备注',
    charge_code                    int unsigned                               null comment '负责人编码',
    charge_name                    varchar(50)                                null comment '负责人姓名',
    charge_phone                   varchar(50)                                null comment '负责人电话',
    charge_phone_cipher            varchar(216)                               null comment '负责人电话',
    business_licence_pic1          varchar(512)                               null comment '营业执照图片1路径',
    business_licence_pic2          varchar(512)                               null comment '营业执照图片2路径',
    business_licence_pic3          varchar(512)                               null comment '营业执照图片3路径 pdf',
    business_licence_pic3_name     varchar(256)                               null comment '营业执照图片3附件名称',
    business_licence_pic4          varchar(512)                               null comment '营业执照图片4路径 pdf',
    business_licence_pic4_name     varchar(256)                               null comment '营业执照图片4附件名称',
    contract_pic1                  varchar(512)                               null comment '合同扫描件1路径',
    contract_pic2                  varchar(512)                               null comment '合同扫描件2路径',
    contract_pic3                  varchar(512)                               null comment '合同扫描件3路径pdf',
    contract_pic3_name             varchar(256)                               null comment '合同扫描件4附件名称',
    contract_pic4                  varchar(512)                               null comment '合同扫描件4路径pdf',
    contract_pic4_name             varchar(256)                               null comment '合同扫描件4附件名称',
    is_open_invoice                tinyint unsigned                           null comment '是否开发票 0-否 1-是',
    invoice_type                   tinyint unsigned                           null comment '抬头类型 0-个人 1-企业',
    invoice_info_type              tinyint unsigned                           null comment '发票类型（字典：ec_oms_invoice_info_type）1-增值税普通发票(电子)、2-增值税专用发票(电子)、3-增值税专用发票(纸质)',
    invoice_name                   varchar(100)                               null comment '开票公司名称',
    invoice_duty_paragraph         varchar(100)                               null comment '开票公司税号',
    invoice_address                varchar(255)                               null comment '开票公司地址',
    invoice_phone                  varchar(50)                                null comment '开票公司电话',
    invoice_bank                   varchar(100)                               null comment '开票银行开户行',
    invoice_account                varchar(100)                               null comment '开票银行账号',
    invoice_account_cipher         varchar(408)                               null comment '开票银行账号',
    receive_invoice_name           varchar(50)                                null comment '收票人姓名',
    receive_invoice_name_cipher    varchar(216)                               null comment '收票人姓名',
    receive_invoice_phone          varchar(50)                                null comment '收票人电话',
    receive_invoice_phone_cipher   varchar(216)                               null comment '收票人电话',
    receive_province_code          int unsigned                               null comment '收票省份编号',
    receive_province_name          varchar(50)                                null comment '收票省份名称',
    receive_city_code              int unsigned                               null comment '收票城市编码',
    receive_city_name              varchar(50)                                null comment '收票城市名称',
    receive_county_code            int unsigned                               null comment '收票区县编码',
    receive_county_name            varchar(50)                                null comment '收票区县名称',
    receive_invoice_address        varchar(255)                               null comment '收票详细地址',
    receive_invoice_address_cipher varchar(1024)                              null comment '收票详细地址',
    is_delivery                    tinyint unsigned                           null comment '是否登记配送信息 0-否 1-是',
    day_need                       smallint unsigned                          null comment '要求送达天数',
    delivery_start_time            datetime                                   null comment '要求送货时间开始时间 只存时分，日期默认2000-1-1',
    delivery_end_time              datetime                                   null comment '要求送货时间结束时间 只存时分，日期默认2000-1-1',
    is_appointment                 tinyint unsigned                           null comment '是否需要预约 0-否 1-是',
    appointment_day                smallint unsigned                          null comment '预约提前天数',
    is_upstairs                    tinyint unsigned                           null comment '是否上楼 0-否 1-是',
    floor_num                      varchar(10)                                null comment '楼层',
    is_lift                        tinyint unsigned                           null comment '是否有电梯 0-否 1-是',
    is_limit_car                   tinyint unsigned                           null comment '是否限制车辆 0-否 1-是',
    car_limit_remark               varchar(100)                               null comment '车辆限制说明',
    is_limit_row                   tinyint unsigned                           null comment '是否限行 0-否 1-是',
    limit_row_remark               varchar(100)                               null comment '道路限行说明',
    is_unloading                   tinyint unsigned                           null comment '是否需卸货 0-否 1-是',
    is_move                        tinyint unsigned                           null comment '是否平移搬运 0-否 1-是',
    move_range                     varchar(100)                               null comment '搬运距离(单位米)',
    weekend_take                   tinyint unsigned                           null comment '周末是否可收货 0-否 1-是',
    is_twining                     tinyint unsigned default 0                 null comment '是否缠膜 0-否 1-是（字典：ec_oms_yes_no）',
    sign_method                    varchar(100)                               null comment '签收交接方式',
    delivery_remark                varchar(255)                               null comment '配送备注',
    manage_distri_channel          tinyint unsigned default 0                 not null comment '管理客户分销渠道（字典：ec_oms_yes_no）@1-是，0-否',
    distri_channel_codes           varchar(255)                               null comment '分销渠道编号，多个英文逗号分隔',
    distri_commission_ratio        decimal(5, 4)                              null comment '分销佣金比例',
    refund_type                    tinyint unsigned                           null comment '退款额度类型(字典：ec_b2b_refund_type) 1-返充至可抵扣 2-返充至预存款',
    create_code                    int unsigned                               null comment '创建人编码',
    create_name                    varchar(50)                                null comment '创建人姓名',
    create_time                    timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code                   int(10)                                    null comment '修改人/操作人编码',
    changed_name                   varchar(50)                                null comment '修改人/操作人姓名',
    changed_time                   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag                       tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除',
    receive_invoice_email          varchar(50)                                null comment '收票人邮箱'
)
    comment 'B2B客户档案管理表';

create index idx_channel_codes
    on oms_b2b_oper_client_base (manage_distri_channel, distri_channel_codes)
    comment '分销渠道索引';

create table oms_b2b_oper_client_platform
(
    id                   int unsigned auto_increment comment 'id'
        primary key,
    client_code          varchar(15)                   not null comment '客户编号',
    shop_code            int unsigned                  null comment '店铺编号，关联ec_oms_channel_shop_base.shop_code',
    platform_source      varchar(30)                   null comment '平台来源',
    delivery_limitation  mediumint unsigned default 48 not null comment '发货时效(回传快递单号)，单位小时',
    logistics_collection mediumint unsigned default 72 not null comment '发货时效(物流揽收)，单位小时'
)
    comment 'B2B客户档案管理平台来源表';

create index idx_client_code
    on oms_b2b_oper_client_platform (client_code);

create table oms_b2b_oper_client_relation
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    p_client_code varchar(15) null comment '父客户编号',
    c_client_code varchar(15) null comment '子客户编号'
)
    comment 'B2B客户档案管理客户之间关系表';

create index idx_c_client
    on oms_b2b_oper_client_relation (c_client_code);

create index idx_p_client
    on oms_b2b_oper_client_relation (p_client_code);

create table oms_b2b_oper_client_setting
(
    id                 int unsigned auto_increment comment 'id'
        primary key,
    client_code        varchar(15)                                null comment '客户编号',
    b2b_type           tinyint unsigned                           null comment 'b2b类型 1-销售 2-分销',
    is_target_client   tinyint unsigned                           null comment '是否是销售/分销客户 0-否 1-是',
    client_type        tinyint unsigned                           null comment '客户类型(字典:分销客户查看ec_oms_distribution_client_type 销售客户查看ec_oms_sale_client_type)',
    b2b_level          tinyint unsigned                           null comment '销售/分销等级',
    auto_examine_adopt tinyint unsigned                           null comment '导入销售订单自动财审通过 0-否 1-是',
    is_operation_audit tinyint unsigned default 0                 null comment '运营审核订单（字典：ec_oms_yes_no）0-否 1-是',
    co_start_time      datetime                                   null comment '合作生效时间',
    co_end_time        datetime                                   null comment '合作失效时间',
    is_pay             tinyint unsigned                           null comment '是否结算 0-否 1-是',
    pay_type           tinyint unsigned                           null comment '结算方式 0-账期定期批量结算 1-先款后货每单结算',
    pay_day            smallint unsigned                          null comment '结算周期（天）',
    create_code        int unsigned                               null comment '创建人编码',
    create_name        varchar(50)                                null comment '创建人姓名',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code       int(10)                                    null comment '修改人/操作人编码',
    changed_name       varchar(50)                                null comment '修改人/操作人姓名',
    changed_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag           tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B客户销售/分销信息管理表';

create index idx_client_code
    on oms_b2b_oper_client_setting (client_code);

create table oms_b2b_oper_strategy_present_limit
(
    strategy_code   bigint unsigned                            not null comment '策略编号,年月日+5位序号'
        primary key,
    strategy_name   varchar(100)                               null comment '策略名称',
    b2b_type        tinyint unsigned                           not null comment 'B2B类型 1-销售 2-分销',
    start_time      datetime                                   null comment '开始时间',
    end_time        datetime                                   null comment '结束时间',
    strategy_remark varchar(255)                               null comment '策略说明',
    strategy_target tinyint unsigned default 1                 not null comment '策略对象,字典ec_b2b_strategy_target@1-单个客户,2-同SAP客户编号所有客户',
    sap_code        varchar(30)                                null comment 'SAP客户编号',
    client_code     varchar(15)                                null comment '客户编码',
    is_stop         tinyint unsigned default 0                 null comment '是否停用 0-否 1-是',
    present_total   int unsigned                               null comment '允许商品种类数量',
    create_code     int unsigned                               null comment '建档人编码',
    create_name     varchar(255)                               null comment '建档人姓名',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '建档时间',
    changed_code    int unsigned                               null comment '操作人编码',
    changed_name    varchar(255)                               null comment '操作人姓名',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag        tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B赠品限定策略管理';

create index idx_client_code
    on oms_b2b_oper_strategy_present_limit (client_code);

create table oms_b2b_oper_strategy_present_list
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    strategy_code    bigint unsigned        null comment '策略编号,年月日+5位序号',
    present_code     varchar(64)            null comment '产品编码',
    present_num      int unsigned           null comment '允许销售赠品数量',
    sold_present_num int unsigned default 0 null comment '历史销售/已使用赠品总数'
)
    comment 'B2B赠品限定策略管理关联赠品表';

create table oms_b2b_oper_strategy_product_limit
(
    strategy_code   bigint unsigned                            not null comment '策略编号,年月日+5位序号'
        primary key,
    strategy_name   varchar(100)                               null comment '策略名称',
    b2b_type        tinyint unsigned                           not null comment 'B2B类型 1-销售 2-分销',
    limit_type      tinyint(3)       default 1                 not null comment '策略类型1-允许策略2-限制策略',
    start_time      datetime                                   null comment '开始时间',
    end_time        datetime                                   null comment '结束时间',
    strategy_remark varchar(255)                               null comment '策略说明',
    client_code     varchar(15)                                null comment '客户编码',
    is_stop         tinyint unsigned default 0                 null comment '是否停用 0-否 1-是',
    product_total   int unsigned                               null comment '允许商品种类数量',
    create_code     int unsigned                               null comment '建档人编码',
    create_name     varchar(255)                               null comment '建档人姓名',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '建档时间',
    changed_code    int unsigned                               null comment '操作人编码',
    changed_name    varchar(255)                               null comment '操作人姓名',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag        tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B商品限定策略管理';

create index idx_client_code
    on oms_b2b_oper_strategy_product_limit (client_code);

create table oms_b2b_oper_strategy_product_list
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    strategy_code bigint unsigned null comment '策略编号,年月日+5位序号',
    product_code  varchar(64)     null comment '产品编码'
)
    comment 'B2B商品限定策略管理关联商品表';

create index idx_strcode_procode
    on oms_b2b_oper_strategy_product_list (strategy_code, product_code);

create table oms_b2b_order_use_strategy_present
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    order_code    decimal(30) unsigned                       not null comment 'EC订单编号，关联ec_oms_order',
    order_pro_id  int unsigned                               null comment '订单商品明细id，关联ec_oms_order_product_detail',
    strategy_code bigint unsigned                            not null comment '策略编号，关联oms_b2b_oper_strategy_present_limit',
    product_code  bigint unsigned                            not null comment '商品编号',
    use_num       int unsigned                               null comment '已使用赠品数量',
    surplus_num   int unsigned                               null comment '剩余未使用赠品数量',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag      tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '订单应用b2b加赠策略明细表';

create index idx_strategy_code
    on oms_b2b_order_use_strategy_present (strategy_code);

create table oms_b2b_order_use_strategy_price
(
    id             int unsigned auto_increment comment 'id'
        primary key,
    order_code     decimal(30) unsigned                       not null comment 'EC订单编号，关联ec_oms_order',
    order_pro_id   int unsigned                               null comment '订单商品明细id，关联ec_oms_order_product_detail',
    strategy_code  bigint unsigned                            not null comment '策略编号，关联oms_b2b_base_strategy_info',
    product_code   bigint unsigned                            not null comment '商品编号',
    strategy_price decimal(10, 2) unsigned                    null comment '策略价格',
    use_num        int unsigned                               null comment '取特殊价商品已用数量',
    changed_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '操作时间',
    del_flag       tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment '订单取策略特殊价明细表';

create index idx_strategy_code
    on oms_b2b_order_use_strategy_price (strategy_code);

create table oms_b2b_plat_ec_product_relation
(
    distri_channel_code varchar(10)     not null comment '分销渠道编号',
    plat_product_code   varchar(32)     not null comment '平台商品编号',
    ec_product_code     bigint unsigned not null comment 'EC商品编号',
    primary key (distri_channel_code, plat_product_code)
)
    comment '平台商品与EC商品关联表';

create table oms_b2b_receipt
(
    id                     int(24) unsigned auto_increment comment '主键id'
        primary key,
    receipt_code           varchar(68)                                not null comment '收货单号：SH+店铺订单编号+2位顺序码',
    shop_order_id          varchar(64)                                not null comment '店铺订单编号',
    receipt_type           tinyint unsigned default 0                 not null comment '入库类型：采购入库,保留字段，扩展用，暂时默认0.',
    client_storehouse_code varchar(10)                                not null comment '收货仓库',
    client_code            varchar(15)                                not null comment '所属客户编号(实际收货人)',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '收货时间，创建时间',
    create_code            varchar(50)                                not null comment '创建人登录账号(实际收货人)',
    create_name            varchar(50)                                null comment '创建人姓名(实际收货人)',
    constraint uniq_receipt_code
        unique (receipt_code)
)
    comment '收货单';

create index idx_cscode_ctime
    on oms_b2b_receipt (client_storehouse_code, create_time);

create index idx_soid_rc_ctime
    on oms_b2b_receipt (shop_order_id, receipt_code, create_time);

create table oms_b2b_receipt_info
(
    id                   int(24) unsigned auto_increment comment '主键id'
        primary key,
    receipt_code         varchar(68)          not null comment '收货单编号：SH+店铺订单编号+2位顺序码',
    order_code           decimal(30) unsigned not null comment 'EC订单编号，（原始单，合单，拆单原单。）',
    logistics_order_code decimal(30)          not null comment '发货单号',
    product_code         bigint               not null comment '产品编号',
    inbound_num          int(10)              not null comment '入库数量',
    actual_send_num      int(10)              not null comment '已发货数量',
    purchase_num         int(10)              not null comment '采购数量',
    constraint uniq_locode_pcode
        unique (logistics_order_code, product_code)
)
    comment '收货单详情';

create index idx_receiptcode
    on oms_b2b_receipt_info (receipt_code);

create table oms_b2b_temporary_receipt_base
(
    receipt_code         bigint unsigned                            not null comment '收款单号'
        primary key,
    bill_num             int unsigned                               null comment '单据总数',
    receipt_total_amount decimal(10, 2) unsigned                    null comment '收款总金额',
    receipt_batch_no     bigint                                     null comment '同批收款单编号',
    remark               varchar(255)                               null comment '备注',
    verify_code          int unsigned                               null comment '审核人编码',
    verify_name          varchar(50)                                null comment '审核人名称',
    verify_time          datetime                                   null comment '审核时间',
    verify_opinion       tinyint unsigned default 2                 null comment '审核意见 0-不通过 1-通过 2-待审核',
    verify_explain       varchar(255)                               null comment '审核说明',
    create_code          int unsigned                               null comment '创建人编码',
    create_name          varchar(50)                                null comment '创建人姓名',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    changed_code         int(10)                                    null comment '修改人/操作人编码',
    changed_name         varchar(50)                                null comment '修改人/操作人姓名',
    changed_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag             tinyint unsigned default 0                 null comment '删除标识 0-有效 1-删除'
)
    comment 'B2B临时收款单信息表';

create index idx_bno_delf
    on oms_b2b_temporary_receipt_base (receipt_batch_no, del_flag);

create table oms_b2b_temporary_receipt_sub
(
    id                     bigint                                        not null comment 'id'
        primary key,
    receipt_code           bigint unsigned                               null comment '收款单号',
    receipt_method         tinyint unsigned                              null comment '收款方式 0-对公转账 1-运费链接 2-虚拟充值',
    receipt_amount         decimal(10, 2) unsigned                       null comment '收款金额',
    transaction_serial_num varchar(32)                                   null comment '交易流水号',
    order_code             varchar(32)                                   null comment '运费链接订单号',
    pay_company            varchar(100)                                  null comment '付款公司',
    pay_date               date                                          null comment '付款日期',
    receipt_bill_pic       varchar(255)                                  null comment '回款单图片',
    create_time            timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    changed_time           timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改/操作时间',
    del_flag               tinyint(2) unsigned default 0                 null comment '是否删除（0，有效；1，删除）'
)
    comment 'B2B临时收款单明细';

create index idx_receipt_code_del
    on oms_b2b_temporary_receipt_sub (receipt_code, del_flag);

create index idx_transaction_serial_num
    on oms_b2b_temporary_receipt_sub (transaction_serial_num);

create index order_code
    on oms_b2b_temporary_receipt_sub (order_code);

create table oms_b2b_unit_order_sap
(
    id                    int auto_increment comment '主键ID'
        primary key,
    sap_order_code        varchar(100)                       null comment 'sap订单编号',
    order_code            varchar(100)                       null comment '订单编号',
    order_id              varchar(64)                        null comment '外部平台订单号',
    order_source          varchar(32)                        null comment '平台来源',
    send_status           varchar(32)                        null comment 'SAP发货状态',
    waybill_code          varchar(512)                       null comment '发运单号（快递单号）',
    waybill_number        varchar(521)                       null comment '发货单号',
    apply_document_no     varchar(100)                       null comment '申请文件编号',
    delivery_date         datetime                           null comment '发货时间',
    transport_area_code   varchar(32)                        null comment '运输区域编码',
    store_name            varchar(32)                        null comment '仓库名称',
    store_code            varchar(32)                        null comment '发货仓库编码',
    store_desc            varchar(512)                       null comment '仓库描述',
    plan_arrival_date     datetime                           null comment '计划到货日期',
    real_arrival_date     datetime                           null comment '实际到货日期',
    remark                varchar(512)                       null comment '到货异常备注',
    order_start_time      datetime                           null comment '订单创建时间',
    order_transfer_date   datetime                           null comment '订单转单日期',
    order_transfer_time   datetime                           null comment '订单转单时间点',
    weight                varchar(64)                        null comment '重量',
    verify_date           datetime                           null comment '验货时间',
    print_date            datetime                           null comment '打印时间',
    is_success            tinyint                            null comment '是否推送成功（0：否，1是）',
    return_msg            varchar(512)                       null comment 'SAP返回信息',
    sap_bulk              varchar(32)                        null comment 'SAP体积',
    carton_num            int(10)                            null comment '发货箱数',
    is_cancel             varchar(32)                        null comment '取消状态',
    cancel_failure_reason varchar(512)                       null comment '取消失败原因',
    create_code           int(10)                            null comment '创建人编码',
    create_name           varchar(50)                        null comment '创建人名称',
    create_time           datetime default CURRENT_TIMESTAMP null comment '创建时时间',
    changed_code          int(10)                            null comment '修改人编码',
    changed_name          varchar(50)                        null comment '修改人名称',
    changed_time          datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    del_flag              tinyint  default 0                 null comment '删除标识 0-有效 1-删除',
    constraint unique_index_os
        unique (order_id, order_source)
)
    comment 'SAP订单表';

create index idx_isc_iss_ctime
    on oms_b2b_unit_order_sap (is_success, is_cancel, create_time);

create index idx_iss_ctime
    on oms_b2b_unit_order_sap (is_success, create_time);

create index idx_order_code_id
    on oms_b2b_unit_order_sap (waybill_number, order_id, order_source);

create table sys_action_log
(
    id            bigint unsigned auto_increment comment 'id'
        primary key,
    module_type   tinyint unsigned                    not null comment '模块类型',
    oper_type     tinyint unsigned                    not null comment '操作类型',
    oper_content  varchar(512)                        null comment '操作内容',
    relation_info varchar(50)                         null comment '关联信息（对应记录的编号、名称等）',
    creator_id    int unsigned                        null comment '创建人编号',
    creator_name  varchar(32)                         null comment '创建人名称',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '模块操作日志';

create index idx_module_oper
    on sys_action_log (module_type, oper_type);

create index idx_relation
    on sys_action_log (relation_info);

create table sys_auth_user_info
(
    user_id              int(8) unsigned                               not null comment '用户id 对应sys_user的id'
        primary key,
    authorization_reason varchar(255)                                  null comment '可授权原因',
    remarks              varchar(255)                                  null comment '备注',
    create_code          int(11) unsigned                              null comment '创建人编码',
    create_name          varchar(50)                                   null comment '创建人姓名',
    create_time          timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    op_code              int(11) unsigned                              null comment '更新人编码',
    op_name              varchar(50)                                   null comment '更新人姓名',
    op_time              timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag             tinyint(1) unsigned default 0                 null comment '删除标记 1：删除 0：未删除'
)
    comment '可授权用户信息表';

create table sys_auth_user_role
(
    user_id     int unsigned                        not null comment '用户ID',
    role_id     int unsigned                        not null comment '角色ID',
    creator_id  int(11) unsigned                    null comment '创建人编号',
    create_time timestamp default CURRENT_TIMESTAMP null comment '创建时间',
    op_code     int                                 null comment '更新人编码',
    op_time     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新人时间',
    primary key (user_id, role_id)
)
    comment '可授权用户与角色关系表';

create table sys_dict_entry
(
    id          int(8) unsigned auto_increment comment '编号'
        primary key,
    dicttype_id varchar(50)          not null comment '业务字典子选项',
    dict_id     varchar(100)         not null comment '字典编码',
    dict_name   varchar(400)         null comment '字典名称',
    status      tinyint(1)           null comment '状态（1使用中/0已废弃）',
    sort        smallint(4)          null comment '排序编码',
    create_time datetime             null comment '创建时间',
    op_time     datetime             null comment '更新时间',
    del_flag    tinyint(1) default 0 null comment '删除标记
1：删除
0：未删除'
)
    comment '字典项明细表';

create index idx_dict_id
    on sys_dict_entry (dict_id);

create index idx_dicttype_id
    on sys_dict_entry (dicttype_id);

create table sys_dict_type
(
    id            int(8) unsigned auto_increment comment '编号'
        primary key,
    dicttype_id   varchar(100)         not null comment '业务字典编码',
    dicttype_name varchar(100)         null comment '业务字典名称',
    create_time   datetime             null comment '创建时间',
    op_time       datetime             null comment '更新时间',
    del_flag      tinyint(1) default 0 null comment '删除标记
1：删除
0：未删除'
)
    comment '字典类型表';

create index idx_dicttype_id
    on sys_dict_type (dicttype_id);

create table sys_interface_log
(
    id                bigint unsigned auto_increment comment 'id'
        primary key,
    service_type      tinyint unsigned                    not null comment '服务类型/业务类型@1-自动推订单2-审核推订单3-恢复正常单推订单4-ag恢复正常单推订单5-推送退货单6-推送导入退货单7-回传发货单8-回传退货单',
    relation_info     varchar(50)                         null comment '关联信息（对应记录的编号、名称等）',
    request_variables text                                null comment '请求参数',
    response_result   text                                null comment '响应结果',
    creator_id        int unsigned                        null comment '创建人编号',
    creator_name      varchar(32)                         null comment '创建人名称',
    create_time       timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '接口对接日志';

create index idx_create_time
    on sys_interface_log (create_time);

create index idx_log_relation_info
    on sys_interface_log (relation_info);

create table sys_menu
(
    id          int(8) unsigned auto_increment comment '编号'
        primary key,
    parent_id   int(8)                     null comment '父ID',
    parent_ids  varchar(2000)              null comment '树ID',
    text        varchar(100)               not null comment '菜单名称',
    sort        decimal                    not null comment '排序',
    url         varchar(2000)              null comment '链接',
    target_type varchar(32)                null comment '页面打开方式',
    icon        varchar(100)               null comment '图标',
    is_show     tinyint(1)       default 1 null comment '是否显示
1：显示
0：隐藏',
    permission  varchar(200)               null comment '权限标识',
    remarks     varchar(255)               null comment '备注',
    menu_type   tinyint unsigned default 1 null comment '菜单类型 0-目录 1-模块 2-页面 3-功能',
    create_time datetime                   null comment '创建时间',
    op_time     datetime                   null comment '更新时间',
    del_flag    tinyint(1)       default 0 null comment '删除标记
1：删除
0：未删除'
)
    comment '菜单信息表';

create index idx_parent_id
    on sys_menu (parent_id);

create table sys_modify_log
(
    id            bigint unsigned auto_increment comment 'id'
        primary key,
    business_type tinyint unsigned                    not null comment '业务类型@1-退货单修改',
    business_code varchar(50)                         null comment '业务流水号（对应记录的编号、名称等）',
    old_record    text                                null comment '记录修改前数据',
    new_record    text                                null comment '记录修改后数据',
    creator_id    int unsigned                        null comment '创建人编号',
    creator_name  varchar(32)                         null comment '创建人名称',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '创建时间'
)
    comment '模块修改记录日志';

create index idx_bcode_btype
    on sys_modify_log (business_code, business_type);

create table sys_role
(
    id          int(8) unsigned auto_increment comment '编号'
        primary key,
    code        varchar(50)                                   not null comment '角色代码',
    name        varchar(100)                                  not null comment '角色名称',
    enabled     tinyint(1) unsigned default 1                 null comment '是否可用1：可用 0：停用',
    remarks     varchar(255)                                  null comment '备注',
    is_all_shop tinyint unsigned    default 0                 null comment '是否授权全部店铺权限 0-否 1-是',
    create_code int(11) unsigned                              null comment '创建人编码',
    create_name varchar(50)                                   null comment '创建人姓名',
    create_time timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    op_code     int                                           null comment '更新人编码',
    op_name     varchar(50)                                   null comment '更新人姓名',
    op_time     timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag    tinyint(1) unsigned default 0                 null comment '删除标记1：删除 0：未删除',
    constraint code_UNIQUE
        unique (code)
)
    comment '角色表';

create table sys_role_data
(
    role_id   int unsigned               not null comment '角色ID',
    data_id   int unsigned               not null comment '数据ID',
    data_type tinyint unsigned default 1 not null comment '数据类型@1-店铺',
    primary key (role_id, data_id, data_type)
)
    comment '角色数据关系表';

create table sys_role_menu
(
    role_id int(8) unsigned not null comment '角色ID',
    menu_id int(8) unsigned not null comment '菜单ID',
    primary key (role_id, menu_id)
)
    comment '角色菜单关系表';

create table sys_user
(
    id            int(8) unsigned auto_increment comment '编号'
        primary key,
    login_name    varchar(100)                                  not null comment '登录名',
    password      varchar(100)                                  not null comment '密码',
    name          varchar(36)                                   not null comment '姓名',
    email         varchar(50)                                   null comment '邮件',
    phone         varchar(36)                                   null comment '电话',
    mobile        varchar(36)                                   null comment '手机',
    mobile_cipher varchar(152)                                  null comment '手机',
    user_type     tinyint unsigned    default 1                 not null comment '用户类型 1-员工，2-外部用户',
    enabled       tinyint(1) unsigned default 1                 null comment '是否可用 1：可用 0：停用',
    remarks       varchar(255)                                  null comment '备注',
    create_code   int(11) unsigned                              null comment '创建人编码',
    create_name   varchar(50)                                   null comment '创建人姓名',
    create_time   timestamp           default CURRENT_TIMESTAMP null comment '创建时间',
    op_code       int(11) unsigned                              null comment '更新人编码',
    op_name       varchar(50)                                   null comment '更新人姓名',
    op_time       timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    del_flag      tinyint(1) unsigned default 0                 null comment '删除标记 1：删除 0：未删除',
    constraint login_name_UNIQUE
        unique (login_name)
)
    comment '用户表';

create table sys_user_role
(
    user_id int(8) unsigned not null comment '用户ID',
    role_id int(8) unsigned not null comment '角色ID',
    primary key (user_id, role_id)
)
    comment '用户角色关系表';

create table t1
(
    id            int unsigned auto_increment comment '主键id'
        primary key,
    hand_code     int unsigned default 0 not null comment '挂起编号',
    province_code int unsigned           null comment '省份编码',
    province_name varchar(50)            null comment '省份名称',
    city_code     int unsigned           null comment '城市编码',
    city_name     varchar(50)            null comment '城市名称',
    district_code int unsigned           null comment '区县编号',
    district_name varchar(50)            null comment '区县名称'
)
    comment '订单自动挂起配置区域明细表';

create index idx_hand_code
    on t1 (hand_code);

create table t_tab
(
    id   int unsigned auto_increment comment '主键ID'
        primary key,
    gys  varchar(50) null comment '供应商',
    lb   varchar(50) null comment '类别',
    pp   varchar(50) null comment '品牌',
    gcjk varchar(50) null comment '国产进口',
    dc   varchar(50) null comment '档次'
)
    comment 't';

create table t_tab1
(
    id    int unsigned auto_increment comment '主键ID'
        primary key,
    gys   varchar(50) null comment '供应商',
    pp    varchar(50) null comment '品牌',
    gcjk  varchar(50) null comment '国产进口',
    dc    varchar(50) null comment '档次',
    pp1   varchar(50) null comment '表1中的品牌',
    gcjk1 varchar(50) null comment '表1中的国产进口',
    dc1   varchar(50) null comment '表1中的档次'
)
    comment 't1';

create table t_user0
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '名称',
    city_id     int(12)                             null comment '城市',
    sex         tinyint(1)                          null comment '性别',
    phone       varchar(32)                         null comment '电话',
    email       varchar(32)                         null comment '邮箱',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '创建时间',
    password    varchar(32)                         null comment '密码'
);

create table t_user1
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '名称',
    city_id     int(12)                             null comment '城市',
    sex         tinyint(1)                          null comment '性别',
    phone       varchar(32)                         null comment '电话',
    email       varchar(32)                         null comment '邮箱',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '创建时间',
    password    varchar(32)                         null comment '密码'
);

create table t_user2
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '名称',
    city_id     int(12)                             null comment '城市',
    sex         tinyint(1)                          null comment '性别',
    phone       varchar(32)                         null comment '电话',
    email       varchar(32)                         null comment '邮箱',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '创建时间',
    password    varchar(32)                         null comment '密码'
);

create table t_user3
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '名称',
    city_id     int(12)                             null comment '城市',
    sex         tinyint(1)                          null comment '性别',
    phone       varchar(32)                         null comment '电话',
    email       varchar(32)                         null comment '邮箱',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '创建时间',
    password    varchar(32)                         null comment '密码'
);

create table t_user_address0
(
    id               bigint auto_increment comment '主键'
        primary key,
    user_id          bigint                                     not null comment '用户ID',
    address          varchar(255)                               null comment '地址',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
);

create table t_user_address1
(
    id               bigint auto_increment comment '主键'
        primary key,
    user_id          bigint                                     not null comment '用户ID',
    address          varchar(255)                               null comment '地址',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
);

create table t_user_address2
(
    id               bigint auto_increment comment '主键'
        primary key,
    user_id          bigint                                     not null comment '用户ID',
    address          varchar(255)                               null comment '地址',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
);

create table t_user_address3
(
    id               bigint auto_increment comment '主键'
        primary key,
    user_id          bigint                                     not null comment '用户ID',
    address          varchar(255)                               null comment '地址',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '最后更新时间',
    del_flag         tinyint unsigned default 0                 not null comment '删除标记，1-是，0-否'
);

create table tb_sequence_tmp
(
    id int auto_increment
        primary key
);

create table temp_order_info
(
    order_code    decimal(30) unsigned not null comment 'EC订单编号',
    shop_order_id varchar(64)          not null comment '店铺订单编号，若为合单则置为EC订单编号(order_code)',
    id            int(255) unsigned auto_increment
        primary key
);

create index idx_ocode
    on temp_order_info (order_code);

create table temp_order_search
(
    id            int unsigned auto_increment
        primary key,
    start_time    timestamp                  null,
    end_time      timestamp                  null,
    page_size     int                        null,
    page_num      int                        null,
    handle_status tinyint unsigned default 0 null comment '是否处理  0 - 未处理  1 - 处理2-失败'
);

create table test_crm_gp_demo_food
(
    id      int(11) unsigned auto_increment comment '逐渐，外键推荐food_id'
        primary key,
    name    varchar(20)                not null comment '食物的名字',
    recipe  varchar(255)               null comment '食物的配方',
    deleted tinyint unsigned default 0 null comment '逻辑删除，0未删，1删除'
);

create table test_level_price_update
(
    id                    bigint unsigned auto_increment comment 'id'
        primary key,
    update_list_code      bigint(100)             null comment '更新单编号',
    update_list_name      varchar(100)            not null comment '更新单名称',
    b2b_type              tinyint(3)              null comment '销售1 分销2',
    valid_start_time      datetime                null comment '更新单生效时间',
    valid_end_time        datetime                null comment '更新单失效时间',
    product_code          bigint(100)             null comment '商品编号',
    level_num             tinyint unsigned        not null comment '等级/量级',
    level_price           decimal(10, 2) unsigned null comment '等级管控价',
    one_magnitude_price   decimal(10, 2) unsigned null comment '一量级价格',
    two_magnitude_price   decimal(10, 2) unsigned null comment '二量级价格',
    three_magnitude_price decimal(10, 2) unsigned null comment '三量级价格',
    four_magnitude_price  decimal(10, 2) unsigned null comment '四量级价格',
    five_magnitude_price  decimal(10, 2) unsigned null comment '五量级价格',
    six_magnitude_price   decimal(10, 2) unsigned null comment '六量级价格',
    seven_magnitude_price decimal(10, 2) unsigned null comment '七量级价格',
    eight_magnitude_price decimal(10, 2) unsigned null comment '八量级价格',
    nine_magnitude_price  decimal(10, 2) unsigned null comment '九量级价格'
)
    comment '分销等级管控价更新单临时表';

create table testparam
(
    id     int unsigned auto_increment
        primary key,
    param  varchar(64)    null,
    param1 varchar(64)    null,
    param2 decimal(10, 4) null
);

create table tmp_bill
(
    id           int unsigned auto_increment comment '主键Id'
        primary key,
    order_code   decimal(30) unsigned not null comment 'EC订单编号',
    waybill_code varchar(512)         null comment '快递单号，多个用逗号隔开'
)
    comment '临时表_统一订单发货单明细';

create table tmp_testparam
(
    id               int unsigned auto_increment comment '主键'
        primary key,
    param            varchar(64)                                null comment '参数1',
    param1           varchar(64)                                null comment '参数2',
    param2           decimal(32)                                null comment '参数2',
    handle_status    tinyint unsigned default 0                 null comment '是否处理  0 - 未处理  1 - 处理',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '创建时间',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间'
)
    comment 'excel临时导入表';

create index idx_creat_time
    on tmp_testparam (create_time);

create index idx_ord_code
    on tmp_testparam (param2);

create table writeoff_ec_order
(
    id                  int auto_increment
        primary key,
    ec_order_no         varchar(64)                                       not null comment 'EC订单编号',
    shop_order_id       varchar(64)                                       null comment '店铺订单编号',
    outter_id           varchar(32)                                       null comment '外部平台商品编号',
    shop_code           int                                               null comment '店铺编码',
    shop_name           varchar(64)         default ''                    null comment '店铺名称',
    order_create_date   timestamp                                         null comment '下单时间',
    order_type          tinyint(2)                                        null comment '拆合类型，0：未拆分，1:被拆，2：被合',
    associated_order    varchar(514)                                      null comment '拆合关联单号，如果被拆，存子单单号(多个用逗号隔开);如果被合，存合单单号',
    order_source        tinyint(3)                                        null comment '订单来源,1-正常订单、2-补发订单、3-导入订单',
    pay_channel         tinyint                                           null comment '支付方式',
    buyer_id            varchar(64)                                       null comment '买家ID',
    consumer_consultant varchar(64)         default ''                    null comment '消费者顾问',
    referrer            varchar(32)         default ''                    null comment '推荐人',
    review_time         timestamp                                         null comment '审核时间',
    shop_discount       decimal(14, 4)                                    null comment '店铺承担订单优惠',
    platform_discount   decimal(14, 4)                                    null comment '平台承担订单优惠',
    shipping_cost       decimal(14, 4)                                    null comment '总运费',
    order_payment       decimal(14, 4)                                    null comment '订单实付金额',
    sync_date           timestamp                                         null comment '最后处理时间',
    status              tinyint(1)          default 0                     null comment '订单处理状态,0待处理、1处理成功、2处理失败',
    data_source         tinyint(3)                                        null comment '数据来源,1:EC-OMS、2:自建-2C-OMS、3-自建-2B-OMS',
    failure_reason      varchar(255)                                      null comment '失败原因',
    create_time         timestamp            not null comment '创建时间',
    del_flag            tinyint(1) unsigned default 0                     not null comment '删除标记 1：删除 0：未删除',
    resend_order_code   varchar(64)                                       null comment '补发关联单号',
    tasks_num           tinyint(2)          default 0                     null comment '定时执行转换销售订单次数',
    update_flag         tinyint(1)          default 0                     null comment '是否有更新',
    pay_time            timestamp            not null comment '订单支付时间',
    syn_date            timestamp            not null comment '最后同步时间',
    import_cause        tinyint unsigned                                  null comment '导入原因（字典：ec_oms_import_cause）',
    constraint index_ec_no
        unique (ec_order_no)
)
    comment '原始订单' charset = utf8;

create fulltext index fulltext_associated_order
    on writeoff_ec_order (associated_order);

create index idx_status_ocdate_ecnum
    on writeoff_ec_order (status, order_create_date, ec_order_no);

