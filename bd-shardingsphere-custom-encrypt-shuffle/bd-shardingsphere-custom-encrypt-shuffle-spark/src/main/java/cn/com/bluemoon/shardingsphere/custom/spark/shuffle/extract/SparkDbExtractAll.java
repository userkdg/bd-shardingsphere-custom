package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.sql.SparkSession;

import java.util.List;

/**
 * 全量一次性
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkDbExtractAll extends BaseSparkDbExtract {

    public SparkDbExtractAll(GlobalConfig config, SparkSession spark) {
        super(config, spark);
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        return " 1=1 ";
    }

    @Override
    public String type() {
        return ExtractMode.All.getName();
    }
}
