package cn.com.bluemoon.bd.kms.util;

import cn.com.bluemoon.bd.kms.EncryptAlgorithmUtils;
import com.google.common.annotations.VisibleForTesting;

/**
 * @author Jarod.Kong
 */
public class EncryptTest {
    @VisibleForTesting
    public static void main(String[] args) {
        Object plain = "test";
        String sys = "ec";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + plain2);
    }
}
