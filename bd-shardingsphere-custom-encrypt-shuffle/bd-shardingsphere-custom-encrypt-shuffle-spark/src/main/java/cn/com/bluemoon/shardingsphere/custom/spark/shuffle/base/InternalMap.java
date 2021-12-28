package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import lombok.Getter;
import lombok.Setter;

import java.util.Map;

/**
 * @author Jarod.Kong
 */
@Getter
@Setter
public class InternalMap {
    private Map<String, Object> row;
}
