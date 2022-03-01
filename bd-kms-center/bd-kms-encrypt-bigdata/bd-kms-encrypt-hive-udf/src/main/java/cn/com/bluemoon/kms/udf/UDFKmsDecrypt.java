package cn.com.bluemoon.kms.udf;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.shardingsphere.encrypt.spi.EncryptAlgorithm;
import org.apache.shardingsphere.spi.ShardingSphereServiceLoader;

import java.util.Objects;

import static cn.com.bluemoon.bd.kms.EncryptAlgorithmUtils.decrypt;

/**
 * @author Jarod.Kong
 */
public class UDFKmsDecrypt extends UDF {

    public String evaluate(String system, String cipherValue) {
        if (system == null) {
            return cipherValue;
        }
        if (cipherValue == null) {
            return null;
        }
        return Objects.toString(decrypt(system, cipherValue), cipherValue);
    }

}
