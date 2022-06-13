package cn.com.bluemoon.bd.kms.test;

import cn.com.bluemoon.bd.kms.EncryptAlgorithmUtils;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * 请先选择maven pom
 * profiles为encrypt-sdk-test
 *
 * @author Jarod.Kong
 */
public class EncryptAlgorithmUtilsTest {
    @Test
    public void testEcDecrypt() {
        Object plain = EncryptAlgorithmUtils.decrypt("wshs", "t+1OCt/82DoBd+blIlQe4g==");
        System.out.println(plain);
        assertEquals("温小姐", plain);
    }

    @Test
    public void ec() {
        Object plain = "蓝月亮";
        String sys = "ec";
        String cipher = EncryptAlgorithmUtils.encrypt(sys, plain);
        Object plain2 = EncryptAlgorithmUtils.decrypt(sys, cipher);
        System.out.println("sys: " + sys);
        System.out.println(plain + " encrypt :" + cipher);
        System.out.println(cipher + " decrypt :" + "$" + plain2 + "$");
        assertEquals("cIrvxAdb/L4QwjMwik7LuQ==", cipher);
        assertEquals(plain, plain2);
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
        assertEquals("rtrps/sNEI13txoagbcyEw==", cipher);
        assertEquals(plain, plain2);
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
        assertEquals("tJWRH6vvzBP+VuzIHhFL5g==", cipher);
        assertEquals(plain, plain2);
    }

}
