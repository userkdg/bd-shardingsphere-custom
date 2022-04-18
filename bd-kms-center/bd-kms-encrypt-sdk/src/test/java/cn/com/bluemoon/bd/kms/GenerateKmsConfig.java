package cn.com.bluemoon.bd.kms;

import com.alibaba.fastjson.JSON;
import org.junit.Assert;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import static cn.com.bluemoon.bd.kms.EncryptAlgorithmUtils.getAlgorithmByBase64Str;

/**
 * @author Jarod.Kong
 */
public class GenerateKmsConfig {
    @Test
    public void ec() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        algorithm.setSys("ec");
        algorithm.setType("aes");
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "wlf1d5mmal2xsttr");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        Assert.assertEquals(
        "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCJ3bGYxZDVtbWFsMnhzdHRyXCJ9Iiwic3lzIjoiZWMiLCJ0eXBlIjoiYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        Assert.assertEquals(algorithmByBase64Str.getType(),("aes"));
        Assert.assertEquals(algorithmByBase64Str.getSys(),("ec"));
        Assert.assertEquals(algorithmByBase64Str.getKey(),("{\"aes-key-value\":\"wlf1d5mmal2xsttr\"}"));
    }
    @Test
    public void washing() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        algorithm.setSys("washing");
        algorithm.setType("aes");
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "zsG9NUYfQPrHBhq1");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        Assert.assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCJ6c0c5TlVZZlFQckhCaHExXCJ9Iiwic3lzIjoid2FzaGluZyIsInR5cGUiOiJhZXMifQ==",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        Assert.assertEquals(algorithmByBase64Str.getType(),("aes"));
        Assert.assertEquals(algorithmByBase64Str.getSys(),("washing"));
        Assert.assertEquals(algorithmByBase64Str.getKey(),("{\"aes-key-value\":\"zsG9NUYfQPrHBhq1\"}"));
    }
}
