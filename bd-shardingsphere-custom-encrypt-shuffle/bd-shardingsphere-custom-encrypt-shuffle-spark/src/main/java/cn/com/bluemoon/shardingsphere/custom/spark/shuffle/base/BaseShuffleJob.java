package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ShuffleHandler;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.BaseSparkDbExtract;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.ExtractFactory;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.SparkDbExtract;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.MapPartitionsFunction;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.*;
import org.apache.spark.sql.types.StructType;

import java.util.*;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public abstract class BaseShuffleJob implements BaseShuffle {

    public static final String WRITE_NUM_PARTITIONS = System.getProperty("spark.encrypt.shuffle.write.numPartitions", "50");

    // must static
    protected static volatile Broadcast<GlobalConfig> globalConfigBroadcast = null;

    protected final GlobalConfig config;

    @Setter
    private ShuffleHandler beforeHandler, afterHandler;

    public BaseShuffleJob(GlobalConfig config) {
        this.config = config;
    }

    public static void getBroadcastInstance(SparkSession spark, GlobalConfig config) {
        JavaSparkContext sc = new JavaSparkContext(spark.sparkContext());
        sc.setLogLevel("INFO");
        if (globalConfigBroadcast == null) {
            synchronized (BaseShuffleJob.class) {
                if (globalConfigBroadcast == null) {
                    globalConfigBroadcast = sc.broadcast(config);
                }
            }
        }
    }

    public void init() {
        log.info("start job !!");
        if (config.internalGetExtractCols() == null || config.internalGetExtractCols().isEmpty()) {
            throw new RuntimeException("洗数字段不可为空");
        }
        Optional.ofNullable(beforeHandler).ifPresent(h -> h.handler(config));
    }

    @Override
    public void shuffle() {
        init();
        shuffle0();
        finish();
    }

    @SuppressWarnings("unchecked")
    protected void shuffle0() {
        try (SparkSession spark = getSparkSession(config.isOnYarn())) {
            getBroadcastInstance(spark, config);
            // 抽取（一次或多次）
            SparkDbExtract dbExtract = ExtractFactory.createDbExtract(config, spark);
            if (dbExtract instanceof Iterator) {
                Iterator<Dataset<Row>> itr = (Iterator<Dataset<Row>>) dbExtract;
                log.info("开始{}模式读取源表", config.getExtractMode());
                while (itr.hasNext()) {
                    Dataset<Row> df = itr.next();
                    log.info("开始{}模式更新源表", config.getExtractMode());
                    doShuffleDf(df, df.schema(), globalConfigBroadcast.getValue());
                }
            } else {
                Dataset<Row> df = dbExtract.extract();
                log.info("开始{}模式更新源表", config.getExtractMode());
                doShuffleDf(df, df.schema(), globalConfigBroadcast.getValue());
            }
            log.info("{}模式，洗数结束！！", config.getExtractMode());
        }
    }

    /**
     * 负责转换（洗数）、入库
     */
    protected void doShuffleDf(Dataset<Row> dataset, StructType schema, GlobalConfig globalConfig) {
//        Dataset<InternalMap> mapDf = dataset.coalesce(Integer.parseInt(WRITE_NUM_PARTITIONS))
//                .mapPartitions(new MapToInternalMapFunc(), Encoders.bean(InternalMap.class));
//        doShuffle0(mapDf, schema, globalConfig);
        JavaRDD<Map<String, Object>> javaRDD = dataset.toJavaRDD()
                .repartition(Integer.parseInt(WRITE_NUM_PARTITIONS))
//                .coalesce(Integer.parseInt(WRITE_NUM_PARTITIONS))
                .mapPartitions(new RowToMapFlatMapFunction());
        doShuffle(javaRDD, schema, globalConfig);
    }

    @Deprecated
    protected abstract void doShuffle0(Dataset<InternalMap> df, StructType schema, GlobalConfig globalConfig);

    protected abstract void doShuffle(JavaRDD<Map<String, Object>> javaRDD, StructType schema, GlobalConfig globalConfig);

    @Override
    public void finish() {
        log.info("run done !!");
        Optional.ofNullable(afterHandler).ifPresent(h -> h.handler(config));
    }

    private SparkSession getSparkSession(boolean onYarn) {
        SparkConf conf = new SparkConf().setAppName(config.getJobName());
        if (!onYarn) conf.setMaster("local[*]");
        return SparkSession.builder().config(conf).getOrCreate();
    }

    static class MapToInternalMapFunc implements MapPartitionsFunction<Row, InternalMap> {

        @Override
        public Iterator<InternalMap> call(Iterator<Row> iterator) throws Exception {
            List<InternalMap> res = new ArrayList<>();
            while (iterator.hasNext()) {
                InternalMap map = new InternalMap();
                Map<String, Object> r = new HashMap<>();
                Row row = iterator.next();
                StructType schema = row.schema();
                String[] fieldNames = schema.fieldNames();
                for (String fieldName : fieldNames) {
                    Object fieldVal = row.getAs(fieldName);
                    r.put(fieldName, fieldVal);
                }
                map.setRow(r);
                res.add(map);
            }
            return res.iterator();
        }
    }
}
