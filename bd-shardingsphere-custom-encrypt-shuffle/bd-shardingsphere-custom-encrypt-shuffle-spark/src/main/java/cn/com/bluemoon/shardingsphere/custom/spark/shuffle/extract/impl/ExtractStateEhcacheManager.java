package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.impl;

import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.IExtractStateManager;
import org.ehcache.Cache;
import org.ehcache.PersistentCacheManager;
import org.ehcache.config.builders.CacheConfigurationBuilder;
import org.ehcache.config.builders.CacheManagerBuilder;
import org.ehcache.config.builders.ResourcePoolsBuilder;
import org.ehcache.config.units.EntryUnit;
import org.ehcache.config.units.MemoryUnit;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author Jarod.Kong
 */
public class ExtractStateEhcacheManager implements IExtractStateManager<ExtractState> {

    private final Cache<String, ExtractState> cache;

    private final PersistentCacheManager cacheManager;

    public ExtractStateEhcacheManager(String cacheGroup, String childDir) {
        this.cacheManager = CacheManagerBuilder.newCacheManagerBuilder()
                .with(CacheManagerBuilder.persistence(new File(getStoragePath(cacheGroup), childDir)))
                .withCache(cacheGroup,
                        CacheConfigurationBuilder.newCacheConfigurationBuilder(String.class, ExtractState.class,
                                ResourcePoolsBuilder.newResourcePoolsBuilder()
                                        .heap(10, EntryUnit.ENTRIES)
                                        .offheap(1, MemoryUnit.MB)
                                        .disk(20, MemoryUnit.MB, true)
                        )
                ).build(true);
        this.cache = cacheManager.getCache(cacheGroup, String.class, ExtractState.class);
    }

    public static void main(String[] args) {
        ExtractStateEhcacheManager ehcacheManager = new ExtractStateEhcacheManager("ec_order_sandbox-ec_oms_order-2140068698", "ec_oms_order");
//        ehcacheManager.addState("ec_oms_order", new ExtractState());
        System.out.println(ehcacheManager.getState("ec_oms_order"));
        ehcacheManager.close();
    }

    protected File getStoragePath(String cacheGroup) {
        return new File(System.getProperty("java.io.tmpdir") + "/kmsShuffleCache/" + cacheGroup);
    }

    @Override
    public void addState(String key, ExtractState state) {
        cache.put(key, state);
    }

    @Override
    public void removeState(String key) {

    }

    @Override
    public Map<String, ExtractState> loadAll(){
        Iterator<Cache.Entry<String, ExtractState>> iterator = cache.iterator();
        Map<String, ExtractState> res = new HashMap<>();
        while (iterator.hasNext()){
            Cache.Entry<String, ExtractState> each = iterator.next();
            res.put(each.getKey(), each.getValue());
        }
        return res;
    }

    @Override
    public ExtractState getState(String key) {
        return cache.get(key);
    }

    @Override
    public void close() {
        cacheManager.close();
    }
}
