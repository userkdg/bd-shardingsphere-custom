package cn.com.bluemoon.shardingsphere.custom.spark.shuffle.base;

import org.apache.spark.sql.types.DataType;
import org.apache.spark.sql.types.DataTypes;

import java.sql.JDBCType;

/**
 * @author Jarod.Kong
 */
public class JDBCMetadataUtils {

    public static JDBCType getFieldJDBCType(DataType dataType) {
        if (dataType == null) {
            return JDBCType.VARCHAR;
        }
        JDBCType fieldType;
        if (DataTypes.StringType.sameType(dataType)) {
            fieldType = JDBCType.VARCHAR;
        } else if (DataTypes.IntegerType.sameType(dataType)) {
            fieldType = JDBCType.INTEGER;
        } else if (DataTypes.DoubleType.sameType(dataType)) {
            fieldType = JDBCType.DOUBLE;
        } else if (DataTypes.FloatType.sameType(dataType)) {
            fieldType = JDBCType.FLOAT;
        } else if (DataTypes.LongType.sameType(dataType)) {
            fieldType = JDBCType.BIGINT;
        } else if (DataTypes.createDecimalType().sameType(dataType)) {
            fieldType = JDBCType.DECIMAL;
        } else if (DataTypes.BinaryType.sameType(dataType)) {
            fieldType = JDBCType.BINARY;
        } else if (DataTypes.BooleanType.sameType(dataType)) {
            fieldType = JDBCType.BOOLEAN;
        } else if (DataTypes.TimestampType.sameType(dataType)) {
            fieldType = JDBCType.TIMESTAMP;
        } else if (DataTypes.DateType.sameType(dataType)) {
            fieldType = JDBCType.DATE;
        } else if (DataTypes.ShortType.sameType(dataType)) {
            fieldType = JDBCType.SMALLINT;
        } else if (DataTypes.ByteType.sameType(dataType)) {
            fieldType = JDBCType.TINYINT;
        } else {
            fieldType = JDBCType.VARCHAR;
        }
        return fieldType;
    }
}
