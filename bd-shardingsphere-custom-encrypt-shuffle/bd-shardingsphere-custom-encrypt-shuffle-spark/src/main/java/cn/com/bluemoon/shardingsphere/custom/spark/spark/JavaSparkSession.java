package cn.com.bluemoon.shardingsphere.custom.spark.spark;

import org.apache.spark.SparkConf;
import org.apache.spark.sql.SparkSession;


/** Lazily instantiated singleton instance of SparkSession */
public class JavaSparkSession {
    private static transient SparkSession instance = null;

    public static SparkSession getInstance(SparkConf sparkConf) {
        if (instance == null) {
            instance = SparkSession
                    .builder()
                    .config(sparkConf)
                    .getOrCreate();
        }
        return instance;
    }
}
