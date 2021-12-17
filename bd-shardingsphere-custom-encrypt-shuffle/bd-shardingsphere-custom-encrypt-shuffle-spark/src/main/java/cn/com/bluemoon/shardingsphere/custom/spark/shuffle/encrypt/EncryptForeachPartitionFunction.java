package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.types.StructType;

import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class EncryptForeachPartitionFunction extends BaseEncryptForeachPartitionFunction<Map<String, Object>> implements VoidFunction<Iterator<Map<String, Object>>> {

    public EncryptForeachPartitionFunction(StructType schema, Broadcast<EncryptGlobalConfig> globalConfigBroadcast) {
        super(schema, globalConfigBroadcast);
    }

    @Override
    protected void doUpdate(Iterator<Map<String, Object>> its) throws SQLException {
        List<EncryptGlobalConfig.FieldInfo> primaryCols = globalConfig.getPrimaryCols();
        try (Connection conn = DriverManager.getConnection(globalConfig.getConvertTargetUrl())) {
            List<String> cipherCols = getCipherCols(globalConfig.getPlainCols());
            final String updateDynamicSql = getUpdateDynamicSql(primaryCols, cipherCols);
            // update batch
            try (PreparedStatement ps = conn.prepareStatement(updateDynamicSql)) {
                int batchSize = Integer.parseInt(EncryptShuffleJob.BATCH_SIZE);
                int size = 0;
                while (its.hasNext()) {
                    Map<String, Object> row = its.next();
                    // 类型问题
                    int cipherSize = cipherCols.size();
                    for (int i = 1; i <= cipherSize; i++) {
                        String cipherName = cipherCols.get(i - 1);
                        ps.setString(i, Objects.toString(row.get(cipherName), null));
                    }
                    for (EncryptGlobalConfig.FieldInfo primaryCol : primaryCols) {
                        ps.setObject(++cipherSize, row.get(primaryCol.getName()), JDBCType.valueOf(primaryCol.getType()));
                    }
                    ps.addBatch();
                    size++;
                    if (size % batchSize == 0) {
                        int[] batch = ps.executeBatch();
                        ps.clearBatch();
                        log.info("批量：更新SQL=>{},批次提交：{}条，执行：{}条", updateDynamicSql, size, batch.length);
                    }
                }
                if (size > 0) {
                    int[] batch = ps.executeBatch();
                    ps.clearBatch();
                    log.info("批量残余: 更新SQL=>{},批次提交：{}条，执行：{}条", updateDynamicSql, size, batch.length);
                }
            }
        }
    }

    private String getUpdateDynamicSql(List<EncryptGlobalConfig.FieldInfo> primaryCols, List<String> cipherCols) {
        StringBuilder sb = new StringBuilder();
        sb.append("update ").append(globalConfig.getRuleTableName()).append(" set ");
        String setFields = cipherCols.stream().map(f -> f + "=?")
                .collect(Collectors.joining(", "));
        sb.append(setFields).append(" where ");
        List<String> whereSql = new ArrayList<>(primaryCols.size());
        for (EncryptGlobalConfig.FieldInfo primaryCol : primaryCols) {
            whereSql.add(primaryCol.getName() + "=?");
        }
        sb.append(String.join(" and ", whereSql));
        return sb.toString();
    }

    private List<String> getCipherCols(List<EncryptGlobalConfig.FieldInfo> plainColumnNames) {
        return plainColumnNames.stream().map(p -> EncryptFlatMapFunction.encryptFieldName(p.getName())).collect(Collectors.toList());
    }

}
