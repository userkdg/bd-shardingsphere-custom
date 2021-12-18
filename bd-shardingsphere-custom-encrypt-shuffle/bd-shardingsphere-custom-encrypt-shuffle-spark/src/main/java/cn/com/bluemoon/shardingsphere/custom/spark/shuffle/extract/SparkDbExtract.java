package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;

/**
 * @author Jarod.Kong
 */
public interface SparkDbExtract {
    Dataset<Row> extract();
}
