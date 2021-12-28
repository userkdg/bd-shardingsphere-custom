import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfigSwapper;
import com.alibaba.fastjson.JSON;
import org.junit.Test;

/**
 * @author Jarod.Kong
 */
public class GlobalConfigSwapperTest {
    @Test
    public void name() {
        GlobalConfig globalConfig = GlobalConfigSwapper.swapToConfig("{\"convertSourceUrl\":\"jdbc:mysql://192.168.234.7:3306/ec_order?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatemen\n" +
                "ts=true&useSSL=false&user=shproxy_morder&password=9kD6sN4qMIwN&allowMultiQueries=true&serverTimezone=Asia/Shanghai&character_set_server=utf8mb4&connectionCollation=utf8mb4_bin\",\"convertTargetUrl\":\"\n" +
                "jdbc:mysql://192.168.234.7:3306/ec_order?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useSSL=false&user=shproxy_morder&password=9kD6sN4qMIwN&allowMultiQueries=true&serverTim\n" +
                "ezone=Asia/Shanghai&character_set_server=utf8mb4&connectionCollation=utf8mb4_bin\",\"databaseType\":\"mysql\",\"extractMode\":\"WithIncField\",\"incrTimestampCol\":\"op_time\"");
        System.out.println(globalConfig);
        String s = GlobalConfigSwapper.swapToJsonStr(globalConfig);
        System.out.println(s);
    }
}
