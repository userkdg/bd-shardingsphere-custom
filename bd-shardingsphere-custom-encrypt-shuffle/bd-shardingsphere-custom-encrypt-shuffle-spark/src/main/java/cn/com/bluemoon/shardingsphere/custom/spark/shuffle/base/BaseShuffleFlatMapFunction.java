package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmConfiguration;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmFactory;
import org.apache.shardingsphere.spi.ShardingSphereServiceLoader;
import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * @author Jarod.Kong
 */
public abstract class BaseShuffleFlatMapFunction implements FlatMapFunction<Iterator<Row>, Map<String, Object>> {
    public static final String CIPHER_SUFFIX = BaseShuffleJob.JDBC_PROXY_CIPHER_FILED_SUFFIX;

    static {
        ShardingSphereServiceLoader.register(EncryptAlgorithm.class);
    }

    protected final List<EncryptGlobalConfig.FieldInfo> plainCols;
    protected final List<EncryptGlobalConfig.FieldInfo> primaryCols;

    public BaseShuffleFlatMapFunction(Broadcast<EncryptGlobalConfig> broadcast) {
        this.plainCols = broadcast.getValue().getPlainCols();
        this.primaryCols = broadcast.getValue().getPrimaryCols();
    }

    public static String encryptFieldName(String plainName) {
        return plainName + CIPHER_SUFFIX;
    }

    protected EncryptAlgorithm createEncryptAlgorithm(String type, Properties props) {
        return ShardingSphereAlgorithmFactory
                .createAlgorithm(new ShardingSphereAlgorithmConfiguration(type, props),
                        EncryptAlgorithm.class);
    }

    @Override
    public Iterator<Map<String, Object>> call(Iterator<Row> iterator) {
        List<Map<String, Object>> rows = doFlatMap(iterator);
        return rows.iterator();
    }

    protected abstract List<Map<String, Object>> doFlatMap(Iterator<Row> iterator);
}
