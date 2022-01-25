package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import lombok.*;

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
     */
    private Collection<String> fromSql;

    /**
     * execution url
     * 携带账号密码
     */
    private String executorUrl;

    /**
     * 目前只考虑jdbc数据库
     * jdbc
     */
    private String formatType;


}
