package cn.com.bluemoon.bd.kms;

import com.alibaba.fastjson.JSON;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import static cn.com.bluemoon.bd.kms.EncryptAlgorithmUtils.getAlgorithmByBase64Str;
import static org.junit.Assert.assertEquals;

/**
 * 生成kms配置key（base64）
 *
 * @author Jarod.Kong
 */
public class GenerateKmsConfigTest {
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
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCJ3bGYxZDVtbWFsMnhzdHRyXCJ9Iiwic3lzIjoiZWMiLCJ0eXBlIjoiYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), ("aes"));
        assertEquals(algorithmByBase64Str.getSys(), ("ec"));
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"wlf1d5mmal2xsttr\"}"));
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
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCJ6c0c5TlVZZlFQckhCaHExXCJ9Iiwic3lzIjoid3NocyIsInR5cGUiOiJhZXMifQ==",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), ("aes"));
        assertEquals(algorithmByBase64Str.getSys(), ("wshs"));
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"zsG9NUYfQPrHBhq1\"}"));
    }

    @Test
    public void wshsProd() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        algorithm.setSys("wshs");
        algorithm.setType("aes");
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "0A5nyhSZBF3JQAmL");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCIwQTVueWhTWkJGM0pRQW1MXCJ9Iiwic3lzIjoid3NocyIsInR5cGUiOiJhZXMifQ==",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), ("aes"));
        assertEquals(algorithmByBase64Str.getSys(), ("wshs"));
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"0A5nyhSZBF3JQAmL\"}"));
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
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCJzN2pIYjVuUlRqNXgySFZBXCJ9Iiwic3lzIjoibWhzbWMiLCJ0eXBlIjoiYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), ("aes"));
        assertEquals(algorithmByBase64Str.getSys(), ("mhsmc"));
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"s7jHb5nRTj5x2HVA\"}"));
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
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCI1bFo3ZWQxZTN1NDlYRDhwXCJ9Iiwic3lzIjoibWhvbXMiLCJ0eXBlIjoiYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), ("aes"));
        assertEquals(algorithmByBase64Str.getSys(), ("mhoms"));
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"5lZ7ed1e3u49XD8p\"}"));
    }

    @Test
    public void eccrm() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        String algoType = "mysql-aes";
        String sysKey = "eccrm";
        algorithm.setSys(sysKey);
        algorithm.setType(algoType);
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "04rVFQfYYItOBVtk");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCIwNHJWRlFmWVlJdE9CVnRrXCJ9Iiwic3lzIjoiZWNjcm0iLCJ0eXBlIjoibXlzcWwtYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), algoType);
        assertEquals(algorithmByBase64Str.getSys(), sysKey);
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"04rVFQfYYItOBVtk\"}"));
    }


    @Test
    public void eccrmProd() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        String algoType = "mysql-aes";
        String sysKey = "eccrm";
        algorithm.setSys(sysKey);
        algorithm.setType(algoType);
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "7l8avffzgrngdtco");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCI3bDhhdmZmemdybmdkdGNvXCJ9Iiwic3lzIjoiZWNjcm0iLCJ0eXBlIjoibXlzcWwtYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), algoType);
        assertEquals(algorithmByBase64Str.getSys(), sysKey);
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"7l8avffzgrngdtco\"}"));
    }

    @Test
    public void ecoms() {
        EncryptAlgorithmUtils.Algorithm algorithm = new EncryptAlgorithmUtils.Algorithm();
        // 业务线
        String algoType = "mysql-aes";
        String sysKey = "eccrm";
        algorithm.setSys(sysKey);
        algorithm.setType(algoType);
        Map<String, Object> keyProps = new HashMap<>();
        keyProps.put("aes-key-value", "04rVFQfYYItOBVtk");
        algorithm.setKey(JSON.toJSONString(keyProps));
        // 加码
        byte[] encode = Base64.getEncoder().encode(JSON.toJSONString(algorithm).getBytes(StandardCharsets.UTF_8));
        String ec = new String(encode, StandardCharsets.UTF_8);
        assertEquals(
                "eyJrZXkiOiJ7XCJhZXMta2V5LXZhbHVlXCI6XCIwNHJWRlFmWVlJdE9CVnRrXCJ9Iiwic3lzIjoiZWNjcm0iLCJ0eXBlIjoibXlzcWwtYWVzIn0=",
                ec);
        // 解码
        EncryptAlgorithmUtils.Algorithm algorithmByBase64Str = getAlgorithmByBase64Str(ec);
        System.out.println(algorithmByBase64Str);
        assertEquals(algorithmByBase64Str.getType(), algoType);
        assertEquals(algorithmByBase64Str.getSys(), sysKey);
        assertEquals(algorithmByBase64Str.getKey(), ("{\"aes-key-value\":\"04rVFQfYYItOBVtk\"}"));
    }
}
