package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;

import java.sql.JDBCType;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.SparkJDBCMetadataUtils.getFieldJDBCType;

/**
 * @author Jarod.Kong
 */
@Slf4j
public abstract class BaseShuffleForeachPartitionFunction<T> implements ForeachPartitionFunction<T> {
    protected final GlobalConfig globalConfig;

    public BaseShuffleForeachPartitionFunction(StructType schema, Broadcast<GlobalConfig> globalConfigBroadcast) {
        this.globalConfig = globalColsTypeHandlerBySparkSchema(globalConfigBroadcast, schema);
    }

    @Override
    public void call(Iterator<T> iterator) {
        try {
            doUpdate(iterator);
        } catch (SQLException e) {
            log.error("批量更新异常，跳过此批次", e);
        }
    }

    protected abstract void doUpdate(Iterator<T> rows) throws SQLException;

    protected GlobalConfig globalColsTypeHandlerBySparkSchema(Broadcast<GlobalConfig> globalConfigBroadcast, StructType schema) {
        GlobalConfig broadcastValue = globalConfigBroadcast.getValue();
        // 主键列
        List<GlobalConfig.FieldInfo> partCols = broadcastValue.getPrimaryCols();
        for (GlobalConfig.FieldInfo partCol : partCols) {
            if (partCol.getType() == null) {
                StructField structField = schema.apply(partCol.getName());
                JDBCType partColType = getFieldJDBCType(structField.dataType());
                partCol.setType(partColType.getVendorTypeNumber());
            }
        }
        broadcastValue.setPrimaryCols(partCols);
        // 明文列
        List<GlobalConfig.FieldInfo> extractCols = broadcastValue.getExtractCols();
        for (GlobalConfig.FieldInfo plainCol : extractCols) {
            if (plainCol.getType() == null) {
                StructField plainField = schema.apply(plainCol.getName());
                JDBCType plainColType = getFieldJDBCType(plainField.dataType());
                plainCol.setType(plainColType.getVendorTypeNumber());
            }
        }
        broadcastValue.setExtractCols(extractCols);
        log.info("encrypt Global Bean:{}", broadcastValue);
        return broadcastValue;
    }


}
