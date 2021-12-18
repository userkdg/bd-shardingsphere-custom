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

    /**
     * 默认为全量抽取
     */
    public static SparkDbExtract createDbExtract(EncryptGlobalConfig config, SparkSession spark) {
        // FIXME: 2021/12/18 可以优化为SPI+ExtractTypeString 动态增加抽取方式
        if (ExtractMode.WithIncrTimestamp.equals(config.getExtractMode())) {
            return new SparkDbExtractIWithIncTimestamp(config, spark);
        } else if (ExtractMode.OtherCustom.equals(config.getExtractMode())) {
            return new SparkDbCustomExtract(config, spark);
        } else {
            return new SparkDbExtractAll(config, spark);
        }
    }
}
