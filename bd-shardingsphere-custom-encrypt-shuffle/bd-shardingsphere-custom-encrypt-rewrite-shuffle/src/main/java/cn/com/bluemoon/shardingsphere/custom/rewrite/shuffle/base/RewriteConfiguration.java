package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import lombok.*;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Collection;

/**
 * @author Jarod.Kong
 */
@Data
public class RewriteConfiguration extends BaseSparkConfig implements Serializable {
    /**
     * 正则match文件路径
     * 内容为sql
     */
    private String fromFilePath;

    /**
     * 文件类型
     */
    private String fileType;

    /**
     * 指定sql分析
     * fromFilePath选其一
     */
    private Collection<String> fromSql;

    /**
     * execution url
     * 携带账号密码
     */
    @NotNull
    private String executorUrl;

    /**
     * 目前只考虑jdbc数据库
     * jdbc
     */
    private String formatType;

    /**
     * 数据库schema名称
     */
    @NotNull
    private String dbName;

    /**
     * 重置数据库状态（非幂等性的shuffle，插入sql到数据库）
     */
    private Boolean resetDbStatus;


}
