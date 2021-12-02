package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.JDBCMetadataUtils.getFieldJDBCType;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class UpdateForeachPartitionFunction implements ForeachPartitionFunction<Row> {
    private final EncryptGlobalConfig globalConfig;

    public UpdateForeachPartitionFunction(StructType schema, Broadcast<EncryptGlobalConfig> globalConfigBroadcast) {
        this.globalConfig = globalColsTypeHandlerBySparkSchema(globalConfigBroadcast, schema);
    }

    @Override
    public void call(Iterator<Row> iterator) {
        try {
            this.update(iterator);
        } catch (SQLException e) {
            log.error("批量更新异常，跳过此批次", e);
        }
    }

    private EncryptGlobalConfig globalColsTypeHandlerBySparkSchema(Broadcast<EncryptGlobalConfig> globalConfigBroadcast, StructType schema) {
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

    private void update(Iterator<Row> its) throws SQLException {
        List<EncryptGlobalConfig.FieldInfo> primaryCols = globalConfig.getPrimaryCols();
        try (Connection conn = DriverManager.getConnection(globalConfig.getProxyUrl())) {
            List<EncryptGlobalConfig.FieldInfo> plainColumnNames = globalConfig.getPlainCols();
            StringBuilder sb = new StringBuilder();
            sb.append("update ").append(globalConfig.getRuleTableName()).append(" set ");
            String setFields = plainColumnNames.stream().map(f -> f.getName() + "=?").collect(Collectors.joining(", "));
            sb.append(setFields).append(" where ");
            List<String> whereSql = new ArrayList<>(primaryCols.size());
            for (EncryptGlobalConfig.FieldInfo primaryCol : primaryCols) {
                whereSql.add(primaryCol.getName() + "=?");
            }
            sb.append(String.join(" and ", whereSql));
            String updateDynamicSql = sb.toString();
            log.info("更新SQL=>{}", updateDynamicSql);
            try (PreparedStatement ps = conn.prepareStatement(updateDynamicSql)) {
                while (its.hasNext()) {
                    Row row = its.next();
                    // 类型问题
                    int plainColSize = plainColumnNames.size();
                    for (int i = 1; i <= plainColSize; i++) {
                        EncryptGlobalConfig.FieldInfo finfo = plainColumnNames.get(i - 1);
                        ps.setObject(i, row.getAs(finfo.getName()), JDBCType.valueOf(finfo.getType()));
                    }
                    for (EncryptGlobalConfig.FieldInfo primaryCol : primaryCols) {
                        ps.setObject(++plainColSize, row.getAs(primaryCol.getName()), JDBCType.valueOf(primaryCol.getType()));
                    }
                    ps.addBatch();
                }
                ps.executeBatch();
            }
        }
    }
}
