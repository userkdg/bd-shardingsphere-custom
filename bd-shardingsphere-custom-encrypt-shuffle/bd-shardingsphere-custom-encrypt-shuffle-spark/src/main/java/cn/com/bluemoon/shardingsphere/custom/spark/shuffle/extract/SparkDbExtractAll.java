package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import java.util.List;

/**
 * 全量一次性
 *
 * @author Jarod.Kong
 */
public class SparkDbExtractAll extends BaseSparkDbExtract {

    public SparkDbExtractAll(GlobalConfig config, SparkSession spark) {
        super(config, spark);
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        return " 1=1 ";
    }

    @Override
    public Dataset<Row> extract() {
        return spark.read().format("jdbc").options(getCustomDbTableJdbcReadProps()).load();
    }

    @Override
    public String type() {
        return ExtractMode.All.getName();
    }
}
