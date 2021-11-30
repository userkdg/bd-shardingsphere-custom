package cn.com.bluemoon.shardingsphere.custom.spark.persist;

/**
 * @author Jarod.Kong
 */
public enum  InstanceType {
    ZOOKEEPER;

    public static InstanceType nameOf(String type) {
        if (type.equalsIgnoreCase(ZOOKEEPER.name())){
            return ZOOKEEPER;
        }
        return null;
    }
}
