package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import org.apache.spark.api.java.function.ForeachPartitionFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.JDBCMetadataUtils.getFieldJDBCType;

/**
 * @author Jarod.Kong
 */
public class UpdateForeachPartitionFunction implements ForeachPartitionFunction<Row> {
    private final EncryptGlobalConfig globalConfig;

    public UpdateForeachPartitionFunction(StructType schema, Broadcast<EncryptGlobalConfig> globalConfigBroadcast) {
        this.globalConfig = globalColsTypeHandlerBySparkSchema(globalConfigBroadcast, schema);
    }

    @Override
    public void call(Iterator<Row> iterator) throws Exception {
        this.update(iterator);
    }

    private EncryptGlobalConfig globalColsTypeHandlerBySparkSchema(Broadcast<EncryptGlobalConfig> globalConfigBroadcast, StructType schema) {
        EncryptGlobalConfig broadcastValue = globalConfigBroadcast.getValue();
        // 主键列
        EncryptGlobalConfig.FieldInfo partCol = broadcastValue.getPartitionColumn();
        if (partCol.getType() ==null) {
            StructField structField = schema.apply(partCol.getName());
            JDBCType partColType = getFieldJDBCType(structField.dataType());
            partCol.setType(partColType.getVendorTypeNumber());
            broadcastValue.setPartitionColumn(partCol);
        }
        // 明文列
        List<EncryptGlobalConfig.FieldInfo> plainCols = broadcastValue.getPlainColumnNames();
        for (EncryptGlobalConfig.FieldInfo plainCol : plainCols) {
            if (plainCol.getType() == null) {
                StructField plainField = schema.apply(plainCol.getName());
                JDBCType plainColType = getFieldJDBCType(plainField.dataType());
                plainCol.setType(plainColType.getVendorTypeNumber());
            }
        }
        broadcastValue.setPlainColumnNames(plainCols);
        return broadcastValue;
    }

    private void update(Iterator<Row> its) throws SQLException {
        EncryptGlobalConfig.FieldInfo partitionColumn = globalConfig.getPartitionColumn();
        try (Connection conn = DriverManager.getConnection(globalConfig.getProxyUrl())) {
            List<EncryptGlobalConfig.FieldInfo> plainColumnNames = globalConfig.getPlainColumnNames();
            StringBuilder sb = new StringBuilder();
            sb.append("update ").append(globalConfig.getRuleTableName())
                    .append(" set ");
            String setFields = plainColumnNames.stream().map(f -> f.getName() + "=?").collect(Collectors.joining(", "));
            sb.append(setFields).append(" where ").append(partitionColumn.getName()).append("=?");
            String updateDynamicSql = sb.toString();
            try (PreparedStatement ps = conn.prepareStatement(updateDynamicSql)) {
                while (its.hasNext()) {
                    Row row = its.next();
                    // 类型问题
                    for (int i = 1; i <= plainColumnNames.size(); i++) {
                        EncryptGlobalConfig.FieldInfo finfo = plainColumnNames.get(i - 1);
                        ps.setObject(i, row.getAs(finfo.getName()), JDBCType.valueOf(finfo.getType()));
                    }
                    ps.setObject(plainColumnNames.size() + 1, row.getAs(partitionColumn.getName()), JDBCType.valueOf(partitionColumn.getType()));
                    ps.addBatch();
                }
                ps.executeBatch();
            }
        }
    }
}
