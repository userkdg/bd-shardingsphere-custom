package cn.com.bluemoon.bd.kms;

import org.junit.Assert;
import org.junit.Test;

/**
 * @author Jarod.Kong
 */
public class EncryptAlgorithmUtilsTest {
    @Test
    public void testEcDecrypt() {
        Object plain = EncryptAlgorithmUtils.decrypt("wshs", "rQf7qwflKswdQKXbYo+AEw==");
        System.out.println(plain);
    }

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
    public void wshs() {
        Object plain = "";
        String sys = "wshs";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + "$" + plain2 + "$");
        Assert.assertEquals("rtrps/sNEI13txoagbcyEw==", cipher);
        Assert.assertEquals(plain, plain2);
    }


    @Test
    public void wshsProd() {
        Object plain = "";
        String sys = "wshs";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + "$" + plain2 + "$");
        Assert.assertEquals("SFhXDqGO0kQLjDbwgfloXg==", cipher);
        Assert.assertEquals(plain, plain2);
    }


    @Test
    public void eccrm() {
        Object plain = "test";
        String sys = "eccrm";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + plain2);
        Assert.assertEquals("nXcET6Qb49c3ULUAA6nQyA==", cipher);
        Assert.assertEquals(plain, plain2);
    }

}
