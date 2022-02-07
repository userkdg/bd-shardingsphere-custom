package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Jarod.Kong
 */
@Data
public class SqlExecutorResult implements Serializable {
    private String sql;
    private Boolean success;
    private String errorMsg;
}
