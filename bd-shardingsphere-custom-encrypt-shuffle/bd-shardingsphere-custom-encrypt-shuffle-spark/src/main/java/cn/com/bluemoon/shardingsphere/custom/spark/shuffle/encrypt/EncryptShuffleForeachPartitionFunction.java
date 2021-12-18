package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleForeachPartitionFunction;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleJobGraceful;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.types.StructType;

import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.BaseSparkDbExtract.BATCH_SIZE;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class EncryptShuffleForeachPartitionFunction extends BaseShuffleForeachPartitionFunction<Map<String, Object>> implements VoidFunction<Iterator<Map<String, Object>>> {

    public EncryptShuffleForeachPartitionFunction(StructType schema, Broadcast<GlobalConfig> globalConfigBroadcast) {
        super(schema, globalConfigBroadcast);
    }

    @Override
    protected void doUpdate(Iterator<Map<String, Object>> its) throws SQLException {
        List<GlobalConfig.FieldInfo> primaryCols = globalConfig.getPrimaryCols();
        try (Connection conn = DriverManager.getConnection(globalConfig.getConvertTargetUrl())) {
            List<String> cipherCols = getCipherCols(globalConfig.getExtractCols());
            final String updateDynamicSql = getUpdateDynamicSql(primaryCols, cipherCols);
            // update batch
            try (PreparedStatement ps = conn.prepareStatement(updateDynamicSql)) {
                int batchSize = Integer.parseInt(BATCH_SIZE);
                int size = 0;
                while (its.hasNext()) {
                    Map<String, Object> row = its.next();
                    // 类型问题
                    int cipherSize = cipherCols.size();
                    for (int i = 1; i <= cipherSize; i++) {
                        String cipherName = cipherCols.get(i - 1);
                        ps.setString(i, Objects.toString(row.get(cipherName), null));
                    }
                    for (GlobalConfig.FieldInfo primaryCol : primaryCols) {
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

    private String getUpdateDynamicSql(List<GlobalConfig.FieldInfo> primaryCols, List<String> cipherCols) {
        StringBuilder sb = new StringBuilder();
        sb.append("update ").append(globalConfig.getRuleTableName()).append(" set ");
        String setFields = cipherCols.stream().map(f -> f + "=?")
                .collect(Collectors.joining(", "));
        sb.append(setFields).append(" where ");
        List<String> whereSql = new ArrayList<>(primaryCols.size());
        for (GlobalConfig.FieldInfo primaryCol : primaryCols) {
            whereSql.add(primaryCol.getName() + "=?");
        }
        sb.append(String.join(" and ", whereSql));
        return sb.toString();
    }

    private List<String> getCipherCols(List<GlobalConfig.FieldInfo> plainColumnNames) {
        return plainColumnNames.stream().map(p -> EncryptFlatMapFunction.encryptFieldName(p.getName())).collect(Collectors.toList());
    }

}
