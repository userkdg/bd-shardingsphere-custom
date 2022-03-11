package cn.com.bluemoon.shardingsphere.custom.shuffle.base;

/**
 * @author Jarod.Kong
 */
public class InternalDbUtil {

    public static String convertJdbcUrl(String targetUrl, boolean multiBatchConfig) {
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
}
