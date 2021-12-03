package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

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
public class EncryptShuffleJob extends BaseEncryptShuffleJob {

    public EncryptShuffleJob(EncryptGlobalConfig config) {
        super(config);
    }

    @Override
    public void doShuffle(Dataset<Row> dataset, StructType schema, EncryptGlobalConfig globalConfig) {
        dataset.filter((FilterFunction<Row>) row -> globalConfig.getPlainCols().stream().anyMatch(f -> row.getAs(f.getName()) != null))
                .repartition(Integer.parseInt(parallelNum), globalConfig.getPrimaryCols().stream().map(g -> new Column(g.getName())).toArray(Column[]::new))
                .foreachPartition(new EncryptJobForeachPartitionFunction(schema, globalConfigBroadcast));
    }

}
