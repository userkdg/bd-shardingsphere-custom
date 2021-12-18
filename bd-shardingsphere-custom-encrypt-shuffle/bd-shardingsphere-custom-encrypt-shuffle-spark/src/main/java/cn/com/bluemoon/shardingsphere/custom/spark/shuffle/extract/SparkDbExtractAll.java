package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseSparkDbExtract;
import org.apache.spark.sql.SparkSession;

import java.util.List;

/**
 * @author Jarod.Kong
 */
public class SparkDbExtractAll extends BaseSparkDbExtract {

    protected SparkDbExtractAll(EncryptGlobalConfig config, SparkSession spark) {
        super(config, spark);
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> plainCols) {
        return " 1=1 ";
    }
}
