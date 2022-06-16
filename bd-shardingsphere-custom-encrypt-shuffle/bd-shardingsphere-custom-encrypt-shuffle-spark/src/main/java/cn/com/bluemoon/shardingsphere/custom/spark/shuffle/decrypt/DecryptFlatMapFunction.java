package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleFlatMapFunction;
import lombok.extern.slf4j.Slf4j;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;

import java.util.*;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt.DecryptShuffleJob.wrapPlainBakFieldName;

/**
 * @author Jarod.Kong
 */
@Slf4j
public class DecryptFlatMapFunction extends BaseShuffleFlatMapFunction {

    public DecryptFlatMapFunction(Broadcast<GlobalConfig> broadcast) {
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
                GlobalConfig.EncryptRule encryptRule = extractCol.getEncryptRule();
                String type = encryptRule.getType();
                EncryptAlgorithm encryptAlgorithm = createEncryptAlgorithm(type, encryptRule.getProps());
                Object plainText = null;
                try {
                    plainText = encryptAlgorithm.decrypt(Objects.toString(val, null));
                } catch (Exception e) {
                    log.error("{}解密失败，信息：{}", val, row, e);
                }
                r.put(extractColName, val);
                String targetColName = globalConfig.getTargetColOrElse(extractColName, wrapPlainBakFieldName(extractColName));
                r.put(targetColName, plainText);
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
