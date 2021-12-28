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

/**
 * @author Jarod.Kong
 */
public abstract class BaseShuffleFlatMapFunction implements FlatMapFunction<Iterator<Map<String, Object>>, Map<String, Object>> {

    static {
        ShardingSphereServiceLoader.register(EncryptAlgorithm.class);
    }

    protected final GlobalConfig globalConfig;

    protected final List<GlobalConfig.FieldInfo> extractCols;

    protected final List<GlobalConfig.FieldInfo> primaryCols;

    public BaseShuffleFlatMapFunction(Broadcast<GlobalConfig> broadcast) {
        GlobalConfig config = broadcast.getValue();
        this.globalConfig = config;
        this.extractCols = config.internalGetExtractCols();
        this.primaryCols = config.getPrimaryCols();
    }

    protected EncryptAlgorithm createEncryptAlgorithm(String type, Properties props) {
        return ShardingSphereAlgorithmFactory
                .createAlgorithm(new ShardingSphereAlgorithmConfiguration(type, props),
                        EncryptAlgorithm.class);
    }

    @Override
    public Iterator<Map<String, Object>> call(Iterator<Map<String, Object>> iterator) {
        List<Map<String, Object>> rows = doFlatMap(iterator);
        return rows.iterator();
    }

    protected abstract List<Map<String, Object>> doFlatMap(Iterator<Map<String, Object>> iterator);
}
