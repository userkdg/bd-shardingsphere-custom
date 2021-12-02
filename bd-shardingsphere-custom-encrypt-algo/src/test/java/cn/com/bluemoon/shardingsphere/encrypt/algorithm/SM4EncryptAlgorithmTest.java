package cn.com.bluemoon.shardingsphere.encrypt.algorithm;

import cn.hutool.core.util.StrUtil;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmConfiguration;
import org.apache.shardingsphere.infra.config.algorithm.ShardingSphereAlgorithmFactory;
import org.apache.shardingsphere.spi.ShardingSphereServiceLoader;
import org.junit.Before;
import org.junit.Test;

import java.util.Properties;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertThat;

/**
 * @author Jarod.Kong
 */
public class SM4EncryptAlgorithmTest {

    static {
        ShardingSphereServiceLoader.register(EncryptAlgorithm.class);
    }

    private EncryptAlgorithm encryptAlgorithm;

    @Before
    public void setUp() {
        Properties props = new Properties();
        props.setProperty("sm4-key-value", "jluwy9u94dusnb9g");
        props.setProperty("sm4-iv-value", "bluemooniviviviv");
        encryptAlgorithm = ShardingSphereAlgorithmFactory
                .createAlgorithm(new ShardingSphereAlgorithmConfiguration("SM4", props),
                        EncryptAlgorithm.class);
    }

    @Test
    public void assertEncrypt() {
        assertThat(encryptAlgorithm.encrypt("18813975053"), is("DyytBVpVZkwsoi1ce6nCmA=="));
        assertThat(encryptAlgorithm.encrypt(null), is(nullValue()));

        assertThat(encryptAlgorithm.decrypt("DyytBVpVZkwsoi1ce6nCmA=="), is("18813975053"));
        assertThat(encryptAlgorithm.decrypt(null), is(nullValue()));

    }

    @Test
    public void testLength() {
        // jluwy9u94dusnb9g
        // gsmIaet1pCZcmodqWD7IAFlTSHVgVepTdd1gligcnyzIE4CEC0bEvY3EMQsOu/1My4gR7pKNYptrt0FDHu/jibpGWUBBpihiqcgSvdwHg5pcH8hLU+wOzJP37ICkh+8V
        // 128
        String repeat = StrUtil.repeat("жа", 256);
        System.out.println(repeat);
        System.out.println(repeat.length());
        // 4dusnb9g
        // 128
        String s1 =
//                encryptAlgorithm.encrypt("ab");
//                encryptAlgorithm.encrypt("жа");
                encryptAlgorithm.encrypt(repeat);
        System.out.println(s1);
        System.out.println(s1.length());
    }

}
