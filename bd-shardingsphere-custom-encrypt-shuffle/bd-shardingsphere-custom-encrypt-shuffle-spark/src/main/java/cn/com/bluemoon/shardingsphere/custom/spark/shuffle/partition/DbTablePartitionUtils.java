package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.partition;

import com.google.common.collect.ImmutableList;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import static cn.com.bluemoon.shardingsphere.custom.spark.shuffle.extract.BaseSparkDbExtract.JDBC_PARTITION_FIELD_ID;

/**
 * 各类数据库大表，分区字段自定义
 * 待优化，需要打包部署支持，不通用
 *
 * @author Jarod.Kong
 */
public class DbTablePartitionUtils {

    /**
     * 分区数、生产大表（100w以上）中可以调大点，如：ec_oms_order 给10000，表现不错
     * 本地调试建议调小eg:50
     *
     */
    public static final String EC_ORDER_CODE_PARTITION = System.getProperty("ec.order.code.partition", "5000");

    /**
     * 密集数据起点
     */
    public static final String EC_ORDER_CODE_START_VALUE = System.getProperty("ec.order.code.start.value", "1020190000000000000000000");

    /**
     * 密集数据终点
     */
    public static final String EC_ORDER_CODE_END_VALUE = System.getProperty("ec.order.code.end.value", "1021190030000000000000000");

    private static final ConcurrentHashMap<String, List<TablePartition>> dbNameAndTablePartitions = new ConcurrentHashMap<>(16);

    static {
        String[] orderCodePredicate = getOrderCodePredicate(null);

        dbNameAndTablePartitions.put("ec_order", ImmutableList.of(
                new TablePartition("ec_oms_order", orderCodePredicate),
                new TablePartition("ec_oms_plat_order_encrypt_data", orderCodePredicate),
                new TablePartition("ec_oms_plat_order_decrypt_data", orderCodePredicate),
                new TablePartition("ec_oms_plat_tmall_presale_order", getOrderCodePredicate(100)),
                new TablePartition("ec_oms_plat_address_modify_record", getOrderCodePredicate(100))
        ));
        // ... other datasource
    }

    private DbTablePartitionUtils() {
        throw new IllegalArgumentException("static tool");
    }

    public static String[] getPartitions(String dbName, String tableName) {
        if (dbName == null) {
            return null;
        }
        List<TablePartition> tablePartitions = dbNameAndTablePartitions.get(dbName);
        if (tablePartitions != null) {
            return tablePartitions.stream().filter(t -> t.getTableName().equalsIgnoreCase(tableName))
                    .findFirst().map(TablePartition::getPartitions).orElse(null);
        }
        return null;
    }

    private static String[] getOrderCodePredicate(Integer codePartitionNum) {
        List<String> partitions = new ArrayList<>();
        BigDecimal r = new BigDecimal(EC_ORDER_CODE_END_VALUE);
        BigDecimal p = new BigDecimal(EC_ORDER_CODE_START_VALUE);
        BigDecimal sub = r.subtract(p);
        BigDecimal per = sub.divide(codePartitionNum != null && codePartitionNum > 0 ? new BigDecimal(codePartitionNum) : new BigDecimal(EC_ORDER_CODE_PARTITION)); // on proxy ok !!!, 在本地调试可以改小，避免分区过多
        String first = String.format("%s < %s or %s is null ", JDBC_PARTITION_FIELD_ID, p, JDBC_PARTITION_FIELD_ID);
        partitions.add(first);
        BigDecimal pre = p, curr = p;
        while (((curr = pre.add(per))).compareTo(r) < 0) {
            String part = String.format("%s < %s and %s >=%s", JDBC_PARTITION_FIELD_ID, curr.toPlainString(), JDBC_PARTITION_FIELD_ID, pre);
            partitions.add(part);
            pre = curr;
        }
        String part = String.format("%s >=%s", JDBC_PARTITION_FIELD_ID, pre);
        partitions.add(part);
        return partitions.toArray(new String[0]);
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    static class TablePartition implements Serializable {
        private String tableName;
        private String[] partitions;
    }
}
