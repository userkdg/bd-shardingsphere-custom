package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import org.apache.spark.sql.SparkSession;

/**
 * 简单工厂
 *
 * @author Jarod.Kong
 */
public class ExtractFactory {
    public static SparkDbExtract createDbExtract(EncryptGlobalConfig config, SparkSession spark) {
        if (ExtractMode.WithIncrTimestamp.equals(config.getExtractMode())) {
            return new SparkDbExtractIWithIncTimestamp(config, spark);
        } else {
            return new SparkDbExtractAll(config, spark);
        }
    }
}
