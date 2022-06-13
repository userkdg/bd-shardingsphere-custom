package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import java.util.List;
import java.util.Optional;

/**
 * 自定义查询方式一次性抽取
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkDbExtractCustom extends BaseSparkDbExtract {

    public SparkDbExtractCustom(GlobalConfig config, SparkSession spark) {
        super(config, spark);
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        return Optional.ofNullable(config.getCustomExtractWhereSql())
                .filter(s -> !"".equals(s))
                .orElseThrow(() -> new RuntimeException("必须自定义抽取where条件（不带where）"));
    }

    @Override
    public String type() {
        return ExtractMode.OtherCustom.getName();
    }
}
