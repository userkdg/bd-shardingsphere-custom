package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.EncryptGlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.ExtractFactory;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.SparkDbExtract;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.broadcast.Broadcast;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.types.StructType;

import java.util.Iterator;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public abstract class BaseShuffleJobGraceful implements BaseShuffle {
    // must static
    protected static Broadcast<EncryptGlobalConfig> globalConfigBroadcast;

    protected final EncryptGlobalConfig config;

    public BaseShuffleJobGraceful(EncryptGlobalConfig config) {
        this.config = config;
    }

    public void init() {
        log.info("start job !!");
        if (config.getPlainCols() == null || config.getPlainCols().isEmpty()) {
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
                    doShuffle(df, df.schema(), globalConfigBroadcast.getValue());
                }
            } else {
                Dataset<Row> df = dbExtract.extract();
                log.info("开始{}模式更新源表", config.getExtractMode());
                doShuffle(df, df.schema(), globalConfigBroadcast.getValue());
            }
            log.info("{}模式，洗数结束！！", config.getExtractMode());
        }
    }

    /**
     * 负责转换（洗数）、入库
     */
    public abstract void doShuffle(Dataset<Row> dataset, StructType schema, EncryptGlobalConfig globalConfig);

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
