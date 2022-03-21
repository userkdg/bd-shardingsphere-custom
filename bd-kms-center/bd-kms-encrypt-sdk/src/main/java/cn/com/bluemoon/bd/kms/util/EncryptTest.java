package cn.com.bluemoon.bd.kms.util;

import cn.com.bluemoon.bd.kms.EncryptAlgorithmUtils;

/**
 * @author Jarod.Kong
 */
public class EncryptTest {

    public static void main(String[] args) {
        Object plain = "";
        String sys = "ec";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + "$"+plain2+"$");
        assert cipher.equals("rUqyBDkxhDi++bIKHICLZg==");
        assert plain2.equals(plain);
    }
}
