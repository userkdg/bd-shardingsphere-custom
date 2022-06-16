package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleFlatMapFunction;
import lombok.extern.slf4j.Slf4j;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;

import java.util.*;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJob.encryptFieldName;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class EncryptFlatMapFunction extends BaseShuffleFlatMapFunction {

    public EncryptFlatMapFunction(Broadcast<GlobalConfig> broadcast) {
        super(broadcast);
    }

    @Override
    protected List<Map<String, Object>> doFlatMap(Iterator<Map<String, Object>> iterator) {
        List<Map<String, Object>> rows = new ArrayList<>();
        while (iterator.hasNext()) {
            Map<String, Object> row = iterator.next();
            Map<String, Object> r = new HashMap<>();
            for (GlobalConfig.FieldInfo extractCol : extractCols) {
                String extractColName = extractCol.getName();
                Object val = row.get(extractColName);
                r.put(extractColName, val);
                GlobalConfig.FieldInfo targetCol = globalConfig.getTargetColOrElse(extractColName, extractCol);
                GlobalConfig.EncryptRule encryptRule = targetCol.getEncryptRule();
                String type = encryptRule.getType();
                Object cipherText = null;
                try {
                    EncryptAlgorithm encryptAlgorithm = createEncryptAlgorithm(type, encryptRule.getProps());
                    cipherText = encryptAlgorithm.encrypt(val);
                } catch (Exception e) {
                    log.error("{}加密失败，信息：{}", val, row, e);
                }
                r.put(targetCol.getName(), cipherText);
            }
            // 2022/2/25 sql增加onUpdateCurrentTimestamps
            for (String onUpdateCurrentTimestamp : onUpdateCurrentTimestamps) {
                r.put(onUpdateCurrentTimestamp, row.get(onUpdateCurrentTimestamp));
            }
            for (GlobalConfig.FieldInfo primaryCol : primaryCols) {
                r.put(primaryCol.getName(), row.get(primaryCol.getName()));
            }
            rows.add(r);
        }
        return rows;
    }
}
