package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleJobGraceful;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.FilterFunction;
import org.apache.spark.sql.Column;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.types.StructType;


/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public class EncryptShuffleJob extends BaseShuffleJobGraceful implements EncryptShuffle {

    public EncryptShuffleJob(GlobalConfig config) {
        super(config);
    }

    @Override
    public void doShuffle(Dataset<Row> dataset, StructType schema, GlobalConfig globalConfig) {
        dataset.filter((FilterFunction<Row>) row -> globalConfig.getExtractCols().stream().anyMatch(f -> row.getAs(f.getName()) != null))
                .repartition(Integer.parseInt(parallelNum), globalConfig.getPrimaryCols().stream().map(g -> new Column(g.getName())).toArray(Column[]::new))
                .foreachPartition(new EncryptShuffleJobForeachPartitionFunction(schema, globalConfigBroadcast));
    }

}
