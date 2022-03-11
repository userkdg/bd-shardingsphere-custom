package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;

import java.util.*;

/**
 * 迭代器模式多次抽取增量数据
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkDbExtractIWithIncField extends BaseSparkDbExtract implements Iterator<Dataset<Row>> {

    private volatile String preExtractTimestamp;
    private volatile String curMaxIncrTimestamp;
    private volatile Dataset<Row> nextDfWithCache;

    public SparkDbExtractIWithIncField(GlobalConfig config, SparkSession spark) {
        super(config, spark);
        if (StringUtils.isNotBlank(config.getIncrTimestampColPreVal())) {
            log.warn("启动配置指定了上一次的增量最大值，【首次】直接使用preExtractTimestamp={}", config.getIncrTimestampColPreVal());
            preExtractTimestamp = config.getIncrTimestampColPreVal();
        }
    }

    /**
     * 获取增量字段最大值
     */
    protected Map<String, String> getSourceJdbcMaxIncrTimestampProps() {
        Map<String, String> props = getSourceJdbcBasicProps();
        ExtractMode shuffleMode = config.getExtractMode();
        Assert.isTrue(ExtractMode.WithIncField.equals(shuffleMode) && StringUtils.isNotBlank(config.getIncrTimestampCol()), "暂支持{}模式获取增量字段最大值", ExtractMode.WithIncField);
        final String tableAlias = String.format("%s AS %s", config.getRuleTableName(), SPARK_JDBC_DBTABLE_ALIAS);
        String maxQuerySql = String.format("(select MAX(%s) as %s from %s ) as max_table_tmp", wrappedFieldAlias(config.getIncrTimestampCol()), config.getIncrTimestampCol(), tableAlias);
        props.put(JDBCOptions.JDBC_TABLE_NAME(), maxQuerySql);
        return props;
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        return whereSqlWithIncField();
    }

    @Override
    public boolean hasNext() {
        return next0() != null;
    }

    @Override
    public Dataset<Row> next() {
        return extract();
    }

    /**
     * 分析上一次和当前次 sql where片段
     */
    private String whereSqlWithIncField() {
        String incrTimestampCol = config.getIncrTimestampCol();
        Objects.requireNonNull(incrTimestampCol, String.format("%s模式必须填写时间类型增量[%s]字段", ExtractMode.WithIncField, "EncryptGlobalConfig.incrTimestampCol"));
        if (preExtractTimestamp == null) {
            String currentTimestamp = curMaxIncrTimestamp;
//            String lte = String.format(" %s <= '%s' ", wrappedFieldAlias(incrTimestampCol), currentTimestamp);
            final String lte = " 1=1 ";
            log.info("首次洗数直接查询当前表所有数据，where sql=>{}", lte);
            preExtractTimestamp = currentTimestamp;
            return lte;
        } else {
            String gte;
            if (preExtractTimestamp.equals(curMaxIncrTimestamp)) {
                gte = String.format(" %s > '%s' ",
                        wrappedFieldAlias(incrTimestampCol), preExtractTimestamp);
            } else {
                gte = String.format(" %s > '%s' and %s <= '%s' ",
                        wrappedFieldAlias(incrTimestampCol), preExtractTimestamp,
                        wrappedFieldAlias(incrTimestampCol), curMaxIncrTimestamp);
                preExtractTimestamp = curMaxIncrTimestamp;
            }
            log.info("next: 增量数据进行增量字段条件查询，where sql=>{}", gte);
            return gte;
        }
    }


    /**
     * 尝试抽取下一次增量
     */
    private Dataset<Row> next0() {
        long incrExtractSize = 0;
        // 先查询出top1的增量字段值，再进行增量条件查询
        log.info("开始读取增量最大值");
        Dataset<Row> maxIncrTimestampDf = spark.read().format("jdbc").options(getSourceJdbcMaxIncrTimestampProps()).load();
        Row topOne = maxIncrTimestampDf.select(config.getIncrTimestampCol()).first();
        curMaxIncrTimestamp = Optional.ofNullable(topOne.getAs(config.getIncrTimestampCol())).map(String::valueOf).orElse(DateUtil.now());
        log.info("当前洗数阶段增量字段最大值为{}", curMaxIncrTimestamp);
        // 调整方案 普通模式跑一次，若是增量时间类型的就跑多次，直至没有新数据为止
        Dataset<Row> nextDf = loadCustomDbTableJdbcDF();
        nextDfWithCache = nextDf.cache();
        incrExtractSize = nextDfWithCache.count();
        if (incrExtractSize > 0) {
            log.info("发现增量数据进行开始洗数");
            nextDfWithCache.printSchema();
            log.debug("注：增量数据进行洗数完成，将尝试获取下一次增量数据，直至为空");
            return nextDf;
        } else {
            log.info("增量数据为空，洗数结束！！");
            return null;
        }
    }

    @Override
    public Dataset<Row> extract() {
        return nextDfWithCache;
    }

    @Override
    public String type() {
        return ExtractMode.WithIncField.getName();
    }
}
