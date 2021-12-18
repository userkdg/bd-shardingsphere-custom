package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

/**
 * @author Jarod.Kong
 */
public interface SparkDbExtract {
    Dataset<Row> extract(SparkSession spark);
}
