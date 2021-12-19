package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
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
    public static SparkDbExtract createDbExtract(GlobalConfig config, SparkSession spark) {
        // FIXME: 2021/12/18 可以优化为SPI+ExtractTypeString 动态增加抽取方式
        if (ExtractMode.WithIncField.equals(config.getExtractMode())) {
            return new SparkDbExtractIWithIncField(config, spark);
        } else if (ExtractMode.OtherCustom.equals(config.getExtractMode())) {
            return new SparkDbExtractCustom(config, spark);
        } else {
            return new SparkDbExtractAll(config, spark);
        }
    }
}
