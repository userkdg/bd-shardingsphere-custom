package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import lombok.*;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;
import java.util.Properties;
import java.util.StringJoiner;

/**
 * @author Jarod.Kong
 */
@Getter
@Setter
public class EncryptGlobalConfig implements Serializable {

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
    private String jobName = "bd-spark-KMS-洗数程序";
    /**
     * 字段名称+类型，有序
     */
    private List<FieldInfo> plainCols;
    /**
     * 定义洗数模式
     */
    private ExtractMode extractMode;
    /**
     * 转换url是否支持multi batch操作
     */
    private boolean multiBatchUrlConfig;

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
        return new StringJoiner(", ", EncryptGlobalConfig.class.getSimpleName() + "[", "]")
                .add("sourceUrl='" + getConvertSourceUrl() + "'")
                .add("targetUrl='" + getConvertTargetUrl() + "'")
                .add("ruleTableName='" + ruleTableName + "'")
                .add("primaryCols=" + primaryCols)
                .add("partitionCol=" + partitionCol)
                .add("incrTimestampCol='" + incrTimestampCol + "'")
                .add("customExtractWhereSql='" + customExtractWhereSql + "'")
                .add("onYarn=" + onYarn)
                .add("jobName='" + jobName + "'")
                .add("plainCols=" + plainCols)
                .add("extractMode=" + extractMode)
                .add("multiBatchUrlConfig=" + multiBatchUrlConfig)
                .toString();
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
