package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import java.util.List;
import java.util.Optional;

/**
 * 全量一次性
 *
 * @author Jarod.Kong
 */
public class SparkDbCustomExtract extends BaseSparkDbExtract {

    public SparkDbCustomExtract(EncryptGlobalConfig config, SparkSession spark) {
        super(config, spark);
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> plainCols) {
        return Optional.ofNullable(config.getCustomExtractWhereSql())
                .orElseThrow(() -> new RuntimeException("必须自定义抽取where条件（不带where）"));
    }


    @Override
    public Dataset<Row> extract() {
        return spark.read().format("jdbc").options(getCustomDbTableJdbcReadProps()).load();
    }
}
