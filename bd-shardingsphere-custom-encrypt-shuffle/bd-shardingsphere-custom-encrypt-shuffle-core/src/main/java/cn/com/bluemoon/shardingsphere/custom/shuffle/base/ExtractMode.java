package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import lombok.Getter;

/**
 * @author Jarod.Kong
 */
@Getter
public enum ExtractMode {
    All(1, "all", "全量抽取"),
    WithPersistStateCustomWhere(3, "WithPersistStateCustomWhere","自定义where抽取方式，带缓存抽取状态，且结合customExtractWhereSql字段来定义"),
    OtherCustom(4, "otherCustom","其他抽取方式，基于customExtractWhereSql字段来定义"),
    WithIncField(5, "withIncField","带增量字段抽取，如：last_update_time"),
    WithIncFieldOnce(6, "WithIncFieldOnce","带增量字段抽取一次，如：last_update_time");

    private final int type;
    private final String name, desc;

    ExtractMode(int type, String name, String desc) {
        this.type = type;
        this.name = name;
        this.desc = desc;
    }


}
