package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleJobGraceful;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
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
public class EncryptShuffleJob extends BaseShuffleJobGraceful implements EncryptShuffle {
    public static final String CIPHER_SUFFIX = System.getProperty("cipher.suffix", "_cipher");
     public EncryptShuffleJob(GlobalConfig config) {
        super(config);
    }


    public static String encryptFieldName(String plainName) {
        return plainName + CIPHER_SUFFIX;
    }

    @Override
    public void init() {
        super.init();
        boolean hadEncryptRule = config.getExtractCols().stream().allMatch(f -> f.getEncryptRule() != null && f.getEncryptRule().getType() != null);
        Assert.isTrue(hadEncryptRule, "必须指定明文列的加密算法信息");
    }

    @Override
    public void doShuffle(Dataset<Row> dataset, StructType schema, GlobalConfig globalConfig) {
        JavaRDD<Row> rowJavaRDD = dataset.toJavaRDD();
        rowJavaRDD
                .repartition(Integer.parseInt(parallelNum))
                .mapPartitions(new EncryptFlatMapFunction(globalConfigBroadcast))
                .foreachPartition(new EncryptForeachPartitionFunction(schema, globalConfigBroadcast));
    }
}
