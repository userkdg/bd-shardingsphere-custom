package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.BaseShuffleFlatMapFunction;
import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Row;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author Jarod.Kong
 */
public class DecryptFlatMapFunction extends BaseShuffleFlatMapFunction {

    public DecryptFlatMapFunction(Broadcast<EncryptGlobalConfig> broadcast) {
        super(broadcast);
    }

    @Override
    protected List<Map<String, Object>> doFlatMap(Iterator<Row> iterator) {
        return null;
    }
}
