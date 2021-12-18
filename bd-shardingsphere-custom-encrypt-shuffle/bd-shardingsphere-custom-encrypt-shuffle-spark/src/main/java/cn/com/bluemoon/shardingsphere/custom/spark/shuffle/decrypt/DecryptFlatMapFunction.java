package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleFlatMapFunction;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;

import java.util.*;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt.DecryptShuffleJob.wrapPlainBakFieldName;

/**
 * @author Jarod.Kong
 */
public class DecryptFlatMapFunction extends BaseShuffleFlatMapFunction {

    public DecryptFlatMapFunction(Broadcast<GlobalConfig> broadcast) {
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
                Object plainText = encryptAlgorithm.decrypt(Objects.toString(val, null));
                r.put(extractColName, val);
                String targetColName = globalConfig.getTargetColOrElse(extractColName, wrapPlainBakFieldName(extractColName));
                r.put(targetColName, plainText);
            }
            for (GlobalConfig.FieldInfo primaryCol : primaryCols) {
                r.put(primaryCol.getName(), row.getAs(primaryCol.getName()));
            }
            rows.add(r);
        }
        return rows;
    }
}
