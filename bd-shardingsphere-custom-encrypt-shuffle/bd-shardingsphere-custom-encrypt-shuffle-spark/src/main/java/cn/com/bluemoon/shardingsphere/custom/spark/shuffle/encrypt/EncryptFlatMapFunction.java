package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleFlatMapFunction;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;

import java.util.*;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJob.encryptFieldName;

/**
 * @author Jarod.Kong
 */
public class EncryptFlatMapFunction extends BaseShuffleFlatMapFunction {

    public EncryptFlatMapFunction(Broadcast<GlobalConfig> broadcast) {
        super(broadcast);
    }

    @Override
    protected List<Map<String, Object>> doFlatMap(Iterator<Row> iterator) {
        List<Map<String, Object>> rows = new ArrayList<>();
        while (iterator.hasNext()) {
            Row row = iterator.next();
            Map<String, Object> r = new HashMap<>();
            for (GlobalConfig.FieldInfo extractCol : extractCols) {
                String extractColName = extractCol.getName();
                Object val = row.getAs(extractColName);
                GlobalConfig.EncryptRule encryptRule = extractCol.getEncryptRule();
                String type = encryptRule.getType();
                EncryptAlgorithm encryptAlgorithm = createEncryptAlgorithm(type, encryptRule.getProps());
                String cipherText = encryptAlgorithm.encrypt(val);
                r.put(extractColName, val);
                String targetCol = globalConfig.getTargetColOrElse(extractColName, encryptFieldName(extractColName));
                r.put(targetCol, cipherText);
            }
            for (GlobalConfig.FieldInfo primaryCol : primaryCols) {
                r.put(primaryCol.getName(), row.getAs(primaryCol.getName()));
            }
            rows.add(r);
        }
        return rows;
    }
}
