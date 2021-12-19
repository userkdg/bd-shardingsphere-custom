package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.BaseSparkDbExtract;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.ExtractFactory;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.SparkDbExtract;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.StructType;

import java.util.Iterator;
import java.util.Map;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public abstract class BaseShuffleJob implements BaseShuffle {

    public static final String parallelNum = System.getProperty("spark.encrypt.shuffle.jdbc.numPartitions", BaseSparkDbExtract.parallelNum);

    // must static
    protected static Broadcast<GlobalConfig> globalConfigBroadcast;

    protected final GlobalConfig config;

    public BaseShuffleJob(GlobalConfig config) {
        this.config = config;
    }

    public void init() {
        log.info("start job !!");
        if (config.getExtractCols() == null || config.getExtractCols().isEmpty()) {
            throw new RuntimeException("洗数字段不可为空");
        }
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
        JavaRDD<Map<String, Object>> javaRDD = dataset.toJavaRDD()
                .repartition(Integer.parseInt(parallelNum))
                .mapPartitions(new RowToMapFlatMapFunction());
        doShuffle(javaRDD, schema, globalConfig);
    }

    protected abstract void doShuffle(JavaRDD<Map<String, Object>> javaRDD, StructType schema, GlobalConfig globalConfig);

    @Override
    public void finish() {
        log.info("run done !!");
    }


    private SparkSession getSparkSession(boolean onYarn) {
        SparkConf conf = new SparkConf().setAppName(config.getJobName());
        if (!onYarn) conf.setMaster("local[*]");
        JavaSparkContext sc = new JavaSparkContext(conf);
        sc.setLogLevel("INFO");
        globalConfigBroadcast = sc.broadcast(config);
        return SparkSession.builder().config(conf).getOrCreate();
    }

}
