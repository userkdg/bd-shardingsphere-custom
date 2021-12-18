package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
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

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.BaseSparkDbExtract.JDBC_PROXY_CIPHER_FILED_SUFFIX;
import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.BaseSparkDbExtract.JDBC_PROXY_PLAIN_FILED_BAK_SUFFIX;

/**
 * @author Jarod.Kong
 */
public abstract class BaseShuffleFlatMapFunction implements FlatMapFunction<Iterator<Row>, Map<String, Object>> {
    public static final String CIPHER_SUFFIX = JDBC_PROXY_CIPHER_FILED_SUFFIX;
    public static final String PLAIN_BAK_SUFFIX = JDBC_PROXY_PLAIN_FILED_BAK_SUFFIX;

    static {
        ShardingSphereServiceLoader.register(EncryptAlgorithm.class);
    }

    protected final List<GlobalConfig.FieldInfo> extractCols;
    protected final List<GlobalConfig.FieldInfo> primaryCols;

    public BaseShuffleFlatMapFunction(Broadcast<GlobalConfig> broadcast) {
        this.extractCols = broadcast.getValue().getExtractCols();
        this.primaryCols = broadcast.getValue().getPrimaryCols();
    }

    public static String encryptFieldName(String plainName) {
        return plainName + CIPHER_SUFFIX;
    }

    public static String wrapPlainBakFieldName(String colName) {
        return colName + PLAIN_BAK_SUFFIX;
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
