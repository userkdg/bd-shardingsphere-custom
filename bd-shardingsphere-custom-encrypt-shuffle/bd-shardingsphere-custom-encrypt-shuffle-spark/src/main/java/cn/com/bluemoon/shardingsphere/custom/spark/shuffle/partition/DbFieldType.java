package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition;

import com.alibaba.datax.plugin.rdbms.reader.Constant;
import lombok.Getter;

import java.io.Serializable;

/**
 * @author Jarod.Kong
 */@Getter
public enum DbFieldType implements Serializable {
    STRING(1, "'", true),
    NUMBER(2, "", false),
    TIMESTAMP(3, "'", true);

    private final int code;
    private final String quote;
    private final boolean needQuote;

    DbFieldType(int code, String quote, boolean needQuote) {
        this.code = code;
        this.quote = quote;
        this.needQuote = needQuote;
    }

    public static DbFieldType from(String dataXPkTypeStr){
        if (dataXPkTypeStr == null) {
            throw new IllegalArgumentException("不合法字段类型");
        }
        try {
            return valueOf(dataXPkTypeStr);
        } catch (IllegalArgumentException e) {
            //
        }
        if (String.valueOf(Constant.PK_TYPE_STRING).equalsIgnoreCase(dataXPkTypeStr)){
            return STRING;
        }
        if (String.valueOf(Constant.PK_TYPE_UUID_STRING).equalsIgnoreCase(dataXPkTypeStr)){
            return STRING;
        }
        if (String.valueOf(Constant.PK_TYPE_BIG_INTEGER_STRING).equalsIgnoreCase(dataXPkTypeStr)){
            return STRING;
        }
        if (String.valueOf(Constant.PK_TYPE_LONG).equalsIgnoreCase(dataXPkTypeStr)){
            return NUMBER;
        }
        if (String.valueOf(Constant.PK_TYPE_DECIMAL_ZERO_SCALE).equalsIgnoreCase(dataXPkTypeStr)){
            return NUMBER;
        }
        if (Constant.INCR_TYPE_TIMESTAMP.equalsIgnoreCase(dataXPkTypeStr)){
            return TIMESTAMP;
        }

        return STRING;
    }
}
