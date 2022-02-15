import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.SparkInsertRewriteSqlShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.SparkSelectRewriteSqlShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfigurationSwapper;
import org.junit.Before;
import org.junit.Test;

/**
 * @author Jarod.Kong
 */
public class SparkSelectRewriteSqlShuffleCliTest {

    private String jsonStr;

    @Before
    public void setUp() throws Exception {
        RewriteConfiguration conf = new RewriteConfiguration();
        conf.setFileType("text");
//        conf.setFromFilePath("D:\\jarodkong\\pri-project\\shardingsphere\\bd-shardingsphere-custom\\bd-shardingsphere-custom-encrypt-shuffle\\bd-shardingsphere-custom-encrypt-rewrite-shuffle\\src\\test\\resources\\data\\forward.4554-no-repeat.sql");
        conf.setFromFilePath("/home/data_tool/bd-spark-kms-ec_order-sqls-check/sqls-select/test-select-sqls.log");
        conf.setExecutorUrl("jdbc:mysql://192.168.243.34:33306/ec_order_sandbox?user=root&password=root123456&useUnicode=true&characterEncoding=utf8&useSSL=false");
        conf.setDbName("ec_order_sandbox");
        conf.setResetDbStatus(true);
        conf.setFormatType("jdbc");
//        conf.setMaster("yarn");
        conf.setMaster("local[*]");
        conf.setSupportHive(true);
        conf.setAppName("bd-spark-kms-rewrite-shuffle-v1");
        System.out.println(conf);
        jsonStr = RewriteConfigurationSwapper.swapToJsonStr(conf);
        RewriteConfiguration decryptConf = RewriteConfigurationSwapper.swapToConfig(jsonStr);
        System.out.println(decryptConf);
    }

    @Test
    public void test1() {
        String[] args = {"-c " + jsonStr};
        System.out.println("jsonString:" + args[0]);
        SparkSelectRewriteSqlShuffleCli.main(args);
    }
}
