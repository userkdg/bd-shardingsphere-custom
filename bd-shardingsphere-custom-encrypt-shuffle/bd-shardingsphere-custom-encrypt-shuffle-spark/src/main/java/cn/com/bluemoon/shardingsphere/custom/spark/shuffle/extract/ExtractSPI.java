package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

/**
 * @author Jarod.Kong
 */
@FunctionalInterface
public interface ExtractSPI {
    String type();
}
