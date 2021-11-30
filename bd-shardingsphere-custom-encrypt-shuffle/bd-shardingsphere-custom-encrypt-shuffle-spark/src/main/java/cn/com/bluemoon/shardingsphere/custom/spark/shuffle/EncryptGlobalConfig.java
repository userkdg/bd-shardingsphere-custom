package cn.com.bluemoon.shardingsphere.custom.spark.shuffle;

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
    /**
     * jdbc:mysql://192.168.234.xx:3306/xxx?user=xxx&password=xxxx
     */
    private String sourceUrl;
    /**
     * jdbc:mysql://192.168.234.xx:3306/xxx?user=xxx&password=xxxx
     */
    private String proxyUrl;
    private String ruleTableName;

    private FieldInfo partitionColumn;

    /**
     * 字段名称+类型，有序
     */
    private List<FieldInfo> plainColumnNames;

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
        if (sourceUrl.contains("jdbc:mysql")) return "mysql";
        if (sourceUrl.contains("jdbc:postgresql")) return "postgresql";
        throw new RuntimeException("不支持数据库类型");
    }

    @Setter
    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class FieldInfo implements Serializable{
        private String name;
        private Integer type;
        
    }

}
