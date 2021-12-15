package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.types.StructType;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class EncryptJobForeachPartitionFunction extends BaseEncryptForeachPartitionFunction<Row> {

    public EncryptJobForeachPartitionFunction(StructType schema, Broadcast<EncryptGlobalConfig> globalConfigBroadcast) {
        super(schema, globalConfigBroadcast);
    }

    @Override
    protected void doUpdate(Iterator<Row> rows) throws SQLException {
        update(rows);
    }

    private void update(Iterator<Row> its) throws SQLException {
        List<EncryptGlobalConfig.FieldInfo> primaryCols = globalConfig.getPrimaryCols();
        try (Connection conn = DriverManager.getConnection(globalConfig.getConvertTargetUrl())) {
            List<EncryptGlobalConfig.FieldInfo> plainColumnNames = globalConfig.getPlainCols();
            final String updateDynamicSql = getUpdateDynamicSql(primaryCols, plainColumnNames);
            try (PreparedStatement ps = conn.prepareStatement(updateDynamicSql)) {
                int batchSize = Integer.parseInt(EncryptShuffleJob.BATCH_SIZE);
                int size = 0;
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
                    size++;
                    if (size % batchSize == 0) {
                        ps.executeBatch();
                        ps.clearBatch();
                    }
                }
                ps.executeBatch();
                ps.clearBatch();
            }
        }
    }

    private String getUpdateDynamicSql(List<EncryptGlobalConfig.FieldInfo> primaryCols, List<EncryptGlobalConfig.FieldInfo> plainColumnNames) {
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
        return updateDynamicSql;
    }
}
