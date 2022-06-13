package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.IExtractStateManager;
import com.alibaba.fastjson.JSON;
import lombok.SneakyThrows;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Jarod.Kong
 */
public class ExtractStateRedisManager implements IExtractStateManager<ExtractState> {
    private final String groupName;
    private final JedisPool jedisPool;

    @SneakyThrows
    public ExtractStateRedisManager(String groupName) {
        this.jedisPool = new JedisPool("redis://:Bg50BuXzAlgo@192.168.63.11:6579");
        this.groupName = groupName;
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
        try (Jedis jedis = jedisPool.getResource()) {
            List<String> hmget = jedis.hmget(groupName);
            return null;
        }
    }

    public static void main(String[] args) {
        ExtractStateRedisManager extractStateRedisManager = new ExtractStateRedisManager("test-group");
        extractStateRedisManager.addState("test", new ExtractState());
        ExtractState test = extractStateRedisManager.getState("test");
        System.out.println(test);
    }

    @Override
    public ExtractState getState(String key) {
        try (Jedis jedis = jedisPool.getResource()) {
            List<String> hmget = jedis.hmget(groupName, key);
            return JSON.parseObject(hmget.get(0), ExtractState.class);
        }
    }

    @Override
    public void close() {
        jedisPool.close();
    }
}
