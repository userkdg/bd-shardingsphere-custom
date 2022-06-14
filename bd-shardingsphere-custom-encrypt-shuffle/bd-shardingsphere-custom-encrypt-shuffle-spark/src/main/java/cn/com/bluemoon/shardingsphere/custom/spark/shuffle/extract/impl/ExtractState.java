package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition.DbFieldType;
import lombok.*;

import java.io.Serializable;

/**
 * @author Jarod.Kong
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ExtractState implements Serializable {
    private String incrName;
    private Object minIncrVal;
    private Object maxIncrVal;
    private DbFieldType IncrType;
}
