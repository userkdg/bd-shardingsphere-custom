package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.hutool.core.lang.Assert;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.execution.datasources.jdbc.JDBCOptions;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 迭代器模式一次抽取增量数据
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkDbExtractIWithIncFieldOnce extends BaseSparkDbExtract implements Iterator<Dataset<Row>> {

    private volatile String preExtractTimestamp;

    public SparkDbExtractIWithIncFieldOnce(GlobalConfig config, SparkSession spark) {
        super(config, spark);
        if (StringUtils.isNotBlank(config.getIncrTimestampColPreVal())) {
            log.warn("启动配置指定了上一次的增量最大值，【首次】直接使用preExtractTimestamp={}", config.getIncrTimestampColPreVal());
            preExtractTimestamp = config.getIncrTimestampColPreVal();
        }
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        return whereSqlWithIncField();
    }

    @Override
    public boolean hasNext() {
        throw new UnsupportedOperationException("只支持一次增量抽取，请用next()");
    }

    @Override
    public Dataset<Row> next() {
        return next0();
    }

    /**
     * 分析上一次和当前次 sql where片段
     */
    private String whereSqlWithIncField() {
        String incrTimestampCol = config.getIncrTimestampCol();
        Objects.requireNonNull(incrTimestampCol, String.format("%s模式必须填写时间类型增量[%s]字段", ExtractMode.WithIncField, "EncryptGlobalConfig.incrTimestampCol"));
        String gte = String.format(" %s >= '%s' ",
                wrappedFieldAlias(incrTimestampCol), preExtractTimestamp);
        return gte;
    }


    /**
     * 尝试抽取下一次增量
     */
    private Dataset<Row> next0() {
        return loadCustomDbTableJdbcDF();
    }

    @Override
    public Dataset<Row> extract() {
        return next0();
    }

    @Override
    public String type() {
        return ExtractMode.WithIncFieldOnce.getName();
    }
}
