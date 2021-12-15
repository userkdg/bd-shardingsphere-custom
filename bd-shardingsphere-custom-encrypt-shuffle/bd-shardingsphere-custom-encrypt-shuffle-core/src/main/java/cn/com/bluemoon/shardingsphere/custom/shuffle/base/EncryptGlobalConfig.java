package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

import lombok.*;

import java.io.Serializable;
import java.util.List;
import java.util.Properties;

/**
 * @author Jarod.Kong
 */
@Getter
@Setter
@ToString
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

    private boolean onYarn = true;

    private String jobName = "KMS洗数程序 On Spark";
    /**
     * 字段名称+类型，有序
     */
    private List<FieldInfo> plainCols;
    /**
     * 定义洗数模式
     */
    private ShuffleMode shuffleMode = ShuffleMode.ReShuffle;

    /**
     * 转换url是否支持multi batch操作
     */
    private boolean multiBatchUrlConfig;

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

    @Setter
    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
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
