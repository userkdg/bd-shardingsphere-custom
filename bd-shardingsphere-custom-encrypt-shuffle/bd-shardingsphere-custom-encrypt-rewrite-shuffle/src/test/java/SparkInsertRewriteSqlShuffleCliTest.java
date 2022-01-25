import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.SparkInsertRewriteSqlShuffleCli;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfiguration;
import cn.com.bluemoon.shardingsphere.custom.rewrite.shuffle.base.RewriteConfigurationSwapper;
import org.junit.Before;
import org.junit.Test;

/**
 * @author Jarod.Kong
 */
public class SparkInsertRewriteSqlShuffleCliTest {

    private String jsonStr;

    @Before
    public void setUp() throws Exception {
        RewriteConfiguration conf = new RewriteConfiguration();
        conf.setFileType("text");
        conf.setFromFilePath("D:\\jarodkong\\pri-project\\shardingsphere\\bd-shardingsphere-custom\\bd-shardingsphere-custom-encrypt-shuffle\\bd-shardingsphere-custom-encrypt-rewrite-shuffle\\src\\test\\resources\\data\\forward.4509.sql");
        conf.setExecutorUrl("jdbc:mysql://192.168.243.34:33306/ec_order?user=root&password=root&useUnicode=true&characterEncoding=utf8&useSSL=false");
        conf.setFormatType("jdbc");
        conf.setMaster("local[*]");
        conf.setAppName("test-");
        System.out.println(conf);
        jsonStr = RewriteConfigurationSwapper.swapToJsonStr(conf);
        RewriteConfiguration decryptConf = RewriteConfigurationSwapper.swapToConfig(jsonStr);
        System.out.println(decryptConf);
    }

    @Test
    public void test1() {
        String[] args = {"-c " + jsonStr};
        SparkInsertRewriteSqlShuffleCli.main(args);
    }
}
