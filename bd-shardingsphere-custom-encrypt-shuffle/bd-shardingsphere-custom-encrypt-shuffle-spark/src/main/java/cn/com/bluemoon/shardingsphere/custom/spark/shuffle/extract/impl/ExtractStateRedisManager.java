package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.IExtractStateManager;
import com.alibaba.fastjson.JSON;
import lombok.SneakyThrows;
import org.yaml.snakeyaml.Yaml;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.*;

/**
 * @author Jarod.Kong
 */
public class ExtractStateRedisManager implements IExtractStateManager<ExtractState> {
    private final String groupName;
    private final JedisPool jedisPool;

    @SneakyThrows
    public ExtractStateRedisManager(String groupName) {
        Map<String, Object> config = getJedisConfig();
        String redisUri = Objects.toString(config.get("redis.uri"));
        this.jedisPool = new JedisPool(redisUri);
        this.groupName = groupName;
    }

    private Map<String, Object> getJedisConfig() {
        Yaml yaml = new Yaml();
        @SuppressWarnings("unchecked")
        Map<String, Object> config = yaml.loadAs(ExtractStateRedisManager.class.getClassLoader().getResourceAsStream("jedis-config.yaml"), Map.class);
        return config;
    }

    public static void main(String[] args) {
        ExtractStateRedisManager extractStateRedisManager = new ExtractStateRedisManager("test-group");
        extractStateRedisManager.addState("test", new ExtractState("id", 1, 2));
        ExtractState test = extractStateRedisManager.getState("test");
        System.out.println(test);
    }

    @Override
    public void addState(String key, ExtractState extractState) {
        try (Jedis jedis = jedisPool.getResource()) {
            Map<String, String> each = new HashMap<>();
            each.put(key, JSON.toJSONString(extractState));
            jedis.hmset(groupName, each);
        }
    }

    @Override
    public void removeState(String key) {
        try (Jedis jedis = jedisPool.getResource()) {
            jedis.hdel(groupName, key);
        }
    }

    @Override
    public Map<String, ExtractState> loadAll() {
        Map<String, ExtractState> res = new HashMap<>();
        try (Jedis jedis = jedisPool.getResource()) {
            Set<String> keys = jedis.hkeys(groupName);
            for (String key : keys) {
                res.put(key, getState(key));
            }
        }
        return res;
    }

    @Override
    public ExtractState getState(String key) {
        try (Jedis jedis = jedisPool.getResource()) {
            List<String> hmget = jedis.hmget(groupName, key);
            if (hmget.isEmpty()) {
                return null;
            }
            return JSON.parseObject(hmget.get(0), ExtractState.class);
        }
    }

    @Override
    public void close() {
        jedisPool.close();
    }
}
