package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl.ExtractState;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;

/**
 * @author Jarod.Kong
 */
@RequiredArgsConstructor
@Getter
public class TableSplitPkInfo implements Serializable {
    private final String[] pkPredicateArr;

    private final ExtractState incrExtractState;

}
