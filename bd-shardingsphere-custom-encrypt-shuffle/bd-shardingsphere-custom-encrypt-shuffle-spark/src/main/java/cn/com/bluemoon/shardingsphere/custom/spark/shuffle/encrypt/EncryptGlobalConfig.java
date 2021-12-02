package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.ShuffleMode;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

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
    private String proxyUrl;

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

    public String getSourceUrl() {
        return convertJdbcUrl(sourceUrl);
    }

    public String getProxyUrl() {
        return convertJdbcUrl(proxyUrl);
    }

    private String convertJdbcUrl(String proxyUrl) {
        if (proxyUrl != null) {
            String url = proxyUrl;
            if (!url.contains("useUnicode")) url += "&useUnicode=true";
            if (!url.contains("characterEncoding")) url += "&characterEncoding=utf8";
//            if (!url.contains("rewriteBatchedStatements")) url += "&rewriteBatchedStatements=true";
            if (!url.contains("useSSL")) url += "&useSSL=false";
            if (!url.contains("serverTimezone")) url += "&serverTimezone=Asia/Shanghai";
            if (!url.contains("character_set_server")) url += "&character_set_server=utf8mb4";
            if (!url.contains("connectionCollation")) url += "&connectionCollation=utf8mb4_bin";
//            if (!url.contains("allowMultiQueries")) url += "&allowMultiQueries=true";
            return url;
        }
        return null;
    }

    public String getDatabaseType() {
        if (sourceUrl != null) {
            return getDatabaseType(sourceUrl);
        }
        if (proxyUrl != null) {
            return getDatabaseType(proxyUrl);
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

        public FieldInfo(String name) {
            this.name = name;
        }
    }

}
