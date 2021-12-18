package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Jarod.Kong
 */
@Getter
public enum ExtractMode {
    All(1, "全量抽取"),
    OtherCustom(4, "其他抽取方式，基于customExtractWhereSql字段来定义"),
    WithIncField(5, "带增量字段抽取，如：last_update_time");

    private final int type;
    private final String desc;

    ExtractMode(int type, String desc) {
        this.type = type;
        this.desc = desc;
    }


}
