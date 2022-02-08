package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Map;

/**
 * @author Jarod.Kong
 */

@Data
public class BaseSparkConfig implements Serializable {

    @NotNull
    private String master;

    private String appName;

    private Boolean supportHive;

    private Map<String,String> otherParams;

}
