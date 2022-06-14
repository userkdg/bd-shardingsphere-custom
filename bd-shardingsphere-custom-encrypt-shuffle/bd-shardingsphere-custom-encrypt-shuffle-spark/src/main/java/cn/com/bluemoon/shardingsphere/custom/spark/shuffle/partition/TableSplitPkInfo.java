package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition;

import com.alibaba.datax.plugin.rdbms.reader.Constant;
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
    private final Object minPkValue;
    private final Object maxPkValue;
    /**
     * 对应datax的{@link Constant#PK_TYPE}
     */
    private final PkType pkType;

}
