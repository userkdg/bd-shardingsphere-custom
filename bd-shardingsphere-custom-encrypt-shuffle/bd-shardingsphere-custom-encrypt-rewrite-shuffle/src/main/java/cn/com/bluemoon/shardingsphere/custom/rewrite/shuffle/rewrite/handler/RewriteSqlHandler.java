package cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.rewrite.handler;

import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;

import java.io.Serializable;

/**
 * @author Jarod.Kong
 */
public interface RewriteSqlHandler extends Serializable {

    String handler(RewriteConfiguration config,String sourceSql);
}
