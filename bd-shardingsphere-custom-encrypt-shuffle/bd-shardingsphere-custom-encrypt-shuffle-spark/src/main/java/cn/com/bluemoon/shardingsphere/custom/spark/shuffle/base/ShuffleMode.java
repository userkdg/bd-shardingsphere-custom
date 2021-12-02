package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import lombok.Getter;

/**
 * @author Jarod.Kong
 */
@Getter
public enum ShuffleMode {
    ReShuffle(1, "重洗"),
    OrNullShuffle(2, "多列OR且为null的洗数"),
    AndNullShuffle(3, "多列AND且为null的洗数");
    private final int type;
    private final String desc;

    ShuffleMode(int type, String desc) {
        this.type = type;
        this.desc = desc;
    }


}
