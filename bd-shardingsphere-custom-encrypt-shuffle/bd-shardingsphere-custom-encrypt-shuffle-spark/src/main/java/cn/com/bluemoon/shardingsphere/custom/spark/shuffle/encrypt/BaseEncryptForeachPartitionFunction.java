package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;

import java.sql.JDBCType;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.JDBCMetadataUtils.getFieldJDBCType;

/**
 * @author Jarod.Kong
 */
@Slf4j
public abstract class BaseEncryptForeachPartitionFunction<T> implements ForeachPartitionFunction<T> {
    protected final EncryptGlobalConfig globalConfig;

    public BaseEncryptForeachPartitionFunction(StructType schema, Broadcast<EncryptGlobalConfig> globalConfigBroadcast) {
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

    protected EncryptGlobalConfig globalColsTypeHandlerBySparkSchema(Broadcast<EncryptGlobalConfig> globalConfigBroadcast, StructType schema) {
        EncryptGlobalConfig broadcastValue = globalConfigBroadcast.getValue();
        // 主键列
        List<EncryptGlobalConfig.FieldInfo> partCols = broadcastValue.getPrimaryCols();
        for (EncryptGlobalConfig.FieldInfo partCol : partCols) {
            if (partCol.getType() == null) {
                StructField structField = schema.apply(partCol.getName());
                JDBCType partColType = getFieldJDBCType(structField.dataType());
                partCol.setType(partColType.getVendorTypeNumber());
            }
        }
        broadcastValue.setPrimaryCols(partCols);
        // 明文列
        List<EncryptGlobalConfig.FieldInfo> plainCols = broadcastValue.getPlainCols();
        for (EncryptGlobalConfig.FieldInfo plainCol : plainCols) {
            if (plainCol.getType() == null) {
                StructField plainField = schema.apply(plainCol.getName());
                JDBCType plainColType = getFieldJDBCType(plainField.dataType());
                plainCol.setType(plainColType.getVendorTypeNumber());
            }
        }
        broadcastValue.setPlainCols(plainCols);
        log.info("encrypt Global Bean:{}", broadcastValue);
        return broadcastValue;
    }


}
