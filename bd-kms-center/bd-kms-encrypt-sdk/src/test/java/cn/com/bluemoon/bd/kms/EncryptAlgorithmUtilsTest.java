package cn.com.bluemoon.bd.kms;

import org.junit.Assert;
import org.junit.Test;

/**
 * @author Jarod.Kong
 */
public class EncryptAlgorithmUtilsTest {

    @Test
    public void ec() {
        Object plain = "";
        String sys = "ec";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + "$" + plain2 + "$");
        Assert.assertEquals("rUqyBDkxhDi++bIKHICLZg==", cipher);
        Assert.assertEquals(plain, plain2);
    }

    @Test
    public void washing() {
        Object plain = "";
        String sys = "washing";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + "$" + plain2 + "$");
        Assert.assertEquals("rtrps/sNEI13txoagbcyEw==", cipher);
        Assert.assertEquals(plain, plain2);
    }

    @Test
    public void ecoms() {
        Object plain = "test";
        String sys = "ecoms";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + plain2);
        Assert.assertEquals("tJWRH6vvzBP+VuzIHhFL5g==", cipher);
        Assert.assertEquals(plain, plain2);
    }

}
