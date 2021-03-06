/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 * 
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.meta;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Clob;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.eova.common.utils.xx;
import com.eova.config.EovaConfig;
import com.eova.model.MetaField;

/**
 * db types <> java types
 * 
 * @author Jieven
 * 
 */
@SuppressWarnings("rawtypes")
public class MetaDataType {

	/**
	 * 参考：http://dev.mysql.com/doc/connector-j/5.1/en/connector-j-reference-type-conversions.html INT UNSIGNED 这里强制指定为 Integer 因为大部分人不知道应该为Long
	 */
	@SuppressWarnings("serial")
	private final static Map<String, Class> map = new HashMap<String, Class>() {
		{
			// MySQL
			put("BIT", Boolean.class);
			put("TEXT", String.class);

			put("DATE", java.util.Date.class);
			put("DATETIME", DateTime.class);
			put("TIMESTAMP", java.sql.Timestamp.class);
			put("TIME", java.sql.Time.class);

			put("TINYINT", Integer.class);
			put("SMALLINT", Integer.class);
			put("MEDIUMINT", Integer.class);
			put("INT", Integer.class);
			put("BIGINT", Long.class);
			put("SMALLINT UNSIGNED", Integer.class);
			put("MEDIUMINT UNSIGNED", Integer.class);
			// mysql if UNSIGNED Long, because eova the most easy! if the overflow,you should use bigint!
			put("INT UNSIGNED", Integer.class);
			put("BIGINT UNSIGNED", BigInteger.class);
			put("FLOAT", Float.class);
			put("DOUBLE", Double.class);
			put("DECIMAL", BigDecimal.class);

			put("CHAR", String.class);
			put("VARCHAR", String.class);
			put("BINARY", Byte[].class);
			put("VARBINARY", Byte[].class);
			put("TINYBLOB", Byte[].class);
			put("VARCHAR", String.class);
			put("BLOB", Byte[].class);
			put("VARCHAR", String.class);
			put("MEDIUMBLOB", Byte[].class);
			put("VARCHAR", String.class);
			put("LONGBLOB", Byte[].class);
			put("VARCHAR", String.class);

			// Oracle
			put("VARCHAR2", String.class);
			put("LONG", String.class);
			put("NUMBER", BigDecimal.class);
			put("CLOB", Clob.class);

			// PostgreSQL
		}
	};

	public static Class getType(String dataType) {
		return map.get(dataType);
	}
	
	public static Object convert2(MetaField field, Object o) {
		return MetaDataType.convert(field,o,null);
	}
	
	public static Object convert(MetaField field, Object o,String ds) {
		if (o == null) {
			return null;
		}
		String typeName = field.getDataTypeName();
		Integer size = field.getInt("data_size");
		Integer decimal = field.getInt("data_decimal");
		
		//EovaConfig.EOVA_DBTYPE
		
		
		
		Class clazz = getType(typeName);

		// DB类型特殊转换规则
		if (xx.isMysql(ds)) {
			if (typeName.equalsIgnoreCase("TINYINT") && size == 1) {
				clazz = Boolean.class;
			}
		} else if (xx.isOracle(ds)) {
			if (typeName.equalsIgnoreCase("CHAR") && size == 1) {
				clazz = Boolean.class;
			} else if (typeName.equalsIgnoreCase("NUMBER")) {
				if (decimal == 0) {
					if (size <= 10) {
						clazz = Integer.class;
					} else {
						clazz = Long.class;
					}
				} else {
					if (size <= 4) {
						clazz = Float.class;
					} else {
						clazz = Double.class;
					}
				}
			}
		}else if(xx.isMssql(ds)){
			//DATETIME=>TIMESTAMP
			if (typeName.equalsIgnoreCase("DATETIME") ) {
				clazz = Timestamp.class;
			}
		}

//		System.out.print(field.getEn() + " ");
//		System.out.print(o.getClass());
		o = cast(o.toString(), clazz);
//		try {
//			System.out.print("\t" + o.getClass());
//		} catch (Exception e) {
//			System.out.println("\tNull");
//		}
//		System.out.println();
		return o;
	}
	
	private static DateTimeFormatter forPattern = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");

	public static Object cast(String s, Class c) {
		if (s == null) {
			return null;
		}
		s = s.trim();
		if (s.length() == 0 && c != String.class) {
			// empty string only cast to string.class 
			return null;
		}

		if (c == Integer.class) {
			return Integer.parseInt(s);
		}
		if (c == Long.class) {
			return Long.parseLong(s);
		}
		if (c == Float.class) {
			return Float.parseFloat(s);
		}
		if (c == Double.class) {
			return Double.parseDouble(s);
		}
		if (c == Boolean.class) {
			if (xx.isNum(s)) {
				if (s.equals("1")) {
					s = "true";
				} else {
					s= "false";
				}
			}
			return Boolean.parseBoolean(s);
		}
		if (c == BigInteger.class) {
			return BigInteger.valueOf(Long.parseLong(s));
		}
		if (c == BigDecimal.class) {
			return BigDecimal.valueOf(Double.parseDouble(s));
		}
		if (c == Byte[].class) {
			return s.getBytes();
		}
		try {
			if (c == Timestamp.class) {
				
				long time = DateTime.parse(s, forPattern).getMillis();
				return new Timestamp(time);
			}
			if (c == DateTime.class) {
				return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(s);
			}
			if (c == Date.class) {
				return new SimpleDateFormat("yyyy-MM-dd").parse(s.substring(0, 10));
			}
			if (c == Time.class) {
				return new SimpleDateFormat("HH:mm:ss").parse(s.substring(s.indexOf(" ")+1));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return s;
	}
	
	public static void main(String[] args) {
		{
			Object s = cast("2016-10-08 10:20:20", Date.class);
			System.out.println(s);
			System.out.println(s.getClass());
		}
		{
			Object s = cast("2016-10-08 10:20:20", DateTime.class);
			System.out.println(s);
			System.out.println(s.getClass());
		}
		{
			Object s = cast("2016-10-08 10:20:20", Timestamp.class);
			System.out.println(s);
			System.out.println(s.getClass());
		}
	}

}
