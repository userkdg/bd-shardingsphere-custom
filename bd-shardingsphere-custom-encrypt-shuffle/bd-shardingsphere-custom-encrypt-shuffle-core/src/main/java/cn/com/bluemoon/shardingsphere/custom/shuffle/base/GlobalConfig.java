package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import lombok.*;

import java.io.Serializable;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 洗数核心配置
 *
 * @author Jarod.Kong
 */
public class GlobalConfig implements Serializable {

    public static final String MYSQL = "mysql";
    public static final String POSTGRESQL = "postgresql";
    /**
     * jdbc:mysql://192.168.234.xx:3306/xxx?user=xxx&password=xxxx
     */
    private String sourceUrl;
    /**
     * jdbc:mysql://192.168.234.xx:3306/xxx?user=xxx&password=xxxx
     */
    private String targetUrl;

    private String ruleTableName;
    /**
     * 支持单主键、多主键
     * pri_1 and pri_2
     */
    private List<FieldInfo> primaryCols;

    /**
     * 分区字段信息
     */
    private FieldInfo partitionCol;

    /**
     * 增量时间字段名，用于划分时间区域
     */
    private String incrTimestampCol;
    /**
     * 增量时间字段上一次最大值（用于直接跳过历史的洗数数据）
     */
    private String incrTimestampColPreVal;

    /**
     * 自定义拉取数据库的查询条件，不需要 加where
     * eg: 1=1 and 1=1 ...
     */
    private String customExtractWhereSql;
    /**
     * 是否提交到yarn资源上
     */
    private boolean onYarn = true;
    /**
     * 洗数作业名称
     */
    private String jobName = "bd-spark-kms-shuffle-job";


    /**
     * 动态定义抽取字段、洗数到哪个字段及其规则
     * 字段名称+类型，有序
     * 1.明->密：表示plain Columns 明文列 eg: address -> address_cipher
     * 2.密->明：表示cipher Columns 密文列 eg: address_cipher -> address_plain
     * 即可：不同洗数目的对应不同字段列，而获取方式统一
     * 对明文、密文进行洗数，都统一命名为抽取列
     * <pre>
     * key: address
     * value:
     *      name: address_cipher
     *      type: 1
     *      encryptRule:
     *          type: aes
     *          props: aes-key-value: xxx
     * </pre>
     */
    private List<Tuple2<FieldInfo>> shuffleCols = new LinkedList<>();

    /**
     * 用于重加密，需要三个字段
     */
    private List<Tuple3<FieldInfo>> reShuffleCols = new LinkedList<>();

    /**
     * 定义洗数模式
     */
    private ExtractMode extractMode;
    /**
     * 转换url是否支持multi batch操作
     */
    private boolean multiBatchUrlConfig;
    /**
     * 洗数模式
     */
    @Setter(value = AccessLevel.NONE)
    private ShuffleMode shuffleMode = ShuffleMode.ENCRYPT;

    /**
     * 内部设置
     * 不推荐外部设置
     */
    public void setShuffleModeInternal(ShuffleMode shuffleMode) {
        this.shuffleMode = shuffleMode;
    }

    /**
     * 基于shuffleCols入口进行定义抽取列
     */
    public List<FieldInfo> internalGetExtractCols() {
        Assert.isTrue(shuffleCols != null && !shuffleCols.isEmpty(), "洗数表字段不可为空");
        return shuffleCols.stream().map(Tuple2::getT1).collect(Collectors.toList());
    }

    public List<FieldInfo> internalGetTargetCols() {
        Assert.isTrue(shuffleCols != null && !shuffleCols.isEmpty(), "洗数表字段不可为空");
        return shuffleCols.stream().map(Tuple2::getT2).collect(Collectors.toList());
    }

    /**
     * 设置抽取列和洗数模式
     * 内部设置 不推荐外部设置
     */
    public void setExtractColsInternal(List<FieldInfo> extractCols) {
        if (extractCols != null) {
            for (int i = 0; i < extractCols.size(); i++) {
                Tuple2<FieldInfo> fieldTuple = shuffleCols.get(i);
                fieldTuple.setT1(extractCols.get(i));
            }
        }
    }

    /**
     * 获取抽取列的目标列和加密规则
     * 不是固定目标列的名称 如：_cipher 、_plain
     * 而是基于调用者指定的源列->目标列关系
     */
    public Optional<FieldInfo> getTargetCol(String extractCol) {
        Assert.isTrue(shuffleCols != null && !shuffleCols.isEmpty(), "洗数表字段不可为空");
        return shuffleCols.stream().filter(t -> StrUtil.equalsIgnoreCase(t.getT1().getName(), extractCol)).map(Tuple2::getT2).findFirst();
    }

    public String getTargetColOrElse(String extractColName, String defaultTargetCol) {
        return getTargetCol(extractColName).map(FieldInfo::getName).orElse(defaultTargetCol);
    }

    public FieldInfo getTargetColOrElse(String extractColName, FieldInfo defaultTargetCol) {
        return getTargetCol(extractColName).orElse(defaultTargetCol);
    }

    public Optional<FieldInfo> getPartitionColOpt() {
        return Optional.ofNullable(partitionCol);
    }

    public String getConvertSourceUrl() {
        return convertJdbcUrl(sourceUrl, multiBatchUrlConfig);
    }

    public String getConvertTargetUrl() {
        return convertJdbcUrl(targetUrl, multiBatchUrlConfig);
    }

    public String convertJdbcUrl(String targetUrl, boolean multiBatchConfig) {
        if (targetUrl != null) {
            String url = targetUrl;
            if (!url.contains("useUnicode")) url += "&useUnicode=true";
            if (!url.contains("characterEncoding")) url += "&characterEncoding=utf8";
            if (multiBatchConfig) {
                if (!url.contains("rewriteBatchedStatements")) url += "&rewriteBatchedStatements=true";
                if (!url.contains("allowMultiQueries")) url += "&allowMultiQueries=true";
            }
            if (!url.contains("useSSL")) url += "&useSSL=false";
            if (!url.contains("serverTimezone")) url += "&serverTimezone=Asia/Shanghai";
            if (!url.contains("character_set_server")) url += "&character_set_server=utf8mb4";
            if (!url.contains("connectionCollation")) url += "&connectionCollation=utf8mb4_bin";
            return url;
        }
        return null;
    }

    public String getDatabaseType() {
        if (sourceUrl != null) {
            return getDatabaseType(sourceUrl);
        }
        if (targetUrl != null) {
            return getDatabaseType(targetUrl);
        }
        return null;
    }

    private String getDatabaseType(String sourceUrl) {
        if (sourceUrl.contains("jdbc:mysql")) return MYSQL;
        if (sourceUrl.contains("jdbc:postgresql")) return POSTGRESQL;
        throw new RuntimeException("不支持数据库类型");
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", GlobalConfig.class.getSimpleName() + "[", "]")
                .add("sourceUrl='" + sourceUrl + "'")
                .add("targetUrl='" + targetUrl + "'")
                .add("ruleTableName='" + ruleTableName + "'")
                .add("primaryCols=" + primaryCols)
                .add("partitionCol=" + partitionCol)
                .add("incrTimestampCol='" + incrTimestampCol + "'")
                .add("incrTimestampColPreVal='" + incrTimestampColPreVal + "'")
                .add("customExtractWhereSql='" + customExtractWhereSql + "'")
                .add("onYarn=" + onYarn)
                .add("jobName='" + jobName + "'")
                .add("shuffleCols=" + shuffleCols)
                .add("reShuffleCols=" + reShuffleCols)
                .add("extractMode=" + extractMode)
                .add("multiBatchUrlConfig=" + multiBatchUrlConfig)
                .add("shuffleMode=" + shuffleMode)
                .toString();
    }

    @Getter
    public enum ShuffleMode {
        ENCRYPT(1, "_cipher", "明->密"),
        DECRYPT(2, "_plain", "密->明"),
        RE_ENCRYPT(3, "", "重加密：密->明->密");

        private final int code;
        private final String suffix, desc;

        ShuffleMode(int code, String suffix, String desc) {
            this.code = code;
            this.suffix = suffix;
            this.desc = desc;
        }
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Tuple2<T> implements Serializable {
        private T t1;
        private T t2;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Tuple3<T> extends Tuple2<T> {
        private T t3;
    }

    @Setter
    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    @ToString
    public static class FieldInfo implements Serializable {
        private String name;
        // 入参不为空，则已入参为准，若为空则以spark读取的schema类型为准
        private Integer type;
        /**
         * 表字段加密规则
         */
        private EncryptRule encryptRule;

        public FieldInfo(String name) {
            this.name = name;
        }

        public FieldInfo(String name, Integer type) {
            this.name = name;
            this.type = type;
        }

        public FieldInfo(String name, EncryptRule encryptRule) {
            this.name = name;
            this.encryptRule = encryptRule;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            FieldInfo fieldInfo = (FieldInfo) o;

            if (!Objects.equals(name, fieldInfo.name)) return false;
            if (!Objects.equals(type, fieldInfo.type)) return false;
            return Objects.equals(encryptRule, fieldInfo.encryptRule);
        }

        @Override
        public int hashCode() {
            int result = name != null ? name.hashCode() : 0;
            result = 31 * result + (type != null ? type.hashCode() : 0);
            result = 31 * result + (encryptRule != null ? encryptRule.hashCode() : 0);
            return result;
        }
    }

    @Getter
    @RequiredArgsConstructor
    @ToString
    public static class EncryptRule implements Serializable {
        /**
         * 类型：AES/ MD5
         */
        private final String type;
        /**
         * aes-key-value='xx'
         */
        private final Properties props;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            EncryptRule that = (EncryptRule) o;

            if (!Objects.equals(type, that.type)) return false;
            return Objects.equals(props, that.props);
        }

        @Override
        public int hashCode() {
            int result = type != null ? type.hashCode() : 0;
            result = 31 * result + (props != null ? props.hashCode() : 0);
            return result;
        }
    }

    public String getSourceUrl() {
        return sourceUrl;
    }

    public void setSourceUrl(String sourceUrl) {
        this.sourceUrl = sourceUrl;
    }

    public String getTargetUrl() {
        return targetUrl;
    }

    public void setTargetUrl(String targetUrl) {
        this.targetUrl = targetUrl;
    }

    public String getRuleTableName() {
        return ruleTableName;
    }

    public void setRuleTableName(String ruleTableName) {
        this.ruleTableName = ruleTableName;
    }

    public List<FieldInfo> getPrimaryCols() {
        return primaryCols;
    }

    public void setPrimaryCols(List<FieldInfo> primaryCols) {
        this.primaryCols = primaryCols;
    }

    public FieldInfo getPartitionCol() {
        return partitionCol;
    }

    public void setPartitionCol(FieldInfo partitionCol) {
        this.partitionCol = partitionCol;
    }

    public String getIncrTimestampCol() {
        return incrTimestampCol;
    }

    public void setIncrTimestampCol(String incrTimestampCol) {
        this.incrTimestampCol = incrTimestampCol;
    }

    public String getIncrTimestampColPreVal() {
        return incrTimestampColPreVal;
    }

    public void setIncrTimestampColPreVal(String incrTimestampColPreVal) {
        this.incrTimestampColPreVal = incrTimestampColPreVal;
    }

    public String getCustomExtractWhereSql() {
        return customExtractWhereSql;
    }

    public void setCustomExtractWhereSql(String customExtractWhereSql) {
        this.customExtractWhereSql = customExtractWhereSql;
    }

    public boolean isOnYarn() {
        return onYarn;
    }

    public void setOnYarn(boolean onYarn) {
        this.onYarn = onYarn;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public List<Tuple2<FieldInfo>> getShuffleCols() {
        return shuffleCols;
    }

    public void setShuffleCols(List<Tuple2<FieldInfo>> shuffleCols) {
        this.shuffleCols = shuffleCols;
    }

    public List<Tuple3<FieldInfo>> getReShuffleCols() {
        return reShuffleCols;
    }

    public void setReShuffleCols(List<Tuple3<FieldInfo>> reShuffleCols) {
        this.reShuffleCols = reShuffleCols;
    }

    public ExtractMode getExtractMode() {
        return extractMode;
    }

    public void setExtractMode(ExtractMode extractMode) {
        this.extractMode = extractMode;
    }

    public boolean isMultiBatchUrlConfig() {
        return multiBatchUrlConfig;
    }

    public void setMultiBatchUrlConfig(boolean multiBatchUrlConfig) {
        this.multiBatchUrlConfig = multiBatchUrlConfig;
    }

    public ShuffleMode getShuffleMode() {
        return shuffleMode;
    }

    public void setShuffleMode(ShuffleMode shuffleMode) {
        this.shuffleMode = shuffleMode;
    }
}
