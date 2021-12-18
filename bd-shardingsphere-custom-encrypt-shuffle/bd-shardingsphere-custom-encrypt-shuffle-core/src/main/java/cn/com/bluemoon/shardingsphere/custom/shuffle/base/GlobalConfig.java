package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import cn.hutool.core.lang.Assert;
import lombok.*;

import java.io.Serializable;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 洗数核心配置
 *
 * @author Jarod.Kong
 */
@Getter
@Setter
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
     * 字段名称+类型，有序
     * 1.明->密：表示plain Columns 明文列 eg: address -> address_cipher
     * 2.密->明：表示cipher Columns 密文列 eg: address_cipher -> address_plain
     * 即可：不同洗数目的对应不同字段列，而获取方式统一
     * 对明文、密文进行洗数，都统一命名为抽取列
     */
    @Getter(AccessLevel.NONE)
    @Setter(AccessLevel.NONE)
    private List<FieldInfo> extractCols0;

    /**
     * 动态定义抽取字段、洗数到哪个字段及其规则
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
    private LinkedHashMap<String, FieldInfo> shuffleCols;
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
    private ShuffleMode shuffleMode = ShuffleMode.ENCRYPT;

    /**
     * 基于shuffleCols入口进行定义抽取列
     */
    public List<FieldInfo> getExtractCols() {
        Assert.isTrue(shuffleCols != null && !shuffleCols.isEmpty(), "洗数表字段不可为空");
        List<FieldInfo> extractCols = shuffleCols.entrySet().stream().map(e -> new FieldInfo(e.getKey(), e.getValue().getEncryptRule())).collect(Collectors.toList());
        this.extractCols0 = extractCols;
        return extractCols;
    }

    /**
     * 设置抽取列和洗数模式
     */
    public void setExtractCols(List<FieldInfo> extractCols) {
        this.extractCols0 = extractCols;
        if (extractCols != null) {
            LinkedHashMap<String, FieldInfo> shuffleCols0 = new LinkedHashMap<>();
            for (FieldInfo extractCol : extractCols) {
                FieldInfo oldTargetCol = Optional.ofNullable(shuffleCols.get(extractCol.getName()))
                        .orElseGet(() -> {
                            Objects.requireNonNull(shuffleMode, "在无指定目标列下，洗数模式不可为空");
                            return new FieldInfo(extractCol.getName() + shuffleMode.getSuffix(), extractCol.getType(), extractCol.getEncryptRule());
                        });
                oldTargetCol.setType(extractCol.getType());
                oldTargetCol.setEncryptRule(extractCol.getEncryptRule());
                shuffleCols0.put(extractCol.getName(), oldTargetCol);
            }
            this.shuffleCols = shuffleCols0;
        }
    }

    /**
     * 获取抽取列的目标列和加密规则
     * 不是固定目标列的名称 如：_cipher 、_plain
     * 而是基于调用者指定的源列->目标列关系
     */
    public Optional<FieldInfo> getTargetCol(String extractCol) {
        Assert.isTrue(shuffleCols != null && !shuffleCols.isEmpty(), "洗数表字段不可为空");
        FieldInfo targetCol = shuffleCols.get(extractCol);
        return Optional.ofNullable(targetCol);
    }

    public String getTargetColOrElse(String extractColName, String defaultTargetCol) {
        return getTargetCol(extractColName).map(FieldInfo::getName).orElse(defaultTargetCol);
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
                .add("customExtractWhereSql='" + customExtractWhereSql + "'")
                .add("onYarn=" + onYarn)
                .add("jobName='" + jobName + "'")
                .add("extractCols0=" + extractCols0)
                .add("shuffleCols=" + shuffleCols)
                .add("extractMode=" + extractMode)
                .add("multiBatchUrlConfig=" + multiBatchUrlConfig)
                .add("shuffleMode=" + shuffleMode)
                .toString();
    }

    @Getter
    public enum ShuffleMode {
        ENCRYPT(1, "_cipher", "明->密"),
        DECRYPT(2, "_plain", "密->明");
        private final int code;
        private final String suffix, desc;

        ShuffleMode(int code, String suffix, String desc) {
            this.code = code;
            this.suffix = suffix;
            this.desc = desc;
        }
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
    }
}
