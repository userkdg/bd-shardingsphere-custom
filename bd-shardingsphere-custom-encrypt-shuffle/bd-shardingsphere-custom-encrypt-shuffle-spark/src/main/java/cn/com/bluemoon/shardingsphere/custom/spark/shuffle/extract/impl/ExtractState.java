package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl;

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
    private String pkName;
    private Object maxPkVal;
    private Object minPkVal;
}
