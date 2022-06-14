package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.ExtractMode;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl.ExtractState;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl.ExtractStateEhcacheManager;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl.ExtractStateRedisManager;
import lombok.extern.slf4j.Slf4j;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import java.util.List;
import java.util.Optional;

/**
 * 自定义where条件+作业状态管理（支持多次执行、重置状态）
 *
 * @author Jarod.Kong
 */
@Slf4j
public class SparkDbExtractWithPersistStateCustomWhere extends BaseSparkDbExtract {
    private final IExtractStateManager<ExtractState> extractStateManager;

    public SparkDbExtractWithPersistStateCustomWhere(GlobalConfig config, SparkSession spark) {
        super(config, spark);
        this.extractStateManager = new ExtractStateRedisManager(config.getJobGUID());
    }

    @Override
    public Dataset<Row> extract() {
        try {
            if (extractStateManager != null) {
                if (config.isResetJobState()){
                    extractStateManager.removeState(config.getRuleTableName());
                    log.warn("启动配置指定重置{}状态", config.getRuleTableName());
                }
            }
            return super.extract();
        } finally {
            // 2022/6/10 管理当前抽取的增量最大值，提供下次使用，注意：每次刷新是在查询成功之后
            if (extractStateManager != null) {
                ExtractState incrExtractState = tableSplitPkInfo.getIncrExtractState();
                log.info("抽取表{}，状态区间：{}", config.getRuleTableName(), incrExtractState);
                extractStateManager.addState(config.getRuleTableName(), incrExtractState);
            }
        }
    }

    @Override
    protected String getCustomWhereSql(ExtractMode shuffleMode, List<String> fields, List<String> extractCols) {
        ExtractState preExtractState;
        if ((preExtractState = extractStateManager.getState(config.getRuleTableName())) != null && preExtractState.getIncrName() != null){
            Object prePkMaxVal = preExtractState.getIncrType().isNeedQuote() ?
                    String.format("%s%s%s", preExtractState.getIncrType().getQuote(),  preExtractState.getMaxIncrVal(), preExtractState.getIncrType().getQuote()) :
                    preExtractState.getMaxIncrVal();
            String preExtractWhereSql = preExtractState.getIncrName() + " > " + prePkMaxVal;
            String res =  String.format(" (%s) ", preExtractWhereSql);
            if (config.getCustomExtractWhereSql() != null){
                res +=  String.format("and (%s) ", config.getCustomExtractWhereSql());
            }
            log.info("抽取表{}，状态区间：{}，附加条件：{}", config.getRuleTableName(), preExtractState, res);
            return res;
        }
        return String.format(" (%s) ", Optional.ofNullable(config.getCustomExtractWhereSql()).orElse(" 1=1 "));
    }

    @Override
    public String type() {
        return ExtractMode.WithPersistStateCustomWhere.getName();
    }
}
