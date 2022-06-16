package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.InternalDbUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;

import java.sql.JDBCType;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

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

    public String getConvertTargetUrl() {
        return InternalDbUtil.convertJdbcUrl(globalConfig.getTargetUrl(), globalConfig.isMultiBatchUrlConfig());
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
        List<GlobalConfig.FieldInfo> extractCols = broadcastValue.internalGetExtractCols();
        for (GlobalConfig.FieldInfo plainCol : extractCols) {
            // 针对调用者没有指定目标类型的情况下
            if (plainCol.getType() == null) {
                StructField plainField = schema.apply(plainCol.getName());
                JDBCType plainColType = getFieldJDBCType(plainField.dataType());
                plainCol.setType(plainColType.getVendorTypeNumber());
            }
        }
        broadcastValue.setExtractColsInternal(extractCols);
        log.info("encrypt Global Bean:{}", broadcastValue);
        return broadcastValue;
    }

    /**
     *
     * @param primaryCols 主键条件
     * @param encryptCols 加密/解密字段值
     * @param onUpdateCurrentTimestamps timestamp自动更新字段
     * @return sql
     */
    protected String updateDynamicSqlBuilder(List<GlobalConfig.FieldInfo> primaryCols, List<String> encryptCols,
                                             List<String> onUpdateCurrentTimestamps) {
        StringBuilder sb = new StringBuilder();
        sb.append("update ").append(globalConfig.getRuleTableName()).append(" set ");
        List<String> allField = new ArrayList<>(encryptCols);
        allField.addAll(onUpdateCurrentTimestamps);
        String setFields = allField.stream().map(f -> f + "=?")
                .collect(Collectors.joining(", "));
        sb.append(setFields).append(" where ");
        List<String> whereSql = new ArrayList<>(primaryCols.size());
        for (GlobalConfig.FieldInfo primaryCol : primaryCols) {
            whereSql.add(primaryCol.getName() + "=?");
        }
        sb.append(String.join(" and ", whereSql));
        return sb.toString();
    }

}
