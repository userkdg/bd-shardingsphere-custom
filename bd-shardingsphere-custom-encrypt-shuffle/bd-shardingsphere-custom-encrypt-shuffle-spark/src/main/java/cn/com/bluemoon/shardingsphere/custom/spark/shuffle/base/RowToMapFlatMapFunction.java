package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.types.StructType;

import java.util.*;

/**
 * @author Jarod.Kong
 */

public class RowToMapFlatMapFunction implements FlatMapFunction<Iterator<Row>, Map<String, Object>> {

    @Override
    public Iterator<Map<String, Object>> call(Iterator<Row> iterator) {
        List<Map<String, Object>> res = new ArrayList<>();
        while (iterator.hasNext()) {
            Map<String, Object> r = new HashMap<>();
            Row row = iterator.next();
            StructType schema = row.schema();
            String[] fieldNames = schema.fieldNames();
            for (String fieldName : fieldNames) {
                Object fieldVal = row.getAs(fieldName);
                r.put(fieldName, fieldVal);
            }
            res.add(r);
        }
        return res.iterator();
    }
}
