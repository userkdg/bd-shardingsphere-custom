package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.reencrypt;

import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig.FieldInfo;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig.Tuple2;
import cn.com.bluemoon.shardingsphere.custom.shuffle.base.GlobalConfig.Tuple3;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base.EncryptShuffle;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.decrypt.DecryptShuffleJob;
import cn.com.bluemoon.shardingsphere.custom.spark.shuffle.encrypt.EncryptShuffleJob;
import cn.hutool.core.lang.Assert;
import lombok.Getter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.BeanUtils;

import java.util.LinkedList;
import java.util.List;

/**
 * @author Jarod.Kong
 */
@Slf4j
@Getter
public class ReEncryptShuffleJob implements EncryptShuffle {

    private final DecryptShuffleJob decryptShuffleJob;

    private final EncryptShuffleJob encryptShuffleJob;

    /**
     * 构建A->B->A
     * 不能直接A->A，会导致死循环
     * so:要借用一个中间件字段
     */
    @SneakyThrows
    public ReEncryptShuffleJob(GlobalConfig config) {
        List<Tuple3<FieldInfo>> reShuffleCols = config.getReShuffleCols();
        Assert.isTrue(!reShuffleCols.isEmpty(), "重加密洗数必须不为空");
        List<Tuple2<FieldInfo>> decryptShuffleCols = new LinkedList<>();
        List<Tuple2<FieldInfo>> encryptShuffleCols = new LinkedList<>();
        for (Tuple3<FieldInfo> tuple3 : reShuffleCols) {
            Tuple2<FieldInfo> dTuple2 = new Tuple2<>();
            dTuple2.setT1(tuple3.getT1());
            dTuple2.setT2(tuple3.getT2());
            decryptShuffleCols.add(dTuple2);

            Tuple2<FieldInfo> eTuple2 = new Tuple2<>();
            eTuple2.setT1(tuple3.getT2());
            eTuple2.setT2(tuple3.getT3());
            encryptShuffleCols.add(eTuple2);
        }
        // 解密配置
        config.setShuffleCols(decryptShuffleCols);
        this.decryptShuffleJob = new DecryptShuffleJob(config);
        // 加密配置
        GlobalConfig eConfig = new GlobalConfig();
        BeanUtils.copyProperties(eConfig, config);
        eConfig.setShuffleCols(encryptShuffleCols);
        this.encryptShuffleJob = new EncryptShuffleJob(eConfig);
    }

    @Override
    public void shuffle() {
        log.info("开始spark解密操作");
        decryptShuffleJob.shuffle();
        log.info("完成spark解密操作");
        log.info("开始spark重加密操作");
        encryptShuffleJob.shuffle();
        log.info("完成spark重加密操作");
    }
}
