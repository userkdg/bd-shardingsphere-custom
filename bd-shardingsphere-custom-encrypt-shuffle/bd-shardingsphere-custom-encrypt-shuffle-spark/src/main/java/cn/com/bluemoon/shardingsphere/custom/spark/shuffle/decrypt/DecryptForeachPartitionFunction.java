package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleForeachPartitionFunction;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.api.java.function.VoidFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.types.StructType;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt.DecryptShuffleJob.wrapPlainBakFieldName;
import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.BaseSparkDbExtract.BATCH_SIZE;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class DecryptForeachPartitionFunction extends BaseShuffleForeachPartitionFunction<Map<String, Object>> implements VoidFunction<Iterator<Map<String, Object>>> {

    public DecryptForeachPartitionFunction(StructType schema, Broadcast<GlobalConfig> globalConfigBroadcast) {
        super(schema, globalConfigBroadcast);
    }

    @Override
    protected void doUpdate(Iterator<Map<String, Object>> its) throws SQLException {
        List<GlobalConfig.FieldInfo> primaryCols = globalConfig.getPrimaryCols();
        try (Connection conn = DriverManager.getConnection(globalConfig.getConvertTargetUrl())) {
            List<String> plainBakCols = getPlainBakCols(globalConfig.internalGetExtractCols());
            final String updateDynamicSql = updateDynamicSqlBuilder(primaryCols, plainBakCols);
            // update batch
            try (PreparedStatement ps = conn.prepareStatement(updateDynamicSql)) {
                int batchSize = Integer.parseInt(BATCH_SIZE);
                int size = 0;
                while (its.hasNext()) {
                    Map<String, Object> row = its.next();
                    // 类型问题
                    int cipherSize = plainBakCols.size();
                    for (int i = 1; i <= cipherSize; i++) {
                        String plainBakCol = plainBakCols.get(i - 1);
                        ps.setString(i, Objects.toString(row.get(plainBakCol), null));
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

    private List<String> getPlainBakCols(List<GlobalConfig.FieldInfo> cipherColNames) {
        return cipherColNames.stream().map(p -> globalConfig.getTargetColOrElse(p.getName(), wrapPlainBakFieldName(p.getName()))).collect(Collectors.toList());
    }

}
