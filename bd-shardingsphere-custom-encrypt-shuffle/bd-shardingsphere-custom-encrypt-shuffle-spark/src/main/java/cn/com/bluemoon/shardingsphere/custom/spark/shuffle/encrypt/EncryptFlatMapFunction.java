package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmConfiguration;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmFactory;
import org.apache.shardingsphere.spi.ShardingSphereServiceLoader;
import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;

import java.util.*;

/**
 * @author Jarod.Kong
 */
public class EncryptFlatMapFunction implements FlatMapFunction<Iterator<Row>, Map<String, Object>> {
    public static final String CIPHER_SUFFIX = "_cipher";

    static {
        ShardingSphereServiceLoader.register(EncryptAlgorithm.class);
    }

    private final List<EncryptGlobalConfig.FieldInfo> plainCols;
    private final List<EncryptGlobalConfig.FieldInfo> primaryCols;

    public EncryptFlatMapFunction(Broadcast<EncryptGlobalConfig> broadcast) {
        this.plainCols = broadcast.getValue().getPlainCols();
        this.primaryCols = broadcast.getValue().getPrimaryCols();
    }

    private static EncryptAlgorithm createEncryptAlgorithm(String type, Properties props) {
        return ShardingSphereAlgorithmFactory
                .createAlgorithm(new ShardingSphereAlgorithmConfiguration(type, props),
                        EncryptAlgorithm.class);
    }

    public static String encryptFieldName(String plainName) {
        return plainName + CIPHER_SUFFIX;
    }

    @Override
    public Iterator<Map<String, Object>> call(Iterator<Row> iterator) throws Exception {
        List<Map<String, Object>> rows = new ArrayList<>();
        while (iterator.hasNext()) {
            Row row = iterator.next();
            Map<String, Object> r = new HashMap<>();
            for (EncryptGlobalConfig.FieldInfo plainCol : plainCols) {
                Object val = row.getAs(plainCol.getName());
                EncryptGlobalConfig.EncryptRule encryptRule = plainCol.getEncryptRule();
                String type = encryptRule.getType();
                EncryptAlgorithm encryptAlgorithm = createEncryptAlgorithm(type, encryptRule.getProps());
                String cipherText = encryptAlgorithm.encrypt(val);
                r.put(plainCol.getName(), val);
                r.put(encryptFieldName(plainCol.getName()), cipherText);
            }
            for (EncryptGlobalConfig.FieldInfo primaryCol : primaryCols) {
                r.put(primaryCol.getName(), row.getAs(primaryCol.getName()));
            }
            rows.add(r);
        }
        return rows.iterator();
    }
}
