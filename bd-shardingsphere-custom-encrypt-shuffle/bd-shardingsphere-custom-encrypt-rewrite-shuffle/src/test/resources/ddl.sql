create table buried_point_config
(
    id               int(11) unsigned auto_increment comment '����ID'
        primary key,
    url              varchar(128)                         not null comment 'URL��ʶ',
    event_name       varchar(64)                          not null comment '�¼�����',
    system_name      varchar(64)                          not null comment 'ϵͳ����',
    module_name      varchar(64)                          not null comment 'ģ������',
    page_name        varchar(64)                          not null comment 'ҳ������',
    function_name    varchar(64)                          not null comment '��������',
    remarks          varchar(256)                         not null comment '��ע',
    creator_id       int(10)                              not null comment '�����˱��',
    creator_name     varchar(32)                          not null comment '����������',
    create_time      timestamp  default CURRENT_TIMESTAMP not null comment '����ʱ��',
    operator_id      int(10)                              not null comment '�����˱��',
    operator_name    varchar(32)                          not null comment '����������',
    last_update_time timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint(3) default 0                 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '����¼����ñ�';

create table dba_check_otter_sync
(
    id              int auto_increment comment 'id'
        primary key,
    finenter_to_oms datetime null comment 'omsͬ����mallorder��ʱ���',
    oms_to_finenter datetime null comment 'mallorderͬ����oms��ʱʱ���'
)
    comment 'zabbix���otterͬ����' charset = utf8;

create table dim_area
(
    province_code       varchar(50) null comment 'ʡ����',
    province_desc       varchar(50) null comment 'ʡ����',
    province_short_desc varchar(50) null comment 'ʡ���',
    city_code           varchar(50) null comment '���б���',
    city_desc           varchar(50) null comment '��������',
    county_code         varchar(50) null comment '�������',
    county_desc         varchar(50) null comment '��������',
    etl_date            date        null comment 'etlʱ��'
)
    comment 'ʡ��ά��' charset = utf8;

create table dim_ec_channel_data_authorization
(
    channel_id    int unsigned null comment '����',
    plat_form     varchar(50)  null comment '������Դ',
    channel_group varchar(50)  null comment '������',
    channel_name  varchar(50)  null comment '����������',
    channel_code  varchar(50)  null comment '���������',
    valid_time    varchar(50)  null comment '��Чʱ��',
    is_front_show varchar(50)  null comment '�Ƿ�ǰ��չʾ 1-չʾ 0-��չʾ',
    order_id      varchar(50)  null comment 'order_id'
)
    comment '�����ݵ�������Ϣ��' charset = utf8;

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
    shop_code         bigint       null comment '���̱���',
    shop_short_name   varchar(128) null comment '��������',
    shop_english_code varchar(128) null comment '����Ӣ�Ĵ���'
)
    comment '��������oms������Ϣ' charset = utf8;

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
    package_id     bigint       null comment '��Ʒ����',
    package_name   varchar(128) null comment '��Ʒ����',
    zz_product_num int(10)      null comment '��Ʒ����',
    zz_rate        varchar(50)  null comment '�������'
)
    comment '��������oms�����Ʒ��' charset = utf8;

create table dim_ec_user_channel_group
(
    user_id       bigint       null comment '�û�����',
    plat_form     varchar(128) null comment '��������',
    channel_group varchar(50)  null comment '������'
)
    comment '�����ݵ���Ȩ�޿���' charset = utf8;

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
    id             int unsigned auto_increment comment '����'
        primary key,
    order_code     decimal(30)                                not null comment '�������',
    province       varchar(32)                                not null comment '�ջ���ʡ��',
    city           varchar(32)                                not null comment '�ջ��˳���',
    district       varchar(32)                                not null comment '�ջ�������',
    address        varchar(255)                               not null comment '�ջ�����ϸ��ַ',
    address_cipher varchar(1024)                              null comment '�ջ�����ϸ��ַ',
    create_time    timestamp        default CURRENT_TIMESTAMP not null comment '����ʱ��',
    quality_result tinyint unsigned default 0                 not null comment '�ʼ���0-δ���-1-�ϸ�-2���ϸ�'
)
    comment 'ec������ַ��ϴ��¼��';

create index idx_ctime_qresult
    on ec_oms_address_clean_record (create_time, quality_result);

create index idx_order_code
    on ec_oms_address_clean_record (order_code);

create table ec_oms_address_modify_record
(
    id                     int unsigned auto_increment comment '����ID'
        primary key,
    order_code             decimal(30) unsigned                       not null comment 'EC�������',
    province               varchar(32)                                null comment '�ջ���ʡ��',
    city                   varchar(32)                                null comment '�ջ��˳���',
    district               varchar(32)                                null comment '�ջ�������',
    town                   varchar(32)                                null comment '�ջ��˳���',
    village                varchar(32)                                null comment '����/��',
    address                varchar(255)                               null comment '�ջ�����ϸ��ַ',
    address_cipher         varchar(1024)                              null comment '�ջ�����ϸ��ַ',
    post_code              varchar(10)                                null comment '��������',
    receiver_name          varchar(32)      default ''                not null comment '�ջ�������',
    receiver_name_cipher   varchar(152)                               null comment '�ջ�������',
    receiver_mobile        varchar(20)                                null comment '�ջ����ֻ�',
    receiver_mobile_cipher varchar(88)                                null comment '�ջ����ֻ�',
    receiver_phone         varchar(32)                                null comment '�ջ��˹̶��绰',
    receiver_phone_cipher  varchar(152)                               null comment '�ջ��˹̶��绰',
    qianniu_result         tinyint unsigned                           null comment 'ǧţ���ؽ��(�ֵ�ec_oms_qianniu_result)@0-δ����1-�ɹ�2-ʧ��',
    qianniu_fail_reason    tinyint unsigned                           null comment 'ǧţ����ʧ��ԭ��(�ֵ�ec_oms_qianniu_fail_reason)',
    modify_result          tinyint unsigned                           null comment 'ʵ���޸Ľ��(�ֵ�ec_oms_address_modify_result)@0-ʧ��1-�ɹ�2-�޸���',
    modify_fail_reason     tinyint unsigned                           null comment 'ʵ���޸�ʧ��ԭ��(�ֵ�ec_oms_address_modify_fail_reason)',
    mark_exc_time          timestamp                                  null comment '����쳣ʱ��',
    creator_id             int unsigned                               null comment '�����˱��',
    creator_name           varchar(32)                                null comment '����������',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id            int unsigned                               null comment '�����˱��',
    operator_name          varchar(32)                                null comment '����������',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag               tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '������ַ�޸ļ�¼��';

create index idx_order_code
    on ec_oms_address_modify_record (order_code);

create table ec_oms_ag_recover_send_config
(
    id                int unsigned auto_increment comment '���'
        primary key,
    config_name       varchar(64)                            null comment '��������',
    shop_code         int unsigned                           null comment '���̱��',
    config_start_time timestamp                              not null comment '���ÿ�ʼʱ��',
    config_end_time   timestamp                              not null comment '���ý���ʱ��',
    creator_id        int                                    null comment '�����˱��',
    creator_name      varchar(32)                            null comment '����������',
    create_time       timestamp    default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id       int                                    null comment '�����˱��',
    operator_name     varchar(32)                            null comment '����������',
    last_update_time  timestamp    default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag          int unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'AG�Զ��ָ��������ñ�';

create index idx_config_start_time
    on ec_oms_ag_recover_send_config (config_start_time);

create table ec_oms_ag_recover_send_config_op_record
(
    id                  int unsigned auto_increment comment '���'
        primary key,
    config_id           int unsigned                        not null comment '���ñ��',
    config_name         varchar(64)                         null comment '��������',
    operate_describe    tinyint                             null comment '��������(ҵ���ֵ�ec_oms_ag_recover_config_operate_type)',
    shop_code           int unsigned                        not null comment '���̱��',
    return_product_code bigint unsigned                     not null comment '�˿���Ʒ���',
    present_code        varchar(64)                         not null comment '��Ʒ��Ʒ���',
    config_start_time   timestamp                           null comment '���ÿ�ʼʱ��',
    config_end_time     timestamp                           null comment '���ý���ʱ��',
    operator_id         int                                 null comment '�����˱��',
    operator_name       varchar(32)                         null comment '����������',
    operate_time        timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment 'AG�Զ��ָ��������ò�����¼��';

create table ec_oms_ag_recover_send_config_sub
(
    id                  int unsigned auto_increment comment '���'
        primary key,
    config_id           int unsigned                           not null comment '���ñ��',
    return_product_code bigint unsigned                        not null comment '�˿���Ʒ���',
    present_code        bigint unsigned                        not null comment '��Ʒ��Ʒ���',
    creator_id          int                                    null comment '�����˱��',
    creator_name        varchar(32)                            null comment '����������',
    create_time         timestamp    default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id         int                                    null comment '�����˱��',
    operator_name       varchar(32)                            null comment '����������',
    last_update_time    timestamp    default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag            int unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'AG�Զ��ָ����������ӱ�';

create index idx_config_id
    on ec_oms_ag_recover_send_config_sub (config_id);

create index idx_present_code
    on ec_oms_ag_recover_send_config_sub (present_code);

create index idx_return_product_code
    on ec_oms_ag_recover_send_config_sub (return_product_code);

create table ec_oms_amount_refund_apply
(
    apply_code           varchar(14)                                not null comment '����˿�������,BC+������+4λ˳����'
        primary key,
    refund_code          bigint unsigned                            not null comment '�˿��',
    order_code           decimal(30) unsigned                       not null comment 'EC�������',
    shop_order_id        varchar(64)                                not null comment '���̶������',
    exc_waybill_code     varchar(30)                                not null comment '�쳣��ݵ���',
    refund_amount_type   tinyint unsigned default 1                 not null comment '�˿������ͣ��ֵ� ec_oms_refund_amount_type 1-�ɵֿ۽�� 2-Ԥ����',
    refund_amount        decimal(14, 4) unsigned                    not null comment '�˿���',
    order_all_price      decimal(14, 4) unsigned                    not null comment '����ʵ�����',
    order_all_shipment   decimal(14, 4)   default 0.0000            not null comment '�������ʷ�',
    amount_refund_method tinyint unsigned default 1                 not null comment '�˿ʽ���ֵ� ec_oms_amount_refund_method 1-�����˿� 2-�˻������˿',
    amount_refund_status tinyint unsigned                           not null comment '���״̬���ֵ�ec_oms_amount_refund_status 1-���ύ 2-���˻� 99-��������� 3-������ 4-���˿� 5-��ȡ�����ֵ����ֵΪ99',
    client_code          varchar(32)                                null comment 'ƽ̨�ͻ�����',
    shop_code            int unsigned                               not null comment '������Դ���',
    buyer_nick           varchar(64)                                null comment '����ǳ�/ID',
    pay_time             timestamp                                  null comment '����֧��ʱ��',
    auto_refund_msg_type tinyint unsigned default 0                 not null comment '�Զ��˿���Ϣ���ͣ��ֵ�ec_oms_auto_refund_msg_type 0-��1-ϵͳ��ע���˿�������Ϊ���ɵֿ۽����ҡ��˿����500��������ˣ�',
    creator_id           int unsigned                               null comment '�����˱��',
    creator_name         varchar(32)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id          int unsigned                               null comment '�����˱��',
    operator_name        varchar(32)                                null comment '����������',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    constraint idx_refund_code
        unique (refund_code) comment '�˿���'
)
    comment '����˿������';

create index idx_method_status_time
    on ec_oms_amount_refund_apply (amount_refund_method, amount_refund_status, last_update_time)
    comment '��ʱ������';

create index idx_order_code
    on ec_oms_amount_refund_apply (order_code)
    comment 'EC�����������';

create index idx_status_time
    on ec_oms_amount_refund_apply (amount_refund_status, pay_time, shop_code)
    comment '��������';

create table ec_oms_amount_refund_apply_log
(
    id           bigint unsigned auto_increment comment '��������'
        primary key,
    apply_code   varchar(14)                            not null comment '�˿�������',
    oper_node    tinyint(4) unsigned                    not null comment '�����ڵ㣨�ֵ�ec_oms_amount_refund_oper_node 1-������ 2-������ˣ�',
    oper_type    tinyint(4) unsigned                    not null comment '�������ͣ��ֵ�ec_oms_amount_refund_oper_type 1-�ύ 2-���ͨ�� 3-���� 4-ȡ����',
    remark       varchar(300) default ''                not null comment '������ע',
    creator_id   int unsigned                           null comment '�����˱��',
    creator_name varchar(32)                            null comment '����������',
    create_time  timestamp    default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '����˿����������¼��';

create index idx_apply_code
    on ec_oms_amount_refund_apply_log (apply_code)
    comment '�˿�����������';

create table ec_oms_amount_refund_recharge_log
(
    id                bigint unsigned auto_increment comment '����'
        primary key,
    order_code        decimal(30) unsigned                       not null comment 'EC�������',
    apply_code        varchar(14)                                not null comment '����˿�������,BC+������+4λ˳����',
    recharge_type     tinyint unsigned default 2                 not null comment '��ֵ���ͣ��ֵ䣺ec_b2b_recharge_type@1-�ɵֿ۽��,2-Ԥ�����',
    refund_amount     decimal(14, 4) unsigned                    not null comment '�˿���',
    client_code       varchar(15)                                not null comment '�ͻ����',
    company_full_name varchar(100)                               null comment '��˾����',
    remark            varchar(255)                               null comment '��ע',
    creator_id        int unsigned                               null comment '�����˱��',
    creator_name      varchar(32)                                null comment '����������',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag          tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����˿��¼��';

create index idx_time_del
    on ec_oms_amount_refund_recharge_log (del_flag, create_time)
    comment '��ʱ������';

create table ec_oms_attachment
(
    id               bigint unsigned auto_increment comment '����ID'
        primary key,
    file_name        varchar(128)                               null comment '�ļ�Դ��',
    file_path        varchar(1024)                              not null comment '�ļ�����·��',
    business_type    tinyint unsigned                           not null comment 'ҵ�����ͣ�ö��(Java������AttachmentBusinessTypeContants.java)',
    business_code    varchar(32)                                not null comment 'ҵ����ˮ��(������Ӧҵ����������������Ҫ��ʹ�ñ����ֶ�)',
    spare1           varchar(32)                                null comment '�����ֶ�1',
    spare2           varchar(32)                                null comment '�����ֶ�2',
    spare3           varchar(32)                                null comment '�����ֶ�3',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ͳһ�����洢��';

create index idx2_attach_business_code
    on ec_oms_attachment (business_type, business_code);

create table ec_oms_auto_add_present
(
    plan_code                  bigint unsigned                            not null comment '���Ա���'
        primary key,
    plan_name                  varchar(20)                                not null comment '��������',
    shop_code                  int unsigned                               not null comment 'ƽ̨��Դ�����̱�ţ�',
    plan_start_time            timestamp                                  null comment '���Կ�ʼʱ��',
    plan_end_time              timestamp                                  null comment '���Խ���ʱ��',
    plan_status                tinyint unsigned default 1                 not null comment '����״̬@1-����0-ͣ��',
    time_type                  tinyint unsigned                           not null comment 'ʱ������@1-��������ʱ��',
    add_present_type           tinyint unsigned default 1                 not null comment '��������@1-������ 2-������ 3-ָ����Ʒ��',
    is_limit_order_send        tinyint unsigned default 0                 not null comment '�Ƿ��޵�@1-�� 0-��',
    limit_order_send_num       int(6) unsigned                            null comment '��ǰN�ŵ���Ч',
    added_present_num          int(6) unsigned  default 0                 null comment '�Ѽ�����������',
    is_support_multiple        tinyint unsigned default 0                 not null comment '�Ƿ���@1-�� 0-��',
    limit_support_multiple_num int unsigned                               null comment '�����N��',
    is_specify_buyer_scope     tinyint unsigned default 0                 not null comment '�Ƿ�ָ����ҷ�Χ@1-�� 0-��',
    product_scope_type         tinyint unsigned default 0                 not null comment '��Ʒ��Χ����@0-�� 1-�ų� 2-���� ',
    product_scope_code         varchar(1024)                              null comment '��Ʒ��Χ���Ͷ�Ӧ�Ĳ�Ʒ����',
    verify_user_code           int unsigned                               null comment '����û����',
    verify_user_name           varchar(32)                                null comment '����û�����',
    verify_time                timestamp                                  null comment '���ʱ��',
    no_pass_reason             varchar(128)                               null comment '��˲�ͨ��ԭ��',
    creator_id                 int unsigned                               null comment '�����˱��',
    creator_name               varchar(32)                                null comment '����������',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id                int unsigned                               null comment '�����˱��',
    operator_name              varchar(32)                                null comment '����������',
    last_update_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                   tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Զ�������������';

create table ec_oms_auto_add_present_sub
(
    id                   int unsigned auto_increment comment '����ID'
        primary key,
    plan_code            bigint unsigned            not null comment '���Ա�ţ�������ec_oms_auto_add_present��plan_code',
    plan_sub_type        tinyint unsigned default 1 not null comment '��������@1-��Ʒ���ԣ�2-ָ����ҷ�Χ',
    target_product_code  bigint unsigned            null comment 'Ŀ���Ʒ����',
    target_product_name  varchar(100)               null comment 'Ŀ���Ʒ����',
    target_product_num   int unsigned               null comment 'Ŀ���Ʒ����',
    full_order_payment   decimal(12, 4)             null comment '�����',
    full_order_num       int unsigned               null comment '������',
    present_product_code bigint unsigned            null comment '���Ͳ�Ʒ����',
    present_product_name varchar(100)               null comment '���Ͳ�Ʒ����',
    present_product_num  int unsigned               null comment '���Ͳ�Ʒ����',
    buyer_id             varchar(32)                null comment 'ָ�����ID',
    del_flag             tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Զ��������������';

create index idx_plan_code
    on ec_oms_auto_add_present_sub (plan_code);

create table ec_oms_auto_assignment
(
    plan_code        bigint unsigned                            not null comment '���Ա���'
        primary key,
    plan_name        varchar(50)                                not null comment '��������',
    plan_start_time  timestamp                                  not null comment '���Կ�ʼʱ��',
    plan_end_time    timestamp                                  not null comment '���Խ���ʱ��',
    plan_status      tinyint unsigned default 1                 not null comment '����״̬@1-����0-ͣ��',
    shop_codes       varchar(1024)                              not null comment '�����ĵ��̱�ţ�������ŷָ�',
    remark           varchar(200)                               null comment '��ע',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Զ�ָ�ɲ��Թ����';

create table ec_oms_auto_assignment_record
(
    id             int unsigned auto_increment comment '����ID'
        primary key,
    group_code     int unsigned           not null comment '�ͷ����ţ�������ec_oms_customer_service_group.group_code��',
    customer_code  int unsigned           not null comment '�ͷ����(������ec_oms_customer_service.customer_code)',
    assigned_times int unsigned default 0 not null comment '������ָ�ɴ���',
    record_date    date                   not null comment '����'
)
    comment '�Զ�ָ��ÿ�մ�����¼��';

create index idx_customer_code
    on ec_oms_auto_assignment_record (customer_code);

create table ec_oms_auto_assignment_sub
(
    id                  int unsigned auto_increment comment '����ID'
        primary key,
    plan_code           bigint unsigned                            not null comment '���Ա���',
    issue_type_code     int unsigned                               not null comment '���������ţ�������ec_oms_issue_type_base.issue_type_code��',
    issue_subject_code  int unsigned                               not null comment 'һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code��',
    issue_reason_code   int unsigned                               null comment '����ԭ���ţ�������ec_oms_issue_reason_base.issue_reason_code��',
    first_group_code    int unsigned                               not null comment '��ѡ�ͷ����ţ�������ec_oms_customer_service_group.group_code��',
    first_customer_code int unsigned                               null comment '��ѡ�ͷ����',
    second_group_codes  varchar(255)                               null comment '��ѡ�ͷ����ţ�������ŷָ�',
    creator_id          int unsigned                               null comment '�����˱��',
    creator_name        varchar(32)                                null comment '����������',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id         int unsigned                               null comment '�����˱��',
    operator_name       varchar(32)                                null comment '����������',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag            tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Զ�ָ�ɲ��������';

create index idx_plan_code
    on ec_oms_auto_assignment_sub (plan_code);

create table ec_oms_catch_delay_strategy
(
    id                    int unsigned auto_increment comment 'id'
        primary key,
    strategy_code         varchar(13)                                not null comment '���Ա���',
    strategy_name         varchar(20)                                not null comment '��������',
    start_time            timestamp                                  not null comment '���Կ�ʼʱ��',
    end_time              timestamp                                  not null comment '���Խ���ʱ��',
    delay_time_difference smallint unsigned                          not null comment 'ץ���ӳ�ʱ��min',
    creator_id            int unsigned                               null comment '�����˱��',
    creator_name          varchar(32)                                null comment '����������',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id           int unsigned                               null comment '�����˱��',
    operator_name         varchar(32)                                null comment '����������',
    last_update_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag              tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ӳ�ץ�����Ա�';

create table ec_oms_catch_delay_strategy_detail
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    strategy_code    varchar(13)                                not null comment '���Ա���',
    shop_code        int unsigned                               not null comment '���̱��',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ӳ�ץ�����������';

create index idx_strategy_code
    on ec_oms_catch_delay_strategy_detail (strategy_code)
    comment '���Ա�������';

create table ec_oms_channel_base
(
    channel_code      int unsigned                               not null comment '������ţ���������У�5λ���֣�10000��'
        primary key,
    channel_name      varchar(20)                                not null comment '������������',
    channel_level_one tinyint unsigned default 0                 not null comment 'һ������ 0-���� 1-��ҵ���ֵ�:ec_oms_channel_level_one��',
    is_frozen         tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    remark            varchar(100)                               null comment '��ע',
    creator_id        int                                        null comment '�����˱��',
    creator_name      varchar(32)                                null comment '����������',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id       int                                        null comment '�����˱��',
    operator_name     varchar(32)                                null comment '����������',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '�������������ݱ�';

create table ec_oms_channel_shop_base
(
    shop_code                int unsigned                                 not null comment '���̱�ţ���������У�5λ���֣�10000��'
        primary key,
    shop_name                varchar(50)                                  not null comment '����ȫ��',
    shop_short_name          varchar(20)                                  not null comment '���̼��',
    shop_english_code        varchar(20)                                  not null comment '���̴���',
    channel_code             int unsigned                                 not null comment '�����������',
    sap_client_code          varchar(20)                                  not null comment 'SAP�ͻ����',
    sap_shop_code            varchar(20)                                  not null comment 'SAP��˾���',
    platform_name            varchar(20)                                  not null comment '����ƽ̨����',
    shop_website             varchar(512)                                 null comment '������ַ',
    shop_account             varchar(100)                                 not null comment '�������˺�',
    shop_password            varchar(100)                                 not null comment '��������',
    shop_password_cipher     varchar(408)                                 null comment '��������',
    shop_phone_number        varchar(15)                                  not null comment '���̰��ֻ�',
    shop_phone_number_cipher varchar(64)                                  null comment '���̰��ֻ�',
    shop_user_code           int                                          null comment '���̰���Ա���',
    express_name             varchar(20)        default '������'             not null comment '����浥����',
    delivery_limitation      mediumint unsigned default 48                not null comment '����ʱЧ(�ش���ݵ���)����λСʱ',
    logistics_collection     mediumint unsigned default 72                not null comment '����ʱЧ(��������)����λСʱ',
    complain_days            mediumint unsigned default 360               not null comment '����ʱ������λСʱ',
    shop_user_name           varchar(32)                                  null comment '���̰���Ա����',
    is_frozen                tinyint unsigned   default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    is_docking               tinyint unsigned   default 0                 not null comment '�Ƿ��ѶԽӣ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    remark                   varchar(200)                                 null comment '��ע',
    is_auto_send_sms         tinyint unsigned   default 1                 not null comment '�Ƿ����Զ����ţ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    account_code             int(11) unsigned                             null comment '�����˺ű�ţ�������ec_oms_sms_account_base.account_code��',
    sms_account              varchar(50)                                  null comment '�����˺�',
    new_qr_code              varchar(255)                                 null comment '������ά��URL',
    content_pic_url          varchar(255)                                 null comment '�����İ�����URL',
    sort                     int(5) unsigned    default 99999             not null comment '����',
    creator_id               int                                          null comment '�����˱��',
    creator_name             varchar(32)                                  null comment '����������',
    create_time              timestamp          default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id              int                                          null comment '�����˱��',
    operator_name            varchar(32)                                  null comment '����������',
    last_update_time         timestamp          default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '���������ݱ�';

create index idx_shop_name
    on ec_oms_channel_shop_base (shop_name);

create table ec_oms_channel_shop_close_config
(
    id                      int unsigned auto_increment comment '���'
        primary key,
    title                   varchar(32)                                   null comment '֪ͨ����',
    notice_day              tinyint unsigned                              null comment '��������',
    notice_time             varchar(5)                                    null comment '����ʱ��',
    content                 varchar(300)                                  null comment '֪ͨ����',
    admin_id                int                                           null comment '���̹���Ա���',
    notice_responsible_flag tinyint(1)          default 0                 null comment '�Ƿ���Ҫ֪ͨ���̸�����, 0-��1-��',
    notice_docking_flag     tinyint(1)          default 0                 null comment '�Ƿ���Ҫ֪ͨ���̶Խ���, 0-��1-��',
    copy_member_user_codes  varchar(240)                                  null comment '�����˱�ţ����20�������ŷָ�',
    operator_id             int                                           null comment '�����˱��',
    operator_name           varchar(32)                                   null comment '����������',
    last_update_time        timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                tinyint(1) unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '�ص���������';

create table ec_oms_channel_shop_member_detail
(
    id          int unsigned auto_increment comment '���'
        primary key,
    shop_code   int unsigned                        not null comment '���̱��',
    role        tinyint(4) unsigned                 not null comment '�û���ɫ, 1-���̸����ˣ�2-���̶Խ���',
    user_code   int unsigned                        null comment '�û����',
    create_time timestamp default CURRENT_TIMESTAMP not null comment '����ʱ��'
)
    comment '������Ӫ��Ա��Ϣ��';

create index idx_shop_code
    on ec_oms_channel_shop_member_detail (shop_code);

create table ec_oms_chat_account_suning
(
    cust_num         bigint(12)  not null comment '��Ա����'
        primary key,
    shop_code        int(10)     null comment '���̱��',
    user_name        varchar(50) null comment '���˺�',
    eamil            varchar(50) null comment '����',
    phone            varchar(30) null comment '�ֻ�����',
    status           tinyint(1)  null comment '���˺ŵ���״̬0-��ͣ�ã�1-ʹ���У�3-��ְ',
    status_val       varchar(20) null comment '״̬����',
    cust_direct      tinyint(1)  null comment '�Ƿ�Ϊ�ͷ��˺�0 ��1 ��',
    real_name        varchar(50) null comment '���˺�����',
    create_time      timestamp   null comment '�����ݿ��ִ���ʱ��',
    last_update_time timestamp   null on update CURRENT_TIMESTAMP comment '�����ݿ��ָ���ʱ��'
);

create table ec_oms_chat_content_guomei
(
    id                int unsigned auto_increment comment '��������'
        primary key,
    ques_id           bigint(12)   not null comment '��ѯID',
    shop_code         int(8)       null comment '���̱���',
    ques_type         tinyint(3)   null comment '��ѯ����(1=������2=����3=�ͻ���4=֧����5=�ۺ�)',
    title             varchar(255) null comment '��ѯ���⣨δ�ã�',
    question          varchar(500) null comment '��ѯ����',
    post_user         bigint(12)   null comment '������ID',
    post_time         timestamp    null comment '����ʱ��',
    feedback          varchar(500) null comment '�ظ�����',
    reply_user        bigint(12)   null comment '�ظ���ID',
    reply_time        timestamp    null comment '�ظ�ʱ��',
    status            tinyint(3)   null comment '״̬��0���༭�� 1�����ύ 2�����ͨ�� 3����˲�ͨ�� 4�������� 5���ѷ���6���Ѵ𸴣� 8������� 9����ȡ��',
    approve_user_name varchar(50)  null comment '���������������û���',
    post_user_name    varchar(50)  null comment '�����������ύ�û�����δ�ã�',
    reply_user_name   varchar(50)  null comment '���������Ļظ��û�����δ�ã�',
    product_name      varchar(120) null comment '������������Ʒ��֤',
    product_no        varchar(15)  null comment '��Ʒ���룬A+10λ����',
    create_time       timestamp    null comment '���ݿⴴ��ʱ��',
    last_update_time  timestamp    null on update CURRENT_TIMESTAMP comment '���ݿ����ʱ��'
)
    comment '�����ͻ������¼';

create index inx_quse_id
    on ec_oms_chat_content_guomei (ques_id);

create table ec_oms_chat_content_suning
(
    msg_id           varchar(40)  not null comment '��ϢID'
        primary key,
    shop_code        int(10)      null comment '���̱��',
    chat_id          varchar(40)  null comment '�ỰID',
    msg_from         varchar(20)  null comment '��Ϣ���ͷ�',
    msg_to           varchar(20)  null comment '��Ϣ���շ�',
    msg_type         int(4)       null comment '��Ϣ���͡� 100���ı���Ϣ 101��ͼƬ��Ϣ 102���������� 103���������� 104��ת�ӻỰ 105���ļ���Ϣ 106�������� 107�����ڶ��� 110��ϵͳ��Ϣ 112���رջỰ 113��������Ϣ�汾�� 120:��Ƭ��Ϣ',
    msg_content      varchar(500) null comment '��Ϣ����',
    create_time      timestamp    null comment '��Ϣ����ʱ��',
    update_time      timestamp    null comment '��Ϣ����ʱ��',
    oms_create_time  timestamp    null comment '�����ݿ��ִ���ʱ��',
    last_update_time timestamp    null on update CURRENT_TIMESTAMP comment '�����ݿ��ָ���ʱ��'
);

create table ec_oms_chat_user_suning
(
    chat_id          varchar(40)  not null comment '�ỰΨһID'
        primary key,
    shop_code        int(10)      null comment '���̱��',
    login_name       varchar(50)  null comment '�ͷ��˺�',
    member_account   varchar(50)  null comment '��Ա��½��',
    member_id        bigint(12)   null comment '��Ա����',
    member_nick      varchar(50)  null comment '��Ա�ǳ�',
    start_time       timestamp    null comment '�Ự����ʱ��',
    end_time         timestamp    null comment '�Ự����ʱ��',
    next_chat_id     int(10)      null comment '��һͨ�ỰID',
    pre_chat_id      int(10)      null comment '��һͨ�ỰID',
    user_name        varchar(100) null comment '��ϯ����',
    user_nick        varchar(50)  null comment '��ϯ�ǳ�',
    create_time      timestamp    null comment '�����ݿ��ִ���ʱ��',
    last_update_time timestamp    null on update CURRENT_TIMESTAMP comment '�����ݿ��ָ���ʱ��'
);

create table ec_oms_classes
(
    classes_code     int unsigned                               not null comment '��α��'
        primary key,
    classes_name     varchar(32)                                not null comment '�������',
    start_time       time                                       not null comment '�����ʼʱ��',
    end_time         time                                       not null comment '��ν���ʱ��',
    remark           varchar(200)                               null comment '��ע',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�����Ϣ�����';

create table ec_oms_config_assign_express
(
    id                 int unsigned auto_increment comment '����id'
        primary key,
    auto_assign_status tinyint unsigned default 1                 not null comment '�Զ�ָ������@1-������0-�ر�',
    assign_rule        tinyint unsigned default 1                 not null comment 'ϵͳָ����ݹ���1-��ͬ�ֿ��ָ����2-��ͬ�ֿ�ݺ���ʡ��ָ����3-��ͬ�ֿ�ݺ���ʡ�ݼ�����ָ�����ֵ�ec_oms_designated_express_assign_rule',
    creator_id         int                                        null comment '�����˱��',
    creator_name       varchar(32)                                null comment '����������',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag           tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��������ָ���������';

create table ec_oms_config_assign_express_sub
(
    id        int unsigned auto_increment comment '����id'
        primary key,
    config_id int unsigned               not null comment 'ָ�������������id��ec_oms_config_assign_express.id��',
    shop_code int unsigned               not null comment '���̱�ţ�����ec_oms_channel_shop_base��',
    del_flag  tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��������ָ����������ӱ�';

create index idx_config_id
    on ec_oms_config_assign_express_sub (config_id);

create table ec_oms_config_auto_assignment
(
    id                              int unsigned auto_increment comment '����ID'
        primary key,
    config_type                     tinyint unsigned default 1                 not null comment '��������@1-�Զ�ָ�ɣ�2-�Զ�ȡ��ָ��',
    auto_assignment_status          tinyint          default 1                 null comment '�Զ�ָ�ɿ��أ��ֵ�;ec_oms_on_off��@1-������0-�ر�',
    auto_cancel_assignment_status   tinyint          default 1                 null comment '�Զ�ȡ��ָ�ɿ��أ��ֵ�;ec_oms_on_off��@1-������0-�ر�',
    auto_recovery_assignment_status tinyint          default 1                 null comment '�Զ��ָ�δ�����أ��ֵ�;ec_oms_on_off��@1-������0-�ر�',
    auto_recovery_assignment_time   time                                       null comment 'ÿ���Զ��ָ�δ����ʱ��',
    auto_cancel_assignment_time     time                                       null comment 'ÿ���Զ�ȡ��ָ��ʱ��',
    creator_id                      int unsigned                               null comment '�����˱��',
    creator_name                    varchar(32)                                null comment '����������',
    create_time                     timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id                     int unsigned                               null comment '�����˱��',
    operator_name                   varchar(32)                                null comment '����������',
    last_update_time                timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                        tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Զ���ȡ����ָ�����ñ�';

create table ec_oms_config_auto_examine_adopt
(
    id                         int unsigned auto_increment comment '����id'
        primary key,
    retail_examine_adop_status tinyint unsigned default 0                 not null comment '���������Զ����󿪹�@1-������0-�ر�',
    retail_examine_adop_scale  tinyint unsigned default 0                 null comment '�����������������Զ��������������в�Ʒ���۵���ϵͳά���۸�ı������Զ�����',
    sale_examine_adop_status   tinyint unsigned default 0                 not null comment '���۶����Զ����󿪹�@1-������0-�ر�',
    sale_examine_adop_scale    tinyint unsigned default 0                 null comment '�����������۶����Զ��������������в�Ʒ���۵���ϵͳά���۸�ı������Զ�����',
    creator_id                 int unsigned                               null comment '�����˱��',
    creator_name               varchar(32)                                null comment '����������',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag                   tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�����Զ���������';

create table ec_oms_config_import_order_user
(
    id                int unsigned auto_increment comment '����id'
        primary key,
    user_code         int                                        not null comment '��Ա���',
    user_name         varchar(32)                                not null comment '��Ա����',
    handle_shop       varchar(2048)                              null comment 'ָ�ɿɵ���ƽ̨�����ŷָ�',
    user_type         tinyint unsigned default 1                 not null comment '��Ա����@1-Ա����2--�������',
    import_permission tinyint unsigned default 0                 not null comment '����Ȩ��@0-����ƽ̨ 1-ȫ��ƽ̨',
    creator_id        int                                        null comment '�����˱��',
    creator_name      varchar(32)                                null comment '����������',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id       int                                        null comment '�����˱��',
    operator_name     varchar(32)                                null comment '����������',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag          tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��Ա�����������ñ�';

create index idx_user_code
    on ec_oms_config_import_order_user (user_code);

create table ec_oms_config_order_catch_delay
(
    id                    int unsigned auto_increment comment '����id'
        primary key,
    delay_time_difference smallint unsigned                          not null comment 'ץ���ӳ�ʱ��min',
    handle_shop           varchar(2048)                              null comment '�ӳ�ץ����ƽ̨�����ŷָ�',
    shop_type             tinyint(3)       default 1                 not null comment '��������@1-��ͨ2-����',
    creator_id            int                                        null comment '�����˱��',
    creator_name          varchar(32)                                null comment '����������',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag              tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ץ���ӳ�ʱ������';

create table ec_oms_config_order_examine
(
    id                     int unsigned auto_increment comment '����id'
        primary key,
    auto_examine_import    tinyint unsigned default 0                 not null comment '���붩���Զ���״̬@1-������0-�ر�',
    eliminate_area         varchar(2048)                              null comment '��ֹ���򣬶��ŷָ�',
    eliminate_product      varchar(2048)                              null comment '��ֹ��Ʒ�����ŷָ�',
    allow_auto_examine_num smallint unsigned                          not null comment '�����Զ��󵥵Ķ�����Ʒ�ܼ���',
    auto_examine           tinyint unsigned default 0                 not null comment '�ԽӶ����Զ���״̬@1-������0-�ر�',
    handle_shop            varchar(2048)                              null comment '�����Զ��󵥵�ƽ̨�����ŷָ�',
    creator_id             int                                        null comment '�����˱��',
    creator_name           varchar(32)                                null comment '����������',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag               tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�����Զ�������';

create table ec_oms_config_order_hang
(
    hand_code           int unsigned                               not null comment '������'
        primary key,
    auto_hang_status    tinyint unsigned default 0                 not null comment '�Զ����𿪹�@1-������0-�ر�',
    is_all              tinyint unsigned default 0                 not null comment '�Ƿ�ȫ��������1-�ǣ�0-��',
    buyer_message_keys  varchar(2048)                              null comment '������Թؼ��֣����ŷָ�',
    seller_message_keys varchar(2048)                              null comment '�������Թؼ��֣����ŷָ�',
    creator_id          int                                        null comment '�����˱��',
    creator_name        varchar(32)                                null comment '����������',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag            tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�����Զ���������';

create table ec_oms_config_order_hang_sub
(
    id            int unsigned auto_increment comment '����id'
        primary key,
    hand_code     int unsigned     default 0 not null comment '������',
    order_type    tinyint unsigned default 1 not null comment '�������ͣ�1-�Ǵ󶩵�����2-�󶩵�����',
    province_code int unsigned               null comment 'ʡ�ݱ���',
    province_name varchar(50)                null comment 'ʡ������',
    city_code     int unsigned               null comment '���б���',
    city_name     varchar(50)                null comment '��������',
    district_code int unsigned               null comment '���ر��',
    district_name varchar(50)                null comment '��������'
)
    comment '�����Զ���������������ϸ��';

create index idx_hand_code
    on ec_oms_config_order_hang_sub (hand_code);

create table ec_oms_config_risk_control
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    risk_code        int unsigned                               not null comment '���ձ��',
    risk_name        varchar(128)                               null comment '��������',
    risk_type        tinyint unsigned                           not null comment '�������ͣ�ec_oms_risk_type��1-�۸�2-��Ʒ',
    is_risk          tinyint unsigned default 0                 not null comment '�Ƿ��Ƿ��գ�ec_oms_yes_no��1-�� 0-��',
    risk_range       tinyint unsigned                           not null comment '���ռ�ط�Χ��ec_oms_risk_range��',
    risk_tips        tinyint unsigned                           not null comment '������ʾ��ec_oms_risk_tips��',
    remark           varchar(30)                                null comment '�ͷ���ע',
    risk_action      tinyint unsigned default 0                 not null comment '�з���ϵͳ������ec_oms_risk_action��0-�ޣ�1-�Զ�ȡ��������2-�Զ�����3-�Զ���',
    is_valid         tinyint unsigned default 1                 not null comment '�Ƿ���Ч���ֵ䣺ec_oms_yes_no��@1-�� 0-����Ҫ��Գ������е�״̬',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Զ�������ñ�';

create index idx_risk_code
    on ec_oms_config_risk_control (risk_code);

create table ec_oms_config_shop_supply
(
    id           int unsigned auto_increment comment '����id'
        primary key,
    pro_num_80   int unsigned                               not null comment '����ר��80Ʒ��',
    pro_num_10   int unsigned                               not null comment '����ר��10Ʒ��',
    creator_id   int                                        null comment '�����˱��',
    creator_name varchar(32)                                null comment '����������',
    create_time  timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag     tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ר�������������';

create table ec_oms_config_shop_supply_sub
(
    id        int unsigned auto_increment comment '����id'
        primary key,
    supply_id int unsigned not null comment 'ר����������id������ec_oms_config_shop_supply��',
    shop_code int unsigned not null comment '���̱�ţ�����ec_oms_channel_shop_base��'
)
    comment '����ר�����������ϸ��';

create index idx_supply_id
    on ec_oms_config_shop_supply_sub (supply_id);

create table ec_oms_customer_group_shop_relation
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    shop_code        int unsigned                               not null comment '���̱�ţ���������У�5λ���֣�10000��',
    group_code       int unsigned                               not null comment '�ͷ����ţ�������ec_oms_customer_service_group.group_code��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ͷ�������̹�ϵ��';

create table ec_oms_customer_service
(
    id                     int unsigned auto_increment comment '����ID'
        primary key,
    customer_code          int unsigned                               not null comment '�ͷ����',
    customer_name          varchar(32)                                not null comment '�ͷ�����',
    daily_assignment_limit int unsigned                               not null comment 'ÿ��ָ������',
    remark                 varchar(200)                               null comment '��ע',
    creator_id             int unsigned                               null comment '�����˱��',
    creator_name           varchar(32)                                null comment '����������',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id            int unsigned                               null comment '�����˱��',
    operator_name          varchar(32)                                null comment '����������',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag               tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ͷ���Ϣ�����';

create index idx_custcode_dflag
    on ec_oms_customer_service (customer_code, del_flag);

create table ec_oms_customer_service_group
(
    group_code        int unsigned                               not null comment '�ͷ�����'
        primary key,
    group_name        varchar(32)                                not null comment '�ͷ�������',
    group_leader_code int(10)                                    null comment '�ͷ����鳤���',
    group_leader_name varchar(32)                                null comment '�ͷ����鳤����',
    remark            varchar(200)                               null comment '��ע',
    creator_id        int unsigned                               null comment '�����˱��',
    creator_name      varchar(32)                                null comment '����������',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id       int unsigned                               null comment '�����˱��',
    operator_name     varchar(32)                                null comment '����������',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag          tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ͷ�����Ϣ�����';

create table ec_oms_customer_service_group_relation
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    customer_code    int unsigned                               not null comment '�ͷ���ţ�������ec_oms_customer_service.customer_code��',
    group_code       int unsigned                               not null comment '�ͷ����ţ�������ec_oms_customer_service_group.group_code��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ͷ���ͷ����ϵ��';

create index idx_custcode_dflag
    on ec_oms_customer_service_group_relation (customer_code, del_flag);

create table ec_oms_delivery_limitation_strategy
(
    strategy_code            bigint unsigned                            not null comment '���Ա��,����+5λ����'
        primary key,
    strategy_name            varchar(64)                                not null comment '��������',
    time_type                int unsigned     default 0                 not null comment '����ʱ������,0����ʱ��',
    strategy_begin_time      timestamp        default CURRENT_TIMESTAMP not null comment '���Կ�ʼʱ��',
    strategy_end_time        timestamp        default CURRENT_TIMESTAMP not null comment '���Խ���ʱ��',
    product_code             bigint                                     not null comment '��Ʒ��ţ�����-1������ȫ����Ʒ',
    buyer_range              tinyint unsigned default 0                 not null comment '��ҷ�Χ���ֵ�ec_oms_retention_product_buyer_range�� 0-ȫ�� 1-ָ���������',
    order_sign               tinyint unsigned default 0                 not null comment '������ǣ��ֵ�ec_oms_order_sign�� 0-�ޣ�1-ֱ��������2-��ٻ',
    delivery_limitation_type tinyint unsigned default 1                 not null comment '����ʱЧ���ͣ��ֵ�ec_oms_delivery_limitation_type�� 1-�̶�ʱ����2-���䷢��',
    operator_id              int                                        null comment '�����˱��',
    operator_name            varchar(32)                                null comment '����������',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    creator_id               int                                        null comment '�����˱��',
    creator_name             varchar(32)                                null comment '����������',
    del_flag                 tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ʱЧ���Ա�';

create index idx_be_end_pro
    on ec_oms_delivery_limitation_strategy (strategy_begin_time, strategy_end_time, product_code);

create table ec_oms_delivery_limitation_strategy_buyer_sub
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '�������Ա��',
    buyer_id         varchar(64)                                not null comment 'ָ�����ID',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ʱЧ���������Ϣ��';

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_buyer_sub (strategy_code);

create table ec_oms_delivery_limitation_strategy_delivery_sub
(
    id                   int unsigned auto_increment comment '����id'
        primary key,
    strategy_code        bigint unsigned                              not null comment '�������Ա��',
    delivery_limitation  mediumint unsigned default 48                not null comment '����ʱЧ(�ش���ݵ���)����λСʱ',
    logistics_collection mediumint unsigned default 72                not null comment '����ʱЧ(��������)����λСʱ',
    num_interval_start   int unsigned       default 0                 not null comment '��������������ʼֵ',
    num_interval_end     int unsigned       default 0                 not null comment '���������������ֵ',
    use_num              int(10)            default 0                 not null comment '��ʹ����',
    del_flag             tinyint unsigned   default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    create_time          timestamp          default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time     timestamp          default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '����ʱЧ���Է�����Ϣ�ӱ�';

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_delivery_sub (strategy_code);

create table ec_oms_delivery_limitation_strategy_record
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC������ţ�����ec_oms_order',
    strategy_code    bigint unsigned                            not null comment '���Ա�ţ�����ec_oms_delivery_limitation_strategy',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    talent_name      varchar(32)      default ''                null comment '��������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '����Ӧ�÷���ʱЧ������ϸ��';

create index idx_order_code
    on ec_oms_delivery_limitation_strategy_record (order_code);

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_record (strategy_code);

create table ec_oms_delivery_limitation_strategy_shop_sub
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '�������Ա��',
    shop_code        int(30) unsigned                           not null comment '���̱��',
    shop_name        varchar(64)                                not null comment '��������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ʱЧ���Ե�����Ϣ��';

create index idx_strategy_shop_code
    on ec_oms_delivery_limitation_strategy_shop_sub (strategy_code, shop_code, del_flag);

create table ec_oms_delivery_limitation_strategy_talent_sub
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '�������Ա��',
    shop_pro_name    varchar(255)                               not null comment 'ƽ̨��Ʒ��',
    talent_name      varchar(32)      default ''                not null comment '��������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ʱЧ���Դ��˱�Ǳ�';

create index idx_strategy_code
    on ec_oms_delivery_limitation_strategy_talent_sub (strategy_code);

create table ec_oms_edit_order_finenter
(
    id                   int(11) unsigned auto_increment comment '����id'
        primary key,
    export_code          bigint unsigned                     null comment '�������',
    writeoff_ec_order_id int(11) unsigned                    null comment 'writeoff_ec_order�ı��id',
    order_code           decimal(30) unsigned                null comment 'ec�������',
    failure_reason       varchar(255)                        null comment 'ʧ��ԭ��',
    create_time          timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '������̨�������󶩵��б�';

create table ec_oms_edit_order_import
(
    id                      int unsigned auto_increment comment '����ID'
        primary key,
    import_code             bigint unsigned                            not null comment '�������κ�',
    order_code              decimal(30) unsigned                       not null comment 'EC�������',
    shop_order_id           varchar(64)                                not null comment '���̶������',
    shop_code               int unsigned                               null comment '������Դ���',
    order_shop_discount_amt decimal(14, 2) unsigned                    null comment '���̳е������Ż�',
    order_plat_discount_amt decimal(14, 2) unsigned                    null comment 'ƽ̨�е������Ż�',
    order_all_shipment      decimal(14, 2) unsigned                    null comment '���˷�',
    handle_status           tinyint unsigned default 0                 null comment '����״̬ 0 δ���� 1-�ɹ� 2-ʧ��',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    creator_id              int unsigned                               not null comment '�����˱��',
    creator_name            varchar(32)                                null comment '����������'
)
    comment '��������������¼��';

create table ec_oms_edit_order_product_import
(
    id                    int unsigned auto_increment comment '����id'
        primary key,
    import_code           bigint unsigned                            not null comment '�������κ�',
    order_code            decimal(30) unsigned                       not null comment 'ec�������',
    shop_order_id         varchar(64)                                null comment '���̶������',
    product_code          bigint unsigned                            not null comment '��Ʒ���',
    pro_one_price         decimal(14, 2) unsigned                    null comment '��Ʒ����',
    buy_num               int unsigned                               null comment '��������',
    pro_all_price         decimal(14, 2) unsigned                    null comment '���۽��',
    pro_shop_discount_amt decimal(14, 2) unsigned                    null comment '���̳е���Ʒ�Ż�',
    pro_plat_discount_amt decimal(14, 2) unsigned                    null comment 'ƽ̨�е���Ʒ�Ż�',
    handle_status         tinyint unsigned default 0                 null comment '����״̬ 0 δ���� 1-�ɹ� 2-ʧ��',
    creator_id            int unsigned                               null comment '�����˱��',
    creator_name          varchar(32)                                null comment '����������',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '��������������Ʒ���ݼ�¼��';

create table ec_oms_exc_offline_refund_order
(
    offline_refund_code        bigint unsigned                                   not null comment '�����˿���(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    refund_code                bigint unsigned                                   null comment '�����˿�ţ�������ec_oms_exc_refund_order.refund_code��',
    order_code                 decimal(30) unsigned                              not null comment 'EC�������',
    refund_amount              decimal(12, 2) unsigned default 0.00              not null comment '�˿���',
    refund_reason              tinyint unsigned                                  null comment '�˿�ԭ���ֵ䣺ec_oms_offline_refund_reason��',
    refund_type                tinyint unsigned        default 1                 not null comment '�˿����ͣ��ֵ䣺ec_oms_refund_type��@1- �˻��˿�2-��������3-�����˿�4-δ�������˿�5-����',
    refund_mode                tinyint unsigned        default 1                 not null comment '�˿ʽ���ֵ䣺ec_oms_refund_mode��@1- ֧�����˿2-�����˿3-ƽ̨�˿�',
    offline_refund_status      tinyint unsigned        default 0                 not null comment '�����˿״̬���ֵ䣺ec_oms_offline_refund_status��@0-���ύ��1-����ˡ�2-���˿3-�˿��С�4-�˿�ɹ���5-�˿�ʧ�ܡ�6-��˲�ͨ����7-��ȡ��',
    account                    varchar(64)                                       null comment '�˻���֧������',
    account_cipher             varchar(280)                                      null comment '�˻���֧������',
    account_name               varchar(20)                                       null comment '�˻�����',
    account_name_cipher        varchar(88)                                       null comment '�˻�����',
    deposit_bank_province      varchar(32)                                       null comment '������ʡ��',
    deposit_bank_province_code mediumint unsigned                                null comment 'ʡ�ݱ���',
    deposit_bank_city          varchar(32)                                       null comment '�����г���',
    deposit_bank_city_code     mediumint unsigned                                null comment '���б���',
    deposit_bank_name          varchar(64)                                       null comment '����������',
    has_refund_voucher         tinyint unsigned        default 0                 not null comment '�Ƿ�����˿�ƾ֤��1-�ǣ�0-��',
    remark                     varchar(200)                                      null comment '��ע',
    verify_user_id             int unsigned                                      null comment '����˱��',
    verify_user_name           varchar(32)                                       null comment '���������',
    verify_time                timestamp                                         null comment '���ʱ��',
    verify_no_pass_reason      varchar(128)                                      null comment '��˲�ͨ��ԭ��',
    refund_no_pass_reason      varchar(128)                                      null comment '�˿ͨ��ԭ��',
    batch_no                   varchar(16)                                       null comment '���κ�',
    submit_time                timestamp                                         null comment '�ύʱ��',
    refunding_time             timestamp                                         null comment '����˿���ʱ��',
    refunded_time              timestamp                                         null comment '�˿�ɹ�ʱ��',
    shop_order_id              varchar(64)                                       null comment '���̶������',
    creator_id                 int unsigned                                      null comment '�����˱�ţ������ˣ�',
    creator_name               varchar(32)                                       null comment '���������ƣ����������ƣ�',
    create_time                timestamp               default CURRENT_TIMESTAMP null comment '����ʱ�䣨����ʱ�䣩',
    operator_id                int unsigned                                      null comment '�����˱��',
    operator_name              varchar(32)                                       null comment '����������',
    last_update_time           timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                   tinyint unsigned        default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ������˿��Ϣ��';

create index idx_order_code
    on ec_oms_exc_offline_refund_order (order_code);

create table ec_oms_exc_order
(
    id                        int unsigned auto_increment comment '����ID'
        primary key,
    order_code                decimal(30) unsigned                          not null comment 'EC�������',
    exc_mark_time             timestamp                                     null comment '�쳣���ʱ��',
    exc_finish_time           timestamp                                     null comment '�쳣���ʱ��',
    aftersale_status          tinyint unsigned    default 0                 not null comment '�ۺ���״̬���ֵ䣺ec_oms_aftersale_status��@0-δ����1-������2-�Ѵ���',
    response_status           tinyint unsigned    default 1                 not null comment '��������Ӧ״̬(�ֵ䣺ec_oms_distributor_response_status @0-����Ӧ��@1-����Ӧ)',
    mark_undo_time            timestamp                                     null comment '���δ����ʱ��',
    mark_doing_time           timestamp                                     null comment '��Ǵ�����ʱ��',
    mark_done_time            timestamp                                     null comment '����Ѵ���ʱ��',
    revisit_time              timestamp                                     null comment '�ط�ʱ��',
    emergency                 tinyint unsigned                              null comment '�����̶ȣ��ֵ䣺ec_oms_emergency��@1-һ��2-����',
    issue_subject_code        int unsigned                                  null comment 'һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code������¼����һ������������',
    issue_type_code           int unsigned                                  null comment '���������ţ�������ec_oms_issue_type_base.issue_type_code������¼����һ������������',
    issue_reason_code         int unsigned                                  null comment '����ԭ���ţ�����ec_oms_issue_reason_base.issue_reason_code������¼����һ������������',
    default_responsible_party tinyint unsigned    default 0                 null comment '���η����ֵ䣺ec_oms_default_responsible_party��',
    is_refund                 tinyint unsigned    default 0                 not null comment '�Ƿ��˿�ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_return_goods           tinyint unsigned    default 0                 not null comment '�Ƿ��˻����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_reissued               tinyint unsigned    default 0                 not null comment '�Ƿ񲹷����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_pursue_responsibility  tinyint unsigned    default 0                 not null comment '�Ƿ�׷���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    assigned_times            tinyint unsigned    default 0                 not null comment '�Զ�ָ�ɴ���',
    is_assigned               tinyint unsigned    default 0                 not null comment '�Ƿ�ָ�ɣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    manager_id                int unsigned                                  null comment 'ָ�ɴ����˱��',
    manager_name              varchar(32)                                   null comment 'ָ�ɴ���������',
    has_voucher               tinyint unsigned    default 0                 not null comment '�Ƿ����ƾ֤��1-�ǣ�0-��',
    send_sms_fail_resaon      varchar(200)                                  null comment '���ŷ���ʧ��ԭ��',
    send_sms_time             timestamp                                     null comment '���ŷ���ʱ��',
    send_sms_status           tinyint                                       null comment '���ŷ���״̬���ֵ䣺ec_oms_send_sms_status��@1-�ɹ���0-ʧ��',
    return_normal_time        timestamp                                     null comment '�ָ�������ʱ��',
    last_reply_time           timestamp                                     null comment '���ظ�ʱ��',
    refund_scope              tinyint unsigned    default 0                 null comment '�˿Χ���ֵ䣺ec_oms_refund_scope��@1- ȫ���˿2-�����˿�',
    create_source             tinyint unsigned    default 0                 null comment '�ۺ���Դ���ֵ䣺ec_oms_work_order_type��@0-������@1- BM������2-BM������3-ϵͳ�Խӡ�4-Ԥ�˿�Ǽǡ�5-��ݵǼǡ�6-������� ��7-�������� 8-�ͻ�����',
    creator_id                int unsigned                                  null comment '�����˱��',
    creator_name              varchar(32)                                   null comment '����������',
    create_time               timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id               int unsigned                                  null comment '�����˱��',
    operator_name             varchar(32)                                   null comment '����������',
    last_update_time          timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    claims_status             tinyint(4) unsigned default 0                 null comment '���¿�����ⵥ״̬(�˿�򲹷������ֵ䣺ec_oms_claims_status:1-����ˡ�2-��˲�ͨ����3-ȷ�����⡢4-ȡ�����⡢9-���ύ)',
    work_system_status        tinyint(4) unsigned default 0                 null comment '���¿�ݹ���״̬(�ֵ䣺ec_oms_work_system_status:1-������2-�����С�3-�����ա�4-�ѹرա�5-��ȡ��)',
    operation_type            tinyint(4) unsigned default 0                 null comment '���¿�ݹ�������(�ֵ䣺ec_oms_operation_type)',
    latest_ec_reply_id        int unsigned                                  null comment '�����ڲ��ظ�id',
    latest_sam_reply_id       int unsigned                                  null comment '���·����̻ظ�id',
    latest_express_reply_id   int unsigned                                  null comment '���¿���̻ظ�id',
    constraint idx_unq
        unique (order_code)
)
    comment '�ۺ��쳣������Ϣ��';

create index idx_afsta_mid_isass
    on ec_oms_exc_order (aftersale_status, manager_id, is_assigned)
    comment '�ͷ�ͳ�Ʋ�ѯ����';

create index idx_ctime_ocode_astat_lrtime
    on ec_oms_exc_order (create_time, order_code, aftersale_status, last_reply_time)
    comment 'ʱ��+�ۺ�״̬+�ظ���ѯ����';

create index idx_exc_mark_time
    on ec_oms_exc_order (exc_mark_time);

create index idx_luptime
    on ec_oms_exc_order (last_update_time);

create index idx_mid_ctime
    on ec_oms_exc_order (manager_id, create_time);

create table ec_oms_exc_order_history
(
    id                        int unsigned auto_increment comment '����ID'
        primary key,
    order_code                decimal(30) unsigned                          not null comment 'EC�������',
    exc_mark_time             timestamp                                     null comment '�쳣���ʱ��',
    exc_finish_time           timestamp                                     null comment '�쳣���ʱ��',
    aftersale_status          tinyint unsigned    default 0                 not null comment '�ۺ���״̬���ֵ䣺ec_oms_aftersale_status��@0-δ����1-������2-�Ѵ���',
    response_status           tinyint unsigned    default 1                 not null comment '��������Ӧ״̬(�ֵ䣺ec_oms_distributor_response_status @0-����Ӧ��@1-����Ӧ)',
    mark_undo_time            timestamp                                     null comment '���δ����ʱ��',
    mark_doing_time           timestamp                                     null comment '��Ǵ�����ʱ��',
    mark_done_time            timestamp                                     null comment '����Ѵ���ʱ��',
    revisit_time              timestamp                                     null comment '�ط�ʱ��',
    emergency                 tinyint unsigned                              null comment '�����̶ȣ��ֵ䣺ec_oms_emergency��@1-һ��2-����',
    issue_subject_code        int unsigned                                  null comment 'һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code������¼����һ������������',
    issue_type_code           int unsigned                                  null comment '���������ţ�������ec_oms_issue_type_base.issue_type_code������¼����һ������������',
    issue_reason_code         int unsigned                                  null comment '����ԭ���ţ�����ec_oms_issue_reason_base.issue_reason_code������¼����һ������������',
    default_responsible_party tinyint unsigned    default 0                 null comment '���η����ֵ䣺ec_oms_default_responsible_party��',
    is_refund                 tinyint unsigned    default 0                 not null comment '�Ƿ��˿�ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_return_goods           tinyint unsigned    default 0                 not null comment '�Ƿ��˻����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_reissued               tinyint unsigned    default 0                 not null comment '�Ƿ񲹷����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_pursue_responsibility  tinyint unsigned    default 0                 not null comment '�Ƿ�׷���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    assigned_times            tinyint unsigned    default 0                 not null comment '�Զ�ָ�ɴ���',
    is_assigned               tinyint unsigned    default 0                 not null comment '�Ƿ�ָ�ɣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    manager_id                int unsigned                                  null comment 'ָ�ɴ����˱��',
    manager_name              varchar(32)                                   null comment 'ָ�ɴ���������',
    has_voucher               tinyint unsigned    default 0                 not null comment '�Ƿ����ƾ֤��1-�ǣ�0-��',
    send_sms_fail_resaon      varchar(200)                                  null comment '���ŷ���ʧ��ԭ��',
    send_sms_time             timestamp                                     null comment '���ŷ���ʱ��',
    send_sms_status           tinyint                                       null comment '���ŷ���״̬���ֵ䣺ec_oms_send_sms_status��@1-�ɹ���0-ʧ��',
    return_normal_time        timestamp                                     null comment '�ָ�������ʱ��',
    last_reply_time           timestamp                                     null comment '���ظ�ʱ��',
    refund_scope              tinyint unsigned    default 0                 null comment '�˿Χ���ֵ䣺ec_oms_refund_scope��@1- ȫ���˿2-�����˿�',
    create_source             tinyint unsigned    default 0                 null comment '�ۺ���Դ���ֵ䣺ec_oms_work_order_type��@0-������@1- BM������2-BM������3-ϵͳ�Խӡ�4-Ԥ�˿�Ǽǡ�5-��ݵǼǡ�6-������� ��7-�������� 8-�ͻ�����',
    creator_id                int unsigned                                  null comment '�����˱��',
    creator_name              varchar(32)                                   null comment '����������',
    create_time               timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id               int unsigned                                  null comment '�����˱��',
    operator_name             varchar(32)                                   null comment '����������',
    last_update_time          timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    claims_status             tinyint(4) unsigned default 0                 null comment '���¿�����ⵥ״̬(�˿�򲹷������ֵ䣺ec_oms_claims_status:1-����ˡ�2-��˲�ͨ����3-ȷ�����⡢4-ȡ�����⡢9-���ύ)',
    work_system_status        tinyint(4) unsigned default 0                 null comment '���¿�ݹ���״̬(�ֵ䣺ec_oms_work_system_status:1-������2-�����С�3-�����ա�4-�ѹرա�5-��ȡ��)',
    operation_type            tinyint(4) unsigned default 0                 null comment '���¿�ݹ�������(�ֵ䣺ec_oms_operation_type)',
    latest_ec_reply_id        int unsigned                                  null comment '�����ڲ��ظ�id',
    latest_sam_reply_id       int unsigned                                  null comment '���·����̻ظ�id',
    latest_express_reply_id   int unsigned                                  null comment '���¿���̻ظ�id',
    constraint idx_unq
        unique (order_code)
)
    comment '�ۺ��쳣������Ϣ�鵵��';

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
    id               int unsigned auto_increment comment '����ID'
        primary key,
    work_order_code  bigint unsigned                            not null comment '�ۺ󹤵���ţ�������ec_oms_exc_work_order.work_order_code��',
    order_code       decimal(30) unsigned                       not null comment 'EC�������',
    package_code     bigint unsigned                            null comment '�ײͱ��',
    package_name     varchar(255)                               null comment '�ײ����ƣ����ȴ�ŵ���Ʒ����',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    product_name     varchar(255)                               not null comment '��Ʒ���ƣ����ȴ�ŵ���Ʒ����',
    is_present       tinyint unsigned default 0                 not null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    buy_num          int unsigned     default 0                 not null comment '��������',
    exc_number       int unsigned     default 0                 not null comment '������',
    damaged_parts    varchar(32)                                null comment '����λ���ֵ䣺ec_oms_damaged_parts�������Ӣ�Ķ��Ÿ���',
    damaged_pic_path varchar(1024)                              null comment '��ͼƬ·��',
    remark           varchar(200)                               null comment '��ע',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�𻵲�Ʒ��Ϣ�ǼǱ�';

create index idx_order_code
    on ec_oms_exc_product (order_code);

create index idx_work_order_code
    on ec_oms_exc_product (work_order_code);

create table ec_oms_exc_refund_ag
(
    refund_code            bigint unsigned                                   not null comment '�˿��(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    sku_is_bigorder        tinyint unsigned        default 0                 not null comment '�Ƿ�󶩵����ֵ䣺ec_oms_sku_is_bigorder��@1-ȫ���� 0-ȫ����2-���ַ�',
    order_status           tinyint unsigned                                  null comment 'SKU����״̬',
    sku_return_status      tinyint unsigned                                  null comment 'SKU�˻ص���״̬���ֵ䣺ec_oms_sku_return_status��',
    sku_dispatch_status    tinyint unsigned                                  null comment 'SKU����״̬���ֵ䣺ec_oms_sku_dispatch_status��',
    return_status          tinyint unsigned                                  null comment '�˻ص���״̬���ֵ䣺ec_oms_sku_return_status��',
    is_consistent          tinyint unsigned        default 1                 not null comment 'SKU�Ƿ�һ�£��ֵ䣺ec_oms_yes_no��1-�ǣ�0-��',
    doc_num                tinyint unsigned        default 0                 not null comment '��������',
    update_fail_reason     varchar(256)                                      null comment 'AG�ش�ʧ��ԭ��',
    update_plat_status     tinyint unsigned        default 0                 not null comment 'AG�ش����콢��״̬���ֵ䣺ec_oms_update_plat_status��@0-δ�ش�1-�ش��ɹ�2-�ش�ʧ��',
    sku_is_exc             tinyint unsigned        default 0                 not null comment '�Ƿ��쳣���ֵ䣺ec_oms_sku_is_exc��@1-ȫ���� 0-ȫ����2-������',
    operation_type         tinyint unsigned                                  null comment '��������@1-�Զ�2-�˹�3-ǿ��',
    is_recover             tinyint unsigned        default 0                 not null comment '�Ƿ�ָ����ֵ䣺ec_oms_yes_no��1-�ǣ�0-��',
    product_code           bigint unsigned                                   null comment '�˿��Ʒ���(����)',
    buy_num                int unsigned                                      null comment '��������(����)',
    shop_code              int unsigned                                      not null comment '������Դ���(����)',
    refund_num             int unsigned            default 0                 null comment '�����˿�����(����)',
    refund_amount          decimal(10, 2) unsigned default 0.00              not null comment '�����˿���(����)',
    unshipped_num          int(10)                 default 0                 not null comment 'δ��������',
    wait_ship_num          int unsigned            default 0                 not null comment '��������',
    shipped_num            int unsigned            default 0                 not null comment '�ѷ�����',
    product_convert_status tinyint unsigned        default 0                 not null comment '�Ƿ�Ӧ��תƷ���ԵĶ������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    creator_id             int unsigned                                      null comment '�����˱��',
    creator_name           varchar(32)                                       null comment '����������',
    create_time            timestamp               default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id            int unsigned                                      null comment '�����˱��',
    operator_name          varchar(32)                                       null comment '����������',
    last_update_time       timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag               tinyint unsigned        default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'AG�˿���չ��';

create table ec_oms_exc_refund_ag_config
(
    id                        int unsigned auto_increment comment '����ID'
        primary key,
    config_status             tinyint unsigned default 1                 not null comment '�Զ�AG�˿��@1-������0-�ر�',
    shop_codes                varchar(2048)                              not null comment '���̱�ţ�������Ÿ�����0��ʾȫ��',
    is_bigorder               tinyint unsigned default 0                 not null comment '�Ƿ�󶩵����ֵ䣺ec_oms_is_bigorder��@1-ȫ���� 0-ȫ����2-���ַ�',
    shop_trade_status         varchar(64)                                null comment '���̽���״̬(�ֵ䣺ec_oms_tmall_order_status)��������ŷָ�',
    is_same_quantity          tinyint(3)                                 not null comment '�Ƿ�Ҫ��SKU�������������ڡ�SKU�������������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    is_quantity_zero          tinyint(3)                                 not null comment '�Ƿ�Ҫ��SKU��������������0���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    issue_subject_code        int unsigned                               null comment 'һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code��',
    issue_type_code           int unsigned                               null comment '���������ţ�������ec_oms_issue_type_base.issue_type_code��',
    issue_reason_code         int unsigned                               null comment '����ԭ���ţ�������ec_oms_issue_reason_base.issue_reason_code��',
    default_responsible_party tinyint unsigned default 0                 null comment 'Ĭ�����η����ֵ䣺ec_oms_default_responsible_party��@1- ��������2-��ݹ�˾��3-�ͻ�',
    aftersale_status          tinyint unsigned default 0                 not null comment '�ۺ���״̬���ֵ䣺ec_oms_aftersale_status��@0-δ����1-������2-�Ѵ���',
    is_exc                    tinyint unsigned default 0                 not null comment '�Ƿ��쳣���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    creator_id                int unsigned                               null comment '�����˱�ţ������ˣ�',
    creator_name              varchar(32)                                null comment '���������ƣ����������ƣ�',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '����ʱ�䣨�ύʱ�䣩',
    operator_id               int unsigned                               null comment '�����˱��',
    operator_name             varchar(32)                                null comment '����������',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'AG�˿����ñ�';

create table ec_oms_exc_refund_order
(
    refund_code               bigint unsigned                                   not null comment '�˿��(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    work_order_code           bigint unsigned                                   not null comment '�ۺ󹤵���ţ�������ec_oms_exc_work_order.work_order_code��',
    order_code                decimal(30) unsigned                              not null comment 'EC�������',
    shop_refund_order_id      varchar(64)                                       null comment '�����˿���',
    exc_waybill_code          varchar(30)                                       not null comment '�쳣��ݵ���',
    refund_order_type         tinyint unsigned        default 1                 not null comment '�˿���ͣ��ֵ䣺ec_oms_refund_order_type��@1- ϵͳץȡ��2-�˹����� 3-�˻��˿�',
    refund_scope              tinyint unsigned        default 1                 not null comment '�˿Χ���ֵ䣺ec_oms_refund_scope��@1- ȫ���˿2-�����˿�',
    refund_amount             decimal(10, 2) unsigned default 0.00              not null comment '�˿���',
    refund_reason             varchar(32)                                       null comment '�˿�ԭ��',
    is_pursue_responsibility  tinyint unsigned        default 0                 not null comment '�Ƿ�׷���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    default_responsible_party tinyint unsigned                                  null comment '���η����ֵ䣺ec_oms_default_responsible_party��@1- ��������2-��ݹ�˾��3-�ͻ�',
    responsibility_amount     decimal(10, 2) unsigned default 0.00              not null comment '���ν��',
    refund_time               timestamp                                         null comment '�˿��ɣ�ʱ��',
    is_valid                  tinyint unsigned        default 1                 not null comment '�Ƿ���Ч���ֵ䣺ec_oms_is_valid��@0-��Ч��1-��Ч',
    plat_refund_order_status  varchar(40)                                       null comment 'ƽ̨�˿״̬(�ֵ䣺ec_oms_plat_refund_order_status)',
    plat_refund_apply_time    timestamp                                         null comment 'ƽ̨�˿�����ʱ��',
    plat_refund_check_time    timestamp                                         null comment 'ƽ̨�˿����ʱ��',
    shop_total_fee            decimal(10, 2) unsigned default 0.00              not null comment '���̽����ܽ��(ϵͳץȡ)',
    shop_order_id             varchar(64)                                       null comment '���̶������(ϵͳץ��ʱ��¼)',
    shop_good_status          varchar(32)                                       null comment '���̻���״̬��ץȡ���ֵ䣺ec_oms_shop_good_status��',
    shop_is_return_goods      tinyint unsigned        default 1                 not null comment '�Ƿ��˻���ץȡ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    claims_status             tinyint(4) unsigned     default 0                 null comment '������ⵥ״̬(�ֵ䣺ec_oms_claims_status:1-����ˡ�2-��˲�ͨ����3-ȷ�����⡢4-ȡ�����⡢9-���ύ)',
    rejected_reason           varchar(255)                                      null comment '��ݲ�������ԭ��',
    creator_id                int unsigned                                      null comment '�����˱��',
    creator_name              varchar(32)                                       null comment '����������',
    create_time               timestamp               default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id               int unsigned                                      null comment '�����˱��',
    operator_name             varchar(32)                                       null comment '����������',
    last_update_time          timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned        default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ��˿��Ϣ��';

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
    id                int unsigned auto_increment comment '����ID'
        primary key,
    refund_code       bigint unsigned                            not null comment '�˿�ţ�������ec_oms_exc_refund_order.refund_code��',
    product_code      bigint unsigned                            null comment '�˿��Ʒ���',
    plat_product_code varchar(32)                                null comment 'ƽ̨�˿��Ʒ���',
    product_name      varchar(255)                               null comment '�˿��Ʒ���ƣ����ȴ�ŵ���Ʒ����',
    is_present        tinyint unsigned default 0                 not null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    pro_one_price     decimal(14, 4)   default 0.0000            null comment '��Ʒ����',
    buy_num           int unsigned                               null comment '��������',
    refund_num        int unsigned     default 0                 null comment '�����˿�����',
    refund_amount     decimal(10, 2) unsigned                    null comment '�����˿���',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag          tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ��˿���Ʒ��ϸ��';

create index idx_luptime
    on ec_oms_exc_refund_order_sub (last_update_time);

create index idx_refund_code
    on ec_oms_exc_refund_order_sub (refund_code);

create table ec_oms_exc_refund_pdd
(
    refund_code        bigint unsigned                            not null comment '�˿��(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    send_plat_status   varchar(10)      default ''                null comment 'PDD�ش�״̬�ֶ�SUCCESS������ECϵͳ����״̬Ϊ����ȡ������ȡ�������ɹ�FAIL������ECϵͳ�ѷ�����ȡ������״̬ʧ�� ',
    operation_type     tinyint unsigned default 0                 null comment '��������@0-��1-�Զ�2-�˹�',
    update_plat_status tinyint unsigned default 0                 not null comment 'PDD�ش�״̬���ֵ䣺ec_oms_pdd_update_plat_status��@0-δ�ش�1-�ش��ɹ�2-�ش�ʧ��',
    update_plat_time   timestamp                                  null comment 'PDD�ش�ʱ��',
    update_fail_reason varchar(256)     default ''                null comment 'PDD�ش�ʧ��ԭ��',
    update_num         tinyint unsigned default 0                 null comment '�ش�����',
    operator_id        int unsigned                               null comment '�����˱��',
    operator_name      varchar(32)                                null comment '����������',
    operator_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment 'PDD�˿���չ��';

create table ec_oms_exc_refund_sa
(
    refund_code             bigint unsigned                            not null comment '�˿��(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    auto_add_present_status tinyint unsigned default 0                 not null comment '�����Ƿ��Զ��������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    is_contain_virtual      tinyint(3)       default 0                 not null comment '�����Ƿ��������Ʒ���ֵ䣺ec_oms_yes_no��@1-�� 0-��0',
    update_plat_status      tinyint unsigned default 0                 not null comment 'SA�ش����콢��״̬���ֵ䣺ec_oms_update_plat_status��@0-δ�ش�1-�ش��ɹ�2-�ش�ʧ��3-����ش�',
    update_plat_time        timestamp                                  null comment 'SA�ش����콢��ʱ��',
    update_fail_reason      varchar(256)     default ''                null comment 'SA�ش�ʧ��ԭ��',
    update_num              tinyint unsigned default 0                 null comment '�ش�����',
    stock_out_status        tinyint unsigned default 1                 not null comment '����״̬���ֵ䣺ec_oms_stock_out_status��@1-δ���⣬2-�ѳ���',
    operation_type          tinyint unsigned default 0                 null comment '��������@0-��1-�Զ�2-�˹�',
    creator_id              int unsigned                               null comment '�����˱��',
    creator_name            varchar(32)                                null comment '����������',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id             int unsigned                               null comment '�����˱��',
    operator_name           varchar(32)                                null comment '����������',
    last_update_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����SA�˿���չ��';

create index idx_upstatus_luptime
    on ec_oms_exc_refund_sa (update_plat_status, last_update_time);

create table ec_oms_exc_refund_sa_config
(
    id                        int unsigned auto_increment comment '����ID'
        primary key,
    config_status             tinyint unsigned default 1                 not null comment '�Զ�SA�˿��@1-������0-�ر�',
    shop_codes                varchar(2048)    default ''                not null comment '���̱�ţ�������Ÿ���',
    plat_order_status         varchar(512)                               null comment 'ƽ̨/���̶���״̬��������Ÿ������ֵ䣺ec_oms_plat_order_status��',
    order_status              varchar(64)                                not null comment '����״̬��������Ÿ������ֵ䣺ec_oms_order_status��0-��������1-���ύ��2��ɾ����3������4��ȡ����5���󵥡�6���ִ��󵥡�7���˻ص��ȡ�8���ִ��˻ص��ȡ�9�����ȡ�10���ִ����ȡ�11��������12���ִ�������13�����С�14���ַ����С�15�ѷ�����16�����ѷ�����17��ǩ�ա�18������ǩ�ա�19���׳ɹ���20���ֽ��׳ɹ���99������',
    is_bigorder               tinyint unsigned default 0                 not null comment '�Ƿ�󶩵����ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    auto_add_present_status   tinyint unsigned default 0                 not null comment '�����Ƿ��Զ��������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    is_contain_virtual        tinyint(3)       default 0                 not null comment '�����Ƿ��������Ʒ���ֵ䣺ec_oms_yes_no��@1-�� 0-��0',
    no_refund_pro_codes       varchar(2048)    default ''                not null comment '��֧���˿����Ʒ��ţ�������Ÿ���',
    issue_subject_code        int unsigned                               null comment 'һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code��',
    issue_type_code           int unsigned                               null comment '���������ţ�������ec_oms_issue_type_base.issue_type_code��',
    issue_reason_code         int unsigned                               null comment '����ԭ���ţ�������ec_oms_issue_reason_base.issue_reason_code��',
    default_responsible_party tinyint unsigned default 0                 null comment 'Ĭ�����η����ֵ䣺ec_oms_default_responsible_party��@1- ��������2-��ݹ�˾��3-�ͻ�',
    aftersale_status          tinyint unsigned default 0                 not null comment '�ۺ���״̬���ֵ䣺ec_oms_aftersale_status��@0-δ����1-������2-�Ѵ���',
    is_exc                    tinyint unsigned default 0                 not null comment '�Ƿ��쳣���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    creator_id                int unsigned                               null comment '�����˱�ţ������ˣ�',
    creator_name              varchar(32)                                null comment '���������ƣ����������ƣ�',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '����ʱ�䣨�ύʱ�䣩',
    operator_id               int unsigned                               null comment '�����˱��',
    operator_name             varchar(32)                                null comment '����������',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����SA�˿����ñ�';

create table ec_oms_exc_reissue_order
(
    reissue_code              bigint unsigned                                   not null comment '��������(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    work_order_code           bigint unsigned                                   not null comment '�ۺ󹤵���ţ�������ec_oms_exc_work_order.work_order_code��',
    order_code                decimal(30) unsigned                              not null comment 'EC�������',
    exc_waybill_code          varchar(30)                                       not null comment '�쳣��ݵ���',
    reissue_order_status      tinyint unsigned        default 0                 not null comment '������״̬���ֵ䣺ec_oms_reissue_order_status��@0-���Ǽǡ�1-�ѵǼǲ�����2-��ȡ��',
    reissue_order_type        tinyint unsigned        default 1                 not null comment '���������ͣ��ֵ䣺ec_oms_reissue_order_type��@1- �˹�������2-�˹�����',
    reissue_reason            varchar(20)                                       null comment '����ԭ��',
    is_actual_damage          tinyint unsigned        default 0                 not null comment '�Ƿ�ʵ����ʧ,����Ϊ�Ƿ�׷���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    default_responsible_party tinyint unsigned                                  null comment '���η����ֵ䣺ec_oms_default_responsible_party��@1- ��������2-��ݹ�˾��3-�ͻ�',
    reissue_scope             tinyint unsigned        default 1                 not null comment '������Χ���ֵ䣺ec_oms_reissue_scope��@1-����������ȫԭ����2-�����������з�ԭ����3-���ֲ�����ȫԭ����4-���ֲ������з�ԭ����',
    province                  varchar(32)                                       not null comment '����ʡ��',
    city                      varchar(32)                                       not null comment '��������',
    district                  varchar(32)                                       null comment '��������',
    address                   varchar(255)                                      not null comment '������ϸ��ַ',
    address_cipher            varchar(1024)                                     null comment '������ϸ��ַ',
    receiver_name             varchar(32)                                       not null comment '�����ջ�������',
    receiver_name_cipher      varchar(152)                                      null comment '�����ջ�������',
    receiver_mobile           varchar(20)                                       not null comment '�����ջ����ֻ�',
    receiver_mobile_cipher    varchar(88)                                       null comment '�����ջ����ֻ�',
    reissue_order_code        decimal(30) unsigned                              not null comment '����EC�������',
    receiver_phone            varchar(32)                                       null comment '�����ջ��˹̶��绰',
    receiver_phone_cipher     varchar(152)                                      null comment '�����ջ��˹̶��绰',
    claim_all_price           decimal(14, 2) unsigned default 0.00              null comment '�����ܽ�����Ϊ���ν��',
    claims_status             tinyint(4) unsigned     default 0                 null comment '������ⵥ״̬(�ֵ䣺ec_oms_claims_status:1-����ˡ�2-��˲�ͨ����3-ȷ�����⡢4-ȡ�����⡢9-���ύ)',
    rejected_reason           varchar(255)                                      null comment '��ݲ�������ԭ��',
    creator_id                int unsigned                                      null comment '�����˱��',
    creator_name              varchar(32)                                       null comment '����������',
    create_time               timestamp               default CURRENT_TIMESTAMP null comment '����ʱ��(��������ʱ��)',
    operator_id               int unsigned                                      null comment '�����˱��',
    operator_name             varchar(32)                                       null comment '����������',
    last_update_time          timestamp               default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned        default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ󲹷�����Ϣ��';

create index idx_order_code
    on ec_oms_exc_reissue_order (order_code);

create index idx_reissue_order_code
    on ec_oms_exc_reissue_order (reissue_order_code);

create index idx_work_order_code
    on ec_oms_exc_reissue_order (work_order_code);

create table ec_oms_exc_reissue_order_sub
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    reissue_code     bigint unsigned                            not null comment '�������ţ�������ec_oms_exc_reissue_order.reissue_code��',
    package_code     bigint unsigned                            null comment '�ײͱ��',
    package_name     varchar(255)                               null comment '�ײ����ƣ����ȴ�ŵ���Ʒ����',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    product_name     varchar(255)                               not null comment '��Ʒ���ƣ����ȴ�ŵ���Ʒ����',
    is_present       tinyint unsigned default 0                 not null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    buy_num          int unsigned     default 0                 not null comment '��������',
    shipped_num      int unsigned                               null comment '����������ȡ������������û����null��',
    reissue_num      int unsigned     default 0                 not null comment '��������',
    is_original      tinyint unsigned default 1                 not null comment '�Ƿ�ԭ����Ʒ���ֵ䣺ec_oms_is_original��@0-��ԭ����1-ԭ��',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ󲹷�����Ʒ��ϸ��';

create index idx_reissue_code
    on ec_oms_exc_reissue_order_sub (reissue_code);

create table ec_oms_exc_reply_progress
(
    id                  int unsigned auto_increment comment '����ID'
        primary key,
    order_code          decimal(30) unsigned                          not null comment 'EC�������',
    work_order_code     bigint unsigned     default 0                 null comment '�ۺ󹤵���ţ�������ec_oms_exc_work_order.work_order_code��',
    exc_waybill_code    varchar(30)                                   null comment '�쳣��ݵ���',
    is_sync_work_system tinyint(4) unsigned default 0                 null comment '�Ƿ�ͬ����ݣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    operation_type      tinyint(4) unsigned default 0                 null comment '����(�ֵ䣺ec_oms_operation_type)',
    reply_content       varchar(300)                                  null comment '�ظ�����',
    aftersale_status    tinyint unsigned    default 0                 not null comment '�ظ�ʱ�ۺ���״̬���ֵ䣺ec_oms_aftersale_status��@0-δ����1-������2-�Ѵ���',
    reply_type          tinyint(3)          default 1                 not null comment '��ͨ���� �����ⲿec(ҵ���ֵ�ec_oms_reply_type)@1-�ڲ�2-������3-�����4-�ͻ�',
    reply_person_type   tinyint(3)          default 1                 not null comment '�ظ���(ҵ���ֵ�ec_oms_reply_person_type)@1-������2-������3-�����4-�ͻ�',
    creator_id          int unsigned                                  null comment '�����˱�ţ��ظ��ˣ�',
    creator_name        varchar(32)                                   null comment '����������',
    create_time         timestamp           default CURRENT_TIMESTAMP null comment '����ʱ�䣨�ظ�ʱ�䣩',
    del_flag            tinyint unsigned    default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ󵥻ظ����ȱ�';

create index idx_ctime
    on ec_oms_exc_reply_progress (create_time);

create index idx_order_code
    on ec_oms_exc_reply_progress (order_code);

create table ec_oms_exc_return_goods
(
    return_goods_code          bigint unsigned                            not null comment '�˻�����(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    work_order_code            bigint unsigned                            not null comment '�ۺ󹤵���ţ�������ec_oms_exc_work_order.work_order_code��',
    order_code                 decimal(30) unsigned                       not null comment 'EC�������',
    shop_return_order_id       varchar(64)                                null comment '�����˻������',
    exc_waybill_code           varchar(30)                                not null comment '�쳣��ݵ���',
    return_goods_order_type    tinyint unsigned default 1                 not null comment '�˻������ͣ��ֵ䣺ec_oms_return_goods_order_type��@1- ϵͳץȡ��2-�˹�������3-�˹�����',
    return_goods_order_status  tinyint unsigned default 0                 not null comment '�˻���״̬���ֵ䣺ec_oms_return_goods_order_status��@0-δ�Ǽǡ�1-���˻���⡢2-���˻����3-��ȡ��',
    return_goods_stage         tinyint unsigned default 1                 not null comment '�˻��׶Σ��ֵ䣺ec_oms_return_goods_stage��@1-�ڲֽؼ���2- ��;�ؼ���3-ǩ�պ��˻�',
    return_goods_scope         tinyint unsigned default 1                 not null comment '�˻���Χ���ֵ䣺ec_oms_return_goods_scope��@1-ԭ���˻�,2-�����˻�',
    storehouse_code            int unsigned                               null comment '�˻��ֿ����',
    express_code               int unsigned                               null comment '�˻���ݹ�˾����',
    express_name               varchar(32)                                null comment '��ݹ�˾����',
    shipment_responsible_party tinyint unsigned                           null comment '�˷����η����ֵ䣺ec_oms_shipment_responsible_party��@1- ��������2-��ݹ�˾��3-�ͻ�',
    return_goods_waybill_code  varchar(30)                                not null comment '�˻���ݵ���,�������˻�����˾ʱ�������¿�ݵ���',
    return_goods_apply_time    timestamp                                  null comment '�˻�����ʱ��',
    return_goods_time          timestamp                                  null comment '�˻����ʱ��',
    remark                     varchar(200)                               null comment '�˻���ע',
    return_diff_reason         varchar(20)      default ''                null comment '�˻ز���ԭ��',
    refund_code                bigint unsigned                            null comment '�˿�ţ��˻��˿�ʱ���������µ���Ч���˿��',
    is_valid                   tinyint unsigned default 1                 not null comment '�Ƿ���Ч���ֵ䣺ec_oms_is_valid��@0-��Ч��1-��Ч',
    creator_id                 int unsigned                               null comment '�����˱��',
    creator_name               varchar(32)                                null comment '����������',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id                int unsigned                               null comment '�����˱��',
    operator_name              varchar(32)                                null comment '����������',
    last_update_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                   tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ��˻�����Ϣ��';

create index idx_code_status
    on ec_oms_exc_return_goods (refund_code, return_goods_order_status)
    comment '�˿�ţ��˻�״̬����';

create index idx_luptime
    on ec_oms_exc_return_goods (last_update_time);

create index idx_order_code
    on ec_oms_exc_return_goods (order_code);

create index idx_work_order_code
    on ec_oms_exc_return_goods (work_order_code);

create table ec_oms_exc_return_goods_sub
(
    id                       int unsigned auto_increment comment '����ID'
        primary key,
    return_goods_code        bigint unsigned                            not null comment '�˻����ţ�������ec_oms_exc_return_goods.return_goods_code��',
    package_code             bigint unsigned                            null comment '�ײͱ��',
    package_name             varchar(255)                               null comment '�ײ����ƣ����ȴ�ŵ���Ʒ����',
    product_code             bigint unsigned                            not null comment '��Ʒ���',
    product_name             varchar(255)                               not null comment '��Ʒ���ƣ����ȴ�ŵ���Ʒ����',
    is_present               tinyint unsigned default 0                 not null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    buy_num                  int unsigned     default 0                 not null comment '��������',
    shipped_num              int unsigned                               null comment '����������ȡ������������û����null��',
    plan_return_num          int unsigned     default 0                 not null comment '�ƻ��˻�����',
    actual_return_num        int unsigned     default 0                 not null comment 'ʵ���˻�����',
    returned_qualified_count int unsigned     default 0                 not null comment 'ʵ���˻��ϸ�����',
    unqualified_reason       tinyint unsigned                           null comment '��Ʒ���ϸ�ԭ���ֵ䣺ec_oms_unqualified_reason)@1��Ʒ���� 2��ƿ�մ� 3©Һ����֮һ 4©Һ����֮һ 5©Һ�ķ�֮һ 6��Ʒ��Ⱦ 7��Ʒ���� 8����ģ�� 9����',
    is_original              tinyint unsigned default 1                 not null comment '�Ƿ�ԭ����Ʒ���ֵ䣺ec_oms_is_original��@0-��ԭ����1-ԭ��',
    creator_id               int unsigned                               null comment '�����˱��',
    creator_name             varchar(32)                                null comment '����������',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id              int unsigned                               null comment '�����˱��',
    operator_name            varchar(32)                                null comment '����������',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                 tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ��˻�����Ʒ��ϸ��';

create index idx_luptime
    on ec_oms_exc_return_goods_sub (last_update_time);

create index idx_pkcode_pdcode
    on ec_oms_exc_return_goods_sub (package_code, product_code);

create index idx_return_goods_code
    on ec_oms_exc_return_goods_sub (return_goods_code);

create table ec_oms_exc_tmall_order_self_intercept
(
    self_intercept_id        int unsigned auto_increment comment '��������ID'
        primary key,
    tid                      bigint unsigned                            null comment '��è�������',
    shop_code                int unsigned                               null comment '���̱��',
    seller_nick              varchar(20)                                null comment '�������˺�',
    buyer_nick               varchar(32)                                null comment '����˺���',
    callType                 varchar(20)                                null comment 'ͬ�������첽����',
    order_code               decimal(30) unsigned                       null comment '�����������',
    callback_qianniu_result  tinyint unsigned default 0                 null comment '����ǧţ���(ecoms���ظ�ǧţ�Ľ��)�Ƿ������ɹ� 0 δ���� 1 �ɹ� 2 ʧ��',
    callback_qianniu_message varchar(50)      default ''                null comment '����ǧţ���Ϊʧ��ʱʱ��ԭ��',
    is_callback_success      tinyint unsigned                           null comment '�ص�ǧţ�ӿ� �Ƿ�ɹ�',
    qianniu_error_code       int unsigned                               null comment '�ص�ǧţ�ӿڷ��ش����� 4001������Ч 4002�ص���Ϣ������ 4003erp�ص���ʱ 4004���񲻿��� 4005��Ҫ�̼���Ȩ',
    qianniu_error_msg        varchar(50)                                null comment '�ص�ǧţ�ӿڷ��ش�����Ϣ',
    is_handle_self_intercept tinyint unsigned default 0                 null comment '����ǧţ���� 0 δ���� 1�Ѵ���',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '����ʱ�� Ԥ�˿�ʱ��',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    callback_time            timestamp                                  null comment '�ص�ǧţ�ӿ�ʱ��'
)
    comment '��èԤԼ������������';

create index idx_luptime
    on ec_oms_exc_tmall_order_self_intercept (last_update_time);

create table ec_oms_exc_tmall_order_self_intercept_detail
(
    self_intercept_id int unsigned    not null comment '��������ID,ԤԼ��������id',
    tid               bigint unsigned not null comment '������id',
    sub_order_id      bigint unsigned not null comment '�Ӷ���id'
)
    comment '��èԤԼ�������������';

create table ec_oms_exc_tmall_order_self_intercept_summary
(
    order_code              decimal(30) unsigned                       null comment '�������',
    tid                     bigint unsigned                            not null comment '��è�������'
        primary key,
    shop_code               int unsigned                               null comment '���̶������',
    callback_qianniu_result tinyint unsigned default 0                 null comment '����ǧţ���(ecoms���ظ�ǧţ�Ľ��)�Ƿ������ɹ� 0 δ���� 1 �ɹ� 2 ʧ��',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '����ʱ�� Ԥ�˿�ʱ��'
)
    comment '��èԤԼ��������������ܱ�';

create index idx_ctime
    on ec_oms_exc_tmall_order_self_intercept_summary (create_time);

create table ec_oms_exc_work_order
(
    work_order_code           bigint unsigned                               not null comment '�ۺ󹤵����(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    order_code                decimal(30) unsigned                          not null comment 'EC�������',
    exc_waybill_code          varchar(30)                                   not null comment '�쳣��ݵ���',
    work_order_type           tinyint unsigned    default 1                 not null comment '������Դ/���ͣ��ֵ䣺ec_oms_work_order_type��@0-������@1- BM������2-BM������3-ϵͳ�Խӡ�4-Ԥ�˿�Ǽǡ�5-��ݵǼǡ�6-������� ��7-�������� 8-�ͻ�����',
    work_order_status         tinyint unsigned    default 1                 not null comment '����״̬0-���ύ��1���ύ',
    issue_subject_code        int unsigned                                  null comment 'һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code',
    issue_type_code           int unsigned                                  null comment '���������ţ�������ec_oms_issue_type_base.issue_type_code��',
    issue_reason_code         int unsigned                                  null comment '����ԭ���ţ�����ec_oms_issue_reason_base.issue_reason_code��',
    default_responsible_party tinyint unsigned                              null comment '���η����ֵ䣺ec_oms_default_responsible_party��@1- ��������2-��ݹ�˾��3-�ͻ�',
    is_refund                 tinyint             default 0                 null comment '�Ƿ��˿�ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_return_goods           tinyint             default 0                 null comment '�Ƿ��˻����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_reissued               tinyint             default 0                 null comment '�Ƿ񲹷����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_pursue_responsibility  tinyint             default 0                 null comment '�Ƿ�׷���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    reply_progress            varchar(200)                                  null comment '�ظ�����(�ڲ���ͨ��¼)',
    import_type               tinyint unsigned                              null comment '��������(�ֵ�: ec_oms_work_order_import_type)@1-�����ҽ���¼��2-���벢����쳣',
    is_sync_work_system       tinyint(4) unsigned default 0                 null comment '�Ƿ�ͬ����ݣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    work_system_status        tinyint(4) unsigned default 0                 null comment '��ݹ���״̬(�ֵ䣺ec_oms_work_system_status:1-������2-�����С�3-�����ա�4-�ѹرա�5-��ȡ��)',
    express_reply_record      varchar(200)                                  null comment '����̹�ͨ��¼',
    operation_type            tinyint(4) unsigned default 0                 null comment '��ݹ�������(�ֵ䣺ec_oms_operation_type)',
    sync_error_msg            varchar(200)        default ''                null comment '��ݹ���ͬ��ʧ����Ϣ',
    creator_id                int unsigned                                  null comment '�����˱��',
    creator_name              varchar(32)                                   null comment '����������',
    create_time               timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id               int unsigned                                  null comment '�����˱��',
    operator_name             varchar(32)                                   null comment '����������',
    last_update_time          timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned    default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ۺ󹤵���Ϣ��';

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
    id                     int unsigned auto_increment comment '����ID'
        primary key,
    order_code             decimal(30) unsigned not null comment 'EC�������',
    order_last_update_time timestamp            null comment '�������¸���ʱ�䣨����ʱ�����ʱ�䣩',
    constraint udx_order_code
        unique (order_code)
)
    comment '������̨���Ͷ�����¼��';

create table ec_oms_generate_plat_order_exception
(
    id               bigint unsigned auto_increment comment '��������id'
        primary key,
    shop_order_id    varchar(64)                                null comment '���̶������',
    shop_refund_id   varchar(64)                                null comment '�����˿���',
    shop_code        int unsigned                               not null comment '������Դ���',
    plat_response    mediumtext                                 null comment '��������',
    response_type    tinyint unsigned                           null comment '�������� 1-����  2-�˿',
    handle_status    tinyint unsigned default 0                 null comment '����״̬ 0-δ����  1-�Ѵ���',
    create_time      timestamp        default CURRENT_TIMESTAMP not null comment '���Ĵ���ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    exception_reason varchar(500)                               null comment '�쳣ԭ��'
)
    comment '������ƽ̨�������ѳ���ԭʼ���ݱ�';

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
    job_id           int unsigned auto_increment comment 'job_id ����id'
        primary key,
    job_name         varchar(50)                                null comment '��������',
    job_description  varchar(250)                               null comment '����',
    job_class        varchar(100)                               null comment '������õ�JobHander����',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�ʱ��',
    del_flag         tinyint unsigned default 0                 null comment ' ɾ����־ 0-δɾ��  1-ɾ��'
)
    comment '����ץ���������õ�jobhandler����';

create table ec_oms_get_plat_job_log
(
    job_log_id    int unsigned auto_increment comment 'log_id����id'
        primary key,
    job_id        int unsigned                        not null comment '���õ�job���ñ�id',
    operator_id   int unsigned                        null comment '������id',
    operator_name varchar(32)                         null comment '����������',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '����ץ���������õ�jobhandler��ִ����Ա��¼';

create table ec_oms_get_plat_job_param
(
    job_param_id     int unsigned auto_increment comment 'job_param_id ����id'
        primary key,
    job_id           int unsigned                               not null comment 'job���ñ�id',
    param_value      varchar(200)                               null comment '����ֵ',
    sortno           mediumint unsigned                         null comment '������˳��',
    remark           varchar(100)                               null comment '��ע',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�ʱ��',
    del_flag         tinyint unsigned default 0                 null comment ' ɾ����־ 0-δɾ��  1-ɾ��'
)
    comment '����ץ���������õ�jobhandler����';

create table ec_oms_get_plat_job_param_log
(
    log_param_log_id int unsigned auto_increment comment 'log_param_id����id'
        primary key,
    job_log_id       int unsigned                        not null comment '���õ�job_log_id',
    job_param_id     int unsigned                        null comment '���õ�job_param_id',
    operator_id      int unsigned                        null comment '������id',
    operator_name    varchar(32)                         null comment '����������',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '����ץ���������õ�jobhandler��ִ����Ա��¼';

create table ec_oms_hot_consul_account
(
    account_code     int unsigned                               not null comment '�ͷ��˺�'
        primary key,
    account_name     varchar(32)                                not null comment '�ͷ��˺�����',
    account_type     tinyint unsigned                           not null comment '�˺����ͣ��ֵ�ec_oms_hot_account_type;1-��ǰ��2-�ۺ�',
    shop_code        int unsigned                               not null comment '���̱�ţ�����ec_oms_channel_shop_base',
    is_frozen        tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    remark           varchar(200)                               null comment '��ע',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_code    int unsigned                               null comment '�����˱���',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment '�ͷ��˺ű�';

create table ec_oms_hot_consul_account_group_leader
(
    id           int unsigned auto_increment comment '����ID'
        primary key,
    account_code int unsigned               not null comment '�ͷ��˺ţ�����ec_oms_hot_consul_account',
    leader_code  int unsigned               null comment '�鳤����',
    leader_name  varchar(32)                null comment '�鳤����',
    email        varchar(50)                null comment '�鳤����',
    del_flag     tinyint unsigned default 0 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment '�ͷ��˺��鳤��ϵ��';

create index idx_account_code
    on ec_oms_hot_consul_account_group_leader (account_code);

create table ec_oms_hot_consul_day_shop
(
    id          int unsigned auto_increment comment '����ID'
        primary key,
    every_day   date                                       null comment '����',
    shop_code   int unsigned                               not null comment '���̱�ţ�����ec_oms_channel_shop_base',
    account_sum int unsigned                               not null comment '�˺�����',
    create_time timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag    tinyint unsigned default 0                 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment 'ÿ����̿ͷ��˺�������Ϣ��';

create index idx_every_day_shop
    on ec_oms_hot_consul_day_shop (every_day, shop_code);

create table ec_oms_hot_consul_day_shop_acc
(
    id           int unsigned auto_increment comment '����ID'
        primary key,
    every_day    date                       null comment '����',
    shop_code    int unsigned               not null comment '���̱�ţ�����ec_oms_channel_shop_base',
    account_code int unsigned               not null comment '�ͷ��˺ţ�����ec_oms_hot_consul_account',
    account_name varchar(32)                not null comment '�ͷ��˺�����',
    del_flag     tinyint unsigned default 0 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment 'ÿ����̿ͷ��˺ű�';

create index idx_every_day_shop
    on ec_oms_hot_consul_day_shop_acc (every_day, shop_code);

create table ec_oms_hot_consul_day_shop_acc_leader
(
    id           int unsigned auto_increment comment '����ID'
        primary key,
    every_day    date                       null comment '����',
    shop_code    int unsigned               not null comment '���̱�ţ�����ec_oms_channel_shop_base',
    account_code int unsigned               not null comment '�ͷ��˺ţ�����ec_oms_hot_consul_account',
    leader_code  int unsigned               null comment '�鳤����',
    leader_name  varchar(32)                null comment '�鳤����',
    del_flag     tinyint unsigned default 0 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment 'ÿ����̿ͷ��鳤��';

create index idx_every_day_shop
    on ec_oms_hot_consul_day_shop_acc_leader (every_day, shop_code);

create table ec_oms_hot_consul_email_template
(
    template_code    int unsigned                               not null comment 'ģ����'
        primary key,
    template_type    tinyint unsigned default 0                 not null comment 'ģ�����ͣ��ֵ�ec_oms_hot_template_type��1-�ϴ��쳣֪ͨ�� 2-����쳣֪ͨ��3-�ϴ���������֪ͨ',
    template_name    varchar(50)                                not null comment '�ʼ�ģ������',
    notice_type      tinyint unsigned default 0                 not null comment '֪ͨά�����ͣ��ֵ�ec_oms_hot_notice_type��1-�ձ��� 2-�ܱ���3-�±�',
    week_day         tinyint unsigned default 0                 not null comment '���ڼ����ֵ�ec_oms_hot_week_day��1��7��Ӧ��һ������',
    send_time        timestamp                                  null comment '����ʱ��',
    remark           varchar(200)                               null comment '��ע',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_code    int unsigned                               null comment '�����˱���',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment '�ȵ�����ʼ�ģ�����ñ�';

create table ec_oms_hot_consul_email_template_send
(
    id             int unsigned auto_increment comment '����ID'
        primary key,
    template_code  int unsigned               not null comment 'ģ���ţ�����ec_oms_hot_consul_email_template',
    recipient_type tinyint unsigned default 0 not null comment '���������ͣ��ֵ�ec_oms_hot_recipient_type��0-�ռ��ˣ�1-������',
    email          varchar(50)                null comment '����',
    del_flag       tinyint unsigned default 0 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment '�ʼ�ģ���ռ���/�����˱�';

create index idx_template_code
    on ec_oms_hot_consul_email_template_send (template_code);

create table ec_oms_hot_consul_email_template_shop
(
    id            int unsigned auto_increment comment '����ID'
        primary key,
    template_code int unsigned               not null comment 'ģ���ţ�����ec_oms_hot_consul_email_template',
    shop_code     int unsigned               not null comment '���̱�ţ�����ec_oms_channel_shop_base',
    del_flag      tinyint unsigned default 0 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment '�ʼ�ģ����̹�ϵ��';

create index idx_template_code
    on ec_oms_hot_consul_email_template_shop (template_code);

create table ec_oms_hot_consul_qa_mark
(
    id           int unsigned auto_increment comment '����ID'
        primary key,
    shop_code    int unsigned                        not null comment '���̱�ţ�����ec_oms_channel_shop_base',
    account_code int unsigned                        not null comment '�ͷ��˺ţ�����ec_oms_hot_consul_account',
    create_code  int unsigned                        null comment '�����˱���',
    create_name  varchar(32)                         null comment '����������',
    create_time  timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�ʴ�������¼��';

create index idx_shop_code
    on ec_oms_hot_consul_qa_mark (shop_code);

create table ec_oms_hot_consul_qa_upload
(
    upload_code        bigint unsigned                            not null comment '�ϴ����'
        primary key,
    upload_type        tinyint unsigned default 0                 not null comment '�ϴ���ʽ���ֵ�ec_oms_hot_upload_type��1-Excel�ļ��� 2-TXT�ļ�',
    shop_code          int unsigned                               not null comment '���̱�ţ�����ec_oms_channel_shop_base',
    analytical_results tinyint unsigned default 2                 not null comment '����������ֵ�ec_oms_hot_analytical_results��0-ʧ�ܣ�1-�ɹ���2=������',
    error_reason       varchar(512)                               null comment 'ʧ��ԭ��',
    results_time       datetime                                   null comment '�����������ʱ��',
    file_type          varchar(10)                                null comment '�ļ�����(�ļ���׺)',
    md5_code           varchar(50)                                null comment '�ļ�md5ֵ',
    file_url           varchar(255)                               null comment '�ļ�url',
    create_code        int unsigned                               null comment '�����˱���',
    create_name        varchar(32)                                null comment '����������',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�ʴ�����ϴ���¼��';

create index idx_md5_code
    on ec_oms_hot_consul_qa_upload (md5_code);

create index idx_shop_code
    on ec_oms_hot_consul_qa_upload (shop_code);

create table ec_oms_hot_consul_qa_upload_detail
(
    id           int unsigned auto_increment comment '����ID'
        primary key,
    upload_code  bigint unsigned not null comment '�ϴ���ţ�����ec_oms_hot_consul_qa_upload',
    account_code int unsigned    not null comment '�ͷ��˺ţ�����ec_oms_hot_consul_account'
)
    comment '�ʴ�����ϴ��ͷ���ϸ��';

create index idx_account_code
    on ec_oms_hot_consul_qa_upload_detail (account_code);

create index idx_upload_code
    on ec_oms_hot_consul_qa_upload_detail (upload_code);

create table ec_oms_invoice
(
    id                              int unsigned auto_increment comment '����ID'
        primary key,
    order_code                      decimal(30) unsigned                       not null comment 'EC�������',
    shop_order_id                   varchar(64)                                not null comment '���̶������',
    shop_code                       int unsigned                               not null comment '������Դ���',
    invoice_type                    tinyint unsigned default 1                 not null comment '��Ʊ���ͣ��ֵ䣺ec_oms_invoice_type��@1-������Ʊ��2-ֽ����Ʊ��3ֽ��רƱ',
    invoice_status                  tinyint unsigned default 1                 not null comment '��Ʊ״̬���ֵ䣺ec_oms_invoice_status��@1-���ύ2-�����3-����Ʊ4-��Ʊ��5-��Ʊ�ɹ�6-��Ʊʧ��7-��ȡ��8-��˲�ͨ��9-�����10-���ɹ�11-���ʧ��12-������',
    buyer_type                      tinyint unsigned default 1                 not null comment '������ͣ��ֵ䣺ec_oms_buyer_type��@1-���ˣ�2-��ҵ',
    invoice_code                    bigint unsigned                            null comment '��Ʊ�����ţ���Ʊ����ʱ���£���Ʊ�ϲ�ʱ�����ͬ',
    invoice_title                   varchar(64)      default ''                not null comment '��Ʊ̧ͷ',
    taxpayer_number                 varchar(64)                                null comment '��˰��ʶ���',
    buyer_bank                      varchar(128)                               null comment '���򷽿�����',
    buyer_bank_account              varchar(128)                               null comment '���򷽿������ʺ�',
    buyer_bank_account_cipher       varchar(536)                               null comment '���򷽿������ʺ�',
    buyer_phone                     varchar(32)                                null comment '���򷽹̻�',
    buyer_phone_cipher              varchar(152)                               null comment '���򷽹̻�',
    buyer_address                   varchar(128)                               null comment '���򷽵�ַ',
    buyer_address_cipher            varchar(536)                               null comment '���򷽵�ַ',
    invoice_receiver                varchar(32)                                null comment '��Ʊ��',
    invoice_receiver_cipher         varchar(152)                               null comment '��Ʊ��',
    invoice_receiver_phone          varchar(20)                                null comment '��Ʊ���ֻ�',
    invoice_receiver_phone_cipher   varchar(88)                                null comment '��Ʊ���ֻ�',
    invoice_receiver_mail           varchar(128)                               null comment '��Ʊ������',
    invoice_receiver_province       varchar(32)                                null comment '��Ʊ��ʡ��',
    invoice_receiver_city           varchar(32)                                null comment '��Ʊ�˳���',
    invoice_receiver_district       varchar(32)                                null comment '��Ʊ����/��',
    invoice_receiver_address        varchar(255)                               null comment '��Ʊ��ַ',
    invoice_receiver_address_cipher varchar(1024)                              null comment '��Ʊ��ַ',
    invoice_remark                  varchar(200)                               null comment '��Ʊ��ע',
    customer_service_remark         varchar(200)                               null comment '�ͷ���Ʊ��ע',
    is_merge                        tinyint unsigned default 0                 not null comment '�Ƿ�ϲ����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    merge_code                      bigint unsigned                            null comment '�ϲ����',
    is_suspend                      tinyint unsigned default 0                 not null comment '�Ƿ���ͣ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_outport                      tinyint unsigned default 0                 not null comment '�Ƿ񵼳����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_blue                         tinyint unsigned default 1                 not null comment '�Ƿ���Ʊ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_receive                      tinyint unsigned default 0                 not null comment '������̨�Ƿ���գ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    verify_id                       int unsigned                               null comment '����˱��',
    verify_name                     varchar(32)                                null comment '���������',
    verify_time                     timestamp                                  null comment '���ʱ��',
    invoice_url                     varchar(255)                               null comment '��Ʊ��ַ',
    audit_failed_reason             varchar(255)                               null comment '��˲�ͨ��ԭ��',
    invoice_failed_reason           varchar(255)                               null comment '��Ʊʧ��ԭ��',
    submit_time                     timestamp                                  null comment '��Ʊ�ύʱ��',
    cancel_time                     timestamp                                  null comment '��Ʊȡ��ʱ��',
    flush_time                      timestamp                                  null comment '��Ʊ���ʱ��',
    success_time                    timestamp                                  null comment '��Ʊ�ɹ�ʱ��',
    is_edit                         tinyint unsigned default 0                 not null comment '�Ƿ��˹��޸ģ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    invoice_title_modify_times      tinyint unsigned default 0                 not null comment '��Ʊ̧ͷ�޸Ĵ�������������',
    send_sms_fail_resaon            varchar(200)                               null comment '���ŷ���ʧ��ԭ��',
    send_sms_time                   timestamp                                  null comment '���ŷ���ʱ��',
    send_sms_status                 tinyint unsigned default 99                not null comment '���ŷ���״̬���ֵ䣺ec_oms_send_sms_status��@1-�ɹ���0-ʧ�� ,99-δ����',
    creator_id                      int unsigned                               null comment '�����˱��/�����˱��',
    creator_name                    varchar(32)                                null comment '����������/�����˱��',
    create_time                     timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��/����ʱ��',
    operator_id                     int unsigned                               null comment '�����˱��',
    operator_name                   varchar(32)                                null comment '����������',
    last_update_time                timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    invoice_word                    varchar(32)                                null comment '��Ʊ����',
    invoice_number                  varchar(32)                                null comment '��Ʊ����',
    blue_invoice_word               varchar(32)                                null comment '��Ʊ��Ʊ����',
    blue_invoice_number             varchar(32)                                null comment '��Ʊ��Ʊ����',
    callback_status                 tinyint(3)       default 0                 not null comment '�ش�״̬��0-δ�ش���1-�ش��ɹ���2-�ش�ʧ��',
    no_tax_money                    decimal(13, 2)                             null comment 'δ˰���',
    tax_money                       decimal(13, 2)                             null comment '˰��',
    total_tax_money                 decimal(13, 2)                             null comment '��˰�ϼ�',
    tax_rate                        decimal(13, 2)                             null comment '˰��',
    print_status                    tinyint unsigned default 0                 not null comment '��״̬���ֵ�ec_oms_invoice_print_status 0-δ��ӡ 1-��ӡ�� 2-��ӡ�ɹ� 3-��ӡʧ�� 4-�ѷ�����',
    paper_invoice_remark            varchar(255)     default ''                null comment 'ֽƱ��ע',
    express_name                    varchar(32)      default ''                null comment '�������(����)',
    print_fail_reason               varchar(255)     default ''                null comment '��ӡʧ��ԭ��',
    paper_invoice_cancel_reason     varchar(255)     default ''                null comment 'ȡ��ֽƱԭ��',
    delivery_time                   timestamp                                  null comment 'ֽ�ʷ�Ʊ����ʱ��',
    apply_source                    tinyint unsigned                           null comment '������Դ���ֵ�ec_oms_invoice_apply_source 1-�ֶ�������2-ϵͳ�Խӡ�3-�������������룩',
    create_type                     tinyint unsigned default 1                 not null comment '��Ʊ���ݣ��ֵ�ec_oms_invoice_create_type 1-���� 2-��������',
    logistics_order_code            decimal(30) unsigned                       null comment '������������'
)
    comment '��Ʊ�����';

create index idx_ctime_scode_ocode
    on ec_oms_invoice (create_time, shop_code, order_code);

create index idx_icode_istat_suspend_recei
    on ec_oms_invoice (invoice_code, order_code, invoice_status, is_suspend, is_receive);

create index idx_itype_csta_ista_scode
    on ec_oms_invoice (invoice_type, callback_status, invoice_status, shop_code);

create index idx_merge_code
    on ec_oms_invoice (merge_code)
    comment '�ϲ��������';

create index idx_order_code
    on ec_oms_invoice (order_code);

create index idx_shop_order_id
    on ec_oms_invoice (shop_order_id);

create table ec_oms_invoice_apply_record
(
    id                   int unsigned auto_increment comment '����ID'
        primary key,
    invoice_code         bigint unsigned                            not null comment '��Ʊ������',
    order_code           decimal(30) unsigned                       null comment 'EC������ţ����ϲ�ʱ��ֵΪ��',
    merge_code           bigint unsigned                            null comment '�ϲ���ţ������ŷ�Ʊ�ϲ�ʱ����',
    apply_type           tinyint unsigned default 1                 not null comment '��������,@1-��Ʊ���룬2-���',
    creator_id           int unsigned                               null comment '�����˱��',
    creator_name         varchar(32)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ�䣨�ظ�ʱ�䣩',
    create_type          tinyint unsigned default 1                 not null comment '��Ʊ���ݣ��ֵ�ec_oms_invoice_create_type 1-���� 2-��������',
    logistics_order_code decimal(30) unsigned                       null comment '������������'
)
    comment '��Ʊ�����¼';

create index idx_invoice_code
    on ec_oms_invoice_apply_record (invoice_code);

create table ec_oms_invoice_express_apply_record
(
    id                   int unsigned auto_increment comment '����ID'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC�������',
    order_serial_no      varchar(64)                                not null comment '�ͻ�������',
    mailno               varchar(30)                                not null comment '�˵���',
    creator_id           int unsigned                               null comment '�����˱��/�����˱��',
    creator_name         varchar(32)                                null comment '����������/�����˱��',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��/����ʱ��',
    create_type          tinyint unsigned default 1                 not null comment '��Ʊ���ݣ��ֵ�ec_oms_invoice_create_type 1-���� 2-��������',
    logistics_order_code decimal(30) unsigned                       null comment '������������'
)
    comment '��Ʊ����浥�����¼';

create table ec_oms_invoice_wait_flush
(
    id                   int unsigned auto_increment comment '����ID'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC�������',
    handle_status        tinyint unsigned default 0                 not null comment '����״̬@0-������ 1-�Ѵ��� 2-��ȡ��',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_type          tinyint unsigned default 1                 not null comment '��Ʊ���ݣ��ֵ�ec_oms_invoice_create_type 1-���� 2-��������',
    logistics_order_code decimal(30) unsigned                       null comment '������������'
)
    comment '��Ʊ�ȴ�����¼��';

create index idx_order_code
    on ec_oms_invoice_wait_flush (order_code);

create table ec_oms_invoice_waybill
(
    order_code           decimal(30)                not null comment 'EC��������',
    waybill_code         varchar(30)                not null comment '��ݵ���',
    is_subscribe         tinyint unsigned default 0 not null comment '�Ƿ��ģ�1-�ǣ�0-��',
    create_type          tinyint unsigned default 1 not null comment '��Ʊ���ݣ��ֵ�ec_oms_invoice_create_type 1-���� 2-��������',
    logistics_order_code decimal(30) unsigned       null comment '������������',
    primary key (order_code, waybill_code)
)
    comment '��Ʊ��ݵ��Ź�����Ϣ';

create table ec_oms_issue_reason_base
(
    issue_reason_code         int unsigned                               not null comment '����ԭ���ţ�eg��30001��'
        primary key,
    issue_reason              varchar(50)                                not null comment '����ԭ��',
    default_responsible_party tinyint unsigned default 0                 null comment '���η����ֵ䣺ec_oms_default_responsible_party��',
    is_frozen                 tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    creator_id                int unsigned                               null comment '�����˱��',
    creator_name              varchar(32)                                null comment '����������',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id               int unsigned                               null comment '�����˱��',
    operator_name             varchar(32)                                null comment '����������',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '����ԭ�������ݱ�';

create table ec_oms_issue_subject_base
(
    issue_subject_code        int unsigned                               not null comment 'һ�������ţ�eg��10001��'
        primary key,
    issue_subject             varchar(40)                                not null comment 'һ������',
    sort                      smallint(4) unsigned                       not null comment '�������',
    default_responsible_party tinyint unsigned default 0                 null comment '��������Ĭ�����η����ֵ䣺ec_oms_default_responsible_party��',
    remark                    varchar(200)                               null comment '��ע',
    is_frozen                 tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    creator_id                int unsigned                               null comment '�����˱��',
    creator_name              varchar(32)                                null comment '����������',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id               int unsigned                               null comment '�����˱��',
    operator_name             varchar(32)                                null comment '����������',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment 'һ�����������ݱ�';

create table ec_oms_issue_type_base
(
    issue_type_code    int unsigned                               not null comment '������ţ�eg��10001��'
        primary key,
    issue_type         varchar(40)                                not null comment '��������',
    issue_subject_code int unsigned                               not null comment '����һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code��',
    sort               smallint(4) unsigned                       not null comment '�������',
    remark             varchar(200)                               null comment '��ע',
    app_scope          tinyint unsigned default 1                 not null comment '����Ӧ�÷��ࣨ�ֵ䣺ec_oms_issue_app_scope��@1-���ڲ�ʹ�ã�2-���������ѡ��3-����ͬ������̣�4-����������ط�ʹ��',
    is_common          tinyint unsigned default 0                 not null comment '�Ƿ��ã��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    common_sort        smallint(4) unsigned                       null comment '��������',
    is_frozen          tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    creator_id         int unsigned                               null comment '�����˱��',
    creator_name       varchar(32)                                null comment '����������',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id        int unsigned                               null comment '�����˱��',
    operator_name      varchar(32)                                null comment '����������',
    last_update_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '�������������ݱ�';

create index idx_issue_subject_code
    on ec_oms_issue_type_base (issue_subject_code);

create table ec_oms_issue_type_reason_relation
(
    id                int unsigned auto_increment comment '����ID'
        primary key,
    issue_type_code   int unsigned                   not null comment '������ţ�����ec_oms_issue_type_base',
    issue_reason_code int unsigned                   not null comment '����ԭ���ţ�����ec_oms_issue_reason_base',
    is_default        tinyint unsigned     default 0 not null comment '�Ƿ�Ĭ����ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    sort              smallint(4) unsigned default 0 not null comment '����',
    del_flag          tinyint unsigned     default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��������������ԭ���Զ��ϵ��';

create index idx_issue_reason_code
    on ec_oms_issue_type_reason_relation (issue_reason_code);

create index idx_issue_type_code
    on ec_oms_issue_type_reason_relation (issue_type_code);

create table ec_oms_jd_im_pop_chatlog
(
    id          int unsigned auto_increment comment '��������'
        primary key,
    shop_code   int unsigned                        null comment '���̱��',
    channel     smallint unsigned                   null comment '��Ϣͨ����������Ϣ�ǹ˿ͻ��ǿͷ����͡� 11:�ͻ����͵���ͨ��Ϣ 12:�ͻ����յ���ת����Ϣ 13:�ͻ����͵�������Ϣ 14:app-sdk�ͻ���ͨ��Ϣ - ������ѯ 15:app-sdk�ͻ���ͨ��Ϣ - ������ѯ 16:app-sdk�ͻ���ͨ��Ϣ - ������Ϣ 21:�ͷ����͵���ͨ��Ϣ 22:�ͷ����͵��Զ��ظ� 23:�ͷ���ݻظ�  24:��������ת�ӿͷ�����Ϣ 25:������ת�ӿͷ�����Ϣ 26:�ͷ����͵�������Ϣ 27: �ͷ��Ļ�ӭ�� 28:�ͷ����͵�������Ϣ 29:�ͷ�֮��Ի� 31:�ͷ�������Ϣ',
    customer    varchar(32)                         null comment '��ѯ�Ĺ˿�',
    waiter      varchar(32)                         null comment '�ͷ��˺�',
    content     varchar(255)                        null comment '��������',
    sid         varchar(64)                         null comment '�ỰID��',
    sku_id      bigint(10) unsigned                 null comment '��Ʒid',
    time_parse  timestamp                           null comment '����ʱ��ת����',
    time        bigint                              null comment '��Ϣ����ʱ�� long',
    waiter_send tinyint unsigned                    null comment '�Ƿ��ǿͷ����� 1 ��/2 ����',
    create_time timestamp default CURRENT_TIMESTAMP null comment 'ec����ʱ��'
)
    comment '�����ͷ������¼��';

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
    id                   int(11) unsigned auto_increment comment '���'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC�������',
    parent_order_id      decimal(30) unsigned                       not null comment '�����������',
    child_order_id       decimal(30) unsigned                       not null comment '�ӵ��������',
    logistics_order_code decimal(30) unsigned                       not null comment '�ӵ���Ӧ������������',
    num                  varchar(64)                                null comment '�ӵ���Ʒ����',
    outter_id            varchar(255)                               null comment '�ӵ���Ʒoutter_id���',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�����𵥼�¼��';

create table ec_oms_jd_product_info
(
    id                     int(10) auto_increment comment '��������'
        primary key,
    ware_id                bigint(14)    not null comment '��Ʒid',
    shop_code              int(8)        null comment '���̱���',
    shop_name              varchar(50)   null comment '��������',
    sku_id                 bigint(15)    null comment 'skuId',
    status                 tinyint(3)    null comment '1:�ϼ� 2:�¼� 4:ɾ��',
    sale_attrs             mediumtext    null comment '�������Լ���',
    features               mediumtext    null comment '�������Լ���',
    outer_Id               varchar(20)   null comment '�ⲿID',
    bar_code               varchar(20)   null comment '������',
    brand_name             varchar(255)  null comment 'Ʒ������',
    img_tag                int(8)        null comment 'ͼƬ��ǩ',
    market_price           decimal(8, 2) null comment '�г���',
    cost_price             decimal(8, 2) null comment '�ɱ���',
    jd_price               decimal(8, 2) null comment '������',
    stock_num              int(8)        null comment '�ܿ����',
    category_id            int(8)        null comment '��ĿID',
    category_sec_id        int(8)        null comment '����Ҷ����Ŀ',
    multi_category_id      int(8)        null comment 'ĩ����ĿID',
    shop_id                int(10)       null comment '�̼Ҷ�Ӧ��shopID',
    promise_id             int(10)       null comment 'ʱЧģ��ID',
    logo                   varchar(255)  null comment '��Ʒ��ͼ',
    sku_name               varchar(255)  null comment 'sku����',
    ware_title             varchar(255)  null comment '��Ʒ����',
    fixed_delivery_time    timestamp     null comment '�����Ʒ�̶�����ʱЧ ������ʼ����,������������,��������,��ɷ�������',
    relative_delivery_time timestamp     null comment '�����Ʒ��Է���ʱЧ ��ɷ�������',
    parent_id              bigint(15)    null comment '��Ʒ��ID ��������Ʒ����ͨ��Ʒû��',
    modified               timestamp     null comment '��Ʒ���һ���޸�ʱ��',
    created                timestamp     null comment '��Ʒ����ʱ��',
    multi_cate_props       mediumtext    null comment 'ĩ����Ŀ�����б�',
    capacity               varchar(20)   null comment '���� ��������Ҫ�����Ŀ�±�����֧��6λС����',
    title                  varchar(255)  null comment '��Ʒ����',
    brand_id               int(8)        null comment 'Ʒ��ID',
    transport_id           int(8)        null comment '�˷�ģ��ID',
    ware_status            int(5)        null comment '��Ʒ״̬ 1:ɾ�� 1:��δ�ϼ� 2:�����¼� 4:ϵͳ�¼� 8:�ϼ� 513:��δ�ϼܴ��� 514:�����¼ܴ��� 516:ϵͳ�¼ܴ��� 520:�ϼܴ���� 1028:ϵͳ�¼����ʧ��',
    item_num               int(8)        null comment '��Ʒ����',
    ware_location          varchar(255)  null comment '��Ʒ����',
    offline_time           timestamp     null comment '����¼�ʱ��',
    online_time            timestamp     null comment '����ϼ�ʱ��',
    col_type               tinyint(3)    null comment '����ģʽ',
    delivery               varchar(255)  null comment '������',
    ad_words               mediumtext    null comment '��Ʒ����',
    images                 mediumtext    null comment '��ƷͼƬ',
    shop_categorys         mediumtext    null comment '��Ʒ���ڷ��� �̼ҽӿڻ�ȡ������ĩ���ķ���',
    sell_point             varchar(255)  null comment '����',
    ware_tax               mediumtext    null comment '˰��',
    after_sale_desc        varchar(255)  null comment '�ۺ�ͼ������',
    zhuang_ba_mobile_desc  text          null comment '�ƶ���װ������',
    mobile_zhuang_ba_id    varchar(50)   null comment '�ƶ���װ��ʵ��ID',
    mobile_desc            text          null comment '�ƶ�������',
    introduction           text          null comment 'PC������',
    zhuang_ba_introduction text          null comment '��Ʒ����װ��ʵ��ID',
    introduction_use_flag  tinyint(3)    null comment '��Ʒ����ʹ�ñ�ʶ 0��ʹ��Ĭ�ϵ���Ʒ����,1��ʹ��װ������',
    after_sales            varchar(255)  null comment '�ۺ����',
    zhuang_ba_id           varchar(50)   null comment '��Ʒ����װ��ʵ��ID',
    mobile_desc_use_flag   tinyint(3)    null comment '�ƶ�����Ʒ����ʹ�ñ�ʶ 0��ʹ��Ĭ�ϵ��ƶ����ꣻ1��ʹ��װ���ƶ�������',
    fit_case_html_pc       text          null comment 'װ�ް���PC������',
    fit_case_html_app      text          null comment 'װ�ް����ƶ�������',
    special_services       mediumtext    null comment '��ɫ���� װ����Ŀ�ſ���д,װ�������,���Ϊ5,ÿ��ֵ�Ϊ8���ַ�',
    ware_group_id          int(8)        null comment '��Ʒ�ŵ���ID ��������Ʒ����ͨ��Ʒû��',
    business_type          varchar(20)   null comment '��Ʒҵ������ ��������Ʒ����ͨ��Ʒû��',
    design_concept         varchar(255)  null comment '��Ʒ������� ���÷�Χ��toplife��Ŀ',
    is_archival            tinyint(255)  null comment '�Ƿ�鵵��Ʒ �鵵��Ʒ���ܽ����޸� 0�� 1��',
    template_ids           varchar(255)  null comment '������ʽid',
    create_time            timestamp     null comment '���ݿⴴ��ʱ��',
    last_update_time       timestamp     null on update CURRENT_TIMESTAMP comment '���ݿ����ʱ��'
)
    comment '������Ʒ��Ϣ';

create index idx_ware_id_shop_code
    on ec_oms_jd_product_info (ware_id, shop_code);

create table ec_oms_job_task_info
(
    job_id                   int unsigned                               not null comment '������'
        primary key,
    job_desc                 varchar(50)                                not null comment '��������',
    job_handler              varchar(50)                                not null comment '����ִ����',
    job_param                varchar(255)                               null comment '�������',
    job_param_start_time_pos tinyint(3)                                 null comment '��ʼʱ�����λ�ã���0��ʼ��',
    job_param_end_time_pos   tinyint(3)                                 null comment '����ʱ�����λ�ã���0��ʼ��',
    ec_shop_code             int unsigned                               null comment '�����Ӧ���̱�ţ���������У�5λ���֣�10000��',
    ec_task_type             tinyint unsigned                           null comment '�������ͣ�ץȡ������0��ץȡ�ۺ�1',
    create_time              timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�ʱ��',
    del_flag                 tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ץ����ʱ������Ϣ��' charset = utf8;

create table ec_oms_master_data_import
(
    id                    int(10) auto_increment comment '����id'
        primary key,
    import_code           int(10)       null comment '��ʶ�ϴ������κ�',
    product_code          bigint        null comment '��Ʒ���',
    is_frozen             tinyint(3)    null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    import_operation_hint varchar(1024) null comment '����ʧ��ԭ��',
    import_time           timestamp     null comment '����ʱ��'
);

create table ec_oms_monitor_record
(
    id               bigint unsigned auto_increment comment 'id'
        primary key,
    business_type    tinyint unsigned default 0                 not null comment 'ҵ������@1-�����ظ�2-�����쳣3-�ش��쳣',
    order_code       decimal(30) unsigned                       null comment 'EC�������',
    param1           varchar(64)                                null comment '�����ֶ�1',
    param2           varchar(64)                                null comment '�����ֶ�2',
    handle_status    tinyint unsigned default 0                 not null comment '�Ƿ���  0 - δ����  1 - ����',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment 'OMS��ʱ��ؼ�¼��';

create index idx_order_code
    on ec_oms_monitor_record (order_code);

create index idx_param1
    on ec_oms_monitor_record (param1);

create table ec_oms_monitor_task
(
    id               int auto_increment comment 'id'
        primary key,
    task_name        varchar(50)                                not null comment '������',
    task_description varchar(255)                               null comment '��������',
    send_type        varchar(4)                                 not null comment '���ѷ�ʽ 0-����  1-��΢ (�ֵ䣺ec_oms_monitor_task_send_type��)',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code     int(10)                                    null comment '�޸���/�����˱���',
    changed_name     varchar(32)                                null comment '�޸���/����������',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '�����';

create table ec_oms_monitor_task_receive
(
    id            int auto_increment comment 'id'
        primary key,
    task_id       int                        not null comment '��������id',
    receive_code  int                        not null comment '�ռ��˱��',
    receive_name  varchar(50)                not null comment '����',
    receive_email varchar(128)               null comment '����',
    receive_dept  varchar(128)               null comment '��������',
    receive_type  tinyint(2)                 not null comment '�ռ������� 0-�ռ� 1-���� ���ֵ䣺ec_oms_monitor_task_receive_type��',
    del_flag      tinyint unsigned default 0 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '��Ϣ���ձ�';

create table ec_oms_notice
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    notice_title     varchar(100)                               not null comment '�������',
    notice_type      tinyint unsigned default 1                 not null comment '�������� ���ֵ䣺ec_oms_notice_type��1-��Ʒ����',
    propaganda_type  tinyint unsigned default 0                 not null comment '�������� ���ֵ䣺ec_oms_propaganda_type��1-��Ʒ������2-��Ʒ�淶��3-�۸���ԣ�4-��淶��5-����',
    publish_time     timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    notice_content   text                                       not null comment '��������',
    is_top           tinyint unsigned default 0                 not null comment '�Ƿ��ö�@1-�� 0-��',
    is_recall        tinyint unsigned default 0                 not null comment '�Ƿ񳷻أ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    is_push          tinyint unsigned default 0                 not null comment '�Ƿ����ͣ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    push_type        varchar(100)                               null comment '���ͷ�ʽ��1-��ҵ΢�ţ�2-�ʼ����������ƴ��',
    creator_id       int                                        null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int                                        null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ�����@1-�� 0-��'
)
    comment 'ec�����';

create table ec_oms_notice_object
(
    id                 int unsigned auto_increment comment '����ID'
        primary key,
    notice_id          int(11) unsigned           not null comment '����id������ec_oms_notice',
    notice_object_type tinyint unsigned default 1 not null comment '֪ͨ�������� ���ֵ䣺ec_oms_notice_object_type��1-����',
    object_code        varchar(32)                not null comment '������',
    del_flag           tinyint unsigned default 0 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '������֪ͨ�����ϵ��';

create index idx_notice_id
    on ec_oms_notice_object (notice_id);

create table ec_oms_notice_push_time
(
    id        int unsigned auto_increment comment '����ID'
        primary key,
    notice_id int(11) unsigned           not null comment '����id������ec_oms_notice',
    push_time timestamp                  null comment '����ʱ��',
    is_push   tinyint unsigned default 0 not null comment '�Ƿ�������@1-�� 0-��',
    fail_num  int(10)          default 0 null comment '����ʧ�ܴ���',
    del_flag  tinyint unsigned default 0 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '����������ʱ���ϵ��';

create index idx_notice_id
    on ec_oms_notice_push_time (notice_id);

create table ec_oms_notice_push_user
(
    id        int unsigned auto_increment comment '����ID'
        primary key,
    notice_id int(11) unsigned           not null comment '����id������ec_oms_notice',
    user_code varchar(50)                null comment '������Ψһ��ʶ',
    user_name varchar(20)                null comment '����������',
    email     varchar(50)                null comment '����',
    org_name  varchar(255)               null comment '��������',
    is_push   tinyint(3)       default 0 null comment '�Ƿ������� 1-�� 0-��',
    fail_num  int(10)          default 0 null comment '����ʧ�ܴ���',
    del_flag  tinyint unsigned default 0 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '������֪ͨ�����ϵ��';

create index idx_notice_id
    on ec_oms_notice_push_user (notice_id);

create table ec_oms_notice_user
(
    id            int unsigned auto_increment comment '����ID'
        primary key,
    notice_id     int                  not null comment '����id������ec_oms_notice',
    user_code     int                  not null comment '�û����',
    is_read       tinyint(3) default 0 not null comment '�Ƿ��Ѷ�@1-�� 0-��',
    is_collection tinyint(3) default 0 not null comment '�Ƿ��ղ�@1-�� 0-��',
    constraint idx_notice_id_user_code
        unique (notice_id, user_code)
)
    comment '�������û���ϵ��';

create table ec_oms_old_order_relation
(
    order_code       decimal(30)              not null comment '�������'
        primary key,
    old_order_id     varchar(64) charset utf8 not null comment '��OMS�ⲿ����id',
    old_order_source varchar(32) charset utf8 not null comment '��OMS�ⲿ������Դ'
)
    comment '�¾ɶ���������';

create table ec_oms_order
(
    order_code                  decimal(30) unsigned                       not null comment 'EC�������'
        primary key,
    shop_order_id               varchar(64)                                not null comment '���̶�����ţ���Ϊ�ϵ�����ΪEC�������(order_code)',
    shop_code                   int unsigned                               not null comment '������Դ���',
    relate_order_code           decimal(30) unsigned                       not null comment '��Ϲ������� Ĭ��Ϊorder_code,�𵥺�Ϊԭ����order_code���ϵ���Ϊ�ϵ���order_code',
    plat_order_status           varchar(64)                                null comment '��ƽ̨״̬���ֵ䣺ec_oms_plat_order_status��',
    breed_num                   tinyint unsigned default 0                 null comment 'Ʒ����',
    pro_total_num               int unsigned     default 0                 null comment '������',
    gross_weight                decimal(10, 3)   default 0.000             null comment 'ë��(kg)',
    buyer_nick                  varchar(64)                                null comment '����ǳ�/ID',
    has_buyer_message           tinyint unsigned default 0                 null comment '�Ƿ���������ԣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    buyer_message               varchar(1024)    default ''                null comment '�����������',
    seller_message              varchar(1024)    default ''                null comment '���ұ�ע',
    invoice_type                tinyint unsigned default 0                 null comment '����������Ʊ������ͣ��ֵ䣺ec_oms_buyer_type��@1-���ˣ�2-��ҵ',
    invoice_title               varchar(1)       default ''                null comment '����������Ʊ̧ͷ',
    country                     varchar(32)                                null comment '�ջ��˹���',
    province                    varchar(32)                                null comment '�ջ���ʡ��',
    city                        varchar(32)                                null comment '�ջ��˳���',
    district                    varchar(32)                                null comment '�ջ�������',
    town                        varchar(32)                                null comment '�ջ��˳���',
    village                     varchar(32)                                null comment '����/��',
    address                     varchar(255)                               null comment '�ջ�����ϸ��ַ',
    address_cipher              varchar(1048)                              null comment '��ַ',
    post_code                   varchar(15)                                null comment '��������',
    receiver_name               varchar(32)      default ''                not null comment '�ջ�������',
    receiver_name_cipher        varchar(256)                               null comment '�ջ�������',
    receiver_mobile             varchar(20)                                null comment '�ջ����ֻ�',
    receiver_mobile_cipher      varchar(256)                               null comment '�ջ�������',
    receiver_phone              varchar(32)                                null comment '�ջ��˹̶��绰',
    receiver_phone_cipher       varchar(152)                               null comment '�ջ��˹̶��绰',
    send_channel                tinyint unsigned                           null comment '������������',
    storehouse_code             int(10)                                    null comment '�ֿ����',
    storehouse_name             varchar(32)                                null comment '�ֿ�����',
    express_code                int                                        null comment '��ݹ�˾����',
    express_name                varchar(32)                                null comment '��ݹ�˾����',
    waybill_code                varchar(1024)                              null comment '��ݵ��ţ�������ŷָ�',
    order_all_price             decimal(14, 4)   default 0.0000            not null comment '�����ܽ��',
    order_shop_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment '���̳е���Ʒ���Żݽ��',
    order_plat_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е���Ʒ���Żݽ��',
    order_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '���̳е������Ż�',
    order_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е������Ż�',
    shop_all_discount_amt       decimal(12, 2)   default 0.00              not null comment '�������Ż�',
    plat_all_discount_amt       decimal(12, 2)   default 0.00              not null comment 'ƽ̨���Ż�',
    order_pro_pay_amt           decimal(14, 4)   default 0.0000            not null comment '��Ʒʵ���ܽ��',
    order_pay_amt               decimal(14, 4)   default 0.0000            not null comment '����ʵ�����',
    order_received_amt          decimal(14, 4)   default 0.0000            not null comment '����ʵ�ս��',
    order_all_shipment          decimal(14, 4)   default 0.0000            not null comment '�������ʷ�',
    price_control_discrepancy   decimal(14, 4)   default 0.0000            not null comment '�۸�ܿز���',
    split_order                 decimal(30) unsigned                       null comment '�õ�Ϊ�ӵ�ʱ����ԭ����order_code���õ�Ϊԭ��ʱ����ϵ���order_code',
    merge_order                 varchar(1299)                              null comment '�õ�Ϊ�ϵ�ʱ����ԭ����order_code(������ŷָ�)���õ�Ϊԭ��ʱ�����ӵ���order_code(������ŷָ�)',
    client_code                 varchar(32)                                null comment 'ƽ̨�ͻ�����',
    pro_codes                   varchar(1024)                              null comment '��Ʒ��ţ���,"�ָ',
    shop_pro_name               varchar(2048)                              null comment '����Ʒ����"||"�ָ���',
    remark                      varchar(500)                               null comment '������ע',
    import_cause                tinyint unsigned                           null comment '����ԭ���ֵ䣺ec_oms_import_cause��',
    import_nopass_cause         varchar(500)                               null comment '����ͨ��ԭ��',
    import_examine_code         int unsigned                               null comment '����˱��',
    import_examine_name         varchar(32)                                null comment '���������',
    import_operation_hint       varchar(64)                                null comment '���붩��ʧ��ԭ��ҳ����ʾ������ʾ������ö��Ÿ���',
    dispatch_fail_reason        varchar(256)                               null comment '����ʧ��ԭ��',
    dispatch_type               tinyint unsigned                           null comment '�������ͣ��ֵ䣺ec_oms_dispatch_type��',
    hang_emp_code               int                                        null comment '�����˱��',
    hang_emp_name               varchar(32)                                null comment '����������',
    create_time                 timestamp        default CURRENT_TIMESTAMP null comment '��¼����ʱ��',
    last_update_time            timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                    tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    creator_id                  int unsigned                               null comment '�����˱��',
    creator_name                varchar(32)                                null comment '����������',
    reissue_relate_order_code   decimal(30) unsigned                       null comment '������������,Ϊԭ��/�ϵ���EC������ţ���������Ϊ������ʱ����',
    sale_channel                varchar(30)                                null comment '�ն˿ͻ�/����ƽ̨(��¼����������������)',
    return_reason               varchar(64)                                null comment '�˻�ԭ��',
    apply_file_code             varchar(255)                               null comment '�����ļ�����'
)
    comment 'ͳһ������';

create index idx2_order_shop_order_id
    on ec_oms_order (shop_order_id, shop_code)
    comment '���̶�����š������������';

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
    order_code             decimal(30) unsigned                          not null comment 'EC�������'
        primary key,
    distri_channel_code    varchar(10)                                   null comment '����������ţ�����oms_b2b_client_distri_channel.distri_channel_code',
    client_storehouse_code varchar(10)                                   null comment '�ͻ��ֿ���',
    operation_audit_status tinyint(4) unsigned default 0                 not null comment '��Ӫ���״̬ 1-����ˣ�2-���ͨ����3-��˲�ͨ��',
    operation_auditor_id   int unsigned                                  null comment '��Ӫ�����Ա�����',
    operation_auditor      varchar(32)                                   null comment '��Ӫ�����',
    merchant_received_amt  decimal(14, 2)      default 0.00              null comment '�̼�ʵ�ս��',
    recommend_code         bigint(11) unsigned                           null comment '�Ƽ���',
    recommend_user_code    int(9) unsigned                               null comment '�Ƽ��˱��',
    recommend_name         varchar(5)                                    null comment '�Ƽ�������',
    last_update_time       timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment 'ͳһ������2b��չ��Ϣ��';

create table ec_oms_order_aikucun_product_detail
(
    activityId varchar(50)  not null comment '�ID',
    adorderId  varchar(50)  not null comment '�ⲿƽ̨������',
    kuanhao    varchar(50)  not null comment '�ڲ�ƽ̨��ƷID',
    num        int(10)      not null comment '������Ʒ��',
    skuid      varchar(30)  null comment '�ⲿƽ̨��ƷID',
    name       varchar(255) null comment '��Ʒ����',
    brandname  varchar(100) not null comment 'Ʒ��',
    barcode    varchar(50)  not null comment '����'
);

create index idx_adorderId_skuid
    on ec_oms_order_aikucun_product_detail (adorderId, skuid)
    comment '������ ��Ʒ�����������';

create index idx_oid_kuanhao
    on ec_oms_order_aikucun_product_detail (adorderId, kuanhao);

create table ec_oms_order_bm_expand
(
    order_code            decimal(30) unsigned not null comment 'EC�������'
        primary key,
    recommend_code        varchar(32)          null comment '�Ƽ��루Ŀǰֻ�����Խ��̳ǡ��ֻ����룩',
    bm_shop_code          varchar(32)          null comment '������̱���',
    delivery_type         tinyint unsigned     null comment '���ͷ�ʽ(1.�ͻ����� 2.����)',
    customer_code         varchar(32)          null comment '�����̳ǵ������߱���',
    send_goods_time_type  tinyint unsigned     null comment '����ʱ������(1.��ʱ���� 2.��ʱ����)',
    delay_send_goods_time timestamp            null comment '��ʱ����ʱ��',
    receive_code          varchar(16)          null comment 'ǩ����'
)
    comment '��ʹ�ɵ��������̳Ƕ�����չ��';

create table ec_oms_order_convert_relation
(
    id               int unsigned auto_increment comment '����Id'
        primary key,
    order_code       decimal(30) unsigned                not null comment 'EC�������',
    plan_code        bigint unsigned                     not null comment '���Ա��',
    operator_id      int unsigned                        null comment '�����˱��',
    operator_name    varchar(32)                         null comment '����������',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '����תƷӦ�ù�ϵ��';

create index idx_order_code
    on ec_oms_order_convert_relation (order_code);

create table ec_oms_order_convert_relation_tmp
(
    id               int unsigned auto_increment comment '����Id'
        primary key,
    order_code       decimal(30) unsigned                not null comment 'EC�������',
    plan_code        bigint unsigned                     not null comment '���Ա��',
    operator_id      int unsigned                        null comment '�����˱��',
    operator_name    varchar(32)                         null comment '����������',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '����תƷӦ�ù�ϵ��';

create index idx_order_code
    on ec_oms_order_convert_relation_tmp (order_code);

create table ec_oms_order_delivery_guomei
(
    order_no varchar(64) not null comment '�������̶������'
        primary key,
    order_id varchar(20) not null comment '�������͵��ţ�����̶������һ��һ'
)
    comment '�������̵��ź����͵��ŵĹ�ϵӳ���';

create table ec_oms_order_delivery_register_info
(
    id                    int unsigned auto_increment comment '����id'
        primary key,
    order_code            decimal(30)                                null comment 'EC�������',
    shop_order_id         varchar(64)                                not null comment '���̶������',
    shop_code             int unsigned                               not null comment '������Դ���',
    request_delivery_date timestamp                                  null comment 'Ҫ���ʹ�����',
    start_delivery_date   timestamp                                  null comment '��ʼ�ͻ�ʱ��',
    end_delivery_date     timestamp                                  null comment '�����ͻ�ʱ��',
    is_appointment        tinyint unsigned default 0                 not null comment '�Ƿ�ԤԼ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    appointment_day       smallint unsigned                          null comment 'ԤԼ��ǰ����',
    is_upstairs           tinyint unsigned default 0                 not null comment '�Ƿ���¥���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    floor_num             varchar(10)                                null comment '¥��',
    is_lift               tinyint unsigned default 0                 not null comment '�Ƿ��е��ݣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_limit_car          tinyint unsigned default 0                 not null comment '�Ƿ����Ƴ������ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    car_limit_remark      varchar(200)                               null comment '��������˵��',
    is_limit_row          tinyint unsigned default 0                 not null comment '�Ƿ����У��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    limit_row_remark      varchar(200)                               null comment '����˵��',
    is_unloading          tinyint unsigned default 0                 not null comment '�Ƿ�ж�����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_move               tinyint unsigned default 0                 not null comment '�Ƿ�ƽ�ư��ˣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    move_range            varchar(100)                               null comment '���˾��룬��λm',
    weekend_take          tinyint unsigned default 0                 not null comment '�Ƿ���ĩ�ջ����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    sign_type             varchar(200)                               null comment 'ǩ�շ�ʽ',
    bill_image1           varchar(512)                               null comment '����ͼƬ1',
    bill_image2           varchar(512)                               null comment '����ͼƬ2',
    bill_file             varchar(512)                               null comment '���е��ݸ���',
    bill_file_name        varchar(256)                               null comment '���е��ݸ����ļ�����',
    remark                varchar(200)                               null comment '��ע',
    register_id           int                                        null comment '�Ǽ���id',
    register_name         varchar(32)                                null comment '�Ǽ�������',
    register_status       tinyint          default 0                 not null comment '�Ǽ�״̬(0:δ�Ǽǣ�1���ѵǼǣ�2�����ύ)',
    register_time         timestamp        default CURRENT_TIMESTAMP null comment '�Ǽ�ʱ��',
    export_status         tinyint unsigned default 0                 not null comment '����״̬(1���ѵ���,0:δ����)',
    export_time           timestamp                                  null comment '����ʱ��',
    export_user_code      int                                        null comment '�����˱��',
    export_user_name      varchar(32)                                null comment '����������',
    client_code           varchar(15)                                null comment '�ͻ����',
    creator_id            int                                        null comment '�����˱��',
    creator_name          varchar(32)                                null comment '����������',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id           int                                        null comment '�����˱��',
    operator_name         varchar(32)                                null comment '����������',
    last_update_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag              tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '������Ϣ�ǼǱ�';

create index idx_order_code
    on ec_oms_order_delivery_register_info (order_code);

create table ec_oms_order_delivery_register_info_sub
(
    id                   int unsigned auto_increment comment '����id'
        primary key,
    order_code           decimal(30)                   null comment 'EC�������',
    logistics_order_code decimal(30)                   null comment '���������',
    sap_order_code       varchar(20)                   null comment 'sap�������',
    send_status          varchar(10)                   null comment 'SAP����״̬',
    waybill_code         varchar(1024)                 null comment '���˵��ţ���ݵ��ţ�',
    waybill_number       varchar(64)                   null comment '��������',
    apply_document_no    varchar(100)                  null comment '�����ļ����',
    delivery_date        timestamp                     null comment '����ʱ��',
    transport_area_code  varchar(32)                   null comment '�����������',
    store_name           varchar(32)                   null comment '�ֿ�����',
    store_code           varchar(32)                   null comment '�����ֿ����',
    store_desc           varchar(32)                   null comment '�ֿ�����',
    plan_arrival_date    timestamp                     null comment '�ƻ���������',
    real_arrival_date    timestamp                     null comment 'ʵ�ʵ�������',
    order_start_time     timestamp                     null comment '��������ʱ��',
    order_transfer_date  timestamp                     null comment '����ת������',
    verify_date          timestamp                     null comment '���ʱ��',
    print_date           timestamp                     null comment '��ӡʱ��',
    is_success           tinyint unsigned              null comment '�Ƿ����ͳɹ����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    weight               decimal(8, 2)                 null comment 'sap����kg',
    oms_weight           decimal(8, 2)                 null comment 'oms����',
    sap_bulk             decimal(20, 4)                null comment 'SAP���cm3',
    oms_bulk             decimal(20, 4)                null comment 'oms���',
    carton_num           decimal(12, 4) unsigned       null comment '��������',
    client_code          varchar(15)                   null comment '�ͻ����',
    deliver_type         tinyint                       null comment '������������1�����֣�2�����֣�3�����֣�4WMS������5sap������6�ɵ�����',
    dispatch_status      tinyint                       null comment '����״̬',
    return_status        tinyint(4) unsigned default 0 null comment '�˻ص���״̬���ֵ䣺ec_oms_return_status��@0-δ�˻ص���1-�˻ص�����2-�˻ص��ȳɹ�3-�˻ص���ʧ��9-�˻ص��ȳ���',
    last_update_time     timestamp                     null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag             tinyint             default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '������Ϣ�ǼǱ���ϸ';

create index idx_order_code
    on ec_oms_order_delivery_register_info_sub (order_code);

create table ec_oms_order_discount
(
    id                      int unsigned auto_increment comment '����id'
        primary key,
    order_code              decimal(30) unsigned                       not null comment 'EC�������',
    shop_order_id           varchar(64)                                not null comment '���̶������',
    shop_code               int unsigned                               not null comment '������Դ���',
    product_code            bigint unsigned                            null comment '��Ʒ���',
    outter_id               varchar(32)                                null comment '�ⲿƽ̨��Ʒ���',
    order_product_detail_id int unsigned                               null comment '��Ӧƽ̨��Ʒ��ϸid',
    discount_code           varchar(48)                                null comment '�Żݱ���',
    discount_name           varchar(32)                                null comment '�Ż�����',
    discount_amount         decimal(12, 4)                             null comment '�Żݽ��',
    discount_type           tinyint(4) unsigned                        null comment '�Ż����� ƽ̨�е������Ż�1 ,���̳е������Ż�2, ƽ̨�е���Ʒ�Ż�3, ���̳е���Ʒ�Ż�4',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                tinyint unsigned default 0                 not null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment 'ƽ̨�����Żݻ��ܱ�';

create index idx_ctime
    on ec_oms_order_discount (create_time);

create index idx_luptime
    on ec_oms_order_discount (last_update_time);

create index idx_order_code
    on ec_oms_order_discount (order_code);

create table ec_oms_order_discount_config
(
    id                    int(10) auto_increment comment '����ID'
        primary key,
    shop_code             varchar(128) null comment '���̱�ţ�������Ÿ���',
    discount_code         varchar(64)  null comment '�Żݱ���',
    discount_name         varchar(64)  null comment '�Ż�����',
    discount_amount_field varchar(64)  null comment '�Żݽ���ֶ�����',
    discount_type         tinyint      null comment '�Ż����� ƽ̨�е������Ż�1 ,���̳е������Ż�2, ƽ̨�е���Ʒ�Ż�3, ���̳е���Ʒ�Ż�4',
    discount_kind         tinyint      null comment '�Ż�����  1-�����Ż�  2-��Ʒ�Ż�'
)
    comment '����/��Ʒ�Ż����ñ�';

create index dc_shop_code
    on ec_oms_order_discount_config (shop_code);

create table ec_oms_order_discount_jd
(
    discount_id   bigint(64) unsigned auto_increment comment '�Ż�id'
        primary key,
    shop_order_id varchar(32)   null comment '�ⲿƽ̨�������',
    sku_id        varchar(32)   null comment '�ⲿƽ̨sku���',
    coupon_type   varchar(32)   null comment '�ⲿƽ̨�Ż�����',
    coupon_price  decimal(8, 2) null comment '�ⲿƽ̨�Żݼ۸�'
)
    comment '�����Ż�ȯ��Ϣ(�ݲ�ʹ��)';

create index idx_orderId
    on ec_oms_order_discount_jd (shop_order_id);

create table ec_oms_order_discount_tmp
(
    id                      int unsigned auto_increment comment '����id'
        primary key,
    order_code              decimal(30) unsigned                       not null comment 'EC�������',
    shop_order_id           varchar(64)                                not null comment '���̶������',
    shop_code               int unsigned                               not null comment '������Դ���',
    product_code            bigint unsigned                            null comment '��Ʒ���',
    outter_id               varchar(32)                                null comment '�ⲿƽ̨��Ʒ���',
    order_product_detail_id int unsigned                               null comment '��Ӧƽ̨��Ʒ��ϸid',
    discount_code           varchar(48)                                null comment '�Żݱ���',
    discount_name           varchar(32)                                null comment '�Ż�����',
    discount_amount         decimal(12, 4)                             null comment '�Żݽ��',
    discount_type           tinyint(4) unsigned                        null comment '�Ż����� ƽ̨�е������Ż�1 ,���̳е������Ż�2, ƽ̨�е���Ʒ�Ż�3, ���̳е���Ʒ�Ż�4',
    create_time             timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                tinyint unsigned default 0                 not null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment 'ƽ̨�����Żݻ��ܱ�';

create index idx_ctime
    on ec_oms_order_discount_tmp (create_time);

create index idx_luptime
    on ec_oms_order_discount_tmp (last_update_time);

create index idx_order_code
    on ec_oms_order_discount_tmp (order_code);

create table ec_oms_order_guangfa_waybill_status
(
    serial_no             varchar(64)                not null comment '���κ�',
    sub_order_id          varchar(64)                not null comment 'ƽ̨�Ӷ�����',
    update_waybill_status tinyint unsigned default 1 null comment '�ش�ǩ��״̬ 0-δ�ش� 1-�ѻش�',
    primary key (serial_no, sub_order_id)
)
    comment '�㷢�������ǩ�ջش�״̬��';

create table ec_oms_order_import
(
    id                      int unsigned auto_increment comment '����id'
        primary key,
    import_code             bigint unsigned                        not null comment '��ʶ�ϴ����������κ�',
    num                     smallint unsigned                      not null comment '��ţ���ʶ�������붩���Ƿ���ϲ�',
    business_type           tinyint unsigned        default 1      not null comment 'ҵ�����ͣ��ֵ䣺ec_oms_business_type��@1-��ͨ������2-���۶�����3-����������4-��ʱ���۶���',
    shop_order_id           varchar(64)                            null comment '���̶������',
    shop_code               int unsigned                           not null comment '������Դ���',
    relate_shop_order_id    varchar(64)                            null comment '����������� Ĭ��Ϊshop_order_id,�𵥺ϵ���Ϊԭ����shop_order_id',
    import_operation_hint   varchar(64)                            null comment '���붩��ʧ��ԭ��ҳ����ʾ������ʾ������ö��Ÿ���',
    import_cause            tinyint unsigned                       null comment '����ԭ���ֵ䣺ec_oms_import_cause��1-�Թ�ת�˴󶩵�2-�˷����Ӵ󶩵�3-Ӫ�������4-��ƽ̨5-����6-����',
    client_code             varchar(32)                            null comment '�ͻ�����',
    buyer_nick              varchar(64)                            null comment '����ǳ�',
    has_buyer_message       tinyint unsigned        default 0      null comment '�Ƿ���������ԣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    buyer_message           varchar(1024)                          null comment '�����������',
    seller_message          varchar(1024)           default ''     null comment '��������',
    receiver_name           varchar(32)             default ''     not null comment '�ջ�������',
    receiver_name_cipher    varchar(152)                           null comment '�ջ�������',
    receiver_mobile         varchar(20)                            null comment '�ջ����ֻ�',
    receiver_mobile_cipher  varchar(88)                            null comment '�ջ����ֻ�',
    receiver_phone          varchar(32)                            null comment '�ջ��˹̶��绰',
    receiver_phone_cipher   varchar(152)                           null comment '�ջ��˹̶��绰',
    province                varchar(32)                            null comment '�ջ���ʡ��',
    city                    varchar(32)                            null comment '�ջ��˳���',
    district                varchar(32)                            null comment '�ջ�������',
    town                    varchar(32)                            null comment '�ջ��˳���',
    village                 varchar(32)                            null comment '����/��',
    address                 varchar(255)                           null comment '�ջ�����ϸ��ַ',
    address_cipher          varchar(1024)                          null comment '�ջ�����ϸ��ַ',
    product_code            bigint unsigned                        null comment '��Ʒ���',
    shop_pro_name           varchar(255)                           null comment '��Ʒ��',
    buy_num                 int unsigned                           null comment '��������',
    is_present              tinyint unsigned        default 0      null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    payment_type            tinyint unsigned        default 1      not null comment '֧����ʽ ���ֵ䣺ec_oms_payment_type��1-����֧�� 2-�������� 3-���ö�֧��4-��ʱ�տ֧��''             ֧����ʽ ���ֵ䣺ec_oms_payment_type��1-����֧�� 2-�������� 3-���ö�֧��4-��ʱ�տ֧��',
    pro_one_price           decimal(14, 4) unsigned                null comment '��Ʒ����',
    pro_shop_discount_amt   decimal(14, 4) unsigned default 0.0000 not null comment '���̳е���Ʒ�Żݽ��',
    pro_plat_discount_amt   decimal(14, 4) unsigned default 0.0000 not null comment 'ƽ̨�е���Ʒ�Żݽ��',
    order_shop_discount_amt decimal(14, 4) unsigned default 0.0000 not null comment '���̳е������Ż�',
    order_plat_discount_amt decimal(14, 4)          default 0.0000 not null comment 'ƽ̨�е������Ż�',
    order_all_shipment      decimal(14, 4) unsigned default 0.0000 not null comment '�������ʷ�',
    remark                  varchar(500)                           null comment '�ͷ���ע/��Ӧ��������������',
    plat_start_time         timestamp                              null comment '��������ʱ��',
    pay_time                timestamp                              null comment '����֧��ʱ��',
    order_import_time       timestamp                              null comment '��������ʱ��',
    sale_channel            varchar(30)                            null comment '�ն˿ͻ�/����ƽ̨(��¼����������������)',
    sort                    smallint(4) unsigned    default 0      not null comment '�������',
    apply_file_code         varchar(64)                            null comment '�����ļ�����',
    distri_channel_code     varchar(10)                            null comment '����������ţ�����oms_b2b_client_distri_channel.distri_channel_code',
    client_storehouse_code  varchar(10)                            null comment '�ֿ���',
    merchant_received_amt   decimal(14, 2)          default 0.00   null comment '�̼�ʵ�ս��',
    is_original_receive     tinyint unsigned        default 0      not null comment '�Ƿ�ʹ��ԭ���ջ���Ϣ��ec_oms_yes�� 1-�� 0-��',
    recommend_code          bigint(11) unsigned                    null comment '�Ƽ���',
    recommend_user_code     int(9) unsigned                        null comment '�Ƽ��˱��',
    recommend_name          varchar(5)                             null comment '�Ƽ�������'
)
    comment '����������ʱ��';

create index idx_order_import_code
    on ec_oms_order_import (import_code);

create table ec_oms_order_message_inspection
(
    order_code                    decimal(30) unsigned                       not null comment 'EC�������'
        primary key,
    message_intentions            varchar(16)                                null comment '������ͼ(�����'',''����)���ֵ䣺ec_oms_message_intentions��@1-ָ�����2-ָ�����ͷ�ʽ3-����ʱ��Ҫ��4-��Ʊ5-��װ������Ҫ��6-����',
    algorithm_message_intentions  varchar(16)                                null comment '�㷨ʶ��������ͼ(�����'',''����)���ֵ䣺ec_oms_message_intentions��@1-ָ�����2-ָ�����ͷ�ʽ3-����ʱ��Ҫ��4-��Ʊ5-��װ������Ҫ��6-����',
    algorithm_expect_delivery     varchar(255)                               null comment '�㷨ʶ���������',
    algorithm_not_expect_delivery varchar(255)                               null comment '�㷨ʶ���������',
    expect_delivery               varchar(255)                               null comment '�������',
    not_expect_delivery           varchar(255)                               null comment '���������',
    storehouse_code               int unsigned                               null comment '�ֿ���루ʶ��ƥ������',
    storehouse_name               varchar(32)                                null comment '�ֿ����ƣ�ʶ��ƥ������',
    express_code                  int unsigned                               null comment '��ݹ�˾���루ʶ��ƥ������',
    express_name                  varchar(32)                                null comment '��ݹ�˾���ƣ�ʶ��ƥ������',
    expect_result                 tinyint unsigned default 0                 not null comment 'Ԥ��ָ��������ֵ䣺ec_oms_expect_result��@1-�Զ�ƥ��ָ���ɹ���2-�Զ����ָ���ɹ���3-�˹�ָ���ɹ���4-ָ��ʧ��',
    quality_status                tinyint unsigned default 0                 not null comment '�ʼ�״̬���ֵ䣺ec_oms_quality_status��@1-�Ѽ�飬0-δ���',
    is_corrected                  tinyint unsigned default 0                 not null comment '�Ƿ��������ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    plat_start_time               timestamp                                  not null comment '�ⲿƽ̨��������ʱ�䣨����order_status.plat_start_time��',
    corrector_id                  int unsigned                               null comment '�����˱��',
    corrector_name                varchar(32)                                null comment '������',
    corrector_time                timestamp                                  null comment '����ʱ��',
    quality_id                    int unsigned                               null comment '�ʼ��˱��',
    quality_name                  varchar(32)                                null comment '�ʼ���',
    quality_time                  timestamp                                  null comment '�ʼ�ʱ��',
    send_sms_status               tinyint          default 99                not null comment '���ŷ���״̬���ֵ䣺ec_oms_send_sms_status��@99-δ���ͣ�@1-���ͳɹ���0-����ʧ��',
    send_sms_time                 timestamp                                  null comment '���ŷ���ʱ��',
    send_sms_fail_resaon          varchar(200)                               null comment '���ŷ���ʧ��ԭ��',
    create_time                   timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time              timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��������ʶ���ʼ�';

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
    oper_user_id   int unsigned                               null comment '������ID',
    oper_user_name varchar(32)                                null comment '����������',
    oper_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    oper_type      smallint unsigned                          null comment '�������ͣ��ֵ䣺ec_oms_oper_type��',
    oper_content   varchar(512)                               null comment '��������',
    order_code     decimal(30)                                null comment '��¼��ID��EC������ţ�',
    is_exc         tinyint unsigned default 0                 null comment '�Ƿ����쳣�������־@1-��0-��'
)
    comment '����������־��¼��';

create index idx_log_order_code
    on ec_oms_order_oper_log (order_code)
    comment 'EC�����������';

create index idx_oper_time
    on ec_oms_order_oper_log (oper_time);

create table ec_oms_order_oper_log_test
(
    id             bigint unsigned auto_increment comment 'id'
        primary key,
    oper_user_id   int unsigned                               null comment '������ID',
    oper_user_name varchar(32)                                null comment '����������',
    oper_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    oper_type      smallint unsigned                          null comment '�������ͣ��ֵ䣺ec_oms_oper_type��',
    oper_content   varchar(512)                               null comment '��������',
    order_code     decimal(30)                                null comment '��¼��ID��EC������ţ�',
    is_exc         tinyint unsigned default 0                 null comment '�Ƿ����쳣�������־@1-��0-��'
);

create table ec_oms_order_oper_log_tmp
(
    id             bigint unsigned auto_increment comment 'id'
        primary key,
    oper_user_id   int unsigned                               null comment '������ID',
    oper_user_name varchar(32)                                null comment '����������',
    oper_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    oper_type      smallint unsigned                          null comment '�������ͣ��ֵ䣺ec_oms_oper_type��',
    oper_content   varchar(512)                               null comment '��������',
    order_code     decimal(30)                                null comment '��¼��ID��EC������ţ�',
    is_exc         tinyint unsigned default 0                 null comment '�Ƿ����쳣�������־@1-��0-��'
)
    comment '����������־��¼��';

create index idx_log_order_code
    on ec_oms_order_oper_log_tmp (order_code)
    comment 'EC�����������';

create index idx_oper_time
    on ec_oms_order_oper_log_tmp (oper_time);

create table ec_oms_order_original_product_detail
(
    id                        int unsigned auto_increment comment '����Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC�������',
    shop_code                 int(11) unsigned                           null comment 'ƽ̨��Դ',
    shop_order_id             varchar(64)                                null comment '�ⲿƽ̨�������',
    product_code              bigint unsigned                            null comment '��Ʒ���',
    shop_pro_name             varchar(255)                               null comment '��Ʒ��',
    buy_num                   int unsigned                               null comment '��������',
    gross_weight              decimal(10, 3)   default 0.000             null comment '��Ʒ��ë��(kg)',
    pro_type                  tinyint unsigned                           null comment '��Ʒ���ͣ�1-��Ʒ��2-�ײͣ�3-������Ʒ��',
    outter_id                 varchar(64)                                null comment '��Ʒ���ID',
    is_present                tinyint unsigned default 0                 null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '��Ʒ����',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '���۽��',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '���̳е���Ʒ�Żݽ��',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е���Ʒ�Żݽ��',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '��Ʒʵ�����',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '���̳е������Żݡ���̯��',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment 'ƽ̨�е������Żݡ���̯��',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '�����Ż�',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment 'ƽ̨�Ż�',
    shipment                  decimal(12, 2)   default 0.00              not null comment '�˷�',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ͳһ����ԭʼ��Ʒ��ϸ��תƷǰ��';

create index idx_luptime
    on ec_oms_order_original_product_detail (last_update_time);

create index idx_original_pro_order_code
    on ec_oms_order_original_product_detail (order_code);

create table ec_oms_order_original_product_detail_tmp
(
    id                        int unsigned auto_increment comment '����Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC�������',
    shop_code                 int(11) unsigned                           null comment 'ƽ̨��Դ',
    shop_order_id             varchar(64)                                null comment '�ⲿƽ̨�������',
    product_code              bigint unsigned                            null comment '��Ʒ���',
    shop_pro_name             varchar(255)                               null comment '��Ʒ��',
    buy_num                   int unsigned                               null comment '��������',
    gross_weight              decimal(10, 2)   default 0.00              null comment '��Ʒ��ë��(kg)',
    pro_type                  tinyint unsigned                           null comment '��Ʒ���ͣ�1-��Ʒ��2-�ײͣ�3-������Ʒ��',
    outter_id                 varchar(64)                                null comment '��Ʒ���ID',
    is_present                tinyint unsigned default 0                 null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '��Ʒ����',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '���۽��',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '���̳е���Ʒ�Żݽ��',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е���Ʒ�Żݽ��',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '��Ʒʵ�����',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '���̳е������Żݡ���̯��',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment 'ƽ̨�е������Żݡ���̯��',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '�����Ż�',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment 'ƽ̨�Ż�',
    shipment                  decimal(12, 2)   default 0.00              not null comment '�˷�',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ͳһ����ԭʼ��Ʒ��ϸ��תƷǰ��';

create index idx_luptime
    on ec_oms_order_original_product_detail_tmp (last_update_time);

create index idx_original_pro_order_code
    on ec_oms_order_original_product_detail_tmp (order_code);

create table ec_oms_order_pinduoduo_product_details
(
    id               int unsigned auto_increment comment '����Id'
        primary key,
    shop_order_id    varchar(64)                         not null comment 'ƴ�����̶������',
    shop_code        int unsigned                        not null comment '���̱��',
    goods_id         bigint                              null comment '��Ʒ���',
    sku_id           bigint                              null comment '��Ʒ������',
    outer_id         varchar(20)                         null comment '�̼��ⲿ����(sku)',
    outer_goods_id   varchar(20)                         null comment '�̼��ⲿ����(��Ʒ)',
    goods_name       varchar(255)                        null comment '��Ʒ����',
    goods_price      decimal(14, 4)                      null comment '��Ʒ���ۼ۸�',
    goods_spec       varchar(20)                         null comment '��Ʒ���',
    goods_count      int(10)                             null comment '��Ʒ����',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment 'ƴ��ඩ����Ʒ��ϸ�б�';

create index idx_shop_order_id
    on ec_oms_order_pinduoduo_product_details (shop_order_id);

create table ec_oms_order_presale_strategy
(
    id                   int unsigned auto_increment comment 'id'
        primary key,
    strategy_code        bigint unsigned                            null comment '���Ա��',
    strategy_name        varchar(64)                                null comment '��������',
    time_type            int unsigned                               null comment '����ʱ������,0����ʱ��',
    begin_time           timestamp        default CURRENT_TIMESTAMP null comment '��ʼʱ��',
    end_time             timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    strategy_action      tinyint(3)       default 0                 null comment '���Զ������ֵ� ec_oms_presale_strategy_action��0-�����Զ����� 1-�Զ���Ԥ��Ʒ����',
    is_auto_relieve_hand tinyint unsigned                           not null comment '�Ƿ��Զ����',
    relieve_hand_time    timestamp                                  null comment '���ʱ��',
    is_all_product       tinyint unsigned                           not null comment '�Ƿ�������Ʒ��b2c 2.5�汾�����ã�',
    buyer_range          tinyint(3)       default 0                 null comment '��ҷ�Χ���ֵ�ec_oms_retention_product_buyer_range�� 0-ȫ�� 1-ָ���������',
    product_type         tinyint(3)       default 0                 null comment 'ָ����Ʒ���ͣ��ֵ�ec_oms_presale_product_type�� 0-Ԥ����Ʒ 1-��Ԥ����Ʒ',
    operator_id          int                                        null comment '�����˱��',
    operator_name        varchar(32)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    constraint idx_strategy_code
        unique (strategy_code) comment '���Ա������'
)
    comment '����Ԥ�۲��Ա�';

create index idx_begin_time
    on ec_oms_order_presale_strategy (begin_time)
    comment '���Կ�ʼʱ������';

create index idx_end_time
    on ec_oms_order_presale_strategy (end_time)
    comment '����ʱ������';

create index idx_strategy_name
    on ec_oms_order_presale_strategy (strategy_name)
    comment '������������';

create table ec_oms_order_presale_strategy_buyer_sub
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '�������Ա��',
    buyer_id         varchar(64)                                null comment 'ָ�����ID',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'Ԥ�۲��������Ϣ��';

create index idx_strategy_code
    on ec_oms_order_presale_strategy_buyer_sub (strategy_code, buyer_id);

create table ec_oms_order_presale_strategy_detail
(
    order_code                 decimal(30) unsigned                       not null comment '�������'
        primary key,
    strategy_code              bigint unsigned                            null comment '���Ա��',
    is_auto_relieve_hand       tinyint unsigned                           null comment '�Ƿ��Զ����',
    relieve_hand_time          timestamp                                  null comment '���ʱ��',
    handle_relieve_hand_status tinyint unsigned default 0                 null comment '�Ƿ����Զ����״̬',
    plat_start_time            timestamp                                  null comment '�ⲿƽ̨��������ʱ��',
    pay_time                   timestamp                                  null comment '����֧��ʱ��',
    create_time                timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�����ʱ��',
    operator_id                int(10)                                    null comment '������ID',
    operator_name              varchar(32)                                null comment '����������'
)
    comment '����Ԥ�۲��Ա������';

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
    id               int unsigned auto_increment comment 'Ψһ��ʶ'
        primary key,
    strategy_code    bigint unsigned                            null comment '�������Ա��',
    product_code     bigint unsigned                            null comment '��Ʒ���',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����Ԥ�۲�����Ʒ��Ϣ��';

create index idx_strategy_code
    on ec_oms_order_presale_strategy_product_sub (strategy_code)
    comment '���Ա������';

create table ec_oms_order_presale_strategy_shop_sub
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint unsigned                            null comment '�������Ա��',
    shop_code        int(30) unsigned                           null comment '���̱��',
    shop_name        varchar(64)                                null comment '��������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'Ԥ��Ʒ���Ե�����Ϣ��';

create index idx_shop_code
    on ec_oms_order_presale_strategy_shop_sub (shop_code);

create index idx_strategy_code
    on ec_oms_order_presale_strategy_shop_sub (strategy_code);

create table ec_oms_order_present_record
(
    id                   int unsigned auto_increment comment '����ID'
        primary key,
    plan_code            bigint                                     not null comment '���Ա���',
    order_code           decimal(30)                                not null comment 'EC�������',
    target_product_code  bigint unsigned                            null comment 'Ŀ���Ʒ����',
    present_product_code bigint unsigned                            not null comment '��Ʒ��Ʒ���',
    present_product_num  int unsigned                               not null comment '��Ʒ��Ʒ����',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ƽ̨������Ʒ��¼��';

create index idx_plan_code
    on ec_oms_order_present_record (plan_code);

create table ec_oms_order_product_detail
(
    id                        int unsigned auto_increment comment '����Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC�������',
    product_code              bigint unsigned                            null comment '��Ʒ���',
    shop_pro_name             varchar(255)                               null comment '��Ʒ��',
    buy_num                   int unsigned                               null comment '��������',
    actual_num                int unsigned     default 0                 null comment 'ʵ���跢������',
    gross_weight              decimal(10, 3)   default 0.000             null comment '��Ʒ��ë��(kg)',
    pro_type                  tinyint unsigned                           null comment '��Ʒ���ͣ�1-��Ʒ��2-�ײͣ�3-������Ʒ��',
    outter_id                 varchar(64)                                null comment '��Ʒ���ID',
    add_present_type          tinyint unsigned                           null comment '�����Ʒ�ķ�ʽ@1-�Զ���2-�ֶ���3-����',
    is_present                tinyint unsigned default 0                 null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_convert                tinyint unsigned default 0                 null comment '�Ƿ�תƷ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    original_id               int unsigned                               null comment 'תƷǰ��Ʒ��¼ID',
    original_product_code     bigint                                     null comment 'Դ��Ʒ��ţ������תƷ�����תƷǰ��product_code,���ûתƷ������product_code',
    sys_price                 decimal(12, 4)   default 0.0000            not null comment 'oms-b2b ϵͳ���',
    price_logic               tinyint unsigned default 0                 not null comment 'b2b�۸�ȡֵ�߼� @0-��1-����۸����2-��Ʒ�ĵȼ��۸�3-���۵ȼ�Ĭ���ۿ��ʼ���ļ۸�(����)4-���ۼ�(����)5-����Լ����6-�ȼ�������',
    is_price_structure        tinyint unsigned default 0                 null comment 'ץ��2b��Ʒ�۸���ϵ�Ƿ����� 1-����  0-û����',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '��Ʒ����',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '���۽��',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '���̳е���Ʒ�Żݽ��',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е���Ʒ�Żݽ��',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '��Ʒʵ�����',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '���̳е������Żݡ���̯��',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment 'ƽ̨�е������Żݡ���̯��',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '�����Ż�',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment 'ƽ̨�Ż�',
    shipment                  decimal(12, 2)   default 0.00              not null comment '�˷�',
    pro_pay_type              tinyint unsigned default 0                 not null comment '��Ʒ֧������ @0-������1-�ɵֿ۽��֧��',
    batch_scope_text          varchar(25)      default ''                not null comment '���η�Χ�ı�',
    last_update_time          timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ͳһ������Ʒ��ϸ��';

create index idx_luptime
    on ec_oms_order_product_detail (last_update_time);

create index idx_order_code
    on ec_oms_order_product_detail (order_code);

create table ec_oms_order_product_detail_tmp
(
    id                        int unsigned auto_increment comment '����Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC�������',
    product_code              bigint unsigned                            null comment '��Ʒ���',
    shop_pro_name             varchar(255)                               null comment '��Ʒ��',
    buy_num                   int unsigned                               null comment '��������',
    actual_num                int unsigned     default 0                 null comment 'ʵ���跢������',
    gross_weight              decimal(10, 2)   default 0.00              null comment '��Ʒ��ë��(kg)',
    pro_type                  tinyint unsigned                           null comment '��Ʒ���ͣ�1-��Ʒ��2-�ײͣ�3-������Ʒ��',
    outter_id                 varchar(64)                                null comment '��Ʒ���ID',
    add_present_type          tinyint unsigned                           null comment '�����Ʒ�ķ�ʽ@1-�Զ���2-�ֶ���3-����',
    is_present                tinyint unsigned default 0                 null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    is_convert                tinyint unsigned default 0                 null comment '�Ƿ�תƷ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    original_id               int unsigned                               null comment 'תƷǰ��Ʒ��¼ID',
    original_product_code     bigint                                     null comment 'Դ��Ʒ��ţ������תƷ�����תƷǰ��product_code,���ûתƷ������product_code',
    sys_price                 decimal(12, 4)   default 0.0000            not null comment 'oms-b2b ϵͳ���',
    price_logic               tinyint unsigned default 0                 not null comment 'b2b�۸�ȡֵ�߼� @0-��1-����۸����2-��Ʒ�ĵȼ��۸�3-���۵ȼ�Ĭ���ۿ��ʼ���ļ۸�(����)4-���ۼ�(����)5-����Լ����6-�ȼ�������',
    is_price_structure        tinyint unsigned default 0                 null comment 'ץ��2b��Ʒ�۸���ϵ�Ƿ����� 1-����  0-û����',
    pro_one_price             decimal(14, 4)   default 0.0000            not null comment '��Ʒ����',
    pro_all_price             decimal(14, 4)   default 0.0000            not null comment '���۽��',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '���̳е���Ʒ�Żݽ��',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е���Ʒ�Żݽ��',
    pro_pay_amt               decimal(14, 4)   default 0.0000            not null comment '��Ʒʵ�����',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '���̳е������Żݡ���̯��',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment 'ƽ̨�е������Żݡ���̯��',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '�����Ż�',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment 'ƽ̨�Ż�',
    shipment                  decimal(12, 2)   default 0.00              not null comment '�˷�',
    pro_pay_type              tinyint unsigned default 0                 not null comment '��Ʒ֧������ @0-������1-�ɵֿ۽��֧��',
    batch_scope_text          varchar(25)      default ''                not null comment '���η�Χ�ı�',
    last_update_time          timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ͳһ������Ʒ��ϸ��';

create index idx_luptime
    on ec_oms_order_product_detail_tmp (last_update_time);

create index idx_order_code
    on ec_oms_order_product_detail_tmp (order_code);

create table ec_oms_order_product_recovery
(
    id               int unsigned auto_increment comment '����Id'
        primary key,
    exc_order_code   decimal(30) unsigned                       not null comment '�ۺ󵥶�Ӧ��EC�������',
    order_code       decimal(30) unsigned                       not null comment 'EC�������',
    order_product_id int unsigned                               not null comment '������Ʒ��ϸID',
    product_code     bigint unsigned                            null comment '��Ʒ���',
    product_name     varchar(255)                               null comment '��Ʒ��',
    recovery_num     int(10)                                    null comment '�ָ���������',
    is_present       tinyint unsigned default 0                 null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    pro_one_price    decimal(14, 4)   default 0.0000            not null comment '��Ʒ����',
    pro_all_price    decimal(14, 4)   default 0.0000            not null comment '���۽��',
    creator_id       int unsigned                               null comment '�����˱�ţ��ָ��ˣ�',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    order_status     tinyint unsigned                           not null comment '����״̬���ֵ䣺ec_oms_order_status��0-��������1-���ύ��2��ɾ����3������4��ȡ����5���󵥡�6���ִ��󵥡�7���˻ص��ȡ�8���ִ��˻ص��ȡ�9�����ȡ�10���ִ����ȡ�11��������12���ִ�������13�����С�14���ַ����С�15�ѷ�����16�����ѷ�����17��ǩ�ա�18������ǩ�ա�19���׳ɹ���20���ֽ��׳ɹ���99������',
    shop_order_id    varchar(64)                                not null comment '���̶�����ţ���Ϊ�ϵ�����ΪEC�������(order_code)'
)
    comment 'ͳһ������Ʒ�ָ���¼��';

create index idx_pro_recovery_exc_order_code
    on ec_oms_order_product_recovery (exc_order_code);

create table ec_oms_order_risk_batch
(
    risk_batch          bigint unsigned                            not null comment '��������'
        primary key,
    risk_reason         varchar(255)                               null comment '����ԭ��',
    need_persuade       tinyint(3)       default 0                 null comment '�Ƿ���ҪȰ�ˣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��',
    risk_voucher        varchar(512)                               null comment '����ƾ֤',
    risk_voucher2       varchar(512)                               null comment '����ƾ֤2',
    risk_voucher3       varchar(512)                               null comment '����ƾ֤3',
    is_audit_regist     tinyint unsigned default 0                 not null comment '�Ƿ������Ǽ� ���ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    audit_voucher       varchar(512)                               null comment '����ƾ֤',
    audit_voucher2      varchar(512)                               null comment '����ƾ֤2',
    audit_voucher3      varchar(512)                               null comment '����ƾ֤3',
    audit_creator_id    int(10)                                    null comment '���������˱��',
    audit_creator_name  varchar(32)                                null comment '��������������',
    audit_create_time   timestamp                                  null comment '��������ʱ��',
    audit_operator_id   int(10)                                    null comment '���������˱��',
    audit_operator_name varchar(32)                                null comment '��������������',
    audit_operator_time timestamp                                  null comment '��������ʱ��',
    creator_id          int unsigned                               null comment '�����˱��',
    creator_name        varchar(32)                                null comment '����������',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id         int unsigned                               null comment '�����˱��',
    operator_name       varchar(32)                                null comment '����������',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag            tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����������α�';

create table ec_oms_order_risk_control
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC�������',
    shop_code        int unsigned                               null comment '������Դ���',
    risk_code        int unsigned                               not null comment '���ձ��',
    risk_tips        tinyint unsigned                           not null comment '������ʾ��ec_oms_risk_tips��',
    risk_action      tinyint unsigned default 0                 not null comment '�з���ϵͳ������ec_oms_risk_action��0-�ޣ�1-�Զ�ȡ��������2-�Զ�����3-�Զ���',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '������ع�ϵ��';

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
    id               int unsigned auto_increment comment '����ID'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC�������',
    risk_code        int unsigned                               not null comment '���ձ��',
    risk_tips        tinyint unsigned                           not null comment '������ʾ��ec_oms_risk_tips��',
    risk_action      tinyint unsigned default 0                 not null comment '�з���ϵͳ������ec_oms_risk_action��0-�ޣ�1-�Զ�ȡ��������2-�Զ�����3-�Զ���',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '������ع�ϵ��';

create index idx_ocode_rti
    on ec_oms_order_risk_control_tmp (order_code, risk_tips);

create index idx_risk_tips
    on ec_oms_order_risk_control_tmp (risk_tips);

create table ec_oms_order_send_delivery_wechat_subscription_log
(
    id                   int unsigned auto_increment comment '����ID'
        primary key,
    order_code           decimal(30)                         not null comment '�������,����',
    shop_order_id        varchar(64)                         not null comment '���̶�����',
    logistics_order_code decimal(30)                         not null comment '������������',
    response_msg         varchar(255)                        null comment '����ӿڷ�������',
    create_time          timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '΢�Ź��ںŷ���֪ͨ��¼��';

create table ec_oms_order_service_order_reply_relation
(
    reply_id    int unsigned    not null comment '�ظ���¼id'
        primary key,
    relate_id   bigint unsigned not null comment '�ͻ����񵥵�id�����ⲹ���id',
    relate_type tinyint         not null comment '�������� 1-���� 2-���ⲹ��'
)
    comment '�ͻ�������ظ���¼������';

create table ec_oms_order_status
(
    order_code                 decimal(30) unsigned                         not null comment 'EC�������'
        primary key,
    order_type                 tinyint unsigned   default 1                 not null comment '�������ͣ��ֵ䣺ec_oms_order_type��@1-����������2-����������3-���붩��',
    business_type              tinyint unsigned   default 1                 not null comment 'ҵ�����ͣ��ֵ䣺ec_oms_business_type��@1-��ͨ������2-���۶�����3-����������4-��ʱ���۶���',
    order_status               tinyint unsigned                             not null comment '����״̬���ֵ䣺ec_oms_order_status��0-��������1-���ύ��2��ɾ����22����Ӫ��ˡ�3������4��ȡ����21����ء�5���󵥡�6���ִ��󵥡�7���˻ص��ȡ�8���ִ��˻ص��ȡ�9�����ȡ�10���ִ����ȡ�11��������12���ִ�������13�����С�14���ַ����С�15�ѷ�����16�����ѷ�����17��ǩ�ա�18������ǩ�ա�19���׳ɹ���20���ֽ��׳ɹ���99������',
    place_order_status         tinyint unsigned   default 1                 not null comment '�µ�״̬���ֵ䣺out_ec_place_order_status��0-��ȷ�ϣ�1-���µ���2-�˻ش�ȷ��',
    is_outec                   tinyint unsigned   default 0                 not null comment '�Ƿ��ⲿEC�������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    handle_type                tinyint unsigned   default 1                 not null comment '������ͣ��ֵ䣺ec_oms_handle_type����1-ԭʼ����2-�ӵ���3-�ϵ���',
    split_type                 tinyint unsigned   default 0                 not null comment '�𵥷�ʽ���ֵ䣺ec_oms_split_type����0:δ��֣�1���ײͲ�֣�2��SAP��֣�',
    sap_split_type             tinyint unsigned   default 0                 not null comment 'SAP��ֶ������� ���ֵ䣺ec_oms_sap_split_type��@ 0-Ĭ������  1-�����ӵ�  2-����ӵ�  3-��Ʒ�ӵ�',
    hang_status                tinyint unsigned   default 0                 not null comment '����״̬(�ֵ䣺hang_status)��1-�ѹ���0-δ������Ҫ��Կͷ��Ȳ�����Ա���е�״̬',
    hang_up_type               varchar(8)                                   null comment '�������� �����������ʱ�á�,������ 0-������� 1-Ԥ�۹���  2-�˹����� 3-���չ����ֵ�:ec_oms_hang_up_type��',
    is_valid                   tinyint unsigned   default 1                 not null comment '�Ƿ���Ч���ֵ䣺ec_oms_yes_no��@1-�� 0-����Ҫ��Գ������е�״̬',
    is_exc                     tinyint unsigned   default 0                 not null comment '�Ƿ��쳣���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    is_bigorder                tinyint unsigned   default 0                 not null comment '�Ƿ�󶩵����ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    is_beyond_area             tinyint unsigned   default 0                 not null comment '�Ƿ��� ���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    product_convert_status     tinyint unsigned   default 0                 not null comment '�Ƿ�Ӧ��תƷ���ԵĶ������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    auto_add_present_status    tinyint unsigned   default 0                 not null comment '�Զ������Ʒ״̬���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    is_auto_examine_adopt      tinyint unsigned   default 0                 not null comment '�Ƿ�ִ���Զ�������˹��� ���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    examine_adopt_status       tinyint unsigned   default 0                 null comment '����״̬���ֵ䣺ec_oms_examine_adopt_status�� 0-���ύ��1-���ύ��2-���ͨ����3-��˲�ͨ��',
    auto_examine_adopt_reason  tinyint unsigned                             null comment '�Զ�����ͨ��ԭ�� ���ֵ䣺ec_oms_auto_examine_adopt_reason�� 0-��Ʒ����  1-���ö�Ȳ���  2-�ͻ���Ч  3-�޲���Ȩ��',
    examine_adopt_time         timestamp                                    null comment '��������ʱ��',
    import_commit_order_time   timestamp                                    null comment '���붩���ύʱ��',
    verify_status              tinyint unsigned   default 1                 not null comment '��״̬���ֵ䣺ec_oms_verify_status���� 0-��ȡ��,1-����,2-���󵥣�',
    verify_time                timestamp                                    null comment '�������ʱ��',
    is_same_receipt_batch      tinyint unsigned   default 0                 not null comment '�Ƿ�ͬ���տ�ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    receipt_batch_no           bigint unsigned                              null comment '�տ����α�� ʱ���+5λ���',
    temporary_receipt_no       bigint unsigned                              null comment '��ʱ�տ��� ʱ���+5λ���',
    add_receipt_batch_time     timestamp                                    null comment '���ͬ���տʱ��',
    add_temporary_receipt_time timestamp                                    null comment '�����ʱ�տʱ��',
    payment_type               tinyint unsigned   default 1                 not null comment '֧����ʽ ���ֵ䣺ec_oms_payment_type��1-����֧�� 2-�������� 3-���ö�֧��4-��ʱ�տ֧��''             ֧����ʽ ���ֵ䣺ec_oms_payment_type��1-����֧�� 2-�������� 3-���ö�֧��4-��ʱ�տ֧��',
    payment_status             tinyint unsigned   default 0                 not null comment '֧��״̬ ���ֵ䣺ec_oms_payment_status�� 1-��֧��  0--δ֧��',
    pay_time                   timestamp                                    null comment '����֧��ʱ��',
    plat_start_time            timestamp                                    not null comment '�ⲿƽ̨��������ʱ��',
    plat_end_time              timestamp                                    null comment '�ⲿƽ̨��������ʱ��',
    plat_update_time           timestamp                                    null comment '�ⲿƽ̨�����޸�ʱ��',
    plat_delivery_time         timestamp                                    null comment '�ⲿƽ̨��������ʱ��',
    send_sms_status            tinyint unsigned   default 99                not null comment '���ŷ���״̬���ֵ䣺ec_oms_send_sms_status��@1-�ɹ���0-ʧ�� ,99-δ����',
    send_sms_time              timestamp                                    null comment '���ŷ���ʱ��',
    send_sms_fail_resaon       varchar(200)                                 null comment '���ŷ���ʧ��ԭ��',
    is_return_order            tinyint unsigned   default 0                 not null comment '�Ƿ����˻ض������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    is_price_structure         tinyint unsigned                             null comment 'ץ��2b��Ʒ�۸���ϵ�Ƿ����� 1-����  0-û����',
    is_risk                    tinyint(3)         default 4                 null comment '�Ƿ��з��գ�ec_oms_is_risk��0-�� 1-�� 2-���˹�ʶ�� 3-�㷨ʶ���޷��� 4-���㷨ʶ��',
    risk_tips                  tinyint unsigned                             null comment '������ʾ��ec_oms_risk_tips��',
    risk_batch                 bigint unsigned                              null comment '��������',
    risk_control               tinyint(3)         default 0                 null comment '���״̬��ec_oms_risk_control��0-���㷨ʶ�� 1-�㷨ʶ���޷��� 2-���˹�ʶ�� 3-ʶ����Ǽ� 4-��ʶ�𲢵Ǽ�',
    is_presale_order           tinyint(3)         default 0                 not null comment '�Ƿ�ΪԤ�۵����ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    order_sign                 tinyint unsigned   default 0                 not null comment '������ǣ��ֵ�ec_oms_order_sign�� 0-�ޣ�1-ֱ��������2-��ٻ',
    delivery_limitation        mediumint unsigned default 0                 not null comment '����ʱЧ(�ش���ݵ���)����λСʱ',
    logistics_collection       mediumint unsigned default 0                 not null comment '����ʱЧ(��������)����λСʱ',
    is_original_receive        tinyint unsigned   default 0                 not null comment '�Ƿ�ʹ��ԭ���ջ���Ϣ��ec_oms_yes�� 1-�� 0-��',
    last_update_time           timestamp          default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment 'ͳһ����ҵ��״̬��';

create index idx_examine_adopt_time
    on ec_oms_order_status (examine_adopt_time);

create index idx_last_up_t
    on ec_oms_order_status (last_update_time);

create index idx_ost_isv_ise_hst_oty
    on ec_oms_order_status (order_status, hang_status, is_valid, is_exc, order_type);

create index idx_pay_time_rtips
    on ec_oms_order_status (pay_time, risk_tips)
    comment '������ع����ѯ����';

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
    strategy_code        varchar(32)                not null comment '���Ա��'
        primary key,
    strategy_name        varchar(64)                null comment '��������',
    strategy_start_time  timestamp                  null comment '���Կ�ʼʱ��',
    strategy_end_time    timestamp                  null comment '���Խ���ʱ��',
    strategy_type        varchar(10)                null comment '��ţ�ж��߼� ����-1 ��Ʒ-2',
    min_value_order      int(10)                    null comment '������С��ֵ',
    middle_value_order   int(10)                    null comment '�����м���ֵ',
    max_value_order      int(10)                    null comment '���������ֵ',
    min_value_product    int(10)                    null comment '��Ʒ��С��ֵ',
    middle_value_product int(10)                    null comment '��Ʒ�м���ֵ',
    max_value_product    int(10)                    null comment '��Ʒ�����ֵ',
    channel_codes        varchar(1024)              null comment '�������',
    shop_codes           varchar(1024)              null comment '���̱��',
    product_codes        varchar(1024)              null comment '��Ʒ���',
    creator_id           int(10)                    null comment '�����˱��',
    creator_name         varchar(32)                null comment '����������',
    create_time          timestamp                  null comment '����ʱ��',
    operator_id          int(10)                    null comment '�����˱��',
    operator_name        varchar(32)                null comment '����������',
    last_update_time     timestamp                  null comment '������ʱ��',
    del_flag             tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��ţ�������Թ���';

create table ec_oms_order_tmall
(
    tid                    bigint unsigned            not null comment '��è����ID'
        primary key,
    status                 varchar(32)                null comment '��è����״̬',
    type                   varchar(32)                null comment '��è��������',
    seller_nick            varchar(32)                null comment '�����ǳ�',
    buyer_nick             varchar(32)                null comment '����ǳ�',
    created                timestamp                  null comment '����ʱ��',
    modified               timestamp                  null comment '����ʱ��',
    jdp_hashcode           varchar(64)                null comment '���ݱ�־',
    jdp_response           mediumtext                 null comment '��������',
    jdp_created            timestamp                  null comment '���ݿⴴ��ʱ��',
    jdp_modified           timestamp                  null comment '���ݿ��޸�ʱ��',
    update_delivery_status tinyint unsigned default 0 null comment '�ش�����״̬ 0-δ�ش� 1-�ѻش�'
)
    comment '��è����';

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
    fenxiao_id             bigint unsigned            not null comment '��������id'
        primary key,
    status                 varchar(64)                null comment '����״̬',
    tc_order_id            varchar(32)                null comment 'tcorderid',
    supplier_username      varchar(32)                null comment '����������',
    distributor_username   varchar(32)                null comment '����������',
    created                timestamp                  null comment '����ʱ��',
    modified               timestamp                  null comment '�޸�ʱ��',
    jdp_hashcode           varchar(128)               null comment '���ݱ�ʶ',
    jdp_response           mediumtext                 null comment '��������',
    jdp_modified           timestamp                  null comment '����ͬ���޸�ʱ��',
    jdp_created            timestamp                  null comment '����ͬ������ʱ��',
    update_delivery_status tinyint unsigned default 0 null comment '�ش�״̬'
)
    comment '��è����ץ����¼ ��������ʹ��';

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
    sub_fenxiao_id        bigint unsigned                     null comment '����ƽ̨�ĸ��ɹ�������',
    fenxiao_id            bigint                              not null comment '����ƽ̨���Ӳɹ�������'
        primary key,
    item_id               bigint                              null comment '����ƽ̨�ϵĲ�Ʒid',
    item_outer_id         bigint                              null comment '����ƽ̨����Ʒ�̼ұ���',
    convert_item_outer_id bigint(255) unsigned                null comment 'תƷ��Ĳ�Ʒ���;Ĭ�ϵ���item_outer_id',
    auction_price         decimal(12, 4)                      null comment '�����̵����б���һ�ڼ�',
    bill_fee              decimal(12, 4)                      null comment '��ƱӦ�����',
    num                   int                                 null comment '��Ʒ�Ĳɹ�����',
    buyer_payment         decimal(12, 4)                      null comment '���֧���������̵��ܽ��',
    discount_fee          decimal(12, 4)                      null comment '�Żݻ���ۿ۽��',
    distributor_payment   decimal(12, 4)                      null comment '������ʵ�����',
    total_fee             decimal(12, 4)                      null comment '�ɹ����ܶ�',
    created               timestamp                           null comment '�ɹ�������ʱ��',
    price                 decimal(12, 4)                      null comment '��Ʒ�Ĳɹ��۸�',
    promotion_type        tinyint                             null comment '�Żݻ����0=���Ż�1=��ʱ��',
    refund_fee            decimal(12, 4)                      null comment '�˿���',
    tc_discount_fee       decimal(12, 4)                      null comment '�Żݽ��',
    title                 varchar(200)                        null comment '�ɹ��Ĳ�Ʒ����',
    last_update_time      timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��è�����Ӷ�����ϸ��Ϣ�б�';

create index idx_luptime
    on ec_oms_order_tmall_gongxiao_sub_purchase_order (last_update_time);

create index idx_subord
    on ec_oms_order_tmall_gongxiao_sub_purchase_order (sub_fenxiao_id);

create table ec_oms_order_tmall_gongxiao_sub_purchase_order_tmp
(
    sub_fenxiao_id      bigint unsigned                     null comment '����ƽ̨�ĸ��ɹ�������',
    fenxiao_id          bigint                              not null comment '����ƽ̨���Ӳɹ�������'
        primary key,
    item_id             bigint                              null comment '����ƽ̨�ϵĲ�Ʒid',
    item_outer_id       bigint                              null comment '����ƽ̨����Ʒ�̼ұ���',
    auction_price       decimal(12, 4)                      null comment '�����̵����б���һ�ڼ�',
    bill_fee            decimal(12, 4)                      null comment '��ƱӦ�����',
    num                 int                                 null comment '��Ʒ�Ĳɹ�����',
    buyer_payment       decimal(12, 4)                      null comment '���֧���������̵��ܽ��',
    discount_fee        decimal(12, 4)                      null comment '�Żݻ���ۿ۽��',
    distributor_payment decimal(12, 4)                      null comment '������ʵ�����',
    total_fee           decimal(12, 4)                      null comment '�ɹ����ܶ�',
    created             timestamp                           null comment '�ɹ�������ʱ��',
    price               decimal(12, 4)                      null comment '��Ʒ�Ĳɹ��۸�',
    promotion_type      tinyint                             null comment '�Żݻ����0=���Ż�1=��ʱ��',
    refund_fee          decimal(12, 4)                      null comment '�˿���',
    tc_discount_fee     decimal(12, 4)                      null comment '�Żݽ��',
    title               varchar(200)                        null comment '�ɹ��Ĳ�Ʒ����',
    last_update_time    timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��è�����Ӷ�����ϸ��Ϣ�б�';

create index idx_luptime
    on ec_oms_order_tmall_gongxiao_sub_purchase_order_tmp (last_update_time);

create index idx_subord
    on ec_oms_order_tmall_gongxiao_sub_purchase_order_tmp (sub_fenxiao_id);

create table ec_oms_order_tmall_product_detail
(
    tid                           bigint unsigned            not null comment '��èƽ̨�������',
    oid                           bigint unsigned            not null comment '�Ӷ������',
    outer_iid                     varchar(20)                null comment '�̼��ⲿ����',
    outer_sku_id                  varchar(20)                null comment '�̼��ⲿ������Ҫ����',
    num_iid                       bigint unsigned            null comment '��Ʒ����ID',
    num                           int unsigned               null comment '��������',
    price                         decimal(10, 2)             null comment '��Ʒ�۸񡣾�ȷ��2λС��',
    total_fee                     decimal(10, 2)             null comment 'Ӧ������Ʒ�۸� * ��Ʒ���� + �ֹ�������� - �Ӷ����������Żݽ�����ȷ��2λС��;��λ:Ԫ��',
    adjust_fee                    decimal(10, 2)             null comment '�����ֶ��������',
    discount_fee                  decimal(10, 2)             null comment '�Ӷ����������Żݽ�',
    divide_order_fee              decimal(10, 2)             null comment '��̯֮���ʵ�����',
    part_mjz_discount             decimal(10, 2)             null comment '�Żݷ�̯',
    payment                       decimal(10, 2)             null comment '�Ӷ���ʵ�����',
    update_delivery_status        tinyint unsigned default 0 null comment '�ش�����״̬ 0-δ�ش� 1-�ѻش�',
    update_notice_delivery_status tinyint(2)       default 0 null comment '�����֪ͨ�ش�����״̬ 0-δ�ش� 1-�ѻش�',
    primary key (tid, oid)
)
    comment '��è������Ʒ��ϸ';

create index idx_oid
    on ec_oms_order_tmall_product_detail (oid);

create table ec_oms_order_vitual_mobile_import
(
    id                    int(10) auto_increment comment '����id'
        primary key,
    import_code           int(10)       null comment '��ʶ�ϴ����������κ�',
    shop_order_id         varchar(64)   null comment '���̶������',
    shop_code             varchar(64)   null comment '���̱��',
    order_code            varchar(64)   null comment 'ec�������',
    import_operation_hint varchar(1024) null comment '���붩��ʧ��ԭ��',
    import_time           timestamp     null comment '����ʱ��'
)
    comment '������������µ�����ʱ��';

create table ec_oms_order_waybill
(
    id                   int unsigned auto_increment comment '����Id'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC�������',
    logistics_order_code decimal(30)                                not null comment '������������',
    external_order       varchar(32)                                null comment '��ַ�������',
    waybill_code         varchar(2048)                              null comment '��ݵ��ţ�����ö��Ÿ���',
    send_status          tinyint unsigned default 2                 not null comment '����״̬ @1-����ʧ�� 2-������ 3-������ 4-������ 5-�ѷ��� 6-��ǩ��7-�˻���8-�˻�ʧ��9-�˻سɹ�',
    send_channel         tinyint unsigned                           null comment '��������',
    storehouse_code      int(10)                                    null comment '�ֿ����',
    storehouse_name      varchar(32)                                null comment '�ֿ�����',
    express_code         int unsigned                               null comment '��ݹ�˾����',
    express_name         varchar(32)                                null comment '��ݹ�˾����',
    dispatch_type        tinyint unsigned                           null comment '�������ͣ��ֵ䣺ec_oms_dispatch_type��',
    dispatch_fail_reason varchar(256)                               null comment '����ʧ��ԭ��',
    dispatch_time        timestamp                                  null comment '��������ʱ��',
    dispatch_status      tinyint unsigned                           null comment '����״̬���ֵ䣺ec_oms_dispatch_status��@1-������2-������3-�ѵ���4-����ʧ��',
    delivery_time        timestamp                                  null comment '��������ʱ��',
    receipt_time         timestamp                                  null comment '����ǩ��ʱ��',
    is_bigorder          tinyint unsigned default 0                 not null comment '�Ƿ�󶩵����ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    gross_weight         decimal(10, 3)   default 0.000             null comment 'ë��(kg)',
    update_plat_status   tinyint unsigned default 0                 not null comment '�ش����콢��״̬���ֵ䣺ec_oms_update_plat_status��@0-δ�ش�1-�ش��ɹ�2-�ش�ʧ��  3 �����ش�',
    return_status        tinyint unsigned default 0                 null comment '�˻ص���״̬���ֵ䣺ec_oms_return_status��@0-δ�˻ص���1-�˻ص�����2-�˻ص��ȳɹ�3-�˻ص���ʧ��9-�˻ص��ȳ���',
    is_valid             tinyint unsigned default 1                 not null comment '�Ƿ���Ч���ֵ䣺ec_oms_is_valid��@0-��Ч��1-��Ч',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ͳһ������������ϸ';

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
    id           int unsigned auto_increment comment '����Id'
        primary key,
    order_code   decimal(30) unsigned not null comment 'EC�������',
    waybill_code varchar(30)          null comment '��ݵ���'
)
    comment '������������ݵ��Ź�ϵ��';

create index idx_order_code
    on ec_oms_order_waybill_relation (order_code);

create index idx_waybill_code
    on ec_oms_order_waybill_relation (waybill_code);

create table ec_oms_order_waybill_relation_tmp
(
    id           int unsigned auto_increment comment '����Id'
        primary key,
    order_code   decimal(30) unsigned not null comment 'EC�������',
    waybill_code varchar(30)          null comment '��ݵ���'
)
    comment '������������ݵ��Ź�ϵ��';

create index idx_order_code
    on ec_oms_order_waybill_relation_tmp (order_code);

create index idx_waybill_code
    on ec_oms_order_waybill_relation_tmp (waybill_code);

create table ec_oms_order_waybill_tmp
(
    id                   int unsigned auto_increment comment '����Id'
        primary key,
    order_code           decimal(30) unsigned                       not null comment 'EC�������',
    logistics_order_code decimal(30)                                not null comment '������������',
    external_order       varchar(32)                                null comment '��ַ�������',
    waybill_code         varchar(2048)                              null comment '��ݵ��ţ�����ö��Ÿ���',
    send_status          tinyint unsigned default 2                 not null comment '����״̬ @1-����ʧ�� 2-������ 3-������ 4-������ 5-�ѷ��� 6-��ǩ��7-�˻���8-�˻�ʧ��9-�˻سɹ�',
    send_channel         tinyint unsigned                           null comment '��������',
    storehouse_code      int(10)                                    null comment '�ֿ����',
    storehouse_name      varchar(32)                                null comment '�ֿ�����',
    express_code         int unsigned                               null comment '��ݹ�˾����',
    express_name         varchar(32)                                null comment '��ݹ�˾����',
    dispatch_type        tinyint unsigned                           null comment '�������ͣ��ֵ䣺ec_oms_dispatch_type��',
    dispatch_fail_reason varchar(256)                               null comment '����ʧ��ԭ��',
    dispatch_time        timestamp                                  null comment '��������ʱ��',
    dispatch_status      tinyint unsigned                           null comment '����״̬���ֵ䣺ec_oms_dispatch_status��@1-������2-������3-�ѵ���4-����ʧ��',
    delivery_time        timestamp                                  null comment '��������ʱ��',
    receipt_time         timestamp                                  null comment '����ǩ��ʱ��',
    is_bigorder          tinyint unsigned default 0                 not null comment '�Ƿ�󶩵����ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    gross_weight         decimal(8, 2)    default 0.00              null comment 'ë��(kg)',
    update_plat_status   tinyint unsigned default 0                 not null comment '�ش����콢��״̬���ֵ䣺ec_oms_update_plat_status��@0-δ�ش�1-�ش��ɹ�2-�ش�ʧ��  3 �����ش�',
    return_status        tinyint unsigned default 0                 null comment '�˻ص���״̬���ֵ䣺ec_oms_return_status��@0-δ�˻ص���1-�˻ص�����2-�˻ص��ȳɹ�3-�˻ص���ʧ��9-�˻ص��ȳ���',
    is_valid             tinyint unsigned default 1                 not null comment '�Ƿ���Ч���ֵ䣺ec_oms_is_valid��@0-��Ч��1-��Ч',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ͳһ������������ϸ';

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
    order_id         varchar(30)    not null comment '�ⲿƽ̨���̶�����',
    shop_code        int(8)         not null comment '���̱���',
    original_price   decimal(12, 2) null comment '����ԭ��',
    sale_price       decimal(12, 2) null comment '�����ּ�',
    settlement_price decimal(12, 2) null comment '���������',
    pay_price        decimal(12, 2) null comment '����֧�����',
    welfare_product  decimal(12, 2) null comment '��Ʒ��ƽ̨����',
    welfare_order    decimal(12, 2) null comment '������ƽ̨����',
    outer_sku_id     varchar(8)     not null comment 'EC��Ʒ����',
    sku_id           varchar(30)    null comment '�ⲿ��Ʒ����',
    spu_id           varchar(30)    null comment '�ǻ����۲�SPUID',
    spu_name         varchar(255)   null comment '��Ʒ����',
    quantity         int(8)         null comment '��Ʒ����',
    create_time      timestamp      null comment '����ʱ��',
    update_time      timestamp      null comment '����ʱ��',
    primary key (order_id, outer_sku_id)
);

create table ec_oms_order_youzan_product_detail
(
    tid         varchar(30)     not null comment '����ƽ̨�������',
    oid         bigint unsigned not null comment '�Ӷ������',
    outerItemId varchar(20)     not null comment '��Ʒ�ڲ�����ID',
    itemId      bigint unsigned not null comment '�̼��ⲿID',
    num         int unsigned    null comment '��������',
    price       decimal(10, 2)  null comment '��Ʒ�۸񡣾�ȷ��2λС��',
    payment     decimal(10, 2)  null comment '�Ӷ���ʵ�����',
    primary key (tid, itemId, outerItemId)
)
    comment '���޶�����Ʒ��ϸ��¼��';

create index idx_oid
    on ec_oms_order_youzan_product_detail (oid);

create table ec_oms_order_zhenkunhang_product_detail
(
    purchase_order_id varchar(30)  not null comment '������ƽ̨�ɹ�����',
    plan_item_number  varchar(30)  null comment '�ƻ��к�',
    item_line_number  varchar(30)  null comment '�����к�',
    material_describe varchar(255) null comment '���Ϻ�����	',
    unit              varchar(10)  null comment '��λ',
    number            int(8)       null comment '�ƻ���������	',
    zkh_sku           varchar(30)  not null comment '���Ϻ�',
    oms_sku           varchar(30)  not null comment '��Ʒ����',
    primary key (purchase_order_id, oms_sku, zkh_sku)
);

create table ec_oms_package_issue_base
(
    package_issue_code int unsigned                               not null comment '����������'
        primary key,
    package_issue_name varchar(50)                                not null comment '��������',
    issue_subject_code int unsigned                               null comment 'һ������������',
    issue_type_code    int unsigned                               null comment '��������������',
    sort               int unsigned     default 0                 not null comment '����',
    is_frozen          tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    creator_id         int                                        null comment '�����˱��',
    creator_name       varchar(32)                                null comment '����������',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id        int                                        null comment '�����˱��',
    operator_name      varchar(32)                                null comment '����������',
    last_update_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    constraint idx_package_issue_name
        unique (package_issue_name) comment '��������'
)
    comment '��������������';

create index idx_type_code
    on ec_oms_package_issue_base (issue_type_code)
    comment '������������';

create table ec_oms_package_issue_handle_method
(
    id                 int unsigned auto_increment comment '��������'
        primary key,
    package_issue_code int unsigned                           not null comment '����������',
    receive_status     tinyint unsigned                       not null comment 'Ӧ�ÿͻ��ջ�������ֵ�ec_oms_packege_issue_receive_status 1-δ�յ��� 2-���յ��� 3-�Ѿ��գ�',
    handle_method      tinyint unsigned                       not null comment '����ʽ���ֵ�ec_oms_package_issue_handle_method 1-��ϵ��ݺ�ʵ 2-�ߴٿ������ 3-Ҫ���ͻ����� 4-�����˿�� 5-�����Ʒ���� 6-�����˿�� 7-���� 8-���� 9-������',
    tips               varchar(200) default ''                not null comment '����ʽ������ʾ�İ�',
    sort               int unsigned                           not null comment '����',
    creator_id         int                                    null comment '�����˱��',
    creator_name       varchar(32)                            null comment '����������',
    create_time        timestamp    default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�������⴦��ʽ';

create index idx_code_status
    on ec_oms_package_issue_handle_method (package_issue_code, receive_status)
    comment '���������ݱ������';

create table ec_oms_package_issue_info
(
    id                 int unsigned auto_increment comment '����id'
        primary key,
    package_issue_code int unsigned                           not null comment '����������',
    receive_status     tinyint unsigned                       not null comment 'Ӧ�ÿͻ��ջ�������ֵ�ec_oms_package_issue_receive_status 1-δ�յ��� 2-���յ��� 3-�Ѿ��գ�',
    tips               varchar(200) default ''                not null comment '��������������ʾ�İ�',
    creator_id         int                                    null comment '�����˱��',
    creator_name       varchar(32)                            null comment '����������',
    create_time        timestamp    default CURRENT_TIMESTAMP null comment '����ʱ��',
    constraint idx_unique
        unique (package_issue_code, receive_status) comment '�ջ�״̬����'
)
    comment '����������Ϣ';

create table ec_oms_pdd_refund_config
(
    id                        int unsigned auto_increment comment 'id'
        primary key,
    config_status             tinyint unsigned default 1                 not null comment '�Զ�PDD�˿��@1-������0-�ر�',
    shop_codes                varchar(2048)    default ''                not null comment '���̱�ţ�������Ÿ���',
    plat_order_status         varchar(512)                               null comment 'ƽ̨/���̶���״̬��������Ÿ������ֵ䣺ec_oms_plat_order_status��',
    order_status              varchar(65)                                not null comment '����״̬���ֵ䣺ec_oms_order_status��0-��������1-���ύ��2��ɾ����3������4��ȡ����5���󵥡�6���ִ��󵥡�7���˻ص��ȡ�8���ִ��˻ص��ȡ�9�����ȡ�10���ִ����ȡ�11��������12���ִ�������13�����С�14���ַ����С�15�ѷ�����16�����ѷ�����17��ǩ�ա�18������ǩ�ա�19���׳ɹ���20���ֽ��׳ɹ���99������',
    is_bigorder               tinyint unsigned default 0                 not null comment '�Ƿ�󶩵����ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    auto_add_present_status   tinyint unsigned default 0                 not null comment '�����Ƿ��Զ��������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    aftersale_status          tinyint unsigned default 0                 not null comment '�ۺ���״̬���ֵ䣺ec_oms_aftersale_status��@0-δ����1-������2-�Ѵ���',
    is_exc                    tinyint unsigned default 0                 not null comment '�Ƿ��쳣���ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    issue_subject_code        int unsigned                               null comment 'һ�������ţ�������ec_oms_issue_subject_base.issue_subject_code��',
    issue_type_code           int unsigned                               null comment '���������ţ�������ec_oms_issue_type_base.issue_type_code��',
    issue_reason_code         int unsigned                               null comment '����ԭ���ţ�������ec_oms_issue_reason_base.issue_reason_code��',
    default_responsible_party tinyint unsigned default 0                 null comment 'Ĭ�����η����ֵ䣺ec_oms_default_responsible_party��@1- ��������2-��ݹ�˾��3-�ͻ�',
    oper_user_id              int unsigned                               null comment '������ID',
    oper_user_name            varchar(32)                                null comment '����������',
    oper_time                 timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ƴ����˿�������Ϣ��¼��';

create table ec_oms_plat_address_modify_record
(
    shop_order_id          varchar(64)                                not null comment '���̶������'
        primary key,
    shop_code              int(10)                                    null comment '���̱��',
    province               varchar(32)                                null comment '�ջ���ʡ��',
    city                   varchar(32)                                null comment '�ջ��˳���',
    district               varchar(32)                                null comment '�ջ�������',
    town                   varchar(32)                                null comment '�ջ��˳���',
    village                varchar(32)                                null comment '����/��',
    address                varchar(255)                               null comment '�ջ�����ϸ��ַ',
    address_cipher         varchar(1024)                              null comment '�ջ�����ϸ��ַ',
    post_code              varchar(10)                                null comment '��������',
    receiver_name          varchar(32)      default ''                not null comment '�ջ�������',
    receiver_name_cipher   varchar(152)                               null comment '�ջ�������',
    receiver_phone         varchar(32)                                null comment '�ջ��˵绰',
    receiver_phone_cipher  varchar(152)                               null comment '�ջ��˵绰',
    oaid                   varchar(500)                               null comment '��è������',
    receiver_name_orginal  varchar(255)                               null comment 'ԭ�ջ�������',
    receiver_phone_orginal varchar(255)                               null comment 'ԭ�ֻ���',
    address_orginal        varchar(255)                               null comment 'ԭ��ϸ��ַ',
    province_orginal       varchar(32)                                null comment 'ԭʡ��',
    city_orginal           varchar(32)                                null comment 'ԭ����',
    district_orginal       varchar(32)                                null comment 'ԭ����',
    town_orginal           varchar(32)                                null comment 'ԭ����',
    village_orginal        varchar(32)                                null comment 'ԭ����/��',
    post_code_orginal      varchar(10)                                null comment 'ԭ��������',
    oaid_orginal           varchar(500)                               null comment 'ԭoaid',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag               tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ƽ̨��ַ�޸ļ�¼��';

create table ec_oms_plat_api_measure
(
    id          int(10) auto_increment comment '����id'
        primary key,
    api_name    varchar(256) null comment 'api����',
    create_date timestamp    not null on update CURRENT_TIMESTAMP comment '����ʱ��'
)
    comment '�ⲿAPI����Ƶ�ʱ�';

create table ec_oms_plat_api_measure_config
(
    api_name                 varchar(256)   not null comment 'api����'
        primary key,
    shop_code                varchar(256)   null comment '���̱��',
    charge_standard          decimal(12, 4) null comment '�շѱ�׼��Ԫ/�Σ�',
    max_call_count_one_day   int(10)        null comment '1����������ֵ',
    max_call_count_one_week  int(10)        null comment '1�ܵ��������ֵ',
    max_call_count_one_month int(10)        null comment '1���µ��������ֵ',
    create_date              timestamp      not null on update CURRENT_TIMESTAMP comment '����ʱ��'
)
    comment '�ⲿAPI������ñ�';

create table ec_oms_plat_authorization_config
(
    shop_code   int(10)      not null comment '���̱��'
        primary key,
    shop_type   varchar(32)  null comment '��������',
    plat_params varchar(128) null comment '��ȡcode��ƽ̨����'
)
    comment 'ƽ̨��Ȩ���ñ�';

create table ec_oms_plat_callback_monitor_config
(
    shop_code                   bigint     not null comment '���̱��',
    max_callback_count_one_hour int(10)    null comment '1Сʱ�ش�ʧ�������ֵ',
    max_callback_count_one_day  int(10)    null comment '1��ش�ʧ�������ֵ',
    create_date                 timestamp  not null on update CURRENT_TIMESTAMP comment '����ʱ��',
    callback_type               tinyint(3) not null comment '�ش�����  1������  2����Ʊ',
    primary key (shop_code, callback_type)
)
    comment '����/��Ʊ�ش�ʧ�ܼ�����ñ�';

create table ec_oms_plat_change_plan
(
    shop_code         int(10)                   not null comment '���̱��'
        primary key,
    shop_english_code varchar(32)               not null comment '����Ӣ�ı���',
    ec_start_time     datetime                  not null comment 'ec��ϵͳ��ʼʱ��',
    del_flag          tinyint unsigned zerofill not null comment 'ɾ����־'
)
    comment 'ƽ̨�л��ƻ�';

create table ec_oms_plat_change_plan_pre
(
    shop_code         int(10)                   not null comment '���̱��'
        primary key,
    shop_english_code varchar(32)               not null,
    ec_start_time     datetime                  not null comment 'ec��ϵͳ��ʼʱ��',
    del_flag          tinyint unsigned zerofill not null comment 'ɾ����־'
)
    comment 'ƽ̨�л��ƻ�';

create table ec_oms_plat_city_code_mapping
(
    id        int(10) auto_increment comment '����id'
        primary key,
    shop_code int(10)     not null comment '���̱���',
    city      varchar(64) null comment '����',
    city_code int(10)     null comment '���б���'
)
    comment '���д���ӳ���';

create table ec_oms_plat_district_code_mapping
(
    id            int(10) auto_increment comment '����id'
        primary key,
    shop_code     int(10)     not null comment '���̱���',
    district      varchar(64) null comment '����',
    district_code int(10)     null comment '���ر���'
)
    comment '���ش���ӳ���';

create table ec_oms_plat_doudian_push_message
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    shop_code        int unsigned                               not null comment '���̱��',
    tag              smallint(255) unsigned                     not null comment '��Ϣ����',
    msg_id           varchar(64)                                null comment '��Ϣ��¼ID',
    data             json                                       null comment '��Ϣ��',
    is_handle        tinyint unsigned default 0                 null comment '�Ƿ����˸����� 0 δ����  1 ����ɹ� 2 ����ʧ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '����������Ϣ';

create table ec_oms_plat_express_company_code
(
    id                int unsigned auto_increment comment '����id'
        primary key,
    express_code      int unsigned null comment 'ec_oms��ݹ�˾����',
    plat_shop_code    int unsigned null comment 'ƽ̨����',
    plat_company_code varchar(20)  null comment 'ƽ̨��ݹ�˾����',
    plat_company_name varchar(20)  null comment 'ƽ̨��ݹ�˾����'
)
    comment '�����ش�ƽ̨��ݹ�˾����ת������';

create index Index_2
    on ec_oms_plat_express_company_code (id, express_code, plat_shop_code);

create index Index_express_shop
    on ec_oms_plat_express_company_code (express_code);

create table ec_oms_plat_huihong_mapping
(
    id            int(10) auto_increment comment '����id'
        primary key,
    shop_order_id varchar(64)          null comment '���̶������',
    outter_id     varchar(64)          null comment '�ⲿƽ̨��Ʒid',
    line_id       varchar(64)          null comment '�����к�',
    is_mark       tinyint(3) default 0 not null comment '�Ƿ���  0-��  1-��  Ĭ�Ϸ�'
)
    comment '���ƽ̨ӳ���';

create table ec_oms_plat_jdgongxiao_code_mapping
(
    shop_order_id varchar(64) not null comment '���̶���id'
        primary key,
    purchase_id   varchar(64) not null comment '�ɹ���id',
    trade_no      varchar(64) not null comment 'ҵ����ˮ�ţ�uuid���ṩ�������Ų�������'
);

create table ec_oms_plat_order_decrypt_data
(
    order_code                       decimal(32) unsigned                not null comment '�������'
        primary key,
    shop_order_id                    varchar(32)                         not null comment '�ⲿƽ̨�������',
    shop_code                        int unsigned                        not null comment '���̱��',
    address_decrypted                varchar(255)                        null comment '��ַ����',
    address_decrypted_cipher         varchar(1024)                       null comment '��ַ����',
    receiver_name_decrypted          varchar(32)                         null comment '�ռ�������',
    receiver_name_decrypted_cipher   varchar(152)                        null comment '�ռ�������',
    receiver_mobile_decrypted        varchar(20)                         null comment '�ռ����ֻ�����',
    receiver_mobile_decrypted_cipher varchar(88)                         null comment '�ռ����ֻ�����',
    create_time                      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    decrypt_time                     timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '����������Ϣ';

create index idx_ct
    on ec_oms_plat_order_decrypt_data (create_time);

create index ind_pri
    on ec_oms_plat_order_decrypt_data (shop_order_id, shop_code);

create table ec_oms_plat_order_encrypt_data
(
    shop_order_id                    varchar(32)                                not null comment '�ⲿƽ̨�������',
    shop_code                        int unsigned                               not null comment '���̱��',
    order_code                       decimal(32) unsigned                       not null comment '�������'
        primary key,
    address_encrypted                varchar(2000)                              null comment '��ַ����',
    receiver_name_encrypted          varchar(1024)                              null comment '�ռ�����������',
    receiver_mobile_encrypted        varchar(1024)                              null comment '�ռ����ֻ�����',
    address_decrypted                varchar(255)                               null comment '��ַ����',
    address_decrypted_cipher         varchar(1024)                              null comment '��ַ����',
    receiver_name_decrypted          varchar(32)                                null comment '�ռ�������',
    receiver_name_decrypted_cipher   varchar(152)                               null comment '�ռ�������',
    receiver_mobile_decrypted        varchar(20)                                null comment '�ռ����ֻ�����',
    receiver_mobile_decrypted_cipher varchar(88)                                null comment '�ռ����ֻ�����',
    decrypted_time                   timestamp                                  null comment '����ʱ��',
    create_time                      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time                 timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    is_use                           tinyint unsigned default 1                 null comment '�Ƿ�Ӧ�øü������ĺͽ�������  1 ʹ�� 0 ��ʹ��',
    decrypted_status                 tinyint(3)       default 0                 null comment '����״̬(0-δ����,1-���ܳɹ�,2-����ʧ��)',
    plat_name                        varchar(20)                                null comment 'ƽ̨��������',
    oaid                             varchar(500)                               null comment '��è������',
    sid                              varchar(3000)                              null comment '����������',
    decrypt_type                     tinyint(4) unsigned                        null comment '���ܷ�ʽ 1�˹����� 2�Զ�����',
    decrypt_amt                      tinyint unsigned default 0                 null comment '���ܴ���'
)
    comment '����������Ϣ';

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
    shop_order_id          varchar(64)                                not null comment 'EC�������',
    shop_code              int unsigned                               not null comment '������Դ���',
    plat_response          mediumtext                                 null comment '��������',
    plat_create_time       timestamp                                  null comment 'ƽ̨��������ʱ��',
    plat_update_time       timestamp                                  null comment 'ƽ̨��������ʱ��',
    plat_pay_time          timestamp                                  null comment 'ƽ̨��������ʱ��',
    ec_oms_create_time     timestamp        default CURRENT_TIMESTAMP not null comment '���Ĵ���ʱ��',
    ec_oms_update_time     timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '���ĸ���ʱ��',
    update_delivery_status tinyint unsigned default 0                 null comment '�ش�����״̬ 0-δ�ش� 1-�ѻش�',
    primary key (shop_order_id, shop_code)
)
    comment '������ƽ̨����ԭʼ���ݱ�';

create index idx_ec_plat_order_record_plat_pay_time
    on ec_oms_plat_order_record (plat_pay_time);

create table ec_oms_plat_order_record_original
(
    shop_order_id      varchar(64)                         not null comment '�ⲿ�������',
    shop_code          int unsigned                        not null comment '������Դ���',
    plat_response      mediumtext                          null comment '��������',
    ec_oms_create_time timestamp default CURRENT_TIMESTAMP not null comment '���Ĵ���ʱ��',
    primary key (shop_order_id, shop_code)
)
    comment '������ƽ̨����ԭʼ���ݱ�����ˮ��';

create table ec_oms_plat_order_record_tmall_presale
(
    tid          bigint unsigned                     not null comment '��è����ID'
        primary key,
    status       varchar(32)                         null comment '��è����״̬
            ��ѡֵ:TRADE_NO_CREATE_PAY(û�д���֧��������)��WAIT_BUYER_PAY(�ȴ���Ҹ���)��WAIT_SELLER_SEND_GOODS(�ȴ����ҷ���,��:����Ѹ���)��WAIT_BUYER_CONFIRM_GOODS(�ȴ����ȷ���ջ�,��:�����ѷ���)��TRADE_BUYER_SIGNED(�����ǩ��,��������ר��)��TRADE_FINISHED(���׳ɹ�)��TRADE_CLOSED(�����Ժ��û��˿�ɹ��������Զ��ر�)��TRADE_CLOSED_BY_TAOBAO(������ǰ�����һ���������رս���)��PAY_PENDING(�������ÿ�֧������ȷ����)',
    type         varchar(32)                         null comment '��è��������
            ��ѡֵ: fixed(һ�ڼ�) auction(����) guarantee_trade(һ�ڼۡ�����) auto_delivery(�Զ�����) independent_simple_trade(�������Ű潻��) independent_shop_trade(�����׼�潻��) ec(ֱ��) cod(��������) fenxiao(����) game_equipment(��Ϸװ��) shopex_trade(ShopEX����) netcn_trade(��������) external_trade(ͳһ�ⲿ����)o2o_offlinetrade��O2O���ף�step (������)nopaid(�޸����)pre_auth_type(Ԥ��Ȩ0Ԫ��������)',
    seller_nick  varchar(32)                         null comment '�����ǳ�',
    buyer_nick   varchar(32)                         null comment '����ǳ�',
    jdp_hashcode varchar(64)                         null comment '���ݱ�־',
    jdp_response mediumtext                          null comment '��������',
    jdp_created  timestamp                           null comment '��è��������ʱ��',
    jdp_modified timestamp                           null comment '��è�����޸�ʱ��',
    created      timestamp default CURRENT_TIMESTAMP not null comment '��¼����ʱ��',
    modified     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '��¼����ʱ��'
)
    comment '��èԭʼ�A�۶���';

create table ec_oms_plat_order_repeat_alarm
(
    id            int auto_increment comment '����id'
        primary key,
    shop_order_id varchar(64)                         not null comment '�ⲿƽ̨�������',
    plat_pay_time timestamp                           null comment '����ʱ��/������ʼʱ��',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    constraint uniq_shop_ord_pay
        unique (shop_order_id, plat_pay_time)
)
    comment 'ƽ̨�����ظ��жϱ�';

create table ec_oms_plat_pddgongxiao_code_mapping
(
    shop_order_id varchar(64) not null comment '���̶������'
        primary key,
    plat_shop_id  varchar(64) not null comment '������ƽ̨����ID'
)
    comment 'ƴ��๩��ƽ̨��������ӳ���';

create table ec_oms_plat_product_detail
(
    plat_product_id           int unsigned auto_increment comment '����Id'
        primary key,
    order_code                decimal(30) unsigned                       not null comment 'EC�������',
    shop_order_id             varchar(64)                                null comment '�ⲿƽ̨�������',
    shop_code                 int                                        null comment 'ƽ̨��Դ',
    product_code              bigint unsigned                            null comment '��Ʒ���',
    shop_pro_name             varchar(255)                               null comment '��Ʒ��',
    buy_num                   int(10)                                    null comment '��������',
    pro_type                  tinyint unsigned                           null comment '��Ʒ���ͣ�1-��Ʒ��2-�ײͣ�3-������Ʒ��',
    outter_id                 varchar(64)                                null comment '��Ʒ���ID',
    is_present                tinyint unsigned default 0                 null comment '�Ƿ�����Ʒ���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    pro_one_price             decimal(14, 4)   default 0.0000            null comment '��Ʒ����',
    pro_all_price             decimal(14, 4)   default 0.0000            null comment '���۽��',
    pro_shop_discount_amt     decimal(14, 4)   default 0.0000            null comment '���̳е���Ʒ�Żݽ��',
    pro_plat_discount_amt     decimal(14, 4)   default 0.0000            null comment 'ƽ̨�е���Ʒ�Żݽ��',
    pro_pay_amt               decimal(14, 4)   default 0.0000            null comment '��Ʒʵ�����',
    order_shop_discount_share decimal(12, 2)   default 0.00              not null comment '���̳е������Żݡ���̯��',
    order_plat_discount_share decimal(12, 2)   default 0.00              not null comment 'ƽ̨�е������Żݡ���̯��',
    shop_discount_amt         decimal(12, 2)   default 0.00              not null comment '�����Ż�',
    plat_discount_amt         decimal(12, 2)   default 0.00              not null comment 'ƽ̨�Ż�',
    shipment                  decimal(12, 2)   default 0.00              not null comment '�˷�',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    delivery_actual_num       int unsigned     default 0                 null comment '�ѻش���������',
    del_flag                  tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment 'ƽ̨������Ʒ��ϸ��';

create index Index_ordcode
    on ec_oms_plat_product_detail (order_code, product_code);

create index Index_shop
    on ec_oms_plat_product_detail (shop_order_id, shop_code);

create index idx_luptime
    on ec_oms_plat_product_detail (last_update_time);

create table ec_oms_plat_province_code_mapping
(
    id            int(10) auto_increment comment '����id'
        primary key,
    shop_code     int(10)     not null comment '���̱���',
    province      varchar(64) null comment 'ʡ��',
    province_code int(10)     null comment 'ʡ�ݱ���'
)
    comment 'ʡ����ӳ���';

create table ec_oms_plat_purchase_order
(
    purchase_id      int(11) unsigned auto_increment comment '�ɹ���id'
        primary key,
    shop_order_id    varchar(100)                        null comment '�ɹ�����(���̶������)',
    business_type    tinyint                             null comment '����ҵ�����ͣ��ֵ䣺ec_oms_business_type��@1-��ͨ������2-���۶�����3-����������4-��ʱ���۶���',
    shop_code        int(11) unsigned                    null comment '���̱��',
    client_code      varchar(16)                         null comment '�ͻ����',
    po_type          tinyint unsigned                    null comment '�������� 10-��ͨ ֱ?��70-�����',
    plat_start_time  timestamp                           null comment '�ɹ�����������',
    purchase_contact varchar(32)                         null comment '�ɹ���ϵ��',
    buyer_message    varchar(500)                        null comment '�������',
    seller_message   varchar(500)                        null comment '���ұ�ע',
    create_time      timestamp default CURRENT_TIMESTAMP null comment 'ec����ʱ��',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    constraint ind_pri
        unique (shop_code, shop_order_id)
)
    comment '�ɹ�����Ϣ';

create table ec_oms_plat_purchase_order_detail
(
    purchase_detail_id int(11) unsigned auto_increment comment '�ɹ�����ϸid'
        primary key,
    purchase_id        int(11) unsigned null comment '�����ɹ���id',
    product_code       varchar(100)     null comment '��Ʒ���',
    plat_product_code  varchar(100)     null comment '�ⲿ��Ʒ���',
    barcode            varchar(255)     null comment '������',
    shop_pro_name      varchar(512)     null comment '��Ʒ����',
    pro_one_price      decimal(14, 4)   null comment '��Ʒ����(����)',
    buy_num            decimal(11, 4)   null comment '�ɹ�����',
    constraint idx_pro_plat
        unique (purchase_id, product_code, plat_product_code)
)
    comment '�ɹ�����ϸ��Ϣ';

create table ec_oms_plat_receipt
(
    receipt_id         int(11) unsigned auto_increment comment '�ջ���id'
        primary key,
    shop_order_id      varchar(100)                                  null comment 'ƽ̨�������',
    shop_code          int(11) unsigned                              null comment '���̱��',
    received_code      varchar(100)                                  null comment '�ջ�����',
    purchase_time      timestamp                                     null comment '�ɹ�ʱ��',
    received_time      timestamp                                     null comment '�ջ�ʱ��',
    receipt_start_time timestamp                                     null comment '�ջ�������ʱ��',
    purchase_contact   varchar(32)                                   null comment '�ɹ���ϵ��',
    po_type            smallint unsigned                             null comment '�������� è�� 10-��ͨ ֱ?��70-��� ��',
    handle_status      tinyint(4) unsigned default 0                 null comment '����״̬(0��δ����,1������ɹ�,2������ʧ��)',
    create_time        timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time   timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    constraint ind_pri
        unique (shop_code, received_code)
)
    comment '���͵�sap���ջ���';

create table ec_oms_plat_receipt_detail
(
    receipt_detail_id int(11) unsigned auto_increment comment '�ջ�����ϸid'
        primary key,
    receipt_id        int(11) unsigned                                null comment '��Ӧ���ջ���id',
    product_code      int(11) unsigned                                null comment '��Ʒ���',
    plat_product_code varchar(100)                                    null comment 'ƽ̨��Ʒ���',
    received_qty      decimal(11, 4) unsigned                         null comment '�ջ�����',
    barcode           varchar(255)                                    null comment '������ è��',
    handle_status     tinyint(255) unsigned default 0                 null comment '����״̬  0 δ����  1 ����ɹ�  2 ����ʧ��',
    create_time       timestamp             default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time  timestamp             default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    constraint idx_pro_plat
        unique (receipt_id, product_code, plat_product_code)
)
    comment '���͵�sap�Ĳɹ���/��������ϸ';

create table ec_oms_plat_refund_record
(
    shop_order_id      varchar(64)                         not null comment '�ⲿƽ̨���',
    shop_code          int unsigned                        not null comment '������Դ���',
    shop_refund_id     varchar(64)                         not null comment '�˿�����',
    plat_status        varchar(32)                         null comment 'ƽ̨�˿״̬',
    plat_response      mediumtext                          null comment '�˿������',
    plat_update_time   timestamp                           null comment 'ƽ̨�˿����ʱ��',
    plat_apply_time    timestamp                           null comment 'ƽ̨���������˿�ʱ��',
    ec_oms_create_time timestamp default CURRENT_TIMESTAMP not null comment '���Ĵ���ʱ��',
    ec_oms_update_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '���ĸ���ʱ��',
    primary key (shop_order_id, shop_code, shop_refund_id)
)
    comment '������ƽ̨�ۺ󶩵�ԭʼ���ݱ� ������¼��';

create index Index_1
    on ec_oms_plat_refund_record (shop_order_id, shop_code);

create index idx_ec_plat_order_record_plat_apply_time
    on ec_oms_plat_refund_record (plat_apply_time);

create table ec_oms_plat_suning_receipt_detail_order
(
    received_code         varchar(32)                         not null comment '�����ջ����š������ջ�����',
    shop_code             int(10)                             null comment '���̱��',
    reject_qty            decimal(14, 4)                      null comment '������������������',
    received_item         varchar(32)                         not null comment '�����ջ����кš������ջ����к�',
    order_item            varchar(32)                         null comment '�ɹ������кš��ɹ������к�',
    rcpt_qty              decimal(14, 4)                      null comment 'ʵ��������ʵ������',
    supplier_product_code varchar(32)                         null comment '��Ӧ����Ʒ���롣��Ӧ����Ʒ����',
    sn_product_code       varchar(32)                         null comment '�����Ĳ�Ʒ���',
    create_time           timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time      timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    is_handle             tinyint   default 0                 null comment '�Ƿ�������sap',
    barcode               varchar(256)                        null comment '������',
    primary key (received_code, received_item)
)
    comment '�ջ�������������';

create table ec_oms_plat_suning_receipt_order
(
    received_code    varchar(32)                         not null comment '�����ջ����š������ջ�����'
        primary key,
    co_code          varchar(32)                         null comment '��������������',
    sn_order_code    varchar(32)                         null comment '�ɹ������š��ɹ�������',
    shop_code        int(10)                             null,
    order_type       varchar(32)                         null comment '�ɹ��������͡��ɹ���������',
    received_date    timestamp                           null on update CURRENT_TIMESTAMP comment '�����ջ����ڡ������ջ�����',
    store_code       varchar(32)                         null comment '�����ŵ�⡣�����ŵ��',
    supplier_code    varchar(32)                         null comment '��Ӧ�̱���',
    vendor_ref_no    varchar(32)                         null comment '��Ӧ�̷��������š���Ӧ�̷���������',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    is_handle        tinyint   default 0                 null comment '�Ƿ��ѻش�sap'
)
    comment '�����ջ���ͷ����Ϣ����';

create table ec_oms_plat_tmall_invoice_apply_log
(
    id               int unsigned auto_increment comment '��������'
        primary key,
    shop_order_id    varchar(64)                                null comment '�ⲿƽ̨������',
    shop_code        int unsigned                               null comment 'ƽ̨���',
    handle_status    tinyint unsigned default 0                 null comment '����״̬(1 �ɹ�,0ʧ��)',
    apply            mediumtext                                 null comment '��Ʊ��Ϣ',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��è��Ʊ����ǼǼ�¼';

create table ec_oms_plat_tmall_packages_delivery
(
    id                     int(10) auto_increment comment '����ID'
        primary key,
    waybill_code           varchar(1024)                        null comment '��ݵ���',
    order_code             decimal(30)                          null comment 'EC�������',
    company_code           varchar(256)                         null comment '��ݹ�˾����',
    tid                    bigint                               null comment '��èƽ̨�������',
    oid                    bigint                               null comment '�Ӷ������',
    import_type            tinyint(3)                           null comment '�ش����� 1-���������2-��Ʒ��3-����',
    shop_code              int(10)                              null comment '���̱��',
    update_delivery_status tinyint(3) default 0                 null comment '�����֪ͨ�ش�����״̬ 0-δ�ش� 1-�ѻش� 2-ʧ��',
    create_time            timestamp  default CURRENT_TIMESTAMP null comment '��¼����ʱ��',
    last_update_time       timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��è�����֪ͨ�ش���';

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
    shop_order_id               varchar(64)                                not null comment '���̶�����ţ���Ϊ�ϵ�����ΪEC�������(order_code)',
    shop_code                   int unsigned                               not null comment '������Դ���',
    plat_order_status           varchar(64)                                null comment '�Ա�����״̬���ֵ䣺ec_oms_plat_order_status��',
    breed_num                   tinyint unsigned default 0                 null comment 'Ʒ����',
    pro_total_num               int unsigned     default 0                 null comment '������',
    gross_weight                decimal(10, 3)   default 0.000             null comment 'ë��(kg)',
    buyer_nick                  varchar(64)                                null comment '����ǳ�/ID',
    has_buyer_message           tinyint unsigned default 0                 null comment '�Ƿ���������ԣ��ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    buyer_message               varchar(1024)                              null comment '�����������',
    seller_message              varchar(1024)                              null comment '���ұ�ע',
    country                     varchar(32)                                null comment '�ջ��˹���',
    province                    varchar(32)                                null comment '�ջ���ʡ��',
    city                        varchar(32)                                null comment '�ջ��˳���',
    district                    varchar(32)                                null comment '�ջ�������',
    town                        varchar(32)                                null comment '�ջ��˳���',
    village                     varchar(32)                                null comment '����/��',
    address                     varchar(255)                               null comment '�ջ�����ϸ��ַ',
    address_cipher              varchar(1024)                              null comment '�ջ�����ϸ��ַ',
    post_code                   varchar(10)                                null comment '��������',
    receiver_name               varchar(32)      default ''                not null comment '�ջ�������',
    receiver_name_cipher        varchar(152)                               null comment '�ջ�������',
    receiver_mobile             varchar(15)                                null comment '�ջ����ֻ�',
    receiver_mobile_cipher      varchar(64)                                null comment '�ջ����ֻ�',
    receiver_phone              varchar(32)                                null comment '�ջ��˹̶��绰',
    receiver_phone_cipher       varchar(152)                               null comment '�ջ��˹̶��绰',
    order_all_price             decimal(14, 4)   default 0.0000            not null comment '�����ܽ��',
    order_shop_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment '���̳е���Ʒ���Żݽ��',
    order_plat_pro_discount_amt decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е���Ʒ���Żݽ��',
    order_shop_discount_amt     decimal(14, 4)   default 0.0000            not null comment '���̳е������Ż�',
    order_plat_discount_amt     decimal(14, 4)   default 0.0000            not null comment 'ƽ̨�е������Ż�',
    order_pro_pay_amt           decimal(14, 4)   default 0.0000            not null comment '��Ʒʵ���ܽ��',
    order_pay_amt               decimal(14, 4)   default 0.0000            not null comment '����ʵ�����',
    order_received_amt          decimal(14, 4)   default 0.0000            not null comment '����ʵ�ս��',
    order_all_shipment          decimal(14, 4)   default 0.0000            not null comment '�������ʷ�',
    pro_codes                   varchar(1024)                              null comment '��Ʒ��ţ���,"�ָ',
    shop_pro_name               varchar(2048)                              null comment '����Ʒ����"||"�ָ���',
    step_trade_status           varchar(32)                                null comment '�ֽ׶θ���Ķ���״̬�����������Ŷ����ȣ���Ŀǰ��������״̬FRONT_NOPAID_FINAL_NOPAID(����δ��β��δ��)��FRONT_PAID_FINAL_NOPAID(�����Ѹ�β��δ��)��FRONT_PAID_FINAL_PAID(�����β���)',
    taobao_order_type           varchar(32)                                null comment '�Ա�������������',
    good_sku                    varchar(1024)    default ''                null comment '��ƷSKU',
    plat_start_time             timestamp                                  not null comment '�ⲿƽ̨��������ʱ��',
    plat_end_time               timestamp                                  null comment '�ⲿƽ̨��������ʱ��',
    plat_pay_time               timestamp                                  null comment '�ⲿƽ̨����֧��ʱ��',
    plat_update_time            timestamp                                  null comment '�ⲿƽ̨�����޸�ʱ��',
    create_time                 timestamp        default CURRENT_TIMESTAMP null comment '��¼����ʱ��',
    last_update_time            timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                    tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    creator_id                  int unsigned                               null comment '�����˱��',
    creator_name                varchar(32)      default ''                not null comment '����������',
    primary key (shop_order_id, shop_code)
)
    comment 'ͳһ��èԤ�۶�����';

create index idx_crt
    on ec_oms_plat_tmall_presale_order (create_time);

create index idx_order_shop_order_id
    on ec_oms_plat_tmall_presale_order (shop_order_id, shop_code);

create table ec_oms_plat_tmall_presale_product_detail
(
    plat_product_id       int unsigned auto_increment comment '����Id'
        primary key,
    shop_order_id         varchar(64)                                null comment '�ⲿƽ̨�������',
    shop_code             int                                        null comment 'ƽ̨��Դ',
    product_code          bigint unsigned                            null comment '��Ʒ���',
    shop_pro_name         varchar(255)                               null comment '��Ʒ��',
    buy_num               int(10)                                    null comment '��������',
    pro_type              tinyint unsigned                           null comment '��Ʒ���ͣ�1-��Ʒ��2-�ײͣ�3-������Ʒ��',
    outter_id             varchar(32)                                null comment '��Ʒ���ID',
    pro_one_price         decimal(14, 4)   default 0.0000            null comment '��Ʒ����',
    pro_all_price         decimal(14, 4)   default 0.0000            null comment '���۽��',
    pro_shop_discount_amt decimal(14, 4)   default 0.0000            null comment '���̳е���Ʒ�Żݽ��',
    pro_plat_discount_amt decimal(14, 4)   default 0.0000            null comment 'ƽ̨�е���Ʒ�Żݽ��',
    pro_pay_amt           decimal(14, 4)   default 0.0000            null comment '��Ʒʵ�����',
    last_update_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag              tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��èԤ�۶�����Ʒ��ϸ��';

create index Index_shop
    on ec_oms_plat_tmall_presale_product_detail (shop_order_id, shop_code);

create table ec_oms_plat_tmall_tmc_message
(
    id               bigint unsigned                            not null comment '��ϢID'
        primary key,
    topic            varchar(64)                                null comment '��Ϣ��������',
    pub_time         timestamp                                  null comment '��Ϣ����ʱ��',
    outgoing_time    timestamp                                  null comment '��ʱδ֪����',
    user_id          bigint unsigned                            null comment '��Ϣ�������û����',
    user_nick        varchar(50)                                null comment '�û����ǳ�',
    data_id          varchar(50)                                null comment '�������tid',
    content          mediumtext                                 null comment '��Ϣ��������',
    message          mediumtext                                 null comment '���յ�����Ϣ����',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    ec_handle_status tinyint unsigned default 0                 null comment 'ec����״̬'
)
    comment '��è���͵���Ϣ�����б�';

create index idx_dataid
    on ec_oms_plat_tmall_tmc_message (data_id);

create index idx_lst
    on ec_oms_plat_tmall_tmc_message (last_update_time);

create index idx_topic_sellernick
    on ec_oms_plat_tmall_tmc_message (topic, user_nick);

create table ec_oms_plat_token_info
(
    id                      int unsigned auto_increment comment '���'
        primary key,
    shop_code               int                    not null comment 'ƽ̨��Դ',
    shop_name               varchar(32)            null comment 'ƽ̨����',
    client_code             varchar(15) default '' null comment '��ͻ����',
    app_key                 varchar(64) default '' null comment '��Ȩappkey',
    app_secret              varchar(64) default '' null comment '��ȨappSecret',
    access_token            varchar(128)           null comment '�ӿ���Ȩ����',
    refresh_token           varchar(128)           null comment '�ӿ�ˢ����Ȩ����',
    token_expire_time       timestamp              null comment 'access_tokenʧЧʱ��',
    refresh_expire_time     timestamp              null comment 'refresh_tokenʧЧʱ��',
    create_time             timestamp              null comment '����ʱ��',
    update_time             timestamp              null comment '����ʱ��',
    is_use                  tinyint(6)  default 1  not null comment 'token�Ƿ���ʹ�ü��,0-��ʹ��,1-ʹ��',
    token_redis_key         varchar(64)            null comment 'token������redis�е�key',
    refresh_token_redis_key varchar(64)            null comment 'refreshToken������redis�е�key',
    plat_shop_id            varchar(12)            null comment 'ƽ̨���̱���'
)
    comment '�ӿ���Ȩtoken��Ϣ��';

create index plat_source
    on ec_oms_plat_token_info (shop_code);

create table ec_oms_plat_tuyue_code_mapping
(
    shop_order_id varchar(64) not null comment '���̶������'
        primary key,
    delivery_code varchar(64) not null comment '���ݱ��'
)
    comment 'Ϳ�±��ӳ���';

create table ec_oms_plat_tuyue_product_detail
(
    item_id       varchar(32)  not null comment '��Ʒ���ID',
    qty           int          null comment '��������',
    item_name     varchar(255) not null comment '��Ʒ����',
    item_code     bigint       not null comment 'ƽ̨��Ʒ���',
    refund        tinyint(3)   null comment '�Ƿ��˿� 0:δ�˿� 1:�˿�ɹ� 2:�˿���',
    shop_order_id varchar(64)  not null comment '���̶�����',
    primary key (item_id, shop_order_id)
)
    comment 'Ϳ�²�Ʒ��ϸ��';

create table ec_oms_plat_yunji_mobile_record
(
    order_id        varchar(64)                         not null comment '����id'
        primary key,
    receiver_mobile varchar(32)                         not null comment '����ǰ�ֻ���',
    create_time     timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�Ƽ��ֻ��Ž��ܼ�¼��';

create table ec_oms_prd_convert_plan
(
    plan_code            bigint                                     not null comment '���Ա�����'
        primary key,
    plan_name            varchar(32)                                not null comment '��������',
    shop_code            int unsigned                               null comment '���̱��(�����ã�����ec_oms_prd_convert_plan_shop)',
    plan_type            tinyint unsigned default 1                 not null comment '��������  1-�������ⶥ  2-�����ⶥ',
    plan_use_type        tinyint unsigned default 1                 not null comment '����ʹ�����ͣ�1-�Զ�תƷ��2-�ֶ�תƷ',
    plan_start_time      timestamp                                  null comment '���Կ�ʼʱ��',
    plan_end_time        timestamp                                  null comment '���Խ���ʱ��',
    is_limit_num         tinyint unsigned default 0                 not null comment '�Ƿ�����תƷ����1-�� 0-��',
    use_num              int unsigned                               null comment '��ʹ��תƷ����(�����ã�����ec_oms_prd_convert_plan_shop)',
    limit_num            int unsigned                               null comment 'תƷ����(�����ã�����ec_oms_prd_convert_plan_shop)',
    is_limit_ship_region tinyint(3)                                 null comment '�Ƿ������ջ����� 1-�� 0-�� �ֵ䣨ec_oms_yes_no��',
    province_code        varchar(128)                               null comment '����תƷ���ջ�ʡ�ݱ���,����Զ��ŷָ�',
    province_name        varchar(128)                               null comment '����תƷ���ջ�ʡ�����ƣ�����Զ��ŷָ�',
    creator_id           int unsigned                               null comment '�����˱��',
    creator_name         varchar(32)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id          int unsigned                               null comment '�����˱��',
    operator_name        varchar(32)                                null comment '����������',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '������ƷתƷ��������';

create table ec_oms_prd_convert_plan_shop
(
    id        int unsigned auto_increment comment '����'
        primary key,
    plan_code bigint                     not null comment '���Ա�����������ec_oms_prd_convert_plan',
    shop_code int unsigned               null comment '���̱��',
    use_num   int unsigned               null comment '��ʹ��תƷ����',
    limit_num int unsigned               null comment 'תƷ����',
    del_flag  tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '������ƷתƷ�������õ��̱�';

create index idx_plan_code
    on ec_oms_prd_convert_plan_shop (plan_code);

create table ec_oms_prd_convert_plan_sub
(
    id                  int unsigned auto_increment comment '�������������'
        primary key,
    plan_code           bigint unsigned            not null comment '���Ա��',
    before_product_code bigint unsigned            null comment 'תƷǰ��Ʒ���',
    before_num          int unsigned               null comment 'תƷǰ��Ʒ����',
    after_product_code  bigint unsigned            null comment 'תƷ���Ʒ���',
    after_num           int unsigned               null comment 'תƷ���Ʒ����',
    row_group           tinyint(5) unsigned        null comment '���飬һ��תƷ����Ϊһ��',
    del_flag            tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '������ƷתƷ�������ù�����';

create index idx_plan_code
    on ec_oms_prd_convert_plan_sub (plan_code);

create table ec_oms_product_base
(
    product_code         bigint unsigned                             not null comment '��Ʒ��ţ�10000004��'
        primary key,
    product_type         tinyint unsigned  default 1                 not null comment '��Ʒ���ͣ��ֵ䣺ec_oms_product_type��@1-��Ʒ��2-�ײͣ�3-������Ʒ',
    product_name         varchar(100)                                not null comment '��Ʒ����',
    product_short_name   varchar(40)                                 not null comment '��Ʒ���',
    category_first       smallint unsigned                           null comment 'һ�����ࣨ�ֵ䣺ec_oms_product_category��eg:100,��һλ1��ʾ��Ʒ��2���ײͣ�3-��������Ʒ',
    category_second      mediumint unsigned                          null comment '�������ࣨ�ֵ䣺ec_oms_product_category��eg:100001',
    category_thrid       int unsigned                                null comment '�������ࣨ�ֵ䣺ec_oms_product_category��eg:100001001',
    is_frozen            tinyint unsigned  default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    retail_price         decimal(16, 4)                              not null comment '�������ۼ�',
    supply_price         decimal(16, 4)                              null comment '���鹩����',
    claim_price          decimal(16, 4)                              not null comment '��������',
    claim_price_type     tinyint unsigned  default 1                 not null comment '��������ȡֵ�߼����ֵ䣺ec_oms_claim_price_type��@1-ȡֵ�̶�ֵ��2-ȡֵ��Ʒʵ�յ���',
    volume_box           decimal(8, 4)     default 0.0000            not null comment '���(��)m3������4λС��',
    box_length           decimal(8, 4)     default 0.0000            not null comment '����(��)m������4λС��',
    box_width            decimal(8, 4)     default 0.0000            not null comment '���(��)m������4λС��',
    box_height           decimal(8, 4)     default 0.0000            not null comment '�߶�(��)m������4λС��',
    volume_unit          decimal(8, 4)     default 0.0000            not null comment '���(֧)m3������4λС��',
    unit_length          decimal(8, 4)     default 0.0000            not null comment '����(֧)m������4λС��',
    unit_width           decimal(8, 4)     default 0.0000            not null comment '���(֧)m������4λС��',
    unit_height          decimal(8, 4)     default 0.0000            not null comment '�߶�(֧)m������4λС��',
    net_weight           decimal(10, 3)    default 0.000             not null comment '����(KG)������3λС��',
    gross_weight         decimal(10, 3)    default 0.000             not null comment 'ë��(KG)������3λС��',
    unit                 tinyint unsigned                            null comment '������λ�����ֵ䣺ec_oms_product_unit��@1-֧��2-ƿ��3-�ס�4-�顢5-�䣬6-����7-����8-��',
    shelf_life           smallint unsigned                           null comment '������(��)',
    barcode              varchar(20)                                 null comment '��Ʒ������',
    box_barcode          varchar(20)                                 null comment '����������',
    carton               smallint unsigned default 0                 not null comment '���',
    is_present           tinyint unsigned  default 0                 not null comment '�Ƿ��Ϊ��Ʒ ���ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    pic_url              varchar(512)      default ''                not null comment '��ƷͼƬ·��',
    estimated_usage_days smallint unsigned                           null comment '����Ԥ��ʹ������',
    history_product_code bigint unsigned                             null comment '��ʷ���',
    is_spe_supply        tinyint unsigned  default 0                 not null comment '�Ƿ�ר�� ���ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    is_new               tinyint unsigned  default 0                 not null comment '�Ƿ���Ʒ ���ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    remark               varchar(100)                                null comment '��ע',
    creator_id           int                                         null comment '�����˱��',
    creator_name         varchar(32)                                 null comment '����������',
    create_time          timestamp         default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id          int                                         null comment '�����˱��',
    operator_name        varchar(32)                                 null comment '����������',
    last_update_time     timestamp         default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��Ʒ�����ݱ�';

create table ec_oms_product_base_20210208
(
    product_code         bigint unsigned                             not null comment '��Ʒ��ţ�10000004��'
        primary key,
    product_type         tinyint unsigned  default 1                 not null comment '��Ʒ���ͣ��ֵ䣺ec_oms_product_type��@1-��Ʒ��2-�ײͣ�3-������Ʒ',
    product_name         varchar(100)                                not null comment '��Ʒ����',
    product_short_name   varchar(30)                                 not null comment '��Ʒ���',
    category_first       smallint unsigned                           null comment 'һ�����ࣨ�ֵ䣺ec_oms_product_category��eg:100,��һλ1��ʾ��Ʒ��2���ײͣ�3-��������Ʒ',
    category_second      mediumint unsigned                          null comment '�������ࣨ�ֵ䣺ec_oms_product_category��eg:100001',
    category_thrid       int unsigned                                null comment '�������ࣨ�ֵ䣺ec_oms_product_category��eg:100001001',
    is_frozen            tinyint unsigned  default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    retail_price         decimal(16, 4)                              not null comment '��׼���ۼ�',
    supply_price         decimal(16, 4)                              null comment '��׼������',
    claim_price          decimal(16, 4)                              not null comment '��������',
    claim_price_type     tinyint unsigned  default 1                 not null comment '��������ȡֵ�߼����ֵ䣺ec_oms_claim_price_type��@1-ȡֵ�̶�ֵ��2-ȡֵ��Ʒʵ�յ���',
    volume_box           decimal(8, 4)     default 0.0000            not null comment '���(��)m3������4λС��',
    box_length           decimal(8, 4)     default 0.0000            not null comment '����(��)m������4λС��',
    box_width            decimal(8, 4)     default 0.0000            not null comment '���(��)m������4λС��',
    box_height           decimal(8, 4)     default 0.0000            not null comment '�߶�(��)m������4λС��',
    volume_unit          decimal(8, 4)     default 0.0000            not null comment '���(֧)m3������4λС��',
    unit_length          decimal(8, 4)     default 0.0000            not null comment '����(֧)m������4λС��',
    unit_width           decimal(8, 4)     default 0.0000            not null comment '���(֧)m������4λС��',
    unit_height          decimal(8, 4)     default 0.0000            not null comment '�߶�(֧)m������4λС��',
    net_weight           decimal(8, 2)     default 0.00              not null comment '����(KG)������2λС��',
    gross_weight         decimal(8, 2)     default 0.00              not null comment 'ë��(KG)������2λС��',
    unit                 tinyint unsigned                            null comment '������λ�����ֵ䣺ec_oms_product_unit��@1-֧��2-ƿ��3-�ס�4-�顢5-��',
    shelf_life           smallint unsigned                           null comment '������(��)',
    barcode              varchar(20)                                 null comment '��Ʒ������',
    box_barcode          varchar(20)                                 null comment '����������',
    carton               smallint unsigned default 0                 not null comment '���',
    is_present           tinyint unsigned  default 0                 not null comment '�Ƿ��Ϊ��Ʒ ���ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    pic_url              varchar(512)      default ''                not null comment '��ƷͼƬ·��',
    estimated_usage_days smallint unsigned                           null comment '����Ԥ��ʹ������',
    history_product_code bigint unsigned                             null comment '��ʷ���',
    is_spe_supply        tinyint unsigned  default 0                 not null comment '�Ƿ�ר�� ���ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    remark               varchar(100)                                null comment '��ע',
    creator_id           int                                         null comment '�����˱��',
    creator_name         varchar(32)                                 null comment '����������',
    create_time          timestamp         default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id          int                                         null comment '�����˱��',
    operator_name        varchar(32)                                 null comment '����������',
    last_update_time     timestamp         default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��Ʒ�����ݱ�_��ʱ��(20210208����ǰ���ݱ���)';

create table ec_oms_product_base_distri_shop
(
    id            int unsigned auto_increment comment '����ID'
        primary key,
    product_code  bigint unsigned            not null comment '��Ʒ��ţ�����ec_oms_product_base��',
    shop_code     int unsigned               not null comment '���̱�ţ�����ec_oms_channel_shop_base��',
    relation_type tinyint unsigned default 1 not null comment '��ϵ���� 1-�ɷ�����0-����',
    del_flag      tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��Ʒ�ɷ������̹�ϵ��';

create index idx_product_shop_code
    on ec_oms_product_base_distri_shop (product_code, shop_code);

create table ec_oms_product_base_shop
(
    id           int unsigned auto_increment comment '����ID'
        primary key,
    plan_code    int unsigned               not null comment '����',
    product_code bigint unsigned            not null comment '��Ʒ��ţ�����ec_oms_product_base��',
    shop_code    int unsigned               not null comment '���̱�ţ�����ec_oms_channel_shop_base��',
    del_flag     tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��Ʒר�����̹�ϵ��';

create index idx_plan_code
    on ec_oms_product_base_shop (plan_code);

create index idx_product_shop_code
    on ec_oms_product_base_shop (product_code, shop_code);

create table ec_oms_product_base_temp
(
    product_code bigint unsigned not null comment '��Ʒ��ţ�10000004��'
        primary key,
    retail_price decimal(16, 4)  not null comment '��׼���ۼ�',
    claim_price  decimal(16, 4)  null comment '��������'
)
    comment '��Ʒ�����ݱ�_�������ʱ��';

create table ec_oms_product_evaluation_jd
(
    comment_id       varchar(64)                         not null comment '����������Ψһ��ʶ��'
        primary key,
    shop_sap_code    int                                 null comment '����sap���',
    shop_name        varchar(64)                         null comment '��������',
    sku_id           varchar(32)                         null comment '������ƷID',
    sku_image        varchar(256)                        null comment '������ƷͼƬ',
    sku_name         varchar(64)                         null comment '������Ʒ����',
    shop_order_id    bigint unsigned                     not null comment '����ID',
    nick_name        varchar(30)                         null comment '�������ǳ�',
    content          varchar(500)                        null comment '��������',
    jd_create_time   timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    reply_count      int unsigned                        not null comment '�ظ���',
    reply_status     int(10)                             not null comment '�ظ�״̬(1��������-1��ɾ��)',
    useful_count     int unsigned                        not null comment '������',
    reply_score      int unsigned                        null comment '���۵ȼ�(��-4,5/��-2,3/����-1)',
    is_vender_reply  tinyint unsigned                    not null comment '�̼��Ƿ�ظ�',
    audit_status     int(10)                             not null comment '���״̬(-1:��ͨ��(ɾ��) 1:ͨ�� 2:�����)',
    pin              varchar(256)                        null comment '�����û�Ψһ��ʶ',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��'
)
    comment '������Ʒ��Ϣ��������';

create index idx_shop_order_id
    on ec_oms_product_evaluation_jd (shop_order_id);

create index idx_sku_id
    on ec_oms_product_evaluation_jd (sku_id);

create table ec_oms_product_evaluation_jd_images
(
    id             int unsigned auto_increment comment '���'
        primary key,
    comment_id     varchar(64)                         not null comment '��������������Ψһ��ʶ��',
    jd_id          varchar(64)                         null comment 'ɹ��id',
    img_url        varchar(256)                        null comment 'ͼƬ��ַ',
    img_title      varchar(30)                         null comment 'ɹ������',
    jd_create_time timestamp default CURRENT_TIMESTAMP null comment 'Jdϵͳ����ʱ��',
    create_time    timestamp default CURRENT_TIMESTAMP null comment 'Ecϵͳ����ʱ��'
)
    comment '������Ʒ��Ϣ����ͼƬ��ϸ��';

create index idx_comment_id
    on ec_oms_product_evaluation_jd_images (comment_id);

create table ec_oms_product_evaluation_jd_replies
(
    id              int unsigned auto_increment comment '���'
        primary key,
    comment_id      varchar(64)                         not null comment '��������������Ψһ��ʶ��',
    content         varchar(500)                        null comment '��������',
    reply_id        varchar(30)                         null comment '�ظ�id',
    create_time     timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    nick_name       varchar(30)                         null comment '�������ǳ�',
    parent_reply_id varchar(30)                         null comment '�ظ���id',
    jd_create_time  timestamp default CURRENT_TIMESTAMP null comment 'Jdϵͳ����ʱ��'
)
    comment '������Ʒ��Ϣ���������۱�';

create index idx_comment_id
    on ec_oms_product_evaluation_jd_replies (comment_id);

create table ec_oms_product_plat_match_base
(
    match_id          int(11) unsigned auto_increment comment '����id'
        primary key,
    shop_code         int(11) unsigned                           not null comment '�ⲿƽ̨����',
    plat_product_code varchar(64)                                not null comment '�ⲿƽ̨��Ʒ���',
    product_code      bigint unsigned                            not null comment 'oms��Ʒ/�ײͱ��',
    operator_id       int unsigned                               null comment '�����˱��',
    operator_name     varchar(32)                                null comment '����������',
    last_update_time  timestamp        default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag          tinyint unsigned default 0                 not null comment 'ɾ����ʶ  0-�� 1-ɾ��',
    constraint Index_uniq
        unique (shop_code, plat_product_code, product_code),
    constraint Index_uniq_2
        unique (shop_code, plat_product_code)
)
    comment '�ⲿƽ̨��Ʒ��Ա�';

create index idx_order_source
    on ec_oms_product_plat_match_base (shop_code);

create table ec_oms_product_price_strategy
(
    strategy_code    bigint unsigned                            not null comment '���Ա��,������+5λ���'
        primary key,
    strategy_name    varchar(128)                               not null comment '��������/����',
    start_time       datetime                                   not null comment '��ʼʱ��',
    end_time         datetime                                   not null comment '����ʱ��',
    strategy_remark  varchar(1000)                              null comment '��������/��ע',
    is_stop          tinyint unsigned default 0                 not null comment '�Ƿ�ͣ�� 0-�� 1-��',
    creator_id       int                                        null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int                                        null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '��Ʒ�۸���Ա�';

create table ec_oms_product_price_strategy_detail
(
    id                    int unsigned auto_increment comment 'id'
        primary key,
    strategy_code         bigint unsigned            not null comment '���Ա�ţ�����ec_oms_product_price_strategy',
    product_code          bigint unsigned            not null comment '��Ʒ��ţ�����ec_oms_product_base',
    daily_page_price      decimal(16, 4)             not null comment '�ճ�ҳ��ۣ�Ĭ��/C�ˣ�',
    activity_play         varchar(128)               not null comment '��淨��Ĭ��/C�ˣ�',
    daily_hand_price      decimal(16, 4)             not null comment '�ճ����ּۣ�Ĭ��/C�ˣ�',
    postage               varchar(32)                not null comment '�ʷѣ�Ĭ��/C�ˣ�',
    contrast              varchar(128)               null comment '��ԭ���ԶԱȣ�Ĭ��/C�ˣ�',
    daily_page_price_b    decimal(16, 4)             null comment '�ճ�ҳ��ۣ�B�ˣ�',
    activity_play_b       varchar(128)               null comment '��淨��B�ˣ�',
    daily_hand_price_b    decimal(16, 4)             null comment '�ճ����ּۣ�B�ˣ�',
    contrast_b            varchar(128)               null comment '��ԭ���ԶԱȣ�B�ˣ�',
    sale_page_price       decimal(16, 4)             null comment '���ҳ���',
    sale_activity_play    varchar(128)               null comment '����淨',
    sale_daily_hand_price decimal(16, 4)             null comment '��ٵ��ּ�',
    packaging_form        tinyint unsigned default 0 null comment '��װ��̬���ֵ䣺ec_oms_packaging_form��1-ȫ����2-ƿ+����3-ȫƿ��4-���䣬5-����',
    remark                varchar(512)               null comment '��ע',
    del_flag              tinyint unsigned default 0 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '��Ʒ�۸������ϸ��';

create index idx_strategy_code
    on ec_oms_product_price_strategy_detail (strategy_code);

create table ec_oms_product_price_structure_base
(
    price_id         bigint unsigned auto_increment comment '����Id'
        primary key,
    client_code      varchar(15)                                null comment '�ͻ����',
    price_type       tinyint unsigned                           null comment '�۸�����  1-��ϵ�۸�  2-����۸�',
    start_time       timestamp                                  null comment '��Чʱ��',
    end_time         timestamp                                  null comment 'ʧЧʱ��',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    price            decimal(16, 4)                             not null comment '��Ʒ�۸�',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����־  1-��  0-��'
)
    comment 'B2B�ͻ���Ʒ�۸����';

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
    review_id        int(10) auto_increment comment '��������'
        primary key,
    shop_code        int(10)                             not null comment '���̱��',
    comment_id       varchar(40)                         not null comment '������Ϣ����',
    skuid            bigint unsigned                     not null comment '������ƷID',
    nickName         varchar(30)                         null comment '�������ǳ�',
    score            varchar(10)                         null comment '���۽��/�ȼ�',
    creationTime     timestamp                           null comment '���۴���ʱ��',
    content          varchar(500)                        null comment '��������',
    reply_count      int unsigned                        null comment '�ظ���',
    status           varchar(5)                          null comment '����״̬',
    useful_count     int unsigned                        null comment '������',
    is_vender_reply  varchar(5)                          null comment '�̼��Ƿ�ظ�',
    imiage_status    varchar(300)                        null comment 'ɹ�����״̬',
    pin              varchar(300)                        null comment '�û�pin',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    constraint idx_comment_id
        unique (comment_id)
)
    comment '������Ʒ��Ϣ��������';

create table ec_oms_product_review_jd_images
(
    id        int unsigned not null comment 'ɹ��id'
        primary key,
    review_id int unsigned not null comment '������Ϣ�������',
    imgUrl    varchar(300) null comment 'ɹ��ͼƬ��ַ',
    imgTitle  varchar(300) null comment 'ɹ������'
)
    comment '�ӱ���ϸ2 ����ɹ��';

create table ec_oms_product_review_jd_reply
(
    replyId      bigint unsigned not null comment '�ظ� ID ��ϸ����'
        primary key,
    review_id    int unsigned    not null comment '������Ϣ�������',
    content      varchar(500)    null comment '�ظ�����',
    creationTime timestamp       null comment '����ʱ��',
    nickName     varchar(50)     null comment '�ظ��û��ǳ�'
)
    comment '�ӱ���ϸ1 �����ظ�';

create table ec_oms_product_review_tmall
(
    shop_code        int unsigned                        not null comment '���̱��',
    num_iid          bigint unsigned                     not null comment '������ƷID',
    tid              bigint unsigned                     not null comment '����ID',
    oid              bigint unsigned                     not null comment '����ID',
    role             varchar(8)                          null comment '�����߽�ɫ',
    nick             varchar(30)                         null comment '�������ǳ�',
    result           varchar(10)                         null comment '���۽��/�ȼ�',
    created          timestamp                           not null comment '���۴���ʱ��',
    rated_nick       varchar(30)                         null comment '���������ǳ�',
    content          varchar(500)                        null comment '��������',
    reply            varchar(500)                        null comment '���۽���',
    valid_score      varchar(5)                          null comment '�����Ƿ�Ƿֿ�ȡֵ��true(����Ƿ�)��false(������Ƿ�)',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    primary key (oid, created)
)
    comment '��è��Ʒ��Ϣ���۱�';

create table ec_oms_product_sub_base
(
    id               int unsigned auto_increment comment '����'
        primary key,
    product_code     bigint unsigned                            not null comment '��Ʒ��ţ���Ӧec_oms_product_base����product_type=1����Ʒ���',
    package_code     bigint unsigned                            not null comment '�ײͱ�ţ���Ӧec_oms_product_base����product_type=2����Ʒ���',
    product_num      smallint unsigned                          null comment '�ײ��в�Ʒ����',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��Ʒ(�ײ�)��ϸ�����ݱ�';

create index idx_luptime
    on ec_oms_product_sub_base (last_update_time);

create index idx_package_code
    on ec_oms_product_sub_base (package_code);

create index idx_product_code
    on ec_oms_product_sub_base (product_code);

create table ec_oms_refund_tmall
(
    refundId      bigint unsigned     not null comment '�˿���'
        primary key,
    tid           bigint unsigned     null comment '�Ա����׵���',
    status        varchar(32)         null comment '�˿�״̬����ѡֵWAIT_SELLER_AGREE(����Ѿ������˿�ȴ�����ͬ��) WAIT_BUYER_RETURN_GOODS(�����Ѿ�ͬ���˿�ȴ�����˻�) WAIT_SELLER_CONFIRM_GOODS(����Ѿ��˻����ȴ�����ȷ���ջ�) SELLER_REFUSE_BUYER(���Ҿܾ��˿�) CLOSED(�˿�ر�) SUCCESS(�˿�ɹ�)',
    sellerNick    varchar(20)         null comment '���ҵ�������',
    orderStatus   varchar(64)         null comment '�˿��Ӧ�Ķ�������״̬',
    refundPhase   varchar(16)         null comment '�˿�׶Σ���ѡֵ��onsale/aftersale',
    title         varchar(40)         null comment '��Ʒ����',
    outerId       varchar(32)         null comment '�̼ұ��',
    numIid        bigint(21) unsigned null comment '�����˿����Ʒ���ֱ��',
    price         decimal(8, 2)       null comment '�˻��۸�',
    num           int unsigned        null comment '��������',
    refundFee     decimal(8, 2)       null comment '�˻����(�˻�����ҵĽ��)����ȷ��2λС��;��λ:Ԫ',
    totalFee      decimal(8, 2)       null comment '�����ܽ��',
    oid           bigint              null comment '�Ӷ����š�����ǵ��ʽ���oid�����tid',
    hasGoodReturn varchar(16)         null comment '����Ƿ���Ҫ�˻�����ѡֵ:true(1-��),false(0-��)',
    alipayNo      varchar(64)         null comment '֧��������',
    advanceStatus tinyint unsigned    null comment '�˿����е渶Ĭ�ϵ�δ����״̬ 0;�˿����е渶������ 1;�˿����е渶���渶��� 2;�˿����е渶�����Ҿܾ��ջ� 3;�˿����е渶���渶�ر� 4;�˿����е渶���渶���˳ɹ� 5;',
    csStatus      tinyint unsigned    null comment '����ͷ�����1;��Ҫ�ͷ�����2;�ͷ��Ѿ�����3;�ͷ�������� 4;�ͷ����ܸ���ʧ��5;�ͷ��������6;',
    goodStatus    varchar(32)         null comment '����״̬����ѡֵBUYER_NOT_RECEIVED (���δ�յ���) BUYER_RECEIVED (������յ���) BUYER_RETURNED_GOODS (������˻�)',
    payment       decimal(8, 2)       null comment '֧�������ҵĽ��(�����ܽ��-�˻�����ҵĽ��)����ȷ��2λС��;��λ:Ԫ',
    reason        varchar(128)        null comment '�˿�ԭ��',
    desception    varchar(512)        null comment '�˿�˵��',
    modified      timestamp           null comment '�޸�ʱ��',
    created       timestamp           null comment '����ʱ��'
)
    comment '��è�˿��Ϣ';

create index idx_tid
    on ec_oms_refund_tmall (tid);

create table ec_oms_refund_tmall_gongxiao
(
    sub_order_id       bigint       not null comment '������id'
        primary key,
    refund_create_time timestamp    null comment '����ʱ��',
    refund_status      int(10)      null comment '�˿״̬',
    supplier_nick      varchar(32)  null comment '����������',
    distributor_nick   varchar(32)  null comment '����������',
    modified           datetime     null comment '�޸�ʱ��',
    jdp_hashcode       varchar(128) null comment '���ݱ�ʶ',
    jdp_response       mediumtext   null comment '�ۺ�����',
    jdp_modified       timestamp    null comment '����ͬ���޸�ʱ��',
    jdp_created        timestamp    null comment '����ͬ������ʱ��'
)
    comment '��è����ץ�˿��¼ ��������ʹ��';

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
    id               int unsigned auto_increment comment '����id'
        primary key,
    content          varchar(64)      default ''                not null comment '֪ͨ����',
    warning_num      int(11) unsigned default 0                 null comment '���Ԥ��ֵ',
    is_send_operator tinyint(3)       default 1                 null comment '�Ƿ�֪ͨ���Ը����ˣ�1-�ǣ�0-��',
    operator_id      int                                        null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����Ʒ���Ԥ����Ϣ��';

create table ec_oms_retention_product_inventory_warning_push_user
(
    id         int unsigned auto_increment comment '����ID'
        primary key,
    warning_id int(11) unsigned           not null comment '����Ʒ���Ԥ����Ϣid ����ec_oms_retention_product_inventory_wraning',
    user_code  varchar(50)                null comment '������Ψһ��ʶ',
    user_name  varchar(20)                null comment '����������',
    email      varchar(50)                null comment '����',
    org_name   varchar(255)               null comment '��������',
    del_flag   tinyint unsigned default 0 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '����Ʒ���Ԥ�������û���Ϣ��';

create index idx_warning_id
    on ec_oms_retention_product_inventory_warning_push_user (warning_id);

create table ec_oms_retention_product_strategy
(
    id                  int unsigned auto_increment comment '����id'
        primary key,
    strategy_code       bigint unsigned                            not null comment '���Ա��',
    strategy_name       varchar(64)                                not null comment '��������',
    time_type           int unsigned     default 0                 not null comment '����ʱ������,0����ʱ��',
    strategy_begin_time timestamp        default CURRENT_TIMESTAMP not null comment '���Կ�ʼʱ��',
    strategy_end_time   timestamp        default CURRENT_TIMESTAMP not null comment '���Խ���ʱ��',
    product_code        bigint                                     not null comment '��Ʒ���',
    batch_begin_time    date                                       null comment '���ο�ʼʱ��',
    batch_end_time      date                                       null comment '���ν���ʱ��',
    buyer_range         tinyint(3)       default 0                 not null comment '��ҷ�Χ���ֵ�ec_oms_retention_product_buyer_range�� 0-ȫ�� 1-ָ���������',
    is_stop             tinyint(3)       default 0                 not null comment '�Ƿ�ͣ�ã�ec_oms_yes�� 1-�� 0-��',
    is_split            tinyint(3)       default 0                 not null comment '�Ƿ�𵥣�ec_oms_yes�� 1-�� 0-��',
    split_action        varchar(10)      default ''                null comment '�𵥶������ֵ�ec_oms_retention_product_split_action�� 1-�Զ�����װƷ 2-�Զ������Ʒ(����Զ��ŷָ�)',
    operator_id         int                                        null comment '�����˱��',
    operator_name       varchar(32)                                null comment '����������',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag            tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����Ʒ���Ա�';

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
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '�������Ա��',
    buyer_id         varchar(64)                                null comment 'ָ�����ID',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����Ʒ���������Ϣ��';

create index idx_strategy_code
    on ec_oms_retention_product_strategy_buyer_sub (strategy_code);

create table ec_oms_retention_product_strategy_record
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    order_code       decimal(30) unsigned                       not null comment 'EC������ţ�����ec_oms_order',
    strategy_code    bigint unsigned                            not null comment '���Ա�ţ�����ec_oms_retention_product_strategy',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    use_num          int unsigned                               null comment 'ʹ������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '����Ӧ�ô���Ʒ������ϸ��';

create index idx_order_code
    on ec_oms_retention_product_strategy_record (order_code);

create index idx_strategy_code
    on ec_oms_retention_product_strategy_record (strategy_code);

create table ec_oms_retention_product_strategy_shop_sub
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint unsigned                            not null comment '�������Ա��',
    shop_code        int(30) unsigned                           not null comment '���̱��',
    shop_name        varchar(64)                                not null comment '��������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����Ʒ���Ե�����Ϣ��';

create index idx_shop_code
    on ec_oms_retention_product_strategy_shop_sub (shop_code);

create index idx_strategy_code
    on ec_oms_retention_product_strategy_shop_sub (strategy_code);

create table ec_oms_retention_product_strategy_storehouse_express_sub
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    strategy_code    bigint                               not null comment '�������Ա��',
    storehouse_code  int(10)                              not null comment '�ֿ���',
    provinces        varchar(1024)                        not null comment 'ʡ�ݱ�ţ�������ŷָ�',
    province_names   varchar(1024)                        not null comment 'ʡ�����ƣ�������ŷָ�',
    express_code     int(10)                              null comment '���',
    express_name     varchar(32)                          null comment '��ݹ�˾����',
    create_time      timestamp  default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint(3) default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����Ʒ���Բֿ�ʡ�ݿ����Ϣ��';

create index idx_strategy_code
    on ec_oms_retention_product_strategy_storehouse_express_sub (strategy_code);

create table ec_oms_retention_product_strategy_storehouse_sub
(
    id                  int unsigned auto_increment comment '����id'
        primary key,
    strategy_code       bigint                               not null comment '�������Ա��',
    storehouse_code     int(10)                              not null comment '�ֿ���',
    storehouse_name     varchar(32)                          null comment '�ֿ�����',
    retention_count     int(10)    default 0                 not null comment '����Ʒsku����',
    retention_use_count int(10)    default 0                 not null comment '����Ʒsku��ʹ������',
    provinces           varchar(1024)                        null comment '��2c-3.1���á�ʡ�ݱ�ţ�������ŷָ�',
    province_names      varchar(1024)                        null comment '��2c-3.1���á�ʡ�����ƣ�������ŷָ�',
    express_code        int(10)                              null comment '��2c-3.1���á����',
    express_name        varchar(32)                          null comment '��2c-3.1���á���ݹ�˾����',
    is_push             tinyint(3) default 0                 null comment '�Ƿ������� 1-�� 0-��',
    fail_num            int(10)    default 0                 null comment '����ʧ�ܴ���',
    create_time         timestamp  default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time    timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag            tinyint(3) default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����Ʒ���Բֿ���Ϣ��';

create index idx_strategy_code
    on ec_oms_retention_product_strategy_storehouse_sub (strategy_code);

create table ec_oms_risk_email_reminder_time
(
    id                 int(10) auto_increment comment '����ID'
        primary key,
    template_id        int(10)              null comment '�ʼ�ģ�������id��ec_oms_risk_email_template��',
    reminder_time      varchar(32)          null comment '����ʱ�� ���ɹ��� һ��������ֵ_����ֵ���۸��ػ���ʱΪ��������',
    next_reminder_time timestamp            null comment '��һ������ʱ��',
    del_flag           tinyint(3) default 0 null comment 'ɾ����ǣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��'
)
    comment '�����ʼ�����ʱ���';

create index idx_template_email
    on ec_oms_risk_email_reminder_time (template_id);

create table ec_oms_risk_email_template
(
    id               int(10) auto_increment comment '����ID'
        primary key,
    mail_title       varchar(128)                         null comment '�ʼ�����',
    shop_codes       varchar(512)                         null comment '���̱�ţ�����Զ��Ÿ���',
    risk_types       varchar(32)                          null comment '�������ƣ�����Զ��Ÿ���',
    need_sms_remind  tinyint(3) default 0                 null comment '�Ƿ���Ҫ�������ѣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��',
    need_qw_remind   tinyint(3) default 0                 null comment '�Ƿ���Ҫ��ҵ΢�����ѣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��',
    creator_id       int                                  null comment '�����˱��',
    creator_name     varchar(32)                          null comment '����������',
    create_time      timestamp  default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int                                  null comment '�����˱��',
    operator_name    varchar(32)                          null comment '����������',
    last_update_time timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�������ʱ��',
    del_flag         tinyint(3) default 0                 null comment 'ɾ����ǣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��'
)
    comment '�����ʼ�ģ���';

create table ec_oms_risk_email_template_remind_config
(
    id                   int unsigned auto_increment comment '����Id'
        primary key,
    qw_interval_time     smallint(3) unsigned                       null comment '��΢֪ͨ���ʱ��',
    qw_min_interval_time smallint(3) unsigned                       null comment '��΢֪ͨ���ʱ��(�۸񼫵�)',
    qw_content           varchar(50)                                null comment '��΢֪ͨ���ݣ�Ϊnull��ȡ�ֵ�(ec_oms_risk_email_template_remind_config)qwĬ��֪ͨ����',
    qw_count             int(8) unsigned  default 0                 not null comment '������΢�״����͵ĵ���ֵ',
    qw_min_count         int(8) unsigned  default 0                 not null comment '������΢�״����͵ĵ���ֵ(�۸񼫵�)',
    sms_interval_time    smallint(3) unsigned                       null comment '����֪ͨ���ʱ��',
    sms_content          varchar(50)                                null comment '����֪ͨ����(ҵ�����޷����ģ��ֶα������¼)��ʹ���Զ�����ģ��(���ն����������Ѷ���)������',
    sms_count            int(8) unsigned  default 0                 not null comment '���������״����͵ĵ���ֵ',
    creator_id           int unsigned                               null comment '�����˱��',
    creator_name         varchar(32)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id          int                                        null comment '�����˱��',
    operator_name        varchar(32)                                null comment '����������',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�������ʱ��',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�����ʼ�ģ����΢�Ͷ���֪ͨ���ñ�';

create table ec_oms_risk_order_import
(
    id                     int(10) auto_increment comment '����id'
        primary key,
    import_code            int(10)       null comment '��ʶ�ϴ����������κ�',
    shop_order_id          varchar(64)   null comment '���̶������',
    shop_code              varchar(64)   null comment '���̱��',
    is_risk                varchar(64)   null comment '�Ƿ��з���',
    risk_tips              varchar(64)   null comment '������ʾ',
    risk_batch             varchar(64)   null comment '�����������',
    risk_reason            varchar(256)  null comment '����ԭ��',
    import_operation_hint  varchar(1024) null comment '���붩��ʧ��ԭ��',
    risk_order_import_time timestamp     null comment '���ն�������ʱ��',
    risk_control           tinyint(3)    null
)
    comment '��������������/ȡ�����ᵼ����ʱ��';

create table ec_oms_risk_reason_import
(
    id                      int(10) auto_increment comment '����id'
        primary key,
    order_code              decimal(30)          null comment 'EC�������',
    import_code             int(10)              null comment '��ʶ�ϴ����������κ�',
    shop_order_id           varchar(64)          null comment '���̶������',
    shop_code               varchar(64)          null comment '���̱��',
    is_risk                 varchar(64)          null comment '�Ƿ��з���',
    risk_tips               varchar(64)          null comment '������ʾ',
    risk_batch              varchar(64)          null comment '�����������',
    risk_reason             varchar(256)         null comment '����ԭ��',
    need_persuade           tinyint(3) default 0 null comment '�Ƿ���ҪȰ�ˣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��',
    register_status         varchar(32)          null comment '�Ǽ�״̬',
    import_operation_hint   varchar(1024)        null comment '���붩��ʧ��ԭ��',
    risk_reason_import_time timestamp            null comment '���ն�������ʱ��'
)
    comment '�������ԭ���';

create table ec_oms_risk_send_person
(
    id          int(10) auto_increment comment '����ID'
        primary key,
    person_type tinyint(3)           null comment '�������� �ֵ䣨ec_oms_risk_person_type��0-�ռ��� 1-������',
    template_id int(10)              null comment '�ʼ�ģ�������id��ec_oms_risk_email_template��',
    user_code   int(10)              null comment 'Ա�����',
    user_name   varchar(32)          null comment 'Ա������',
    email       varchar(32)          null comment '����',
    del_flag    tinyint(3) default 0 null comment 'ɾ����ǣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��'
)
    comment '�����ʼ������˱�';

create index idx_type_relate
    on ec_oms_risk_send_person (person_type, template_id);

create table ec_oms_risk_shop_prd_plan
(
    plan_code         bigint                                     not null comment '���Ա�����'
        primary key,
    plan_name         varchar(32)                                not null comment '��������',
    plan_start_time   timestamp                                  null comment '���Կ�ʼʱ��',
    plan_end_time     timestamp                                  null comment '���Խ���ʱ��',
    shop_code         int unsigned     default 222               null comment '���̱�ţ�����ec_oms_channel_shop_base��',
    product_code      bigint unsigned                            not null comment '��Ʒ��ţ�����ec_oms_product_base��',
    discount_rate     decimal(5, 2)    default 0.00              not null comment '��Ʒ�ۿ��ʼ��ֵ������2λС��(��12.34%����ֵΪ12.34)',
    min_discount_rate decimal(5, 2)    default 0.00              not null comment '��Ʒ�ۿ��ʱ��׼��ֵ������2λС��(��12.34%����ֵΪ12.34)',
    creator_id        int unsigned                               null comment '�����˱��',
    creator_name      varchar(32)                                null comment '����������',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id       int unsigned                               null comment '�����˱��',
    operator_name     varchar(32)                                null comment '����������',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag          tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��Ʒ�ۿ۷�ز��Ա�';

create index idx_pcode_del
    on ec_oms_risk_shop_prd_plan (product_code, del_flag)
    comment '��Ʒ����ۿ�ƥ������';

create table ec_oms_risk_shop_prd_plan_sub
(
    id               int(10) auto_increment comment '����'
        primary key,
    plan_code        bigint                              not null comment '���Ա�ţ�����ec_oms_risk_shop_prd_plan���Ա�ţ�',
    shop_code        int(10)                             not null comment '���̱�ţ�����ec_oms_channel_shop_base��',
    creator_id       int unsigned                        null comment '�����˱��',
    creator_name     varchar(32)                         null comment '����������',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                        null comment '�����˱��',
    operator_name    varchar(32)                         null comment '����������',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��Ʒ�ۿ۷�ز��Թ������̱�';

create index idx_plan_code
    on ec_oms_risk_shop_prd_plan_sub (plan_code);

create table ec_oms_risk_template_reminder_time
(
    id                 int(10) auto_increment comment '����ID'
        primary key,
    template_id        int(10)              null comment '����ģ�������id��ec_oms_risk_email_template��',
    shop_code          int(10)              null comment '���̱��',
    is_push            tinyint(3) default 0 null comment '�Ƿ������͹�һ�� 1-�� 0-��',
    type               tinyint unsigned     not null comment '�������ͣ�1-��΢��2-����',
    next_reminder_time timestamp            null comment '��һ������ʱ��',
    del_flag           tinyint(3) default 0 null comment 'ɾ����ǣ����ֵ� ec_oms_yes_no��1-�ǣ�0-��'
)
    comment '����ģ����΢�Ͷ�������ʱ���';

create index idx_template_shop
    on ec_oms_risk_template_reminder_time (template_id, shop_code);

create table ec_oms_scapling_order
(
    order_code       decimal(30) unsigned                       not null comment 'EC�������'
        primary key,
    rule_desc        varchar(255)                               null comment '�б�Ϊ��ţ�Ĺ�������',
    deal_flag        tinyint unsigned default 0                 null comment '�����ʶ@1-�ǣ�0-��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��ţ������-�洢�㷨�б�Ϊ��ţ����������';

create index idx_create_time
    on ec_oms_scapling_order (create_time);

create index idx_last_update_time
    on ec_oms_scapling_order (last_update_time);

create table ec_oms_scapling_plan
(
    plan_code        int unsigned auto_increment comment '���Ա���'
        primary key,
    strategy_code    varchar(32)                                null comment 'ϵͳ�Զ����ɲ��Ա��',
    plan_name        varchar(50)                                null comment '��������',
    shop_code        int unsigned                               null comment '���̱���',
    plan_type        tinyint unsigned default 1                 null comment '��������@1-����2-��Ʒ',
    plan_status      tinyint unsigned default 1                 null comment '����״̬@1-����0-ͣ��',
    plan_start_date  timestamp                                  null comment '��Ч��ʼ����',
    plan_end_date    timestamp                                  null comment '��Ч��ֹ����',
    threshold_0      int(10)          default 1                 null comment '��С��ֵ',
    threshold_1      int(10)          default 1                 null comment '�м���ֵ',
    threshold_2      int(10)          default 1                 null comment '�����ֵ',
    creator_id       int(11) unsigned                           null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ǣ�1-�ǣ�0-��',
    operator_id      int                                        null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    threshold_risk   int(10)                                    null comment '�Ʒ�����ֵ'
)
    comment '�쳣����(��ţ����)�������ñ�';

create table ec_oms_scapling_product_base
(
    plan_code        int unsigned auto_increment comment '���Ա���'
        primary key,
    strategy_code    varchar(32)                                null comment 'ϵͳ�Զ����ɲ��Ա��',
    product_code     bigint unsigned                            not null comment '��Ʒ����',
    shop_code        int unsigned                               not null comment '���̱���',
    plan_status      tinyint unsigned default 1                 not null comment '����״̬@1-����0-ͣ��',
    plan_start_date  timestamp                                  null comment '��Ч��ʼ����',
    plan_end_date    timestamp                                  null comment '��Ч��ֹ����',
    creator_id       int(11) unsigned                           null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag         tinyint unsigned                           null comment 'ɾ����ǣ�1-�ǣ�0-��',
    operator_id      int(11) unsigned                           null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '�쳣����(��ţ����)������Ʒ��';

create index idx_product_code
    on ec_oms_scapling_product_base (product_code);

create index idx_shop_code
    on ec_oms_scapling_product_base (shop_code);

create table ec_oms_scapling_risk_config
(
    id                       int(10) auto_increment comment '����id'
        primary key,
    channel_codes            varchar(1024)              null comment '�������',
    shop_codes               varchar(1024)              null comment '���̱��',
    order_status             tinyint(3)                 null comment '����״̬',
    risk_action              varchar(64)                null comment '�з���ϵͳ����',
    is_exc                   tinyint(3)                 null comment '�Ƿ����쳣 ��-1 ��-0',
    is_add_work_order        tinyint(3)                 null comment 'û���κ��ۺ󹤵����Ƿ������ۺ󹤵� ��-1 ��-0',
    is_update_work_order     tinyint(3)                 null comment '�����ۺ󹤵����Ƿ������ۺ󹤵� ��-1 ��-0*',
    is_update_add_work_order tinyint(3)                 null comment '�����ۺ󹤵����Ƿ�����ۺ󹤵� ��-1 ��-0',
    issue_subject            int(10)                    null comment '��������/һ������',
    issue_type               int(10)                    null comment '��������/��������',
    issue_reason_code        int unsigned               null comment '����ԭ����',
    responsible_party        tinyint(3)                 null comment '���η�',
    aftersale_status         tinyint(3)                 null comment '�ۺ���״̬',
    reply_progress           varchar(512)               null comment '�ظ�����',
    is_risk                  tinyint(3)                 null comment '�Ƿ��з���',
    remark                   varchar(64)                null comment '�ͷ���ע',
    creator_id               int(10)                    null comment '�����˱��',
    creator_name             varchar(32)                null comment '����������',
    create_time              timestamp                  null comment '����ʱ��',
    del_flag                 tinyint unsigned default 0 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��ţ�����Զ�����';

create table ec_oms_schedule
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    schedule_date    date                                       not null comment '�Ű�����',
    remark           varchar(200)                               null comment '��ע',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Ű�����';

create index idx_schedule_date
    on ec_oms_schedule (schedule_date);

create table ec_oms_schedule_sub
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    group_code       int unsigned                               not null comment '�ͷ����ţ�������ec_oms_customer_service_group.group_code��',
    customer_code    int unsigned                               not null comment '�ͷ����(������ec_oms_customer_service.customer_code)',
    schedule_date    date                                       not null comment '�Ű�����',
    classes_code     int unsigned                               not null comment '��α��',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�Ű������ϸ��';

create index idx_schedule_date
    on ec_oms_schedule_sub (schedule_date);

create table ec_oms_self_help_link_config
(
    id               int unsigned auto_increment comment '��������'
        primary key,
    link_type        tinyint unsigned default 1                 not null comment '�������ͣ��ֵ�ec_oms_self_help_link_type��@1-������Ϣ�����飩',
    title            varchar(100)                               not null comment '���ӱ���',
    short_link       varchar(128)                               not null comment '����',
    remark           varchar(200)     default ''                null comment '��ע',
    shop_code        int unsigned     default 0                 not null comment '���̱��',
    start_time       timestamp                                  not null comment '��Чʱ��',
    end_time         timestamp                                  not null comment 'ʧЧʱ��',
    version          varchar(32)                                not null comment 'UUID�汾��',
    data_type        tinyint(3)       default 0                 not null comment '����ά�� 0-�ͻ�ά�� 1-����ά��',
    creator_id       int                                        null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int                                        null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�ͻ�����������������';

create index idx_time
    on ec_oms_self_help_link_config (start_time, end_time)
    comment 'ʱ������';

create table ec_oms_self_help_link_detail
(
    id           int unsigned auto_increment comment '��������'
        primary key,
    config_id    int(10)                                null comment '��������id',
    shop_code    int unsigned default 0                 not null comment '���̱��',
    client_code  varchar(15)                            null comment '�ͻ����',
    creator_id   int                                    null comment '�����˱��',
    creator_name varchar(32)                            null comment '����������',
    create_time  timestamp    default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�ͻ�������������������չ��';

create index idx_query_condition
    on ec_oms_self_help_link_detail (config_id, client_code)
    comment '��ѯ����';

create table ec_oms_self_help_query_log
(
    id                     bigint unsigned auto_increment comment '����id'
        primary key,
    config_id              int unsigned                           null comment '����id',
    title                  varchar(100) default ''                not null comment '���ӱ���',
    open_id                varchar(64)  default ''                not null comment '�û���Ϣ(���ں�openid)',
    receiver_mobile        varchar(20)  default ''                not null comment '�ջ����ֻ�����',
    receiver_mobile_cipher varchar(88)                            null comment '�ջ����ֻ�����',
    shop_order_id          varchar(64)  default ''                not null comment '���̶������',
    create_time            timestamp    default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�ͻ�����������ѯ�����־��';

create index idx_time
    on ec_oms_self_help_query_log (create_time)
    comment 'ʱ������';

create index idx_title
    on ec_oms_self_help_query_log (title)
    comment '��������';

create table ec_oms_self_help_service_order
(
    id                 bigint unsigned auto_increment comment '��������'
        primary key,
    order_code         decimal(30) unsigned                   not null comment 'EC�������',
    waybill_code       varchar(30)                            not null comment '��ݵ���',
    shop_order_id      varchar(64)                            not null comment '���̶������',
    shop_code          int unsigned                           not null comment '���̱��',
    work_order_code    bigint unsigned                        not null comment '�ۺ󹤵����',
    package_issue_code int unsigned                           not null comment '����������',
    package_issue_desc varchar(500)                           not null comment '������������',
    receive_status     tinyint unsigned                       not null comment 'Ӧ�ÿͻ��ջ�������ֵ�ec_oms_packege_issue_receive_status 1-δ�յ��� 2-���յ��� 3-�Ѿ��գ�',
    handle_method      tinyint unsigned                       not null comment '����ʽ���ֵ�ec_oms_packege_issue_handle_method 1-��ϵ��ݺ�ʵ 2-�ߴٿ������ 3-Ҫ���ͻ����� 4-�����˿�� 5-�����Ʒ���� 6-�����˿�� 7-���� 8-���� 9-������',
    handle_method_desc varchar(500) default ''                null comment '����ʽ����',
    create_time        timestamp    default CURRENT_TIMESTAMP not null comment '����ʱ��',
    constraint idx_unique_code
        unique (order_code, waybill_code) comment '�����������'
)
    comment '�ͻ���������';

create table ec_oms_self_help_service_order_complement
(
    id               bigint unsigned auto_increment comment '��������'
        primary key,
    service_order_id bigint unsigned                     not null comment '����id',
    complement_desc  varchar(500)                        not null comment '���ⲹ������',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�ͻ������������ⲹ����չ��';

create index idx_create_time
    on ec_oms_self_help_service_order_complement (create_time)
    comment '����ʱ������';

create index idx_service_order_id
    on ec_oms_self_help_service_order_complement (service_order_id)
    comment '����id����';

create table ec_oms_sms_account_base
(
    account_code      int unsigned                               not null comment '�˺ű��'
        primary key,
    account_name      varchar(20)                                not null comment '�����˺�����',
    sms_account       varchar(50)                                not null comment '�����˺�',
    sms_password      varchar(50)                                not null comment '�����˺�����',
    is_allow_for_auto tinyint unsigned default 1                 not null comment '�Ƿ�������Զ����ţ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    remark            varchar(200)                               null comment '��ע',
    is_frozen         tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    creator_id        int unsigned                               null comment '�����˱��',
    creator_name      varchar(32)                                null comment '����������',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id       int unsigned                               null comment '�����˱��',
    operator_name     varchar(32)                                null comment '����������',
    last_update_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '�����˺������ݱ�';

create table ec_oms_sms_management
(
    id                  bigint unsigned auto_increment comment '����ID'
        primary key,
    phone_number        varchar(20)                                not null comment '�ֻ�����',
    phone_number_cipher varchar(88)                                null comment '�ֻ�����',
    receive_name        varchar(32)                                null comment '�ջ�������',
    receive_name_cipher varchar(152)                               null comment '�ջ�������',
    content             varchar(1024)                              null comment '�������',
    handle_status       tinyint unsigned default 0                 not null comment '����״̬���ֵ䣺ec_oms_handle_status��@0-δ����1-�Ѵ���',
    receive_send_status tinyint unsigned                           null comment '�շ�״̬���ֵ䣺ec_oms_receive_send_status��@0-���ظ�1-�ѷ���',
    send_sms_status     tinyint unsigned default 1                 not null comment '���ŷ���״̬���ֵ䣺ec_oms_send_sms_status��@1-�ɹ���0-ʧ��',
    send_time           timestamp                                  null comment '����ʱ��',
    receive_time        timestamp                                  null comment '����ʱ��',
    remark              varchar(200)                               null comment '��ע',
    operator_id         int unsigned                               null comment '�����˱��',
    operator_name       varchar(32)                                null comment '����������',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    shop_code           varchar(10)                                null comment '���̱��',
    shop_name           varchar(50)                                null comment '��������'
)
    comment '�����շ���������';

create index idx_phone_number
    on ec_oms_sms_management (phone_number);

create index idx_receive_time
    on ec_oms_sms_management (receive_time);

create index idx_send_time
    on ec_oms_sms_management (send_time);

create table ec_oms_sms_management_sub
(
    id                   bigint unsigned auto_increment comment '����ID'
        primary key,
    phone_number         varchar(20)                                not null comment '�ֻ�����',
    phone_number_cipher  varchar(88)                                null comment '�ֻ�����',
    receive_name         varchar(32)                                null comment '�ջ�������',
    receive_name_cipher  varchar(152)                               null comment '�ջ�������',
    content              varchar(1024)                              null comment '��������',
    is_customer_send     tinyint unsigned default 0                 not null comment '�Ƿ�ͻ����ͣ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    is_staff_send        tinyint unsigned default 0                 not null comment '�Ƿ���˾���ͣ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    receive_send_time    timestamp                                  not null comment '�շ�ʱ��',
    send_sms_status      tinyint unsigned default 1                 not null comment '���ŷ���״̬���ֵ䣺ec_oms_send_sms_status��@1-�ɹ���0-ʧ��',
    send_sms_fail_resaon varchar(200)                               null comment '���ŷ���ʧ��ԭ��',
    business_type        tinyint unsigned                           null comment 'ҵ�����ͣ�ö��',
    business_code        varchar(32)                                null comment 'ҵ����ˮ��',
    creator_id           int unsigned                               null comment '�����˱��',
    creator_name         varchar(32)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    template_type        tinyint unsigned                           null comment 'ģ�����/�Զ����ŷ��ࣨ�ֵ䣺ec_oms_template_type��',
    template_code        int unsigned                               null comment 'ģ�����'
)
    comment '�����շ������ӱ�';

create index idx_business_code
    on ec_oms_sms_management_sub (business_code);

create index idx_phone_number
    on ec_oms_sms_management_sub (phone_number);

create index idx_send_sms_status
    on ec_oms_sms_management_sub (send_sms_status);

create table ec_oms_sms_manual_config
(
    id                     int unsigned auto_increment comment '����ID'
        primary key,
    verify_account_code    int unsigned                               null comment '�󵥶����˺ű��',
    aftersale_account_code int unsigned                               null comment '�ۺ�����˺ű��',
    operator_id            int unsigned                               null comment '�����˱��',
    operator_name          varchar(32)                                null comment '����������',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag               tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '�˹��������ù�ϵ��';

create table ec_oms_sms_template
(
    template_code    int unsigned                               not null comment 'ģ�����'
        primary key,
    business_type    tinyint unsigned default 1                 not null comment 'ҵ������@1-�˹�����ģ�壬2-�Զ�����ģ��',
    template_type    tinyint unsigned default 1                 not null comment 'ģ�����/�Զ����ŷ��ࣨ�ֵ䣺ec_oms_template_type|ec_oms_auto_template_type��@1-�󵥣�2-�ۺ�',
    template_name    varchar(50)                                not null comment 'ģ������/�Զ���������',
    template_content varchar(200)                               not null comment '����ģ������',
    is_frozen        tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    shop_codes       varchar(1024)                              null comment '�����ĵ��̱�ţ�������ŷָ�',
    multi_shop_codes varchar(1024)                              null comment '����������Ź����ĵ��̱�ţ�������ŷָ�',
    available_plat   varchar(1024)                              null comment '����ƽ̨���ֵ䣺ec_oms_sms_plat��xuanwu����douyin����pingduoduoƴ���',
    pass_plat        varchar(1024)                              null comment '��ͨ��ƽ̨(�ֵ䣺ec_oms_sms_plat_pass)',
    unpass_plat      varchar(1024)                              null comment 'δͨ��ƽ̨(�ֵ䣺ec_oms_sms_plat_no_pass)',
    checking_plat    varchar(1024)                              null comment '�����ƽ̨(�ֵ䣺ec_oms_sms_plat_checking)',
    remark           varchar(200)                               null comment '��ע',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ģ������';

create table ec_oms_sms_template_backup
(
    template_code    int unsigned                               not null comment 'ģ�����'
        primary key,
    business_type    tinyint unsigned default 1                 not null comment 'ҵ������@1-�˹�����ģ�壬2-�Զ�����ģ��',
    template_type    tinyint unsigned default 1                 not null comment 'ģ�����/�Զ����ŷ��ࣨ�ֵ䣺ec_oms_template_type|ec_oms_auto_template_type��@1-�󵥣�2-�ۺ�',
    template_name    varchar(50)                                not null comment 'ģ������/�Զ���������',
    template_content varchar(200)                               not null comment '����ģ������',
    is_frozen        tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    shop_codes       varchar(1024)                              null comment '�����ĵ��̱�ţ�������ŷָ�',
    multi_shop_codes varchar(1024)                              null comment '����������Ź����ĵ��̱�ţ�������ŷָ�',
    available_plat   varchar(1024)                              null comment '����ƽ̨���ֵ䣺ec_oms_sms_plat��xuanwu����douyin����pingduoduoƴ���',
    pass_plat        varchar(1024)                              null comment '��ͨ��ƽ̨(�ֵ䣺ec_oms_sms_plat_pass)',
    unpass_plat      varchar(1024)                              null comment 'δͨ��ƽ̨(�ֵ䣺ec_oms_sms_plat_no_pass)',
    checking_plat    varchar(1024)                              null comment '�����ƽ̨(�ֵ䣺ec_oms_sms_plat_checking)',
    remark           varchar(200)                               null comment '��ע',
    creator_id       int unsigned                               null comment '�����˱��',
    creator_name     varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int unsigned                               null comment '�����˱��',
    operator_name    varchar(32)                                null comment '����������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '����ģ������';

create table ec_oms_sms_template_plat_register
(
    id                     int(10) auto_increment comment '��������'
        primary key,
    ec_template_id         int(10)                             null comment 'EC����ģ��CODE',
    ec_template_name       varchar(255)                        null comment 'EC����ģ������',
    plat_code              varchar(255)                        null comment 'ƽ̨����',
    plat_template_id       varchar(50)                         null comment 'ģ��ID',
    apply_template_id      varchar(30)                         null comment 'ģ�����뵥ID',
    plat_check_status      tinyint(3)                          null comment 'ƽ̨���״̬  0����� 1 ��ͨ�� 2 δͨ��',
    update_time            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    plat_check_status_name varchar(255)                        null comment 'ƽ̨���״̬��'
)
    comment '����ģ��';

create table ec_oms_sms_template_plat_register_backup
(
    id                     int(10) auto_increment comment '��������'
        primary key,
    ec_template_id         int(10)                             null comment 'EC����ģ��CODE',
    ec_template_name       varchar(255)                        null comment 'EC����ģ������',
    plat_code              varchar(255)                        null comment 'ƽ̨����',
    plat_template_id       varchar(30)                         null comment 'ģ��ID',
    apply_template_id      varchar(30)                         null comment 'ģ�����뵥ID',
    plat_check_status      tinyint(3)                          null comment 'ƽ̨���״̬  0����� 1 ��ͨ�� 2 δͨ��',
    update_time            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    plat_check_status_name varchar(255)                        null comment 'ƽ̨���״̬��'
);

create table ec_oms_task_log
(
    id          bigint unsigned auto_increment comment '����ID'
        primary key,
    log_type    tinyint unsigned                    null comment '��־����(�ֵ� ec_oms_task_log_type @0-�Զ��� 1-AG�˿��Զ����� 2-�����޸Ķ�����ַ���� 3-SA�˿��Զ����� 4-OMS�����ش�ƽ̨ 5-OMS��Ʊ�ش�ƽ̨ ...)',
    handle_num  int unsigned                        null comment '����ҵ����',
    success_num int unsigned                        null comment '����ҵ����',
    time_cost   double(10, 3) unsigned              null comment '��ʱ���룩',
    ip          int unsigned                        null comment '������ip',
    start_time  timestamp                           null comment 'ִ�п�ʼʱ��',
    end_time    timestamp                           null comment 'ִ�н���ʱ��',
    create_time timestamp default CURRENT_TIMESTAMP not null comment '��־����ʱ��'
)
    comment '��ʱ��ִ����־��';

create index idx_time
    on ec_oms_task_log (start_time, end_time)
    comment 'ִ��ʱ������';

create table ec_oms_temporary_receipt_order
(
    receipt_code         bigint unsigned                            not null comment '�տ��'
        primary key,
    bill_num             int unsigned                               null comment '��������',
    receipt_total_amount decimal(10, 2) unsigned                    null comment '�տ��ܽ��',
    receipt_batch_no     bigint                                     null comment 'ͬ���տ���',
    remark               varchar(255)                               null comment '��ע',
    verify_code          int unsigned                               null comment '����˱���',
    verify_name          varchar(50)                                null comment '���������',
    verify_time          datetime                                   null comment '���ʱ��',
    verify_opinion       tinyint unsigned default 2                 null comment '������ 0-��ͨ�� 1-ͨ�� 2-�����',
    verify_explain       varchar(255)                               null comment '���˵��',
    creator_id           int unsigned                               null comment '�����˱��',
    creator_name         varchar(32)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id          int unsigned                               null comment '�����˱��',
    operator_name        varchar(32)                                null comment '����������',
    last_update_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag             tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��ʱ�տ��Ϣ��';

create table ec_oms_temporary_receipt_order_sub
(
    id                     bigint unsigned auto_increment comment 'id'
        primary key,
    receipt_code           bigint unsigned                            null comment '�տ��',
    receipt_method         tinyint unsigned                           null comment '�տʽ���ֵ䣺ec_oms_receipt_method�� 0-�Թ�ת�� 1-�˷����� 2-�����ֵ',
    receipt_amount         decimal(10, 2) unsigned                    null comment '�տ���',
    transaction_serial_num varchar(32)                                null comment '������ˮ��',
    order_code             varchar(32)                                null comment '�˷����Ӷ�����',
    pay_company            varchar(100)                               null comment '���˾',
    pay_date               date                                       null comment '��������',
    receipt_bill_pic       varchar(255)                               null comment '�ؿͼƬ',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag               tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
)
    comment '��ʱ�տ��ϸ';

create index idx_receipt_code
    on ec_oms_temporary_receipt_order_sub (receipt_code);

create table ec_oms_tmall_product_base
(
    num_iid          bigint unsigned                            not null comment '��Ʒid'
        primary key,
    outer_id         bigint                                     null comment '�̼��ⲿ����',
    price            decimal(10, 2) unsigned                    null comment '��Ʒ�۸�',
    num              int unsigned                               null comment '��Ʒ��������棩',
    sold_quantity    int unsigned                               null comment '��Ʒ����',
    approve_status   tinyint unsigned                           null comment '��Ʒ�ϴ����״̬ 1-onsale�����У�2-instock����',
    cid              bigint unsigned                            null comment '��Ʒ������Ҷ����Ŀ id',
    has_discount     tinyint unsigned                           null comment '֧�ֻ�Ա����   1 true   0 false',
    freight_payer    varchar(10)                                null comment '�˷ѳе���ʽ',
    is_virtual       tinyint unsigned                           null comment '������Ʒ��״̬�ֶ� 1 true   0 false',
    item_weigh       decimal(8, 4) unsigned                     null comment '��Ʒ������ ��λΪkg',
    item_size        varchar(50)                                null comment '��ʾ��Ʒ�����',
    post_fee         decimal(10, 2) unsigned                    null comment '�˷�',
    nick             varchar(20)                                null comment '��������',
    shop_code        int unsigned                               null comment '���̱�� �ɵ�������ƥ��',
    has_sku          tinyint unsigned                           not null comment '�Ƿ���ec_oms_tmall_produc_sku_base�й�����sku�б�  0-��  1-��',
    modified         timestamp                                  null comment '��Ʒ�޸�ʱ��',
    list_time        timestamp                                  null comment '�ϼ�ʱ��',
    delist_time      timestamp                                  null comment '�¼�ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment 'ec������ʱ��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment 'ec����ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    detail_url       varchar(128)                               null comment '��Ʒurl',
    express_fee      decimal(10, 2) unsigned                    null comment '��ݷ���',
    has_invoice      tinyint unsigned                           null comment '�Ƿ��з�Ʊ  0-��  1-��',
    ems_fee          decimal(10, 2) unsigned                    null comment 'ems����,'
)
    comment '��è��Ʒ���ݻ�����Ϣ';

create table ec_oms_tmall_product_base_desc_text
(
    num_iid          bigint unsigned                            not null comment '��Ʒid'
        primary key,
    title            varchar(256)                               null comment '��Ʒ����',
    input_pids       varchar(256)                               null comment '�û������������Ŀ����ID��',
    input_str        varchar(256)                               null comment '�û������������������������ֵ',
    sell_point       varchar(256)                               null comment '��Ʒ������Ϣ',
    pic_url          varchar(256)                               null comment '��Ʒ��ͼƬ',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    props_name       varchar(2000)                              null comment '��������'
)
    comment '��è��Ʒ�����ı�������Ϣ';

create table ec_oms_tmall_product_props_dict
(
    id               int(8) unsigned auto_increment comment '���'
        primary key,
    num_iid          bigint unsigned                            not null comment '��Ʒid',
    props_key        varchar(64)                                null comment '��Ʒ���Լ���',
    props_value      varchar(128)                               null comment '��Ʒ���Լ�ֵ',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '��è��Ʒ����ӳ���';

create table ec_oms_tmall_product_sku_base
(
    num_iid          bigint unsigned                            not null comment '��������Ʒid',
    sku_id           bigint unsigned                            not null comment 'sku��id'
        primary key,
    outer_id         bigint unsigned                            null comment '�̼��ⲿ����',
    created          timestamp                                  null comment '����ʱ��',
    modified         timestamp                                  null comment 'sku����޸�����',
    price            decimal(8, 2) unsigned                     null comment '�������sku����Ʒ�ļ۸�',
    properties_name  varchar(256)                               null comment 'sku����Ӧ���������Ե��������ִ�',
    quantity         int unsigned                               null comment '�������sku����Ʒ������',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment 'ec������ʱ��',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment 'ec����ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��',
    properties       varchar(256)                               null comment '������������ַ���'
)
    comment '��è��Ʒ����sku������Ϣ';

create table ec_oms_update_plat_delievery_params
(
    id               int unsigned auto_increment comment '����id'
        primary key,
    params_type      mediumint unsigned not null comment '��ѯ��������',
    query_field_type varchar(32)        null comment '��ѯ�ֶ�',
    query_field_desc varchar(255)       null comment '��ѯ�ֶ�����',
    query_args       varchar(64)        null comment '��ѯ�ֶ����Ӧ�Ĳ���ֵ',
    constraint Index_unq
        unique (params_type, query_field_type)
)
    comment '�ش�������ѯ����';

create table ec_oms_update_plat_delivery_fail_log
(
    order_code                decimal(30)                                not null comment '�������,����',
    relate_shop_order_id      varchar(64)                                null comment '����������� ԭ��',
    shop_code                 int unsigned                               not null comment '������Դ���',
    update_fail_handle_status tinyint unsigned default 0                 null comment '�����콢��״̬ʧ�ܴ���״̬  0-δ����  1-�Ѵ���',
    fail_reason               varchar(1024)                              null comment 'ʧ��ԭ��',
    fail_times                tinyint unsigned default 1                 null comment 'ʧ�ܴ���',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id               int                                        null comment '�����˱��',
    operator_name             varchar(32)                                null comment '����������',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    callback_type             tinyint(3)                                 not null comment '�ش�����',
    primary key (order_code, callback_type)
)
    comment '�ش��콢��������Ϣ��ʧ����־' charset = utf8;

create index idx_ltime_upstat
    on ec_oms_update_plat_delivery_fail_log (last_update_time, update_fail_handle_status)
    comment '�Ż��ش�ʧ�ܶ�����ѯ����';

create table ec_oms_vip_order_additional_info
(
    shop_order_id             varchar(64)  not null comment '���̶�����'
        primary key,
    hebao_identification_code varchar(64)  null comment '�ϰ���ʶ��',
    create_transport          varchar(10)  null comment '�Ƿ�ɻ�ȡ�����浥',
    ship_or_cancel            varchar(10)  null comment '�Ƿ�ɷ�����ȡ��',
    print                     varchar(255) null comment '�Ƿ�ɴ�ӡ�����浥'
)
    comment 'ΨƷ�ᶩ��������Ϣ';

create table ec_oms_vip_order_details_additional_info
(
    id            int auto_increment comment 'ID'
        primary key,
    shop_order_id varchar(64)  not null comment '���̶�����',
    outer_sku_id  varchar(64)  null comment 'skuid',
    outer_spu_id  varchar(64)  null comment 'spuid',
    transport_no  varchar(64)  null comment '�ϰ���ʶ��',
    carriers_name varchar(64)  null comment '�Ƿ�ɻ�ȡ�����浥',
    carriers_code varchar(64)  null comment '�Ƿ�ɷ�����ȡ��',
    amount        int(10)      null comment '����',
    print         varchar(255) null comment '�Ƿ�ɴ�ӡ�����浥',
    stat          varchar(10)  null comment '״̬��1.�ѻ�ȡ�˵���2.�ѷ���'
)
    comment 'ΨƷ�ᶩ����ϸ������Ϣ';

create table ec_oms_vip_sku_stock
(
    id                int auto_increment comment 'id'
        primary key,
    shop_code         int(5)                              null comment '���̱�@�콢��10017 ����10018',
    spu_id            varchar(32) charset utf8mb4         null comment '��Ʒ����',
    sku_id            varchar(32) charset utf8mb4         null comment 'sku����',
    product_style_num int                                 null comment '��Ʒ���',
    product_code      int                                 null comment '�̼�sku',
    product_name      varchar(256) charset utf8mb4        null comment '��Ʒ����',
    leaving_stock     int                                 null comment '�������',
    nationwide_stock  int                                 null comment '�̼�ȫ���ֿ��',
    nationwide_occupy int                                 null comment '�̼�ȫ���ֿ����ռ����',
    chongqing_stock   int                                 null comment '������̲�',
    chongqing_occupy  int                                 null comment '������̲���ռ����',
    kunshan_stock     int                                 null comment '��ɽ���̲�',
    kunshan_occupy    int                                 null comment '��ɽ������ռ����',
    tianjin_stock     int                                 null comment '�����̲�',
    tianjin_occupy    int                                 null comment '�����̲���ռ����',
    guangzhou_stock   int                                 null comment '���ݵ��̲�',
    guangzhou_occupy  int                                 null comment '���ݵ��̲���ռ����',
    sku_safe_stock    int                                 null comment 'SKU��ȫ���ֵ',
    sku_top_stock     int                                 null comment 'SKU����ֵ',
    del_flag          tinyint   default 0                 not null comment 'ɾ����ʶ0-��ɾ�� 1-ɾ��',
    create_time       timestamp default CURRENT_TIMESTAMP not null comment '��������',
    update_time       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '�޸�����'
)
    comment 'ΨƷ����Ʒ����' collate = utf8mb4_danish_ci;

create index idx_mall_vip_sku_stock_sku_id
    on ec_oms_vip_sku_stock (sku_id);

create table ec_oms_vip_stock_syn_log
(
    id            bigint auto_increment comment 'id'
        primary key,
    sku_id        varchar(32)                         null comment 'sku����',
    request_type  tinyint                             null comment '�ӿ�����1-��ѯ����sku��� 2-ȫ������sku���',
    request_data  text                                null comment '������',
    response_data text                                null comment '��Ӧ����',
    request_time  timestamp default CURRENT_TIMESTAMP not null comment '����ʱ��'
)
    comment 'ΨƷ��ͬ�������־��' charset = utf8;

create index idx_mall_vip_stock_syn_log_sku_id
    on ec_oms_vip_stock_syn_log (sku_id);

create table external_ext_order
(
    order_code          decimal(30) unsigned                          not null comment 'EC�������'
        primary key,
    cancel_result       tinyint(4) unsigned default 0                 null comment 'ʵ��ȡ��������ֵ䣺external_ext_order_cancel_result��@0-ȡ���У�1-ȡ���ɹ���2-ȡ��ʧ��',
    cancel_fail_reason  varchar(128)                                  null comment 'ȡ��ʧ��ԭ��',
    operator_login_name varchar(32)                                   null comment '�������˺�',
    handle_status       tinyint unsigned    default 0                 not null comment '�Ƿ���  0 - δ����  1 - ����',
    operator_name       varchar(36)                                   null comment '����������',
    operate_time        timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    last_update_time    timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '�ⲿec������չ��';

create table external_ext_work_order
(
    work_order_code    bigint unsigned                     not null comment '�ۺ󹤵����(������+6λ�������ɣ�eg:191111000001)'
        primary key,
    order_code         decimal(30) unsigned                not null comment 'EC�������',
    product_code       bigint                              null comment '��Ʒ���',
    issue_description  varchar(200)                        null comment '��������',
    customer_demand    tinyint(3)                          null comment '�ͻ�����(ҵ���ֵ�out_ec_customer_demand_type)@1-�������˿�2-�����貹��3-��Э������',
    creator_login_name varchar(32)                         null comment '�������˺�',
    creator_name       varchar(36)                         null comment '����������',
    create_time        timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time   timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '�ⲿec�ۺ󹤵���չ��';

create index idx_order_code
    on external_ext_work_order (order_code);

create table external_sale_expense_record
(
    id                bigint(11) auto_increment comment '����'
        primary key,
    client_code       varchar(15)                          not null comment '�ͻ����',
    sale_date         date                                 null comment '��������',
    status            tinyint(3) default 0                 null comment '��¼״̬ 0-����¼ 1-�Ѽ�¼ 2-��ȷ�� �ֵ䣨sale_fee_record_status��',
    promotion_expense decimal(14, 2)                       null comment '�ƹ����',
    other_expense     decimal(14, 2)                       null comment '��������',
    remark            varchar(350)                         null comment '��ע',
    registrant        varchar(32)                          null comment '�Ǽ���',
    registrant_code   varchar(32)                          null comment '�Ǽ����˺�',
    registrant_time   timestamp                            null comment '�Ǽ�ʱ��',
    last_update_time  timestamp                            null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_time       timestamp  default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '���۷��ü�¼��';

create index idx_client_code_and_date
    on external_sale_expense_record (client_code, sale_date)
    comment '�ͻ�������������������';

create table external_sys_menu
(
    id          int(8) unsigned auto_increment comment '���'
        primary key,
    parent_id   int(8)                     null comment '��ID',
    parent_ids  varchar(2000)              null comment '��ID',
    text        varchar(100)               not null comment '�˵�����',
    sort        decimal                    not null comment '����',
    url         varchar(2000)              null comment '����',
    target_type varchar(32)                null comment 'ҳ��򿪷�ʽ',
    icon        varchar(100)               null comment 'ͼ��',
    is_show     tinyint(1)       default 1 null comment '�Ƿ���ʾ 1����ʾ 0������',
    permission  varchar(200)               null comment 'Ȩ�ޱ�ʶ',
    remarks     varchar(255)               null comment '��ע',
    menu_type   tinyint unsigned default 1 null comment '�˵����� 0-Ŀ¼ 1-ģ�� 2-ҳ�� 3-����',
    create_time datetime                   null comment '����ʱ��',
    op_time     datetime                   null comment '����ʱ��',
    del_flag    tinyint(1)       default 0 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment '�ⲿEC�˵���Ϣ��';

create index idx_parent_id
    on external_sys_menu (parent_id);

create table external_sys_role
(
    id            int(8) unsigned auto_increment comment '���'
        primary key,
    code          varchar(50)                                not null comment '��ɫ����',
    name          varchar(100)                               not null comment '��ɫ����',
    enabled       tinyint unsigned default 1                 null comment '�Ƿ����1������ 0��ͣ��',
    remarks       varchar(255)                               null comment '��ע',
    client_code   varchar(15)                                null comment '�ͻ���ţ�����SAMϵͳ�����Ľ�ɫʱ����Ϊ��',
    create_source tinyint unsigned default 1                 null comment '���ݴ�����Դ1-EC 2-SAM',
    is_frozen     tinyint(3)       default 0                 null comment '�Ƿ񶳽� 0-�� 1-��',
    create_code   int(11) unsigned                           null comment '�����˱���',
    create_name   varchar(32)                                null comment '����������',
    create_time   timestamp                                  null comment '����ʱ��',
    op_code       int                                        null comment '�����˱���',
    op_name       varchar(32)                                null comment '����������',
    op_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag      tinyint unsigned default 0                 null comment 'ɾ�����1��ɾ�� 0��δɾ��',
    constraint code_UNIQUE
        unique (code)
)
    comment '�ⲿEC��ɫ��';

create index idx_client_code
    on external_sys_role (client_code)
    comment '�ͻ�����';

create table external_sys_role_data
(
    role_id     int(8) unsigned not null comment '��ɫID',
    client_code varchar(15)     not null comment '�ͻ����',
    primary key (role_id, client_code)
)
    comment '�ⲿEC��ɫ���ݹ�ϵ��';

create table external_sys_role_menu
(
    role_id int(8) unsigned not null comment '��ɫID',
    menu_id int(8) unsigned not null comment '�˵�ID',
    primary key (role_id, menu_id)
)
    comment '�ⲿEC��ɫ�˵���ϵ��';

create table external_sys_user
(
    id               int auto_increment comment '���'
        primary key,
    login_name       varchar(32)                         not null comment '��¼�˺�',
    password         varchar(80)                         not null comment '����',
    name             varchar(36)                         not null comment '�û���',
    account_status   tinyint   default 1                 not null comment '�˺��Ƿ���Ч���ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    client_code      varchar(15)                         not null comment '�ͻ����',
    account_type     tinyint   default 1                 not null comment '�˺�����1-���˺ţ�2-���˺�',
    user             varchar(36)                         null comment 'ʹ����',
    user_phone       varchar(15)                         not null comment 'ʹ�����ֻ�',
    user_email       varchar(50)                         null comment 'ʹ��������',
    user_position    varchar(32)                         null comment 'ʹ����ְλ',
    account_end_time datetime                            null comment '�˺�ʧЧʱ����ʱ�ֶ�',
    remarks          varchar(255)                        null comment '��ע',
    creator_code     int                                 null comment '�����˱���',
    creator_name     varchar(32)                         null comment '����������',
    create_time      timestamp                           null comment '����ʱ��',
    operator_code    int                                 null comment '�����˱���',
    operator_name    varchar(32)                         null comment '����������',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint                             not null comment '�Ƿ�ɾ�����ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    constraint idx_login_name
        unique (login_name) comment '��¼������'
)
    comment '�ⲿEC�û���';

create index idx_client_code
    on external_sys_user (client_code)
    comment '�ͻ���������';

create table external_sys_user_role
(
    user_id int(8) unsigned not null comment '�û�ID',
    role_id int(8) unsigned not null comment '��ɫID',
    primary key (user_id, role_id)
)
    comment '�ⲿEC�û���ɫ��ϵ��';

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
    datadate          varchar(50) null comment '����',
    ec_platform       varchar(50) null comment 'ƽ̨',
    loadtime          date        null comment '����ʱ��',
    plat_form         varchar(50) null comment '��������',
    shop_english_code varchar(50) null comment '����Ӣ��',
    shop_group        varchar(50) null comment '������',
    shop_name         varchar(50) null comment '��������',
    uoload_date       varchar(50) null comment '�ϴ�ʱ��'
)
    comment 'ƽ̨������/����ϵ������̹�ϵά��' charset = utf8;

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
    record_id         int(10) auto_increment comment '��ַ��������ID'
        primary key,
    pre_code          varchar(30)                          null comment '�޸�ǰ����',
    pre_desc          varchar(50)                          null comment '�޸�ǰ����',
    post_code         varchar(30)                          null comment '�޸ĺ����',
    post_desc         varchar(50)                          null comment '�޸ĺ�����',
    area_type         tinyint(2)                           null comment '��ַ���ͣ�1-ʡ�ݣ�2-���У�3-���أ�4-����\�ֵ���5-��/������10-ʡ����ǿ��20-������ǿ��30-������ǿ��40-�ֵ���ǿ��11-ʡ����ǿ�ظģ�21-������ǿ�ظģ�31-������ǿ�ظģ�41-�ֵ���ǿ�ظģ�',
    pre_full_address  varchar(50)                          null comment 'ǰ������ַ',
    post_full_address varchar(50)                          null comment '��������ַ',
    remark            varchar(100)                         null comment '�޸ı�ע',
    create_code       varchar(50)                          null comment '�����˱���',
    create_name       varchar(100)                         null comment '����������',
    create_time       timestamp  default CURRENT_TIMESTAMP null comment '����ʱ��',
    change_code       varchar(50)                          null comment '�޸��˱���',
    change_name       varchar(100)                         null comment '�޸�������',
    change_time       timestamp  default CURRENT_TIMESTAMP null comment '�޸�ʱ��',
    del_flag          tinyint(1) default 0                 null comment 'ɾ����־��1-ɾ����0-δɾ����'
)
    comment '��ַ�޸ļ�¼��,������ϴ�����ڸ�����ʷ����������Ϣ' charset = utf8;

create index idx_post_code
    on mall_area_update_record (post_code);

create index idx_pre_code
    on mall_area_update_record (pre_code);

create table mall_express_info_kuaiyun
(
    id                   bigint auto_increment comment '���'
        primary key,
    order_code           decimal(30)                         not null comment '���������',
    express_company      varchar(64)                         null comment '������',
    way_code             varchar(32)                         null comment '���˵���',
    send_good_date       varchar(20)                         null comment 'ʵ�ʷ��������ַ���',
    plan_received_date   varchar(20)                         null comment 'Ԥ�Ƶ��������ַ���',
    is_received_complete varchar(4)                          null comment '�Ƿ�����ǩ��',
    received_date        varchar(20)                         null comment 'ʵ�ʵ��������ַ���',
    exception_in_way     varchar(64)                         null comment '��;�쳣���',
    good_damage_num      int                                 null comment '�����������䣩',
    delay_reason         varchar(128)                        null comment '�ӳ�ԭ��',
    remarks              varchar(300)                        null comment '��ע',
    creater_name         varchar(32)                         null comment '������',
    creater_code         int                                 null comment '�����˱���',
    create_time          timestamp default CURRENT_TIMESTAMP not null comment '����ʱ��',
    update_time          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '�޸�ʱ��'
)
    comment '�󶩵���;��Ϣ--��ݿ���' charset = utf8;

create index idx_kuaiyun_create_time
    on mall_express_info_kuaiyun (create_time);

create index idx_kuaiyun_order_code
    on mall_express_info_kuaiyun (order_code);

create table mall_express_info_wuliu
(
    id                   bigint auto_increment comment '���'
        primary key,
    order_code           decimal(30)                         not null comment '���������',
    express_company      varchar(64)                         null comment '������',
    way_code             varchar(32)                         null comment '���˵���',
    send_good_date       varchar(20)                         null comment '���������ַ���',
    plan_received_date   varchar(20)                         null comment '�ƻ����������ַ���',
    send_good_code       varchar(32)                         null comment '��������',
    day1_city            varchar(20)                         null comment '��һ�쵽�����',
    day2_city            varchar(20)                         null comment '�ڶ��쵽�����',
    day3_city            varchar(20)                         null comment '�����쵽�����',
    day4_city            varchar(20)                         null comment '�����쵽�����',
    day5_city            varchar(20)                         null comment '�����쵽�����',
    day6_city            varchar(20)                         null comment '�����쵽�����',
    day7_city            varchar(20)                         null comment '�����쵽�����',
    is_received_complete varchar(4)                          null comment '�Ƿ�����ǩ��',
    received_date        varchar(20)                         null comment '�ջ������ַ���',
    exception_in_way     varchar(64)                         null comment '��;�쳣���',
    remarks              varchar(128)                        null comment '��ע',
    creater_name         varchar(32)                         null comment '������',
    creater_code         int                                 null comment '�����˱���',
    create_time          timestamp default CURRENT_TIMESTAMP not null comment '����ʱ��',
    update_time          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '�޸�ʱ��'
)
    comment '�󶩵���;��Ϣ--����' charset = utf8;

create index idx_wuliu_create_time
    on mall_express_info_wuliu (create_time);

create index idx_wuliu_order_code
    on mall_express_info_wuliu (order_code);

create table mall_sys_menu_btn_temp
(
    id           int unsigned auto_increment comment '����'
        primary key,
    btn_name     varchar(64)          null comment '�˵���ť����',
    parents_id   varchar(64)          null comment '�����˵�id',
    parents_code varchar(64)          null comment '�����˵�����',
    app_code     varchar(20)          null comment '����Ӧ������',
    changed_code varchar(20)          null comment '����޸���',
    changed_name varchar(32)          null comment '����޸�������',
    changed_time datetime             null comment '����޸�ʱ��',
    permission   varchar(50)          null comment 'Ȩ�ޱ�ʶ����д�˵���ť��ǩid��',
    del_flag     tinyint(2) default 0 null comment 'ɾ����� 1 -��ɾ�� 0 -δɾ��',
    relation_id  int(11) unsigned     null comment '����id(��ϵͳ�˵�����)'
)
    comment 'portal�˵���ť��' charset = utf8;

create table mall_sys_menu_temp
(
    menu_id              int(10) auto_increment comment '�˵�ID'
        primary key,
    menu_code            varchar(64)                     null comment '�˵�����',
    menu_name            varchar(64)                     null comment '�˵�����',
    menu_label           varchar(64)                     null comment '�˵���ʾ������',
    ifleaf               varchar(5)                      null comment '�Ƿ���Ҷ 0�� 1��',
    menu_level           int(6)                          null comment '�˵�����',
    display_order        int(6)                          null comment '�˵�����',
    function_path        varchar(550)                    null comment '�˵�����·��',
    function_desc        varchar(256)                    null comment '��������',
    menu_type            varchar(20)                     null comment '�˵����� app:app��˵� pc:pc��˵�',
    icon_img             varchar(255)                    null comment 'ͼ���·��',
    menu_url             varchar(500)                    null comment 'vw����(appʱ����ҳ��)',
    parents_id           int(10)                         null comment '���ڵ�ID',
    parents_code         varchar(64)                     null comment '���ڵ����',
    menu_seq             varchar(256)                    null comment '�˵�����',
    app_code             varchar(20)                     null comment '����Ӧ������',
    sys_code             varchar(32)                     null comment '������ϵͳ����',
    changed_code         varchar(20)                     null comment '����޸���',
    changed_name         varchar(100)                    null comment '����޸�������',
    changed_time         datetime                        null comment '����޸�ʱ��',
    del_flag             varchar(10)         default '0' null comment 'ɾ����� 1 -��ɾ�� 0 -δɾ��',
    if_down_shelf        tinyint(1) unsigned default 0   null comment '�Ƿ��¼ܣ�0-��1-�ǣ�',
    business_charge_code varchar(20)                     null comment 'ҵ�����˱���',
    business_charge_name varchar(32)                     null comment 'ҵ����������',
    require_charge_code  varchar(20)                     null comment '�������˱���',
    require_charge_name  varchar(32)                     null comment '������������',
    relation_id          int(11) unsigned                null comment '����id(��ϵͳ�˵�����)',
    relation_id_seq      varchar(50)                     null comment '����id ��seq(��ϵͳ�˵�����)'
)
    comment 'portal�˵�����' charset = utf8;

create index idx_dflag_ifleaf_menuseq
    on mall_sys_menu_temp (del_flag, ifleaf, menu_seq);

create table mall_sys_role_temp
(
    role_id     int(10) auto_increment comment '��ɫID'
        primary key,
    role_code   varchar(64)  null comment '��ɫ����',
    role_name   varchar(64)  null comment '��ɫ����',
    app_code    varchar(64)  null comment '����Ӧ��ϵͳ����',
    role_desc   varchar(255) null comment '��ɫ����',
    create_user varchar(64)  null comment '������',
    create_time datetime     null comment '����ʱ��'
)
    comment 'portal��ɫ����' charset = utf8;

create table mall_unit_tmall_tmc_message
(
    id               bigint unsigned                     not null comment '��ϢID'
        primary key,
    topic            varchar(64)                         null comment '��Ϣ��������',
    pub_time         timestamp                           null comment '��Ϣ����ʱ��',
    outgoing_time    timestamp                           null comment '��ʱδ֪����',
    user_id          bigint unsigned                     null comment '��Ϣ�������û����',
    user_nick        varchar(64)                         null comment '�û����ǳ�',
    data_id          varchar(64)                         null comment '�������tid',
    content          mediumtext                          null comment '��Ϣ��������',
    message          mediumtext                          null comment '���յ�����Ϣ����',
    last_update_time timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment '��è���͵���Ϣ�����б�mallorder';

create index idx_dataid
    on mall_unit_tmall_tmc_message (data_id);

create index idx_lst
    on mall_unit_tmall_tmc_message (last_update_time);

create index idx_topic_sellernick
    on mall_unit_tmall_tmc_message (topic, user_nick);

create table need_sms_order
(
    order_code      decimal(30) unsigned not null comment 'EC�������'
        primary key,
    shop_name       varchar(50)          not null comment '����ȫ��',
    shop_order_id   varchar(64)          not null comment '���̶�����ţ���Ϊ�ϵ�����ΪEC�������(order_code)',
    receiver_mobile varchar(20)          null comment '�ջ����ֻ�',
    province        varchar(32)          null comment '�ջ���ʡ��',
    city            varchar(32)          null comment '�ջ��˳���',
    district        varchar(32)          null comment '�ջ�������',
    plat_start_time timestamp            not null comment '�ⲿƽ̨��������ʱ��'
)
    comment 'need_sms_order';

create index idx_mobile
    on need_sms_order (receiver_mobile);

create table need_sms_order11
(
    order_code      decimal(30) unsigned not null comment 'EC�������'
        primary key,
    shop_name       varchar(50)          not null comment '����ȫ��',
    shop_order_id   varchar(64)          not null comment '���̶�����ţ���Ϊ�ϵ�����ΪEC�������(order_code)',
    receiver_mobile varchar(20)          null comment '�ջ����ֻ�',
    province        varchar(32)          null comment '�ջ���ʡ��',
    city            varchar(32)          null comment '�ջ��˳���',
    district        varchar(32)          null comment '�ջ�������',
    plat_start_time timestamp            not null comment '�ⲿƽ̨��������ʱ��'
)
    comment 'need_sms_order';

create index idx_mobile
    on need_sms_order11 (receiver_mobile);

create table need_sms_order12
(
    order_code      decimal(30) unsigned not null comment 'EC�������'
        primary key,
    shop_name       varchar(50)          not null comment '����ȫ��',
    shop_order_id   varchar(64)          not null comment '���̶�����ţ���Ϊ�ϵ�����ΪEC�������(order_code)',
    receiver_mobile varchar(20)          null comment '�ջ����ֻ�',
    province        varchar(32)          null comment '�ջ���ʡ��',
    city            varchar(32)          null comment '�ջ��˳���',
    district        varchar(32)          null comment '�ջ�������',
    plat_start_time timestamp            not null comment '�ⲿƽ̨��������ʱ��'
)
    comment 'need_sms_order';

create index idx_mobile
    on need_sms_order12 (receiver_mobile);

create table oms_b2b_announcement_client
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    announcement_id  int                                   not null comment '����id',
    client_code      varchar(15) default '0'               not null comment '�ͻ����',
    is_read          tinyint(3)  default 0                 not null comment '�Ƿ��Ѷ����ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    creator_id       int                                   null comment '�����˱��',
    creator_name     varchar(32)                           null comment '����������',
    create_time      timestamp   default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id      int                                   null comment '�����˱��',
    operator_name    varchar(32)                           null comment '����������',
    last_update_time timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint     default 0                 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '������ͻ���ϵ��';

create table oms_b2b_announcement_management
(
    id               int unsigned auto_increment comment '����ID'
        primary key,
    inform_title     varchar(30)                          not null comment '֪ͨ����',
    publish_status   tinyint(3) default 1                 not null comment '����״̬ ���ֵ䣺oms_b2b_announcement_status��1-������ 2-ִ���� 3-������� 4-�ѳ���',
    publish_time     timestamp  default CURRENT_TIMESTAMP null comment '����ʱ��',
    content          text                                 not null comment '��������',
    is_repeat_notice tinyint(3) default 0                 not null comment '�Ƿ��ظ����ѣ��ֵ䣺ec_oms_yes_no��@0-�� 1-��',
    stop_repeat_time timestamp                            null comment '�ظ�ֹͣʱ��',
    creator_id       int                                  null comment '�����˱��',
    creator_name     varchar(32)                          null comment '����������',
    create_time      timestamp  default CURRENT_TIMESTAMP null comment '����ʱ��',
    withdraw_id      int                                  null comment '�����˱��',
    withdraw_name    varchar(32)                          null comment '����������',
    withdraw_time    timestamp                            null comment '����ʱ��',
    operator_id      int                                  null comment '�����˱��',
    operator_name    varchar(32)                          null comment '����������',
    last_update_time timestamp  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint    default 0                 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '��������';

create table oms_b2b_announcement_notification_object
(
    id                       int unsigned auto_increment comment '����ID'
        primary key,
    announcement_id          int                                   not null comment '����id',
    notification_object_type tinyint(3)  default 1                 not null comment '֪ͨ�������� ���ֵ䣺oms_b2b_notification_object_type��1-���� 2-������',
    object_code              varchar(15) default '0'               not null comment '������',
    creator_id               int                                   null comment '�����˱��',
    creator_name             varchar(32)                           null comment '����������',
    create_time              timestamp   default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id              int                                   null comment '�����˱��',
    operator_name            varchar(32)                           null comment '����������',
    last_update_time         timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag                 tinyint     default 0                 not null comment 'ɾ�����@1-�� 0-��'
)
    comment '������֪ͨ�����ϵ��';

create table oms_b2b_base_level_info
(
    id                     int unsigned auto_increment comment 'id'
        primary key,
    b2b_type               tinyint unsigned                           not null comment 'b2b���� 1-���� 2-����',
    level_num              tinyint unsigned                           null comment '�ȼ�',
    level_name             varchar(100)                               null comment '�ȼ�����',
    control_price_discount decimal(4, 3)    default 0.001             not null comment '�ܿؼ��ۿ���',
    default_discount       decimal(10, 2) unsigned                    null comment 'Ĭ���ۿ��ʡ�������',
    is_frozen              tinyint(3)       default 0                 null comment '�Ƿ񶳽� 0-�� 1-��',
    is_use_agree_price     tinyint(3)       default 1                 null comment '�Ƿ�ʹ��Լ���� 1-�� 0-��',
    create_code            int unsigned                               null comment '�����˱���',
    create_name            varchar(50)                                null comment '����������',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code           int(10)                                    null comment '�޸���/�����˱���',
    changed_name           varchar(50)                                null comment '�޸���/����������',
    changed_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag               tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'OMS-B2B����/�����ȼ�������';

create index idx_b2b_type_level_num
    on oms_b2b_base_level_info (b2b_type, level_num);

create table oms_b2b_base_level_magnitude
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    b2b_type      tinyint unsigned default 1                 null comment 'b2b���� 1-���� 2-����',
    level_num     tinyint unsigned                           not null comment '�ȼ�',
    magnitude_num tinyint unsigned                           not null comment '����',
    min_weight    decimal(12, 2)   default 0.00              not null comment '����������Сֵ(kg)',
    max_weight    decimal(12, 2)   default 0.00              not null comment '�����������ֵ(kg)',
    create_code   int unsigned                               null comment '�����˱���',
    create_name   varchar(32)                                null comment '����������',
    create_time   timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code  int(10)                                    null comment '�޸���/�����˱���',
    changed_name  varchar(32)                                null comment '�޸���/����������',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag      tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����/�����ȼ�������ϵ��';

create index idx_b2b_type_level_num
    on oms_b2b_base_level_magnitude (b2b_type, level_num);

create table oms_b2b_base_present_info
(
    id           int unsigned auto_increment comment 'id'
        primary key,
    b2b_type     tinyint unsigned                           not null comment 'B2B���� 1-���� 2-����',
    product_code varchar(64)                                null comment '��Ʒ��Ʒ����',
    is_frozen    tinyint unsigned                           null comment '�Ƿ񶳽� 0-�� 1-��',
    create_code  int unsigned                               null comment '�����˱���',
    create_name  varchar(255)                               null comment '����������',
    create_time  timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code int unsigned                               null comment '�����˱���',
    changed_name varchar(255)                               null comment '����������',
    changed_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag     tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����/������Ʒ�����ݹ����';

create index idx_product_code
    on oms_b2b_base_present_info (product_code);

create table oms_b2b_base_product_info
(
    base_id          int unsigned auto_increment comment 'id'
        primary key,
    b2b_type         tinyint unsigned                           not null comment 'B2B���� 1-���� 2-����',
    product_code     varchar(64)                                not null comment '��Ʒ����',
    is_frozen        tinyint unsigned                           null comment '�Ƿ񶳽� 0-�� 1-��',
    control_price    decimal(10, 2) unsigned                    null comment '�ܿؼ�',
    importor_code    int unsigned                               null comment '�����˱�š����á�',
    importor_name    varchar(32)                                null comment '���������������á�',
    import_time      timestamp                                  null comment '����ʱ�䡾���á�',
    import_no        bigint(19) unsigned                        null comment '�����š����á�',
    auditor_code     int unsigned                               null comment '����˱�š����á�',
    auditor_name     varchar(32)                                null comment '��������������á�',
    audit_time       timestamp                                  null comment '���ʱ�䡾���á�',
    audit_status     tinyint unsigned default 1                 not null comment '���״̬ (�ֵ�: ec_oms_b2b_price_audit_status)�����á�',
    auditor_opinion  varchar(1024)                              null comment '�������������á�',
    source_type      tinyint unsigned default 1                 not null comment '��Դ���� @1-�ֶ�����, 2-���롾���á�',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(50)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code     int unsigned                               null comment '�����˱���',
    changed_name     varchar(50)                                null comment '����������',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    valid_start_time timestamp                                  null comment '��Чʱ�䡾���á�',
    valid_end_time   timestamp                                  null comment 'ʧЧʱ�䡾���á�',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����/������Ʒ������';

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
    b2b_type         tinyint unsigned                           not null comment 'B2B���� 1-���� 2-����',
    product_code     varchar(64)                                not null comment '��Ʒ����',
    is_frozen        tinyint unsigned                           null comment '�Ƿ񶳽� 0-�� 1-��',
    control_price    decimal(10, 2) unsigned                    null comment '�ܿؼ�',
    importor_code    int unsigned                               null comment '�����˱��',
    importor_name    varchar(32)                                null comment '����������',
    import_time      timestamp                                  null comment '����ʱ��',
    import_no        bigint(19) unsigned                        null comment '������',
    auditor_code     int unsigned                               null comment '����˱��',
    auditor_name     varchar(32)                                null comment '���������',
    audit_time       timestamp                                  null comment '���ʱ��',
    audit_status     tinyint unsigned default 1                 not null comment '���״̬ (�ֵ�: ec_oms_b2b_price_audit_status)',
    auditor_opinion  varchar(1024)                              null comment '��������',
    source_type      tinyint unsigned default 1                 not null comment '��Դ���� @1-�ֶ�����, 2-����',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code     int unsigned                               null comment '�����˱���',
    changed_name     varchar(32)                                null comment '����������',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    valid_start_time timestamp                                  null comment '��Чʱ��',
    valid_end_time   timestamp                                  null comment 'ʧЧʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����/������Ʒ�����ݵ����¼��';

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
    base_id       int unsigned               not null comment '����/������Ʒ��������id',
    level         tinyint unsigned           not null comment '����/�����ȼ�',
    level_price   decimal(10, 2) unsigned    null comment '�ȼ��۸�',
    pricing_logic tinyint unsigned default 1 not null comment '�ܿؼ�ȡ���߼�,�ֵ�:ec_b2b_pricing_logic��@1-ȡֵ���ܿؼ��ۿ��ʡ�����ֵ��2-ȡֵ�̶�ֵ'
)
    comment 'B2B����/������Ʒ�ȼ��۸�';

create index idx_base_id
    on oms_b2b_base_product_level_price (base_id);

create table oms_b2b_base_product_level_price_import
(
    id          int unsigned auto_increment comment 'id'
        primary key,
    base_id     int unsigned            not null comment '����/������Ʒ��������id',
    level       tinyint unsigned        not null comment '����/�����ȼ�',
    level_price decimal(10, 2) unsigned null comment '�ȼ��۸�'
)
    comment 'B2B����/������Ʒ�ȼ��۸����¼';

create index idx_base_id
    on oms_b2b_base_product_level_price_import (base_id);

create table oms_b2b_base_strategy_client
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    strategy_code bigint unsigned                            not null comment '���Ա��,����oms_b2b_base_strategy_info.strategy_code',
    client_code   varchar(15)                                null comment '�ͻ�����',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag      tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����/��������۸���Կͻ���ϵ��';

create index idx_strategy_client_code
    on oms_b2b_base_strategy_client (strategy_code, client_code, del_flag);

create table oms_b2b_base_strategy_info
(
    strategy_code   bigint unsigned                            not null comment '���Ա��,������+5λ���'
        primary key,
    strategy_name   varchar(100)                               null comment '��������',
    b2b_type        tinyint unsigned                           not null comment 'B2B���� 1-���� 2-����',
    start_time      datetime                                   null comment '��ʼʱ��',
    end_time        datetime                                   null comment '����ʱ��',
    strategy_remark varchar(255)                               null comment '����˵��',
    client_code     varchar(15)                                null comment '������������Ǩ������oms_b2b_base_strategy_client���ͻ�����',
    is_stop         tinyint unsigned default 0                 null comment '�Ƿ�ͣ�� 0-�� 1-��',
    is_limit_num    tinyint unsigned default 0                 null comment '�Ƿ�������ҵ���ֵ�ec_oms_yes_no,@0-��1-��',
    prd_num         int unsigned                               null comment '������Ʒ����',
    create_code     int unsigned                               null comment '�����˱���',
    create_name     varchar(255)                               null comment '����������',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code    int unsigned                               null comment '�����˱���',
    changed_name    varchar(255)                               null comment '����������',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag        tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����/��������۸���Թ��������ݱ�';

create index idx_client_code
    on oms_b2b_base_strategy_info (client_code);

create table oms_b2b_base_strategy_level_price
(
    id              int unsigned auto_increment comment 'id'
        primary key,
    strategy_code   bigint unsigned                            not null comment '���Ա�ţ�����oms_b2b_base_strategy_info',
    product_code    bigint unsigned                            not null comment '��Ʒ���',
    magnitude_num   tinyint unsigned                           not null comment '����',
    min_weight      decimal(12, 2)   default 0.00              not null comment '����������Сֵ(kg)',
    max_weight      decimal(12, 2)   default 0.00              not null comment '�����������ֵ(kg)',
    magnitude_price decimal(10, 2) unsigned                    null comment '�����۸�',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag        tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����/�����ȼ�������ϵ��';

create index idx_strategy_code
    on oms_b2b_base_strategy_level_price (strategy_code);

create table oms_b2b_base_strategy_price
(
    id             int unsigned auto_increment comment 'id'
        primary key,
    strategy_code  bigint unsigned                            null comment '���Ա��',
    config_code    varchar(30)                                null comment '���ñ��,���Ա��+��Ʒ���',
    product_code   varchar(64)                                null comment '��Ʒ����',
    strategy_price decimal(10, 2) unsigned                    null comment '���Լ۸�',
    limit_num      int unsigned                               null comment '����ȡ�������Ʒ����',
    use_num        int unsigned                               null comment 'ȡ�������Ʒ��������',
    is_stop        tinyint unsigned default 0                 not null comment '�Ƿ�ͣ�ã��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    changed_code   int unsigned                               null comment '�����˱���',
    changed_name   varchar(50)                                null comment '����������',
    changed_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��'
)
    comment 'B2B������Թ�����Ʒ�۸��';

create index idx_config_code
    on oms_b2b_base_strategy_price (config_code);

create index idx_product_code
    on oms_b2b_base_strategy_price (product_code);

create index idx_strategy_code
    on oms_b2b_base_strategy_price (strategy_code);

create table oms_b2b_client_agreed_price_update
(
    update_list_code bigint unsigned                            not null comment '���µ��ţ���ʽ;202012310001'
        primary key,
    update_list_name varchar(100)                               not null comment '���µ�����',
    list_size        int unsigned     default 0                 not null comment '���µ�������������',
    client_code      varchar(15)                                not null comment '�ͻ����',
    valid_start_time timestamp                                  not null comment '���µ���Чʱ��',
    valid_end_time   timestamp                                  not null comment '���µ�ʧЧʱ��',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(50)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code     int unsigned                               null comment '�����˱���',
    changed_name     varchar(50)                                null comment '����������',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '�ͻ�����Լ���۸��µ���Ϣ��';

create table oms_b2b_client_agreed_price_update_product
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    update_list_code bigint unsigned                            not null comment '���µ��ţ�����oms_b2b_client_agreed_price_info',
    client_code      varchar(15)                                not null comment '�ͻ����',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    config_code      varchar(30)                                not null comment '���õ���,���µ����+��Ʒ���',
    agreed_price     decimal(10, 2) unsigned                    not null comment 'Լ���۸�',
    is_same          tinyint unsigned default 1                 not null comment '���ú͸��µ�ʱ��һ����,ҵ���ֵ�ec_oms_yes_no@0-�� 1-��',
    valid_start_time timestamp                                  not null comment '������Чʱ��',
    valid_end_time   timestamp                                  not null comment '����ʧЧʱ��',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(50)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code     int unsigned                               null comment '�����˱���',
    changed_name     varchar(50)                                null comment '����������',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '�ͻ�����Լ���۸��µ����ñ��ӱ�';

create index idx_client_pro
    on oms_b2b_client_agreed_price_update_product (client_code, product_code);

create index idx_update_code
    on oms_b2b_client_agreed_price_update_product (update_list_code);

create table oms_b2b_client_apply
(
    application_code           varchar(16)                                   not null comment '������NF/UF+��ǰ������+4λ˳����'
        primary key,
    client_code                varchar(15)                                   null comment '�ͻ����',
    application_type           tinyint(1) unsigned default 0                 not null comment '�������� 0-���� 1-�ĵ����ֵ䣺ec_oms_application_type��',
    application_status         tinyint unsigned                              null comment '����״̬ 0-��������� 1-��Ԥ����� 2-������ 3-���ύ 4-���ͨ�� 5-��ȡ�����ֵ䣺ec_oms_application_status��',
    client_short_name          varchar(50)                                   null comment '�ͻ����',
    is_auto_audit              tinyint(1)                                    null comment '�Ƿ��Զ����� 0-�� 1-�� ���ֵ䣺ec_oms_yes_no��',
    buyer_nick                 varchar(50)                                   null comment '���ID',
    begin_cooperation_time     datetime                                      null comment '������ʼʱ��',
    end_cooperation_time       datetime                                      null comment '��������ʱ��',
    shop_code                  int unsigned                                  null comment '���̱�ţ�����ec_oms_channel_shop_base.shop_code',
    shop_name                  varchar(50)                                   null comment '��������',
    other_contact              varchar(100)                                  null comment '������ϵ��ʽ',
    mobile_phone               int(11) unsigned                              null comment '�ֻ�����',
    client_remark              varchar(200)                                  null comment '��ע',
    is_delivery                tinyint unsigned                              null comment '�Ƿ�Ǽ�������Ϣ 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    day_need                   smallint unsigned                             null comment 'Ҫ���ʹ�����',
    delivery_start_time        datetime                                      null comment 'Ҫ���ͻ�ʱ�俪ʼʱ�� ֻ��ʱ�֣�����Ĭ��2000-1-1',
    delivery_end_time          datetime                                      null comment 'Ҫ���ͻ�ʱ�����ʱ�� ֻ��ʱ�֣�����Ĭ��2000-1-1',
    is_appointment             tinyint unsigned                              null comment '�Ƿ���ҪԤԼ 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    appointment_day            smallint unsigned                             null comment 'ԤԼ��ǰ����',
    is_upstairs                tinyint unsigned                              null comment '�Ƿ���¥ 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    floor_num                  varchar(10)                                   null comment '¥��',
    is_lift                    tinyint unsigned                              null comment '�Ƿ��е��� 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    is_limit_car               tinyint unsigned                              null comment '�Ƿ����Ƴ��� 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    car_limit_remark           varchar(100)                                  null comment '��������˵��',
    is_limit_row               tinyint unsigned                              null comment '�Ƿ����� 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    limit_row_remark           varchar(100)                                  null comment '��·����˵��',
    is_unloading               tinyint unsigned                              null comment '�Ƿ���ж�� 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    is_move                    tinyint unsigned                              null comment '�Ƿ�ƽ�ư��� 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    move_range                 varchar(100)                                  null comment '���˾���(�ֵ� ship_move_range) ',
    weekend_take               tinyint unsigned                              null comment '��ĩ�Ƿ���ջ� 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    is_twining                 tinyint unsigned    default 0                 null comment '�Ƿ��Ĥ 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    sign_method                varchar(100)                                  null comment 'ǩ�ս��ӷ�ʽ',
    delivery_remark            varchar(255)                                  null comment '���ͱ�ע',
    is_open_invoice            tinyint unsigned                              null comment '�Ƿ񿪷�Ʊ 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    invoice_type               tinyint unsigned                              null comment '��Ʊ���� 0-���� 1-��ҵ ���ֵ�b2b_invoice_type��',
    invoice_info_type          tinyint unsigned                              null comment '��Ʊ���ͣ��ֵ䣺ec_oms_invoice_info_type��1-��ֵ˰��ͨ��Ʊ(����)��2-��ֵ˰ר�÷�Ʊ(����)��3-��ֵ˰ר�÷�Ʊ(ֽ��)',
    invoice_name               varchar(100)                                  null comment '��Ʊ��˾����',
    invoice_duty_paragraph     varchar(100)                                  null comment '��Ʊ��˾˰��',
    invoice_address            varchar(255)                                  null comment '��Ʊ��˾��ַ',
    invoice_phone              varchar(50)                                   null comment '��Ʊ��˾�绰',
    invoice_bank               varchar(50)                                   null comment '��Ʊ���п�����',
    invoice_account            varchar(100)                                  null comment '��Ʊ�����˺�',
    receive_invoice_name       varchar(50)                                   null comment '��Ʊ������',
    receive_invoice_email      varchar(50)                                   null comment '��Ʊ������',
    receive_invoice_phone      varchar(50)                                   null comment '��Ʊ�˵绰',
    receive_province_name      varchar(50)                                   null comment '��Ʊʡ������',
    receive_city_name          varchar(50)                                   null comment '��Ʊ��������',
    receive_county_name        varchar(50)                                   null comment '��Ʊ��������',
    receive_invoice_address    varchar(255)                                  null comment '��Ʊ��ϸ��ַ',
    b2b_type                   varchar(8)                                    null comment '1-���� 2-�������ֵ䣺b2b_type��ѡʱ��1,2����',
    distribution_level         tinyint(3)                                    null comment '�����ȼ�',
    b2b_level                  tinyint unsigned                              null comment '���۵ȼ�',
    manage_distri_channel      tinyint unsigned    default 0                 not null comment '�ܿط����������ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    distri_channel_codes       varchar(255)                                  null comment '����������ţ����Ӣ�Ķ��ŷָ�',
    distri_commission_ratio    decimal(5, 4)                                 null comment '����Ӷ�����',
    is_pay                     tinyint unsigned                              null comment '�Ƿ���� 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    pay_type                   tinyint unsigned                              null comment '���㷽ʽ 0-���ڶ����������� 1-�ȿ���ÿ�����㣨�ֵ䣺ec_application_pay_type��',
    pay_day                    smallint unsigned                             null comment '�������ڣ��죩',
    refund_type                tinyint unsigned                              null comment '�˿�������(�ֵ䣺ec_b2b_refund_type) 1-�������ɵֿ� 2-������Ԥ���',
    is_operation_audit         tinyint unsigned    default 0                 null comment '��Ӫ��˶������ֵ䣺ec_oms_yes_no��0-�� 1-��',
    business_licence_pic1      varchar(512)                                  null comment 'Ӫҵִ��ͼƬ1·��',
    business_licence_pic1_name varchar(256)                                  null comment 'Ӫҵִ��ͼƬ1����',
    business_licence_pic2      varchar(512)                                  null comment 'Ӫҵִ��ͼƬ2·��',
    business_licence_pic2_name varchar(256)                                  null comment 'Ӫҵִ��ͼƬ2����',
    business_licence_pic3      varchar(512)                                  null comment 'Ӫҵִ��ͼƬ3·��',
    business_licence_pic3_name varchar(256)                                  null comment 'Ӫҵִ��ͼƬ3����',
    edit_description           varchar(400)                                  null comment '�޸�˵��',
    edit_pic_url_1             varchar(255)                                  null comment 'ƾ֤����1',
    edit_pic_name_1            varchar(255)                                  null comment 'ƾ֤������1',
    edit_pic_url_2             varchar(255)                                  null comment 'ƾ֤����2',
    edit_pic_name_2            varchar(255)                                  null comment 'ƾ֤������2',
    edit_pic_url_3             varchar(255)                                  null comment 'ƾ֤����3',
    edit_pic_name_3            varchar(255)                                  null comment 'ƾ֤������3',
    update_module              varchar(16)                                   null comment '�޸�ģ�飬���ģ����","�ָ�  ö���� 0-������Ϣ 1-����/������Ϣ 2-������Ϣ 3-��Ʊ��Ϣ 4-����Ҫ�� 5-Ӫҵִ��',
    commit_time                timestamp           default CURRENT_TIMESTAMP null comment '�����ύʱ��',
    create_code                int unsigned                                  null comment '�����˱���',
    create_name                varchar(32)                                   null comment '����������',
    create_time                timestamp           default CURRENT_TIMESTAMP not null comment '����ʱ��',
    changed_code               int(10)                                       null comment '�޸���/�����˱���',
    changed_name               varchar(32)                                   null comment '�޸���/����������',
    changed_time               timestamp           default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag                   tinyint unsigned    default 0                 not null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '���������';

create table oms_b2b_client_apply_audit
(
    id               int(11) unsigned auto_increment comment 'id'
        primary key,
    application_code varchar(16)                         not null comment '������',
    audit_result     tinyint(2) unsigned                 null comment '��˽��0-�ύ 1-ͨ�� 2-���أ��ֵ�ec_oms_sam_declaration_operate_result��',
    oper_node        varchar(64)                         null comment '�����ڵ�',
    remark           varchar(300)                        null comment '������ע/�޸�˵��/����ԭ��',
    edit_pic_url_1   varchar(255)                        null comment '�޸�ƾ֤1',
    edit_pic_url_2   varchar(255)                        null comment '�޸�ƾ֤2',
    edit_pic_url_3   varchar(255)                        null comment '�޸�ƾ֤3',
    create_code      int unsigned                        null comment '�����˱���',
    create_name      varchar(32)                         null comment '����������',
    create_time      timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '���¼��';

create index idx_appcode
    on oms_b2b_client_apply_audit (application_code);

create table oms_b2b_client_apply_settlement
(
    id               int(11) unsigned auto_increment comment 'id'
        primary key,
    application_code varchar(16)  not null comment '������',
    account_company  varchar(80)  null comment '���˾����',
    account_bank     varchar(100) null comment '�������п�����',
    account_card     varchar(800) null comment '����/�տ��˺�'
)
    comment '�ͻ�������Ϣ��';

create table oms_b2b_client_declaration
(
    id                  int(24) unsigned auto_increment comment '����id'
        primary key,
    declaration_code    varchar(15)                                not null comment '�ᱨ���ţ�TB+��������������+5λ˳����',
    distri_channel_code varchar(10)                                not null comment '�����������',
    sale_date           timestamp                                  not null comment '��������',
    client_code         varchar(15)                                not null comment '�ͻ����',
    remarks             varchar(200)                               not null comment '��ע�����ܳ���200',
    declaration_status  tinyint unsigned default 0                 not null comment '���ֵ�ec_oms_sam_declaration_status 0-���ύ��1-����Ӫ��ˣ�2-��������ˣ�3-��Ӫ���أ�4-���񲵻� 5-�ѽ�����',
    has_deduction       tinyint(1)       default 0                 not null comment '�Ƿ��ѿۼ����,��Ϊ���أ���治�䣩�������ύ��ɴ���Ӫ��ˣ���ʱ�����ظ��ۼ���档',
    declaration_time    timestamp                                  not null comment '�ᱨʱ��',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    create_code         varchar(50)                                not null comment '�����Ӧ���ⲿ�˺Ź����洢�ġ���¼�˺ţ�����32����������Ӧ��Ա�����š�',
    create_name         varchar(50)                                null comment '����������',
    changed_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ�䣬',
    del_flag            tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��',
    constraint uniq_declaration_code
        unique (declaration_code)
)
    comment '�ᱨ��';

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
    id                     int(24) unsigned auto_increment comment '����id'
        primary key,
    declaration_code       varchar(15) not null comment '�ᱨ���ţ�TB+��������������+5λ˳����',
    product_code           bigint      not null comment '��Ʒ���',
    sale_num               int(10)     not null comment '��������',
    outbound_num           int(10)     not null comment '��������',
    client_storehouse_code varchar(10) not null comment '�����ֿ���',
    constraint uniq_dcode_pcode
        unique (declaration_code, product_code, client_storehouse_code)
)
    comment '�ᱨ����Ϣ��';

create table oms_b2b_client_declaration_log
(
    id               int(24) unsigned auto_increment comment '����id'
        primary key,
    declaration_code varchar(15)                                not null comment '�ᱨ���ţ�TB+��������������+5λ˳����',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operate_name     tinyint unsigned default 0                 not null comment '��������:0-�ᱨ�ˡ�1-��Ӫ��ˡ�2-�������',
    operate_result   tinyint unsigned default 0                 not null comment '�������:0-�ύ��1-ͨ����2-����',
    reason           varchar(300)                               null comment '����ԭ�򣬲��ܳ���300',
    create_name      varchar(36)                                not null comment '�����Ӧ���ⲿ�˺Ź����洢�ġ�ʹ���ˣ�����36����������Ӧ��Ա������36��',
    create_code      varchar(50)                                not null comment '�����Ӧ���ⲿ�˺Ź����洢�ġ���¼�˺ţ�����32����������Ӧ��Ա�����š�'
)
    comment '�ᱨ����¼��';

create index idx_dcode_ctime
    on oms_b2b_client_declaration_log (declaration_code, create_time);

create table oms_b2b_client_distri_channel
(
    distri_channel_code varchar(10)                                not null comment '����������ţ����ɹ���QD+��������4λ˳����'
        primary key,
    distri_channel_name varchar(50)                                not null comment '������������',
    is_frozen           tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��0-�� 1-��',
    create_code         int unsigned                               null comment '�����˱���',
    create_name         varchar(50)                                null comment '����������',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code        int(10)                                    null comment '�޸���/�����˱���',
    changed_name        varchar(50)                                null comment '�޸���/����������',
    changed_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag            tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '�ͻ��������������ݱ�';

create table oms_b2b_client_distri_channel_charge
(
    id                  int unsigned auto_increment comment '����ID'
        primary key,
    distri_channel_code varchar(10)                                not null comment '����������ţ�����oms_b2b_client_distri_channel.distri_channel_code',
    charge_code         int(10)                                    null comment '�����˱���',
    charge_name         varchar(30)                                not null comment '����������',
    charge_phone        varchar(20)                                not null comment '�����˵绰',
    charge_phone_cipher varchar(88)                                null comment '�����˵绰',
    changed_time        timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag            tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '�ͻ�����������Ӫ��������Ϣ��';

create table oms_b2b_client_inventory
(
    id                     int(24) unsigned auto_increment comment '����id'
        primary key,
    inventory_code         varchar(13)                                not null comment '�̵㵥�ţ�P+�ֿ��ź�5λ+���+3λ˳����',
    client_storehouse_code varchar(10)                                not null comment '�ֿ���',
    client_code            varchar(15)                                not null comment '�ͻ����',
    inventory_status       tinyint unsigned default 0                 not null comment '�̵�״̬��0-���ύ��1-����ˣ�2-�����أ�3-һ�ѽ���',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ�䣬�̵㿪ʼʱ��',
    commit_time            timestamp        default CURRENT_TIMESTAMP null comment '�����ύʱ�䣬�̵����ʱ��',
    create_code            varchar(50)                                not null comment '�����˵�¼�˺�',
    create_name            varchar(50)                                null comment '����������',
    changed_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag               tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��',
    constraint uniq_inventory_code
        unique (inventory_code)
)
    comment '�̵㵥';

create index idx_createtime_committime
    on oms_b2b_client_inventory (create_time, commit_time);

create index idx_cscode_istatus
    on oms_b2b_client_inventory (client_storehouse_code, inventory_status);

create table oms_b2b_client_inventory_info
(
    id             int(24) unsigned auto_increment comment '����id'
        primary key,
    inventory_code varchar(13)  not null comment '�̵㵥�ţ�P+�ֿ��ź�5λ+���+3λ˳����',
    product_code   bigint       not null comment '��Ʒ���',
    inventory_num  int(10)      not null comment '�̵�����',
    remarks        varchar(200) not null comment '��ע�����ܳ���200',
    stock_num      int(10)      not null comment '�̵�ʱ�̵Ŀ������',
    constraint uniq_icode_pcode
        unique (inventory_code, product_code)
)
    comment '�̵㵥��Ϣ��';

create table oms_b2b_client_inventory_log
(
    id             int(24) unsigned auto_increment comment '����id'
        primary key,
    inventory_code varchar(13)                         not null comment '�̵㵥�ţ�P+�ֿ��ź�5λ+���+3λ˳����',
    create_time    timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    operate_name   tinyint(3)                          not null comment '��������:�̵��ˡ���Ӫ���',
    operate_result tinyint(3)                          not null comment '�������:�ύ��ͨ��|����',
    reason         varchar(300)                        not null comment '����ԭ�򣬲��ܳ���300',
    create_code    varchar(50)                         not null comment '�����Ӧ���ⲿ�˺Ź����洢�ġ���¼�˺ţ�����32����������Ӧ��Ա�����š�',
    create_name    varchar(36)                         not null comment '�����Ӧ���ⲿ�˺Ź����洢�ġ�ʹ���ˣ�����36����������Ӧ��Ա������36��'
)
    comment '�̵㵥��¼��';

create index idx_icode_ctime
    on oms_b2b_client_inventory_log (inventory_code, create_time);

create table oms_b2b_client_order_delivery
(
    order_code          decimal(30) unsigned                       not null comment 'EC�������'
        primary key,
    delivery_status     tinyint unsigned default 1                 not null comment '�Ǽ�״̬(�ֵ䣺oms_b2b_client_order_delivery_status)��0-����Ǽǣ�1-δ�Ǽǣ�2-�������Ǽ��У�3-�ͻ��Ǽ��У�4-���ύ',
    arrive_day          date                                       null comment 'Ҫ���ʹ�����',
    delivery_start_time time                                       null comment 'Ҫ���ͻ�ʱ�俪ʼʱ�� ֻ��ʱ��',
    delivery_end_time   time                                       null comment 'Ҫ���ͻ�ʱ�����ʱ�� ֻ��ʱ��',
    is_appointment      tinyint unsigned default 0                 not null comment '�Ƿ���ҪԤԼ���ֵ䣺ec_oms_yes_no��0-�� 1-��',
    appointment_day     smallint unsigned                          null comment 'ԤԼ��ǰ����',
    is_upstairs         tinyint unsigned default 0                 not null comment '�Ƿ���¥���ֵ䣺ec_oms_yes_no��0-�� 1-��',
    floor_num           varchar(10)                                null comment '¥��',
    is_lift             tinyint unsigned default 0                 null comment '�Ƿ��е��ݣ��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    is_limit_car        tinyint unsigned default 0                 not null comment '�Ƿ����Ƴ������ֵ䣺ec_oms_yes_no��0-�� 1-��',
    car_limit_remark    varchar(500)                               null comment '��������˵��',
    is_limit_row        tinyint unsigned default 0                 not null comment '�Ƿ����У��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    limit_row_remark    varchar(500)                               null comment '��·����˵��',
    is_unloading        tinyint unsigned default 0                 not null comment '�Ƿ���ж�����ֵ䣺ec_oms_yes_no��0-�� 1-��',
    is_move             tinyint unsigned default 0                 not null comment '�Ƿ�ƽ�ư��ˣ��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    move_range          varchar(100)                               null comment '���˾���(�ֵ䣺ship_move_range)',
    weekend_take        tinyint unsigned default 0                 not null comment '��ĩ�Ƿ���ջ� 0-�� 1-��',
    sign_method         varchar(300)     default ''                not null comment 'ǩ�ս��ӷ�ʽ(�ֵ䣺oms_b2b_client_order_delivery_sign_method)',
    version             varchar(32)                                null comment '�汾�ţ�һ�εǼ�Ϊһ���汾��',
    create_code         varchar(10)                                null comment '�����˱���',
    create_name         varchar(32)                                null comment '����������',
    create_account      varchar(32)                                null comment '�������˺�',
    create_time         timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    operator_id         varchar(10)                                null comment '�����˱��',
    operator_name       varchar(32)                                null comment '����������',
    operator_account    varchar(32)                                null comment '�������˺�',
    last_update_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    is_bluemoon_del     tinyint(3)       default 0                 not null comment '�Ƿ����ɾ����1-�ǣ�0-��'
)
    comment '�ͻ��Ǽ�����Ҫ���';

create index idx_delivery_status
    on oms_b2b_client_order_delivery (delivery_status);

create table oms_b2b_client_stock
(
    id                     int(24) unsigned auto_increment comment '����id'
        primary key,
    client_storehouse_code varchar(10)                         not null comment '�ֿ���',
    product_code           bigint                              not null comment '��Ʒ���',
    stock_num              int(10)                             not null comment '�������',
    create_time            timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_time           timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    create_code            varchar(50)                         not null comment '�����˵�¼�˺�(ʵ���ջ���)',
    create_name            varchar(50)                         null comment '����������',
    constraint uniq_cscode_pcode
        unique (client_storehouse_code, product_code)
)
    comment '����';

create index idx_stocknum
    on oms_b2b_client_stock (stock_num);

create table oms_b2b_client_stock_log
(
    id                     int(24) unsigned auto_increment comment '����id'
        primary key,
    relate_code            varchar(68)                                not null comment 'ҵ����',
    client_storehouse_code varchar(10)                                not null comment '�ֿ���',
    product_code           bigint                                     not null comment '��Ʒ���',
    changed_code           varchar(50)                                null comment '�޸��˱���',
    changed_name           varchar(50)                                null comment '�޸�������',
    stock_num_before       int(10)                                    not null comment '���ǰ�������',
    stock_num_after        int(10)                                    not null comment '�����������',
    changed_type           tinyint unsigned default 0                 not null comment '�ֵ��ec_oms_stock_log_changed_type�����ҵ��0-��⣻1-�̵㣻2-�ᱨ��3-��ʼ��',
    platform_type          tinyint unsigned default 0                 not null comment '�ֵ��ec_oms_stock_log_platform_type��ƽ̨��0-΢��С����1-web��',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��,�����޸�ʱ��'
)
    comment '�����ˮ��';

create index idx_dcode_ctime
    on oms_b2b_client_stock_log (relate_code, create_time);

create table oms_b2b_client_storehouse
(
    client_storehouse_code varchar(10)                                not null comment '�ֿ��ţ����ɹ���CK+�ͻ���ź�4λ+�ͻ��ֿ�����3λ˳����'
        primary key,
    storehouse_name        varchar(50)                                not null comment '�ֿ�����',
    supply_city_code       varchar(1024)                              not null comment '�������б�ţ����Ӣ�Ķ��ŷָ�',
    supply_city_name       varchar(1024)                              not null comment '�����������ƣ�������ŷָ�',
    client_code            varchar(15)                                not null comment '�ͻ����',
    is_frozen              tinyint unsigned default 0                 not null comment '�Ƿ񶳽ᣨ�ֵ䣺ec_oms_yes_no��0-�� 1-��',
    charge_name            varchar(30)                                not null comment '����������',
    charge_phone           varchar(20)                                not null comment '�����˵绰',
    charge_phone_cipher    varchar(88)                                null comment '�����˵绰',
    storehouse_tel         varchar(30)                                null comment '�ֿ�̻�',
    province_code          int(10)                                    not null comment 'ʡ�ݱ���',
    province_name          varchar(50)                                not null comment 'ʡ������',
    city_code              int(10)                                    not null comment '���б���',
    city_name              varchar(50)                                not null comment '��������',
    county_code            int(10)                                    not null comment '���ر���',
    county_name            varchar(50)                                not null comment '��������',
    town                   varchar(32)                                null comment '�ֵ�����',
    village                varchar(32)                                null comment '����/��',
    address                varchar(255)                               not null comment '��ϸ��ַ',
    day_need               smallint unsigned                          not null comment 'Ҫ���ʹ�����',
    delivery_start_time    time                                       not null comment 'Ҫ���ͻ�ʱ�俪ʼʱ�� ֻ��ʱ��',
    delivery_end_time      time                                       not null comment 'Ҫ���ͻ�ʱ�����ʱ�� ֻ��ʱ��',
    is_appointment         tinyint unsigned default 0                 not null comment '�Ƿ���ҪԤԼ���ֵ䣺ec_oms_yes_no��0-�� 1-��',
    appointment_day        smallint unsigned                          null comment 'ԤԼ��ǰ����',
    is_upstairs            tinyint unsigned default 0                 not null comment '�Ƿ���¥���ֵ䣺ec_oms_yes_no��0-�� 1-��',
    floor_num              varchar(10)                                null comment '¥��',
    is_lift                tinyint unsigned default 0                 not null comment '�Ƿ��е��ݣ��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    is_limit_car           tinyint unsigned default 0                 not null comment '�Ƿ����Ƴ������ֵ䣺ec_oms_yes_no��0-�� 1-��',
    car_limit_remark       varchar(500)                               null comment '��������˵��',
    is_limit_row           tinyint unsigned default 0                 not null comment '�Ƿ����У��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    limit_row_remark       varchar(500)                               null comment '��·����˵��',
    is_unloading           tinyint unsigned default 0                 not null comment '�Ƿ���ж�����ֵ䣺ec_oms_yes_no��0-�� 1-��',
    is_move                tinyint unsigned default 0                 not null comment '�Ƿ�ƽ�ư��ˣ��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    move_range             varchar(100)                               null comment '���˾���(�ֵ䣺ship_move_range)',
    weekend_take           tinyint unsigned default 0                 not null comment '��ĩ�Ƿ���ջ� 0-�� 1-��',
    sign_method            varchar(300)     default ''                not null comment 'ǩ�ս��ӷ�ʽ',
    create_code            int unsigned                               null comment '�����˱���',
    create_name            varchar(50)                                null comment '����������',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code           int(10)                                    null comment '�޸���/�����˱���',
    changed_name           varchar(50)                                null comment '�޸���/����������',
    changed_time           timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag               tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '�ͻ��ֿ���Ϣ��';

create index idx_client_code
    on oms_b2b_client_storehouse (client_code)
    comment '�ͻ��������';

create table oms_b2b_delivery_register_info
(
    id                  int auto_increment comment '����ID'
        primary key,
    order_code          varchar(32)                        null comment '�������',
    order_id            varchar(64)                        null comment '�ⲿ����id',
    order_source        varchar(34)                        null comment '�ⲿ������Դ',
    delivery_date       datetime                           null comment 'Ҫ���ʹ�����',
    start_delivery_date datetime                           null comment '��ʼ�ͻ�ʱ��',
    end_delivery_date   datetime                           null comment '�����ͻ�ʱ��',
    is_appointment      tinyint                            null comment '�Ƿ�ԤԼ(1:�ǣ�0����)',
    appointment_day     int(10)                            null comment 'ԤԼ��ǰ����',
    is_upstairs         tinyint                            null comment '�Ƿ���¥(1���ǣ�0����)',
    floor_num           varchar(10)                        null comment '¥��',
    is_lift             tinyint                            null comment '�Ƿ��е���(1:�У�0��û��)',
    is_limit_car        tinyint                            null comment '�Ƿ����Ƴ���(1:�ǣ�0����)',
    car_limit_remark    varchar(200)                       null comment '��������˵��',
    is_limit_row        tinyint                            null comment '�Ƿ�����(1:�ǣ�0����)',
    limit_row_remark    varchar(200)                       null comment '����˵��',
    is_unloading        tinyint                            null comment '�Ƿ�ж��(1:�ǣ�0����)',
    is_move             tinyint                            null comment '�Ƿ�ƽ�ư���(1:�ǣ�0����)',
    move_range          int(10)                            null comment '���˾���',
    weekend_take        tinyint                            null comment '�Ƿ���ĩ�ջ�(1:�ǣ�0����)',
    sign_type           varchar(200)                       null comment 'ǩ�շ�ʽ',
    bill_image1         varchar(1024)                      null comment '����ͼƬ1',
    bill_image2         varchar(1024)                      null comment '����ͼƬ2',
    remark              varchar(512)                       null comment '��ע',
    register_id         varchar(64)                        null comment '�Ǽ���id',
    register_name       varchar(50)                        null comment '�Ǽ�������',
    register_status     tinyint  default 0                 null comment '�Ǽ�״̬(0:δ�Ǽǣ�1���ѵǼǣ�2�����ύ)',
    register_time       datetime default CURRENT_TIMESTAMP null comment '�Ǽ�ʱ��',
    export_status       tinyint                            null comment '����״̬(1���ѵ���,2:δ����)',
    export_time         datetime                           null comment '����ʱ��',
    export_user_code    int(10)                            null comment '�����˱��',
    export_user_name    varchar(50)                        null comment '����������',
    changed_time        datetime default CURRENT_TIMESTAMP null comment '�޸�/����ʱ��',
    changed_code        int(10)                            null comment '�޸���/�����˱���',
    changed_name        varchar(50)                        null comment '�޸���/����������',
    client_code         varchar(15)                        null comment '�ͻ����',
    del_flag            tinyint  default 0                 null comment 'ɾ����ʶ  1-ɾ��',
    create_time         datetime                           null comment '����ʱ��',
    create_code         int(10)                            null comment '�����˱���',
    create_name         varchar(50)                        null comment '����������',
    bill_file           varchar(1024)                      null comment '���е��ݸ���'
)
    comment '������Ϣ�ǼǱ�';

create index idx_oid_osr
    on oms_b2b_delivery_register_info (order_id, order_source);

create index idx_ordercode
    on oms_b2b_delivery_register_info (order_code);

create table oms_b2b_finance_amount_stock
(
    id                    int auto_increment comment '����ID'
        primary key,
    client_code           varchar(10)                                null comment '�ͻ�����',
    available_credit      decimal(10, 2)                             null comment 'Ԥ�����',
    line_credit           decimal(10, 2)                             null comment '���Ŷ��/��͸֧���',
    accumulative_amount   decimal(16, 2)                             null comment '�ۼ�Ԥ�����',
    deductible_amount     decimal(10, 2)                             null comment '�ɵֿ۽��',
    sum_deductible_amount decimal(16, 2)                             null comment '�ۼƿɵֿ۽��',
    create_code           int unsigned                               null comment '�����˱���',
    create_name           varchar(255)                               null comment '����������',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code          int unsigned                               null comment '�����˱���',
    changed_name          varchar(255)                               null comment '����������',
    changed_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag              tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��',
    constraint idx_client_code
        unique (client_code)
)
    comment 'B2B�ͻ���ȹ�����Ϣ��';

create table oms_b2b_finance_client_daily_balance
(
    id                  int unsigned auto_increment comment 'id'
        primary key,
    client_code         varchar(15)                              not null comment '�ͻ�����',
    every_day           date                                     not null comment '����',
    credit_balance      decimal(10, 2) default 0.00              not null comment 'Ԥ��������',
    deductible_amount   decimal(10, 2) default 0.00              not null comment '�ɵֿ۽�����',
    line_credit_balance decimal(10, 2) default 0.00              not null comment '��͸֧������',
    last_update_time    timestamp      default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    constraint idx_client_code_every_day
        unique (client_code, every_day)
)
    comment 'B2B�ͻ�ÿ�������Ϣ��';

create table oms_b2b_finance_clinent_quota_monitor_balance
(
    client_code      varchar(10)   default ''                not null comment '��ؿͻ����'
        primary key,
    warn_money_one   decimal(8, 2) default 0.00              null comment '���ѽ��',
    warn_money_two   decimal(8, 2) default 0.00              null comment '���ѽ��',
    create_time      timestamp     default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp     default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��'
)
    comment '�ͻ���ȼ�ر�';

create table oms_b2b_finance_clinent_quota_monitor_receiver
(
    client_code varchar(10)                         not null comment '��ؿͻ����',
    email       varchar(64)                         not null comment 'Ԥ���ռ���',
    create_time timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    primary key (client_code, email)
)
    comment '�ͻ���ȼ��Ԥ���ʼ������˱�';

create table oms_b2b_finance_clinent_quota_monitor_sender
(
    email       varchar(64)                         not null comment '�ʼ�������'
        primary key,
    password    varchar(255)                        null comment '��������',
    create_time timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�ͻ���ȼ��Ԥ���ʼ������˱�';

create table oms_b2b_finance_debited_quota_fail_log
(
    id                        int(11) unsigned auto_increment comment '����id'
        primary key,
    client_code               varchar(10)                                null comment '�ͻ�����',
    current_deductible_amount decimal(10, 2)                             null comment '��ǰ�ɵֿ۽��',
    current_available_credit  decimal(10, 2)                             null comment '��ǰԤ�����',
    fail_start_time           timestamp                                  not null comment '�ۿ�ʧ��ʱ��',
    auto_execute_job_id       int unsigned                               null comment '��ץ������',
    auto_execute_flag         tinyint unsigned default 0                 null comment '��ץ��ʶ 0-δ��ץ 1-�Ѳ�ץ',
    auto_execute_time         timestamp                                  null comment '��ץִ��ʱ��',
    create_time               timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag                  tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B�ͻ���ȿۿ�ʧ����־��';

create table oms_b2b_finance_receipt_settlement_detail
(
    id                bigint unsigned auto_increment comment 'id'
        primary key,
    client_code       varchar(15)                                null comment '�ͻ����',
    order_id          varchar(64)                                null comment '�ⲿ�������',
    order_source      varchar(32)                                null comment '������Դ',
    order_code        varchar(64)                                null comment '�ڲ��������',
    order_payment     decimal(20, 2)                             null comment '�����ܽ��  �ۼ��Ľ��',
    credit_balance    decimal(10, 2)                             null comment 'Ԥ��������',
    deductible_amount decimal(10, 2)   default 0.00              not null comment '�ɵֿ۽�����',
    pay_type          tinyint unsigned default 2                 not null comment '֧������,�ֵ�ec_b2b_pay_type@1-�ɵֿ۽��֧����2-Ԥ�����֧��',
    is_return         tinyint unsigned default 0                 null comment '�Ƿ��Ѿ����ж�ȷ������ֵ䣺ec_oms_yes_no��@1-�� 0-��',
    return_payment    decimal(20, 2)   default 0.00              null comment '�����ۿ��ȫ�����������order_payment',
    create_code       int unsigned                               null comment '�����˱���',
    create_name       varchar(255)                               null comment '����������',
    create_time       timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_time      timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag          tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B�ȿ�������������ϸ';

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
    recharge_code         bigint unsigned                            not null comment '��ֵ����,������+5λ���'
        primary key,
    unique_code           varchar(25)                                null comment '����ͬ����ֵ��Ψһ���',
    recharge_status       tinyint unsigned                           null comment '״̬,�ֵ�b2b_recharge_status@0-��ȡ�� 1-����� 2-���ͨ�� 3-��˲�ͨ��',
    client_code           varchar(15)                                null comment '�ͻ����',
    company_full_name     varchar(100)                               null comment '��˾����',
    recharge_type         tinyint unsigned default 2                 not null comment '��ֵ���ͣ��ֵ䣺ec_b2b_recharge_type@1-�ɵֿ۽��,2-Ԥ�����',
    bill_num              int unsigned                               null comment '��������',
    recharge_total_amount decimal(10, 2)                             null comment '��ֵ�ܽ��',
    credit_balance        decimal(10, 2)                             null comment 'Ԥ��������',
    deductible_amount     decimal(10, 2)   default 0.00              not null comment '�ɵֿ۽�����',
    recharge_source       tinyint unsigned default 1                 not null comment '��ֵ��Դ,�ֵ�ec_b2b_recharge_source@1-�˹���ֵ��2-ϵͳ����,3-FNC���ͳ�ֵ,4-FNC���Ϳۿ5-�ۺ��˿�',
    order_code            decimal(30)                                null comment 'EC������ţ�����ec_oms_order',
    remark                varchar(255)                               null comment '��ע',
    verify_code           int unsigned                               null comment '����˱���',
    verify_name           varchar(50)                                null comment '���������',
    verify_time           datetime                                   null comment '���ʱ��',
    verify_opinion        tinyint unsigned                           null comment '������ 0-��ͨ�� 1-ͨ��',
    verify_explain        varchar(255)                               null comment '���˵��',
    create_code           int unsigned                               null comment '�����˱���',
    create_name           varchar(50)                                null comment '����������',
    create_time           timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code          int(10)                                    null comment '�޸���/�����˱���',
    changed_name          varchar(50)                                null comment '�޸���/����������',
    changed_time          timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag              tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B�ͻ����ö�ȳ�ֵ��Ϣ��';

create index idx_client_code
    on oms_b2b_finance_recharge_base (client_code);

create table oms_b2b_finance_recharge_sub
(
    id                     int auto_increment comment 'id'
        primary key,
    recharge_code          bigint unsigned                               null comment '��ֵ����',
    recharge_method        tinyint unsigned                              null comment '��ֵ��ʽ:(ҵ���ֵ�b2b_recharge_method) 0-�Թ�ת�� 1-�˷����� 2-�����ֵ 3-�ۿ�/�˿�',
    recharge_amount        decimal(10, 2)                                null comment '��ֵ���/ϵͳ�����ĵ��ݽ��',
    transaction_serial_num varchar(32)                                   null comment '������ˮ��/ϵͳ�������ݣ���¼������Ӧ�Ŀۿ���ϸid',
    order_code             varchar(32)                                   null comment '�˷����Ӷ�����',
    pay_company            varchar(100)                                  null comment '���˾',
    pay_date               date                                          null comment '��������',
    return_bill_pic        varchar(512)                                  null comment '��ͼƬ',
    del_flag               tinyint(2) unsigned default 0                 null comment '�Ƿ�ɾ����0����Ч��1��ɾ����',
    last_update_time       timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��'
)
    comment 'B2B�ͻ����ö�ȳ�ֵ��ϸ��';

create index idx_luptime
    on oms_b2b_finance_recharge_sub (last_update_time);

create index idx_recharge_code
    on oms_b2b_finance_recharge_sub (recharge_code);

create table oms_b2b_finance_settlement_detail
(
    id                bigint unsigned auto_increment comment 'id'
        primary key,
    settlement_code   bigint unsigned  null comment '���㵥��,������+5λ���',
    order_id          varchar(64)      null comment '�ⲿ�������',
    order_source      varchar(32)      null comment '������Դ',
    order_code        varchar(64)      null comment '�ڲ��������',
    buyer_nick        varchar(64)      null comment '���id',
    order_total_price decimal(20, 2)   null comment '�����ܽ��',
    post_fee          decimal(20, 2)   null comment '�˷�',
    order_payment     decimal(20, 2)   null comment '�����ܽ��',
    get_price_type    tinyint unsigned null comment 'ȡ���߼� 1-����۸� 2-�ȼ��۸� ',
    product_code      varchar(32)      null comment '��Ʒ���',
    buy_num           int(11) unsigned null comment '��������',
    level_price       decimal(10, 2)   null comment '�ȼ��۸�',
    pro_price         decimal(10, 2)   null comment '��Ʒ����'
)
    comment 'B2B������������ϸ';

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
    settlement_code bigint unsigned                            not null comment '���㵥��,������+5λ���'
        primary key,
    b2b_type        tinyint unsigned                           null comment 'b2b���� 1-���� 2-����',
    client_code     varchar(15)                                null comment '�ͻ����',
    settlement_type tinyint unsigned                           null comment '���㷽ʽ 0-���ڶ�����������',
    order_num       int unsigned                               null comment '��������',
    total_amount    decimal(10, 2)                             null comment '�����ܽ��',
    before_amount   decimal(10, 2)                             null comment '����ǰ���ö��',
    after_amount    decimal(10, 2)                             null comment '��������ö��',
    create_code     int unsigned                               null comment '�����˱���',
    create_name     varchar(255)                               null comment '����������',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code    int unsigned                               null comment '�����˱���',
    changed_name    varchar(255)                               null comment '����������',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag        tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B��������¼��';

create index idx_client_code
    on oms_b2b_finance_settlement_info (client_code);

create table oms_b2b_finance_settlement_oper_info
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    client_code   varchar(15)                                null comment '�ͻ�����',
    order_id      varchar(64)                                null comment '�ⲿ�������',
    order_source  varchar(32)                                null comment '������Դ',
    order_code    varchar(64)                                null comment '�ڲ��������',
    product_code  varchar(32)                                null comment '��Ʒ���',
    is_settlement tinyint unsigned                           null comment '�Ƿ��ѽ��� 0-�� 1-��',
    is_delay      tinyint unsigned                           null comment '�Ƿ����ڽ��� 0-�� 1-��',
    delay_reason  varchar(255)                               null comment '���ڽ���ԭ��',
    delay_code    bigint unsigned                            null comment '���ڽ�����',
    create_code   int unsigned                               null comment '���ڽ����˱���',
    create_name   varchar(255)                               null comment '���ڽ���������',
    create_time   timestamp        default CURRENT_TIMESTAMP null comment '���ڽ���ʱ��',
    changed_code  int unsigned                               null comment '�����˱���',
    changed_name  varchar(255)                               null comment '����������',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag      tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B�ѽ���/���ڽ����¼��';

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
    update_list_code bigint unsigned                            not null comment '���µ���,������+4λ��ţ���ʽ;202012310001'
        primary key,
    update_list_name varchar(100)                               not null comment '���µ�����',
    list_size        int unsigned     default 0                 not null comment '���µ�������������',
    b2b_type         tinyint unsigned default 1                 not null comment 'b2b���� 1-���� 2-����',
    update_status    tinyint unsigned default 0                 not null comment '���µ�״̬,ҵ���ֵ�ec_b2b_update_status @0-���ύ��1-����ˡ�2-���ͨ����3-��˲�ͨ��',
    level_num        tinyint unsigned                           not null comment '�ȼ�/����',
    valid_start_time timestamp                                  not null comment '���µ���Чʱ��',
    valid_end_time   timestamp                                  not null comment '���µ�ʧЧʱ��',
    auditor_code     int unsigned                               null comment '����˱��',
    auditor_name     varchar(32)                                null comment '���������',
    audit_time       timestamp                                  null comment '���ʱ��',
    auditor_opinion  varchar(512)                               null comment '��˲�ͨ��ԭ��',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code     int(10)                                    null comment '�޸���/�����˱���',
    changed_name     varchar(32)                                null comment '�޸���/����������',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����������/�����ȼ��ܿؼ۸��µ���';

create table oms_b2b_level_price_update_product
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    update_list_code bigint unsigned                            not null comment '���µ��ţ�����oms_b2b_level_price_update',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    level_price      decimal(10, 2) unsigned                    null comment '�ȼ��ܿؼ�',
    config_code      varchar(30)                                not null comment '���õ���,���µ����+��Ʒ���',
    is_same          tinyint unsigned default 1                 not null comment '���ú͸��µ�ʱ��һ����,ҵ���ֵ�ec_oms_yes_no@0-�� 1-��',
    valid_start_time timestamp                                  null comment '������Чʱ��',
    valid_end_time   timestamp                                  null comment '����ʧЧʱ��',
    is_stop          tinyint unsigned default 0                 null comment '�Ƿ�ͣ�ã��ֵ䣺ec_oms_yes_no��0-�� 1-��',
    create_code      int unsigned                               null comment '�����˱���',
    create_name      varchar(32)                                null comment '����������',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code     int unsigned                               null comment '�����˱���',
    changed_name     varchar(32)                                null comment '����������',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B����������/�����ȼ��ܿؼ۸��µ���Ʒ���ñ�';

create index idx_update_code
    on oms_b2b_level_price_update_product (update_list_code, product_code);

create table oms_b2b_level_price_update_product_magnitude
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    update_list_code bigint unsigned                            not null comment '���µ��ţ�����oms_b2b_level_price_update',
    product_code     bigint unsigned                            not null comment '��Ʒ���',
    magnitude_num    tinyint unsigned                           not null comment '����',
    magnitude_price  decimal(10, 2) unsigned                    null comment '�����۸�',
    changed_time     timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag         tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B���������۸��µ���Ʒ���õĵȼ������۱�';

create index idx_update_code
    on oms_b2b_level_price_update_product_magnitude (update_list_code, product_code);

create table oms_b2b_oper_client_account
(
    id                  int unsigned auto_increment comment 'id'
        primary key,
    client_code         varchar(15)      null comment '�ͻ����',
    account_type        tinyint unsigned null comment '�˺����� 0-���� 1-�տ�',
    account_company     varchar(100)     null comment '�˻���˾����',
    account_bank        varchar(100)     null comment '�˻����п�����',
    account_card        varchar(100)     null comment '����/�տ��˺�',
    account_card_cipher varchar(408)     null comment '����/�տ��˺�'
)
    comment 'B2B�ͻ�����������/�����˺ű�';

create index idx_client_code
    on oms_b2b_oper_client_account (client_code);

create table oms_b2b_oper_client_base
(
    client_code                    varchar(15)                                not null comment '�ͻ����'
        primary key,
    client_status                  tinyint unsigned                           null comment '����״̬ 0-������ 1-����ȫ',
    sap_code                       varchar(30)                                null comment 'sap�ͻ����',
    buyer_nick                     varchar(50)                                null comment '���ID',
    client_name                    varchar(50)                                null comment '�ͻ�����',
    client_name_cipher             varchar(216)                               null comment '�ͻ�����',
    mobile_phone                   bigint(11)                                 null comment '�ֻ�����',
    mobile_phone_cipher            varchar(512)                               null comment '�ֻ�����',
    client_short_name              varchar(50)                                null comment '�ͻ����',
    company_full_name              varchar(100)                               null comment '��˾����',
    province_code                  int(10)                                    null comment 'ʡ�ݱ���',
    province_name                  varchar(50)                                null comment 'ʡ������',
    city_code                      int(10)                                    null comment '���б���',
    city_name                      varchar(50)                                null comment '��������',
    county_code                    int(10)                                    null comment '���ر���',
    county_name                    varchar(50)                                null comment '��������',
    company_address                varchar(255)                               null comment '��˾��ϸ��ַ',
    company_address_cipher         varchar(1024)                              null comment '��˾��ϸ��ַ',
    is_frozen                      tinyint unsigned                           null comment '�Ƿ񶳽� 0-�� 1-��',
    other_contact                  varchar(100)                               null comment '������ϵ��ʽ',
    remark                         varchar(255)                               null comment '��ע',
    charge_code                    int unsigned                               null comment '�����˱���',
    charge_name                    varchar(50)                                null comment '����������',
    charge_phone                   varchar(50)                                null comment '�����˵绰',
    charge_phone_cipher            varchar(216)                               null comment '�����˵绰',
    business_licence_pic1          varchar(512)                               null comment 'Ӫҵִ��ͼƬ1·��',
    business_licence_pic2          varchar(512)                               null comment 'Ӫҵִ��ͼƬ2·��',
    business_licence_pic3          varchar(512)                               null comment 'Ӫҵִ��ͼƬ3·�� pdf',
    business_licence_pic3_name     varchar(256)                               null comment 'Ӫҵִ��ͼƬ3��������',
    business_licence_pic4          varchar(512)                               null comment 'Ӫҵִ��ͼƬ4·�� pdf',
    business_licence_pic4_name     varchar(256)                               null comment 'Ӫҵִ��ͼƬ4��������',
    contract_pic1                  varchar(512)                               null comment '��ͬɨ���1·��',
    contract_pic2                  varchar(512)                               null comment '��ͬɨ���2·��',
    contract_pic3                  varchar(512)                               null comment '��ͬɨ���3·��pdf',
    contract_pic3_name             varchar(256)                               null comment '��ͬɨ���4��������',
    contract_pic4                  varchar(512)                               null comment '��ͬɨ���4·��pdf',
    contract_pic4_name             varchar(256)                               null comment '��ͬɨ���4��������',
    is_open_invoice                tinyint unsigned                           null comment '�Ƿ񿪷�Ʊ 0-�� 1-��',
    invoice_type                   tinyint unsigned                           null comment '̧ͷ���� 0-���� 1-��ҵ',
    invoice_info_type              tinyint unsigned                           null comment '��Ʊ���ͣ��ֵ䣺ec_oms_invoice_info_type��1-��ֵ˰��ͨ��Ʊ(����)��2-��ֵ˰ר�÷�Ʊ(����)��3-��ֵ˰ר�÷�Ʊ(ֽ��)',
    invoice_name                   varchar(100)                               null comment '��Ʊ��˾����',
    invoice_duty_paragraph         varchar(100)                               null comment '��Ʊ��˾˰��',
    invoice_address                varchar(255)                               null comment '��Ʊ��˾��ַ',
    invoice_phone                  varchar(50)                                null comment '��Ʊ��˾�绰',
    invoice_bank                   varchar(100)                               null comment '��Ʊ���п�����',
    invoice_account                varchar(100)                               null comment '��Ʊ�����˺�',
    invoice_account_cipher         varchar(408)                               null comment '��Ʊ�����˺�',
    receive_invoice_name           varchar(50)                                null comment '��Ʊ������',
    receive_invoice_name_cipher    varchar(216)                               null comment '��Ʊ������',
    receive_invoice_phone          varchar(50)                                null comment '��Ʊ�˵绰',
    receive_invoice_phone_cipher   varchar(216)                               null comment '��Ʊ�˵绰',
    receive_province_code          int unsigned                               null comment '��Ʊʡ�ݱ��',
    receive_province_name          varchar(50)                                null comment '��Ʊʡ������',
    receive_city_code              int unsigned                               null comment '��Ʊ���б���',
    receive_city_name              varchar(50)                                null comment '��Ʊ��������',
    receive_county_code            int unsigned                               null comment '��Ʊ���ر���',
    receive_county_name            varchar(50)                                null comment '��Ʊ��������',
    receive_invoice_address        varchar(255)                               null comment '��Ʊ��ϸ��ַ',
    receive_invoice_address_cipher varchar(1024)                              null comment '��Ʊ��ϸ��ַ',
    is_delivery                    tinyint unsigned                           null comment '�Ƿ�Ǽ�������Ϣ 0-�� 1-��',
    day_need                       smallint unsigned                          null comment 'Ҫ���ʹ�����',
    delivery_start_time            datetime                                   null comment 'Ҫ���ͻ�ʱ�俪ʼʱ�� ֻ��ʱ�֣�����Ĭ��2000-1-1',
    delivery_end_time              datetime                                   null comment 'Ҫ���ͻ�ʱ�����ʱ�� ֻ��ʱ�֣�����Ĭ��2000-1-1',
    is_appointment                 tinyint unsigned                           null comment '�Ƿ���ҪԤԼ 0-�� 1-��',
    appointment_day                smallint unsigned                          null comment 'ԤԼ��ǰ����',
    is_upstairs                    tinyint unsigned                           null comment '�Ƿ���¥ 0-�� 1-��',
    floor_num                      varchar(10)                                null comment '¥��',
    is_lift                        tinyint unsigned                           null comment '�Ƿ��е��� 0-�� 1-��',
    is_limit_car                   tinyint unsigned                           null comment '�Ƿ����Ƴ��� 0-�� 1-��',
    car_limit_remark               varchar(100)                               null comment '��������˵��',
    is_limit_row                   tinyint unsigned                           null comment '�Ƿ����� 0-�� 1-��',
    limit_row_remark               varchar(100)                               null comment '��·����˵��',
    is_unloading                   tinyint unsigned                           null comment '�Ƿ���ж�� 0-�� 1-��',
    is_move                        tinyint unsigned                           null comment '�Ƿ�ƽ�ư��� 0-�� 1-��',
    move_range                     varchar(100)                               null comment '���˾���(��λ��)',
    weekend_take                   tinyint unsigned                           null comment '��ĩ�Ƿ���ջ� 0-�� 1-��',
    is_twining                     tinyint unsigned default 0                 null comment '�Ƿ��Ĥ 0-�� 1-�ǣ��ֵ䣺ec_oms_yes_no��',
    sign_method                    varchar(100)                               null comment 'ǩ�ս��ӷ�ʽ',
    delivery_remark                varchar(255)                               null comment '���ͱ�ע',
    manage_distri_channel          tinyint unsigned default 0                 not null comment '����ͻ������������ֵ䣺ec_oms_yes_no��@1-�ǣ�0-��',
    distri_channel_codes           varchar(255)                               null comment '����������ţ����Ӣ�Ķ��ŷָ�',
    distri_commission_ratio        decimal(5, 4)                              null comment '����Ӷ�����',
    refund_type                    tinyint unsigned                           null comment '�˿�������(�ֵ䣺ec_b2b_refund_type) 1-�������ɵֿ� 2-������Ԥ���',
    create_code                    int unsigned                               null comment '�����˱���',
    create_name                    varchar(50)                                null comment '����������',
    create_time                    timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code                   int(10)                                    null comment '�޸���/�����˱���',
    changed_name                   varchar(50)                                null comment '�޸���/����������',
    changed_time                   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag                       tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��',
    receive_invoice_email          varchar(50)                                null comment '��Ʊ������'
)
    comment 'B2B�ͻ����������';

create index idx_channel_codes
    on oms_b2b_oper_client_base (manage_distri_channel, distri_channel_codes)
    comment '������������';

create table oms_b2b_oper_client_platform
(
    id                   int unsigned auto_increment comment 'id'
        primary key,
    client_code          varchar(15)                   not null comment '�ͻ����',
    shop_code            int unsigned                  null comment '���̱�ţ�����ec_oms_channel_shop_base.shop_code',
    platform_source      varchar(30)                   null comment 'ƽ̨��Դ',
    delivery_limitation  mediumint unsigned default 48 not null comment '����ʱЧ(�ش���ݵ���)����λСʱ',
    logistics_collection mediumint unsigned default 72 not null comment '����ʱЧ(��������)����λСʱ'
)
    comment 'B2B�ͻ���������ƽ̨��Դ��';

create index idx_client_code
    on oms_b2b_oper_client_platform (client_code);

create table oms_b2b_oper_client_relation
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    p_client_code varchar(15) null comment '���ͻ����',
    c_client_code varchar(15) null comment '�ӿͻ����'
)
    comment 'B2B�ͻ���������ͻ�֮���ϵ��';

create index idx_c_client
    on oms_b2b_oper_client_relation (c_client_code);

create index idx_p_client
    on oms_b2b_oper_client_relation (p_client_code);

create table oms_b2b_oper_client_setting
(
    id                 int unsigned auto_increment comment 'id'
        primary key,
    client_code        varchar(15)                                null comment '�ͻ����',
    b2b_type           tinyint unsigned                           null comment 'b2b���� 1-���� 2-����',
    is_target_client   tinyint unsigned                           null comment '�Ƿ�������/�����ͻ� 0-�� 1-��',
    client_type        tinyint unsigned                           null comment '�ͻ�����(�ֵ�:�����ͻ��鿴ec_oms_distribution_client_type ���ۿͻ��鿴ec_oms_sale_client_type)',
    b2b_level          tinyint unsigned                           null comment '����/�����ȼ�',
    auto_examine_adopt tinyint unsigned                           null comment '�������۶����Զ�����ͨ�� 0-�� 1-��',
    is_operation_audit tinyint unsigned default 0                 null comment '��Ӫ��˶������ֵ䣺ec_oms_yes_no��0-�� 1-��',
    co_start_time      datetime                                   null comment '������Чʱ��',
    co_end_time        datetime                                   null comment '����ʧЧʱ��',
    is_pay             tinyint unsigned                           null comment '�Ƿ���� 0-�� 1-��',
    pay_type           tinyint unsigned                           null comment '���㷽ʽ 0-���ڶ����������� 1-�ȿ���ÿ������',
    pay_day            smallint unsigned                          null comment '�������ڣ��죩',
    create_code        int unsigned                               null comment '�����˱���',
    create_name        varchar(50)                                null comment '����������',
    create_time        timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code       int(10)                                    null comment '�޸���/�����˱���',
    changed_name       varchar(50)                                null comment '�޸���/����������',
    changed_time       timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag           tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B�ͻ�����/������Ϣ�����';

create index idx_client_code
    on oms_b2b_oper_client_setting (client_code);

create table oms_b2b_oper_strategy_present_limit
(
    strategy_code   bigint unsigned                            not null comment '���Ա��,������+5λ���'
        primary key,
    strategy_name   varchar(100)                               null comment '��������',
    b2b_type        tinyint unsigned                           not null comment 'B2B���� 1-���� 2-����',
    start_time      datetime                                   null comment '��ʼʱ��',
    end_time        datetime                                   null comment '����ʱ��',
    strategy_remark varchar(255)                               null comment '����˵��',
    strategy_target tinyint unsigned default 1                 not null comment '���Զ���,�ֵ�ec_b2b_strategy_target@1-�����ͻ�,2-ͬSAP�ͻ�������пͻ�',
    sap_code        varchar(30)                                null comment 'SAP�ͻ����',
    client_code     varchar(15)                                null comment '�ͻ�����',
    is_stop         tinyint unsigned default 0                 null comment '�Ƿ�ͣ�� 0-�� 1-��',
    present_total   int unsigned                               null comment '������Ʒ��������',
    create_code     int unsigned                               null comment '�����˱���',
    create_name     varchar(255)                               null comment '����������',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code    int unsigned                               null comment '�����˱���',
    changed_name    varchar(255)                               null comment '����������',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag        tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B��Ʒ�޶����Թ���';

create index idx_client_code
    on oms_b2b_oper_strategy_present_limit (client_code);

create table oms_b2b_oper_strategy_present_list
(
    id               int unsigned auto_increment comment 'id'
        primary key,
    strategy_code    bigint unsigned        null comment '���Ա��,������+5λ���',
    present_code     varchar(64)            null comment '��Ʒ����',
    present_num      int unsigned           null comment '����������Ʒ����',
    sold_present_num int unsigned default 0 null comment '��ʷ����/��ʹ����Ʒ����'
)
    comment 'B2B��Ʒ�޶����Թ��������Ʒ��';

create table oms_b2b_oper_strategy_product_limit
(
    strategy_code   bigint unsigned                            not null comment '���Ա��,������+5λ���'
        primary key,
    strategy_name   varchar(100)                               null comment '��������',
    b2b_type        tinyint unsigned                           not null comment 'B2B���� 1-���� 2-����',
    limit_type      tinyint(3)       default 1                 not null comment '��������1-�������2-���Ʋ���',
    start_time      datetime                                   null comment '��ʼʱ��',
    end_time        datetime                                   null comment '����ʱ��',
    strategy_remark varchar(255)                               null comment '����˵��',
    client_code     varchar(15)                                null comment '�ͻ�����',
    is_stop         tinyint unsigned default 0                 null comment '�Ƿ�ͣ�� 0-�� 1-��',
    product_total   int unsigned                               null comment '������Ʒ��������',
    create_code     int unsigned                               null comment '�����˱���',
    create_name     varchar(255)                               null comment '����������',
    create_time     timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code    int unsigned                               null comment '�����˱���',
    changed_name    varchar(255)                               null comment '����������',
    changed_time    timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag        tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B��Ʒ�޶����Թ���';

create index idx_client_code
    on oms_b2b_oper_strategy_product_limit (client_code);

create table oms_b2b_oper_strategy_product_list
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    strategy_code bigint unsigned null comment '���Ա��,������+5λ���',
    product_code  varchar(64)     null comment '��Ʒ����'
)
    comment 'B2B��Ʒ�޶����Թ��������Ʒ��';

create index idx_strcode_procode
    on oms_b2b_oper_strategy_product_list (strategy_code, product_code);

create table oms_b2b_order_use_strategy_present
(
    id            int unsigned auto_increment comment 'id'
        primary key,
    order_code    decimal(30) unsigned                       not null comment 'EC������ţ�����ec_oms_order',
    order_pro_id  int unsigned                               null comment '������Ʒ��ϸid������ec_oms_order_product_detail',
    strategy_code bigint unsigned                            not null comment '���Ա�ţ�����oms_b2b_oper_strategy_present_limit',
    product_code  bigint unsigned                            not null comment '��Ʒ���',
    use_num       int unsigned                               null comment '��ʹ����Ʒ����',
    surplus_num   int unsigned                               null comment 'ʣ��δʹ����Ʒ����',
    changed_time  timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag      tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '����Ӧ��b2b����������ϸ��';

create index idx_strategy_code
    on oms_b2b_order_use_strategy_present (strategy_code);

create table oms_b2b_order_use_strategy_price
(
    id             int unsigned auto_increment comment 'id'
        primary key,
    order_code     decimal(30) unsigned                       not null comment 'EC������ţ�����ec_oms_order',
    order_pro_id   int unsigned                               null comment '������Ʒ��ϸid������ec_oms_order_product_detail',
    strategy_code  bigint unsigned                            not null comment '���Ա�ţ�����oms_b2b_base_strategy_info',
    product_code   bigint unsigned                            not null comment '��Ʒ���',
    strategy_price decimal(10, 2) unsigned                    null comment '���Լ۸�',
    use_num        int unsigned                               null comment 'ȡ�������Ʒ��������',
    changed_time   timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag       tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment '����ȡ�����������ϸ��';

create index idx_strategy_code
    on oms_b2b_order_use_strategy_price (strategy_code);

create table oms_b2b_plat_ec_product_relation
(
    distri_channel_code varchar(10)     not null comment '�����������',
    plat_product_code   varchar(32)     not null comment 'ƽ̨��Ʒ���',
    ec_product_code     bigint unsigned not null comment 'EC��Ʒ���',
    primary key (distri_channel_code, plat_product_code)
)
    comment 'ƽ̨��Ʒ��EC��Ʒ������';

create table oms_b2b_receipt
(
    id                     int(24) unsigned auto_increment comment '����id'
        primary key,
    receipt_code           varchar(68)                                not null comment '�ջ����ţ�SH+���̶������+2λ˳����',
    shop_order_id          varchar(64)                                not null comment '���̶������',
    receipt_type           tinyint unsigned default 0                 not null comment '������ͣ��ɹ����,�����ֶΣ���չ�ã���ʱĬ��0.',
    client_storehouse_code varchar(10)                                not null comment '�ջ��ֿ�',
    client_code            varchar(15)                                not null comment '�����ͻ����(ʵ���ջ���)',
    create_time            timestamp        default CURRENT_TIMESTAMP null comment '�ջ�ʱ�䣬����ʱ��',
    create_code            varchar(50)                                not null comment '�����˵�¼�˺�(ʵ���ջ���)',
    create_name            varchar(50)                                null comment '����������(ʵ���ջ���)',
    constraint uniq_receipt_code
        unique (receipt_code)
)
    comment '�ջ���';

create index idx_cscode_ctime
    on oms_b2b_receipt (client_storehouse_code, create_time);

create index idx_soid_rc_ctime
    on oms_b2b_receipt (shop_order_id, receipt_code, create_time);

create table oms_b2b_receipt_info
(
    id                   int(24) unsigned auto_increment comment '����id'
        primary key,
    receipt_code         varchar(68)          not null comment '�ջ�����ţ�SH+���̶������+2λ˳����',
    order_code           decimal(30) unsigned not null comment 'EC������ţ���ԭʼ�����ϵ�����ԭ������',
    logistics_order_code decimal(30)          not null comment '��������',
    product_code         bigint               not null comment '��Ʒ���',
    inbound_num          int(10)              not null comment '�������',
    actual_send_num      int(10)              not null comment '�ѷ�������',
    purchase_num         int(10)              not null comment '�ɹ�����',
    constraint uniq_locode_pcode
        unique (logistics_order_code, product_code)
)
    comment '�ջ�������';

create index idx_receiptcode
    on oms_b2b_receipt_info (receipt_code);

create table oms_b2b_temporary_receipt_base
(
    receipt_code         bigint unsigned                            not null comment '�տ��'
        primary key,
    bill_num             int unsigned                               null comment '��������',
    receipt_total_amount decimal(10, 2) unsigned                    null comment '�տ��ܽ��',
    receipt_batch_no     bigint                                     null comment 'ͬ���տ���',
    remark               varchar(255)                               null comment '��ע',
    verify_code          int unsigned                               null comment '����˱���',
    verify_name          varchar(50)                                null comment '���������',
    verify_time          datetime                                   null comment '���ʱ��',
    verify_opinion       tinyint unsigned default 2                 null comment '������ 0-��ͨ�� 1-ͨ�� 2-�����',
    verify_explain       varchar(255)                               null comment '���˵��',
    create_code          int unsigned                               null comment '�����˱���',
    create_name          varchar(50)                                null comment '����������',
    create_time          timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_code         int(10)                                    null comment '�޸���/�����˱���',
    changed_name         varchar(50)                                null comment '�޸���/����������',
    changed_time         timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag             tinyint unsigned default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��'
)
    comment 'B2B��ʱ�տ��Ϣ��';

create index idx_bno_delf
    on oms_b2b_temporary_receipt_base (receipt_batch_no, del_flag);

create table oms_b2b_temporary_receipt_sub
(
    id                     bigint                                        not null comment 'id'
        primary key,
    receipt_code           bigint unsigned                               null comment '�տ��',
    receipt_method         tinyint unsigned                              null comment '�տʽ 0-�Թ�ת�� 1-�˷����� 2-�����ֵ',
    receipt_amount         decimal(10, 2) unsigned                       null comment '�տ���',
    transaction_serial_num varchar(32)                                   null comment '������ˮ��',
    order_code             varchar(32)                                   null comment '�˷����Ӷ�����',
    pay_company            varchar(100)                                  null comment '���˾',
    pay_date               date                                          null comment '��������',
    receipt_bill_pic       varchar(255)                                  null comment '�ؿͼƬ',
    create_time            timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    changed_time           timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�/����ʱ��',
    del_flag               tinyint(2) unsigned default 0                 null comment '�Ƿ�ɾ����0����Ч��1��ɾ����'
)
    comment 'B2B��ʱ�տ��ϸ';

create index idx_receipt_code_del
    on oms_b2b_temporary_receipt_sub (receipt_code, del_flag);

create index idx_transaction_serial_num
    on oms_b2b_temporary_receipt_sub (transaction_serial_num);

create index order_code
    on oms_b2b_temporary_receipt_sub (order_code);

create table oms_b2b_unit_order_sap
(
    id                    int auto_increment comment '����ID'
        primary key,
    sap_order_code        varchar(100)                       null comment 'sap�������',
    order_code            varchar(100)                       null comment '�������',
    order_id              varchar(64)                        null comment '�ⲿƽ̨������',
    order_source          varchar(32)                        null comment 'ƽ̨��Դ',
    send_status           varchar(32)                        null comment 'SAP����״̬',
    waybill_code          varchar(512)                       null comment '���˵��ţ���ݵ��ţ�',
    waybill_number        varchar(521)                       null comment '��������',
    apply_document_no     varchar(100)                       null comment '�����ļ����',
    delivery_date         datetime                           null comment '����ʱ��',
    transport_area_code   varchar(32)                        null comment '�����������',
    store_name            varchar(32)                        null comment '�ֿ�����',
    store_code            varchar(32)                        null comment '�����ֿ����',
    store_desc            varchar(512)                       null comment '�ֿ�����',
    plan_arrival_date     datetime                           null comment '�ƻ���������',
    real_arrival_date     datetime                           null comment 'ʵ�ʵ�������',
    remark                varchar(512)                       null comment '�����쳣��ע',
    order_start_time      datetime                           null comment '��������ʱ��',
    order_transfer_date   datetime                           null comment '����ת������',
    order_transfer_time   datetime                           null comment '����ת��ʱ���',
    weight                varchar(64)                        null comment '����',
    verify_date           datetime                           null comment '���ʱ��',
    print_date            datetime                           null comment '��ӡʱ��',
    is_success            tinyint                            null comment '�Ƿ����ͳɹ���0����1�ǣ�',
    return_msg            varchar(512)                       null comment 'SAP������Ϣ',
    sap_bulk              varchar(32)                        null comment 'SAP���',
    carton_num            int(10)                            null comment '��������',
    is_cancel             varchar(32)                        null comment 'ȡ��״̬',
    cancel_failure_reason varchar(512)                       null comment 'ȡ��ʧ��ԭ��',
    create_code           int(10)                            null comment '�����˱���',
    create_name           varchar(50)                        null comment '����������',
    create_time           datetime default CURRENT_TIMESTAMP null comment '����ʱʱ��',
    changed_code          int(10)                            null comment '�޸��˱���',
    changed_name          varchar(50)                        null comment '�޸�������',
    changed_time          datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '�޸�ʱ��',
    del_flag              tinyint  default 0                 null comment 'ɾ����ʶ 0-��Ч 1-ɾ��',
    constraint unique_index_os
        unique (order_id, order_source)
)
    comment 'SAP������';

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
    module_type   tinyint unsigned                    not null comment 'ģ������',
    oper_type     tinyint unsigned                    not null comment '��������',
    oper_content  varchar(512)                        null comment '��������',
    relation_info varchar(50)                         null comment '������Ϣ����Ӧ��¼�ı�š����Ƶȣ�',
    creator_id    int unsigned                        null comment '�����˱��',
    creator_name  varchar(32)                         null comment '����������',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment 'ģ�������־';

create index idx_module_oper
    on sys_action_log (module_type, oper_type);

create index idx_relation
    on sys_action_log (relation_info);

create table sys_auth_user_info
(
    user_id              int(8) unsigned                               not null comment '�û�id ��Ӧsys_user��id'
        primary key,
    authorization_reason varchar(255)                                  null comment '����Ȩԭ��',
    remarks              varchar(255)                                  null comment '��ע',
    create_code          int(11) unsigned                              null comment '�����˱���',
    create_name          varchar(50)                                   null comment '����������',
    create_time          timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    op_code              int(11) unsigned                              null comment '�����˱���',
    op_name              varchar(50)                                   null comment '����������',
    op_time              timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag             tinyint(1) unsigned default 0                 null comment 'ɾ����� 1��ɾ�� 0��δɾ��'
)
    comment '����Ȩ�û���Ϣ��';

create table sys_auth_user_role
(
    user_id     int unsigned                        not null comment '�û�ID',
    role_id     int unsigned                        not null comment '��ɫID',
    creator_id  int(11) unsigned                    null comment '�����˱��',
    create_time timestamp default CURRENT_TIMESTAMP null comment '����ʱ��',
    op_code     int                                 null comment '�����˱���',
    op_time     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    primary key (user_id, role_id)
)
    comment '����Ȩ�û����ɫ��ϵ��';

create table sys_dict_entry
(
    id          int(8) unsigned auto_increment comment '���'
        primary key,
    dicttype_id varchar(50)          not null comment 'ҵ���ֵ���ѡ��',
    dict_id     varchar(100)         not null comment '�ֵ����',
    dict_name   varchar(400)         null comment '�ֵ�����',
    status      tinyint(1)           null comment '״̬��1ʹ����/0�ѷ�����',
    sort        smallint(4)          null comment '�������',
    create_time datetime             null comment '����ʱ��',
    op_time     datetime             null comment '����ʱ��',
    del_flag    tinyint(1) default 0 null comment 'ɾ�����
1��ɾ��
0��δɾ��'
)
    comment '�ֵ�����ϸ��';

create index idx_dict_id
    on sys_dict_entry (dict_id);

create index idx_dicttype_id
    on sys_dict_entry (dicttype_id);

create table sys_dict_type
(
    id            int(8) unsigned auto_increment comment '���'
        primary key,
    dicttype_id   varchar(100)         not null comment 'ҵ���ֵ����',
    dicttype_name varchar(100)         null comment 'ҵ���ֵ�����',
    create_time   datetime             null comment '����ʱ��',
    op_time       datetime             null comment '����ʱ��',
    del_flag      tinyint(1) default 0 null comment 'ɾ�����
1��ɾ��
0��δɾ��'
)
    comment '�ֵ����ͱ�';

create index idx_dicttype_id
    on sys_dict_type (dicttype_id);

create table sys_interface_log
(
    id                bigint unsigned auto_increment comment 'id'
        primary key,
    service_type      tinyint unsigned                    not null comment '��������/ҵ������@1-�Զ��ƶ���2-����ƶ���3-�ָ��������ƶ���4-ag�ָ��������ƶ���5-�����˻���6-���͵����˻���7-�ش�������8-�ش��˻���',
    relation_info     varchar(50)                         null comment '������Ϣ����Ӧ��¼�ı�š����Ƶȣ�',
    request_variables text                                null comment '�������',
    response_result   text                                null comment '��Ӧ���',
    creator_id        int unsigned                        null comment '�����˱��',
    creator_name      varchar(32)                         null comment '����������',
    create_time       timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment '�ӿڶԽ���־';

create index idx_create_time
    on sys_interface_log (create_time);

create index idx_log_relation_info
    on sys_interface_log (relation_info);

create table sys_menu
(
    id          int(8) unsigned auto_increment comment '���'
        primary key,
    parent_id   int(8)                     null comment '��ID',
    parent_ids  varchar(2000)              null comment '��ID',
    text        varchar(100)               not null comment '�˵�����',
    sort        decimal                    not null comment '����',
    url         varchar(2000)              null comment '����',
    target_type varchar(32)                null comment 'ҳ��򿪷�ʽ',
    icon        varchar(100)               null comment 'ͼ��',
    is_show     tinyint(1)       default 1 null comment '�Ƿ���ʾ
1����ʾ
0������',
    permission  varchar(200)               null comment 'Ȩ�ޱ�ʶ',
    remarks     varchar(255)               null comment '��ע',
    menu_type   tinyint unsigned default 1 null comment '�˵����� 0-Ŀ¼ 1-ģ�� 2-ҳ�� 3-����',
    create_time datetime                   null comment '����ʱ��',
    op_time     datetime                   null comment '����ʱ��',
    del_flag    tinyint(1)       default 0 null comment 'ɾ�����
1��ɾ��
0��δɾ��'
)
    comment '�˵���Ϣ��';

create index idx_parent_id
    on sys_menu (parent_id);

create table sys_modify_log
(
    id            bigint unsigned auto_increment comment 'id'
        primary key,
    business_type tinyint unsigned                    not null comment 'ҵ������@1-�˻����޸�',
    business_code varchar(50)                         null comment 'ҵ����ˮ�ţ���Ӧ��¼�ı�š����Ƶȣ�',
    old_record    text                                null comment '��¼�޸�ǰ����',
    new_record    text                                null comment '��¼�޸ĺ�����',
    creator_id    int unsigned                        null comment '�����˱��',
    creator_name  varchar(32)                         null comment '����������',
    create_time   timestamp default CURRENT_TIMESTAMP null comment '����ʱ��'
)
    comment 'ģ���޸ļ�¼��־';

create index idx_bcode_btype
    on sys_modify_log (business_code, business_type);

create table sys_role
(
    id          int(8) unsigned auto_increment comment '���'
        primary key,
    code        varchar(50)                                   not null comment '��ɫ����',
    name        varchar(100)                                  not null comment '��ɫ����',
    enabled     tinyint(1) unsigned default 1                 null comment '�Ƿ����1������ 0��ͣ��',
    remarks     varchar(255)                                  null comment '��ע',
    is_all_shop tinyint unsigned    default 0                 null comment '�Ƿ���Ȩȫ������Ȩ�� 0-�� 1-��',
    create_code int(11) unsigned                              null comment '�����˱���',
    create_name varchar(50)                                   null comment '����������',
    create_time timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    op_code     int                                           null comment '�����˱���',
    op_name     varchar(50)                                   null comment '����������',
    op_time     timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag    tinyint(1) unsigned default 0                 null comment 'ɾ�����1��ɾ�� 0��δɾ��',
    constraint code_UNIQUE
        unique (code)
)
    comment '��ɫ��';

create table sys_role_data
(
    role_id   int unsigned               not null comment '��ɫID',
    data_id   int unsigned               not null comment '����ID',
    data_type tinyint unsigned default 1 not null comment '��������@1-����',
    primary key (role_id, data_id, data_type)
)
    comment '��ɫ���ݹ�ϵ��';

create table sys_role_menu
(
    role_id int(8) unsigned not null comment '��ɫID',
    menu_id int(8) unsigned not null comment '�˵�ID',
    primary key (role_id, menu_id)
)
    comment '��ɫ�˵���ϵ��';

create table sys_user
(
    id            int(8) unsigned auto_increment comment '���'
        primary key,
    login_name    varchar(100)                                  not null comment '��¼��',
    password      varchar(100)                                  not null comment '����',
    name          varchar(36)                                   not null comment '����',
    email         varchar(50)                                   null comment '�ʼ�',
    phone         varchar(36)                                   null comment '�绰',
    mobile        varchar(36)                                   null comment '�ֻ�',
    mobile_cipher varchar(152)                                  null comment '�ֻ�',
    user_type     tinyint unsigned    default 1                 not null comment '�û����� 1-Ա����2-�ⲿ�û�',
    enabled       tinyint(1) unsigned default 1                 null comment '�Ƿ���� 1������ 0��ͣ��',
    remarks       varchar(255)                                  null comment '��ע',
    create_code   int(11) unsigned                              null comment '�����˱���',
    create_name   varchar(50)                                   null comment '����������',
    create_time   timestamp           default CURRENT_TIMESTAMP null comment '����ʱ��',
    op_code       int(11) unsigned                              null comment '�����˱���',
    op_name       varchar(50)                                   null comment '����������',
    op_time       timestamp           default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��',
    del_flag      tinyint(1) unsigned default 0                 null comment 'ɾ����� 1��ɾ�� 0��δɾ��',
    constraint login_name_UNIQUE
        unique (login_name)
)
    comment '�û���';

create table sys_user_role
(
    user_id int(8) unsigned not null comment '�û�ID',
    role_id int(8) unsigned not null comment '��ɫID',
    primary key (user_id, role_id)
)
    comment '�û���ɫ��ϵ��';

create table t1
(
    id            int unsigned auto_increment comment '����id'
        primary key,
    hand_code     int unsigned default 0 not null comment '������',
    province_code int unsigned           null comment 'ʡ�ݱ���',
    province_name varchar(50)            null comment 'ʡ������',
    city_code     int unsigned           null comment '���б���',
    city_name     varchar(50)            null comment '��������',
    district_code int unsigned           null comment '���ر��',
    district_name varchar(50)            null comment '��������'
)
    comment '�����Զ���������������ϸ��';

create index idx_hand_code
    on t1 (hand_code);

create table t_tab
(
    id   int unsigned auto_increment comment '����ID'
        primary key,
    gys  varchar(50) null comment '��Ӧ��',
    lb   varchar(50) null comment '���',
    pp   varchar(50) null comment 'Ʒ��',
    gcjk varchar(50) null comment '��������',
    dc   varchar(50) null comment '����'
)
    comment 't';

create table t_tab1
(
    id    int unsigned auto_increment comment '����ID'
        primary key,
    gys   varchar(50) null comment '��Ӧ��',
    pp    varchar(50) null comment 'Ʒ��',
    gcjk  varchar(50) null comment '��������',
    dc    varchar(50) null comment '����',
    pp1   varchar(50) null comment '��1�е�Ʒ��',
    gcjk1 varchar(50) null comment '��1�еĹ�������',
    dc1   varchar(50) null comment '��1�еĵ���'
)
    comment 't1';

create table t_user0
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '����',
    city_id     int(12)                             null comment '����',
    sex         tinyint(1)                          null comment '�Ա�',
    phone       varchar(32)                         null comment '�绰',
    email       varchar(32)                         null comment '����',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '����ʱ��',
    password    varchar(32)                         null comment '����'
);

create table t_user1
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '����',
    city_id     int(12)                             null comment '����',
    sex         tinyint(1)                          null comment '�Ա�',
    phone       varchar(32)                         null comment '�绰',
    email       varchar(32)                         null comment '����',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '����ʱ��',
    password    varchar(32)                         null comment '����'
);

create table t_user2
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '����',
    city_id     int(12)                             null comment '����',
    sex         tinyint(1)                          null comment '�Ա�',
    phone       varchar(32)                         null comment '�绰',
    email       varchar(32)                         null comment '����',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '����ʱ��',
    password    varchar(32)                         null comment '����'
);

create table t_user3
(
    id          bigint                              not null
        primary key,
    name        varchar(64)                         null comment '����',
    city_id     int(12)                             null comment '����',
    sex         tinyint(1)                          null comment '�Ա�',
    phone       varchar(32)                         null comment '�绰',
    email       varchar(32)                         null comment '����',
    create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '����ʱ��',
    password    varchar(32)                         null comment '����'
);

create table t_user_address0
(
    id               bigint auto_increment comment '����'
        primary key,
    user_id          bigint                                     not null comment '�û�ID',
    address          varchar(255)                               null comment '��ַ',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
);

create table t_user_address1
(
    id               bigint auto_increment comment '����'
        primary key,
    user_id          bigint                                     not null comment '�û�ID',
    address          varchar(255)                               null comment '��ַ',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
);

create table t_user_address2
(
    id               bigint auto_increment comment '����'
        primary key,
    user_id          bigint                                     not null comment '�û�ID',
    address          varchar(255)                               null comment '��ַ',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
);

create table t_user_address3
(
    id               bigint auto_increment comment '����'
        primary key,
    user_id          bigint                                     not null comment '�û�ID',
    address          varchar(255)                               null comment '��ַ',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '������ʱ��',
    del_flag         tinyint unsigned default 0                 not null comment 'ɾ����ǣ�1-�ǣ�0-��'
);

create table tb_sequence_tmp
(
    id int auto_increment
        primary key
);

create table temp_order_info
(
    order_code    decimal(30) unsigned not null comment 'EC�������',
    shop_order_id varchar(64)          not null comment '���̶�����ţ���Ϊ�ϵ�����ΪEC�������(order_code)',
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
    handle_status tinyint unsigned default 0 null comment '�Ƿ���  0 - δ����  1 - ����2-ʧ��'
);

create table test_crm_gp_demo_food
(
    id      int(11) unsigned auto_increment comment '�𽥣�����Ƽ�food_id'
        primary key,
    name    varchar(20)                not null comment 'ʳ�������',
    recipe  varchar(255)               null comment 'ʳ����䷽',
    deleted tinyint unsigned default 0 null comment '�߼�ɾ����0δɾ��1ɾ��'
);

create table test_level_price_update
(
    id                    bigint unsigned auto_increment comment 'id'
        primary key,
    update_list_code      bigint(100)             null comment '���µ����',
    update_list_name      varchar(100)            not null comment '���µ�����',
    b2b_type              tinyint(3)              null comment '����1 ����2',
    valid_start_time      datetime                null comment '���µ���Чʱ��',
    valid_end_time        datetime                null comment '���µ�ʧЧʱ��',
    product_code          bigint(100)             null comment '��Ʒ���',
    level_num             tinyint unsigned        not null comment '�ȼ�/����',
    level_price           decimal(10, 2) unsigned null comment '�ȼ��ܿؼ�',
    one_magnitude_price   decimal(10, 2) unsigned null comment 'һ�����۸�',
    two_magnitude_price   decimal(10, 2) unsigned null comment '�������۸�',
    three_magnitude_price decimal(10, 2) unsigned null comment '�������۸�',
    four_magnitude_price  decimal(10, 2) unsigned null comment '�������۸�',
    five_magnitude_price  decimal(10, 2) unsigned null comment '�������۸�',
    six_magnitude_price   decimal(10, 2) unsigned null comment '�������۸�',
    seven_magnitude_price decimal(10, 2) unsigned null comment '�������۸�',
    eight_magnitude_price decimal(10, 2) unsigned null comment '�������۸�',
    nine_magnitude_price  decimal(10, 2) unsigned null comment '�������۸�'
)
    comment '�����ȼ��ܿؼ۸��µ���ʱ��';

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
    id           int unsigned auto_increment comment '����Id'
        primary key,
    order_code   decimal(30) unsigned not null comment 'EC�������',
    waybill_code varchar(512)         null comment '��ݵ��ţ�����ö��Ÿ���'
)
    comment '��ʱ��_ͳһ������������ϸ';

create table tmp_testparam
(
    id               int unsigned auto_increment comment '����'
        primary key,
    param            varchar(64)                                null comment '����1',
    param1           varchar(64)                                null comment '����2',
    param2           decimal(32)                                null comment '����2',
    handle_status    tinyint unsigned default 0                 null comment '�Ƿ���  0 - δ����  1 - ����',
    create_time      timestamp        default CURRENT_TIMESTAMP null comment '����ʱ��',
    last_update_time timestamp        default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '����ʱ��'
)
    comment 'excel��ʱ�����';

create index idx_creat_time
    on tmp_testparam (create_time);

create index idx_ord_code
    on tmp_testparam (param2);

create table writeoff_ec_order
(
    id                  int auto_increment
        primary key,
    ec_order_no         varchar(64)                                       not null comment 'EC�������',
    shop_order_id       varchar(64)                                       null comment '���̶������',
    outter_id           varchar(32)                                       null comment '�ⲿƽ̨��Ʒ���',
    shop_code           int                                               null comment '���̱���',
    shop_name           varchar(64)         default ''                    null comment '��������',
    order_create_date   timestamp                                         null comment '�µ�ʱ��',
    order_type          tinyint(2)                                        null comment '������ͣ�0��δ��֣�1:����2������',
    associated_order    varchar(514)                                      null comment '��Ϲ������ţ�������𣬴��ӵ�����(����ö��Ÿ���);������ϣ���ϵ�����',
    order_source        tinyint(3)                                        null comment '������Դ,1-����������2-����������3-���붩��',
    pay_channel         tinyint                                           null comment '֧����ʽ',
    buyer_id            varchar(64)                                       null comment '���ID',
    consumer_consultant varchar(64)         default ''                    null comment '�����߹���',
    referrer            varchar(32)         default ''                    null comment '�Ƽ���',
    review_time         timestamp                                         null comment '���ʱ��',
    shop_discount       decimal(14, 4)                                    null comment '���̳е������Ż�',
    platform_discount   decimal(14, 4)                                    null comment 'ƽ̨�е������Ż�',
    shipping_cost       decimal(14, 4)                                    null comment '���˷�',
    order_payment       decimal(14, 4)                                    null comment '����ʵ�����',
    sync_date           timestamp                                         null comment '�����ʱ��',
    status              tinyint(1)          default 0                     null comment '��������״̬,0������1����ɹ���2����ʧ��',
    data_source         tinyint(3)                                        null comment '������Դ,1:EC-OMS��2:�Խ�-2C-OMS��3-�Խ�-2B-OMS',
    failure_reason      varchar(255)                                      null comment 'ʧ��ԭ��',
    create_time         timestamp            not null comment '����ʱ��',
    del_flag            tinyint(1) unsigned default 0                     not null comment 'ɾ����� 1��ɾ�� 0��δɾ��',
    resend_order_code   varchar(64)                                       null comment '������������',
    tasks_num           tinyint(2)          default 0                     null comment '��ʱִ��ת�����۶�������',
    update_flag         tinyint(1)          default 0                     null comment '�Ƿ��и���',
    pay_time            timestamp            not null comment '����֧��ʱ��',
    syn_date            timestamp            not null comment '���ͬ��ʱ��',
    import_cause        tinyint unsigned                                  null comment '����ԭ���ֵ䣺ec_oms_import_cause��',
    constraint index_ec_no
        unique (ec_order_no)
)
    comment 'ԭʼ����' charset = utf8;

create fulltext index fulltext_associated_order
    on writeoff_ec_order (associated_order);

create index idx_status_ocdate_ecnum
    on writeoff_ec_order (status, order_create_date, ec_order_no);

