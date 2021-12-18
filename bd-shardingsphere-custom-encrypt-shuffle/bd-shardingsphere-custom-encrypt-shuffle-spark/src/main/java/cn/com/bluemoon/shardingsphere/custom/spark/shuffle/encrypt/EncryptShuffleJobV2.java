package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.hutool.core.lang.Assert;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.types.StructType;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public class EncryptShuffleJobV2 extends BaseEncryptShuffleJob {

    public EncryptShuffleJobV2(EncryptGlobalConfig config) {
        super(config);
    }

    @Override
    public void init() {
        super.init();
        boolean hadEncryptRule = config.getPlainCols().stream().allMatch(f -> f.getEncryptRule() != null && f.getEncryptRule().getType() != null);
        Assert.isTrue(hadEncryptRule, "必须指定明文列的加密算法信息");
    }

    @Override
    public void doShuffle(Dataset<Row> dataset, StructType schema, EncryptGlobalConfig globalConfig) {
        JavaRDD<Row> rowJavaRDD = dataset.toJavaRDD();
        rowJavaRDD
                .repartition(Integer.parseInt(parallelNum))
                .mapPartitions(new EncryptFlatMapFunction(globalConfigBroadcast))
                .foreachPartition(new EncryptForeachPartitionFunction(schema, globalConfigBroadcast));
    }
}
