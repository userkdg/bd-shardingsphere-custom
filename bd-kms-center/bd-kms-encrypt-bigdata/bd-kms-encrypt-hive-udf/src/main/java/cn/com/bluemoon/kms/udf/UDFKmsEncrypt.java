package cn.com.bluemoon.kms.udf;

import org.apache.hadoop.hive.ql.exec.UDF;

import java.util.Objects;

import static cn.com.bluemoon.bd.kms.EncryptAlgorithmUtils.encrypt;

/**
 * @author Jarod.Kong
 */
public class UDFKmsEncrypt extends UDF {

    public String evaluate(String system, String plainValue) {
        if (system == null) {
            return plainValue;
        }
        if (plainValue == null) {
            return null;
        }
        return Objects.toString(encrypt(system, plainValue), plainValue);
    }

}
