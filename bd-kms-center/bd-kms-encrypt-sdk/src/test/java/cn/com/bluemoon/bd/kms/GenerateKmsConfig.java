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
    public void wshs() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        algorithm.setSys("wshs");
        algorithm.setType("aes");
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "zsG9NUYfQPrHBhq1");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        Assert.assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCJ6c0c5TlVZZlFQckhCaHExXCJ9Iiwic3lzIjoid3NocyIsInR5cGUiOiJhZXMifQ==",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        Assert.assertEquals(algorithmByBase64Str.getType(),("aes"));
        Assert.assertEquals(algorithmByBase64Str.getSys(),("wshs"));
        Assert.assertEquals(algorithmByBase64Str.getKey(),("{\"aes-key-value\":\"zsG9NUYfQPrHBhq1\"}"));
    }
    @Test
    public void mhsmc() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        algorithm.setSys("mhsmc");
        algorithm.setType("aes");
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "s7jHb5nRTj5x2HVA");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        Assert.assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCJzN2pIYjVuUlRqNXgySFZBXCJ9Iiwic3lzIjoibWhzbWMiLCJ0eXBlIjoiYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        Assert.assertEquals(algorithmByBase64Str.getType(),("aes"));
        Assert.assertEquals(algorithmByBase64Str.getSys(),("mhsmc"));
        Assert.assertEquals(algorithmByBase64Str.getKey(),("{\"aes-key-value\":\"s7jHb5nRTj5x2HVA\"}"));
    }
    @Test
    public void mhoms() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        algorithm.setSys("mhoms");
        algorithm.setType("aes");
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "5lZ7ed1e3u49XD8p");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        Assert.assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCI1bFo3ZWQxZTN1NDlYRDhwXCJ9Iiwic3lzIjoibWhvbXMiLCJ0eXBlIjoiYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        Assert.assertEquals(algorithmByBase64Str.getType(),("aes"));
        Assert.assertEquals(algorithmByBase64Str.getSys(),("mhoms"));
        Assert.assertEquals(algorithmByBase64Str.getKey(),("{\"aes-key-value\":\"5lZ7ed1e3u49XD8p\"}"));
    }
}
