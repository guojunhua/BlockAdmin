package com.jfinal.plugin.activerecord;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;

/**
 * ModelBuilder.
 */
public class ModelBuilder {
	
	public static final ModelBuilder me = new ModelBuilder();
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public <T> List<T> build(ResultSet rs, Class<? extends Model> modelClass) throws SQLException, ReflectiveOperationException {
		List<T> result = new ArrayList<T>();
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		String[] labelNames = new String[columnCount + 1];
		int[] types = new int[columnCount + 1];
		buildLabelNamesAndTypes(rsmd, labelNames, types);
		while (rs.next()) {
			Model<?> ar = modelClass.newInstance();
			Map<String, Object> attrs = ar._getAttrs();
			for (int i=1; i<=columnCount; i++) {
				Object value;
//				if (types[i] < Types.BLOB) {
//					value = rs.getObject(i);
//				} else {
//					if (types[i] == Types.CLOB) {
//						value = handleClob(rs.getClob(i));
//					} else if (types[i] == Types.NCLOB) {
//						value = handleClob(rs.getNClob(i));
//					} else if (types[i] == Types.BLOB) {
//						value = handleBlob(rs.getBlob(i));
//					} else {
//						value = rs.getObject(i);
//					}
//				}
//				
//				attrs.put(labelNames[i], value);
				
				
				
				value = column2java(types,rs,i);

				attrs.put(labelNames[i], value);

			}
			result.add((T)ar);
		}
		return result;
	}
	
	
	/**
	 * 列数据转java对象
	 * @param types
	 * @param rs
	 * @param column
	 * @return
	 * @throws SQLException
	 */
	protected Object column2java(int[] types,ResultSet rs ,int column) throws SQLException{
		Object value;
		
		if(rs.getObject(column) == null){//edit by jzhao，对于INTEGER，BIGINT，FLOAT，DOUBLE 等类型，判断值是否为空，至于是否需要转换成对象待测验
			value = null;
		
		
		}else if (types[column] == Types.INTEGER || types[column] == Types.TINYINT || types[column] == Types.SMALLINT){
			value = rs.getInt(column);
			
		}else if (types[column] == Types.BIGINT)
			value = rs.getLong(column);
		else if (types[column] == Types.FLOAT)
			value = rs.getFloat(column);
		else if (types[column] == Types.DOUBLE)
			value = rs.getDouble(column);
		else if (types[column] == Types.TIMESTAMP || (xx.isOracle() && types[column] == Types.DATE ))
			value = rs.getTimestamp(column);
		else if (types[column] == Types.DATE)
			value = rs.getDate(column);
		else if (types[column] < Types.BLOB)
			value = rs.getObject(column);
		else if (types[column] == Types.CLOB)
			value = ModelBuilder.me.handleClob(rs.getClob(column));
		else if (types[column] == Types.NCLOB)
			value = ModelBuilder.me.handleClob(rs.getNClob(column));
		else if (types[column] == Types.BLOB)
			value = ModelBuilder.me.handleBlob(rs.getBlob(column));
		else
			value = rs.getObject(column);
		
		
		// Oracle强制类型转换
		if (value != null && xx.isOracle()) {
			return DbUtil.convertOracleValue(value, types[column]);
		}
		
		return value;
	}
	
	
	public void buildLabelNamesAndTypes(ResultSetMetaData rsmd, String[] labelNames, int[] types) throws SQLException {
		for (int i=1; i<labelNames.length; i++) {
			labelNames[i] = rsmd.getColumnLabel(i);
			types[i] = rsmd.getColumnType(i);
		}
	}
	
	public byte[] handleBlob(Blob blob) throws SQLException {
		if (blob == null)
			return null;
		
		InputStream is = null;
		try {
			is = blob.getBinaryStream();
			if (is == null)
				return null;
			byte[] data = new byte[(int)blob.length()];		// byte[] data = new byte[is.available()];
			if (data.length == 0)
				return null;
			is.read(data);
			return data;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		finally {
			if (is != null)
				try {is.close();} catch (IOException e) {throw new RuntimeException(e);}
		}
	}
	
	public String handleClob(Clob clob) throws SQLException {
		if (clob == null)
			return null;
		
		Reader reader = null;
		try {
			reader = clob.getCharacterStream();
			if (reader == null)
				return null;
			char[] buffer = new char[(int)clob.length()];
			if (buffer.length == 0)
				return null;
			reader.read(buffer);
			return new String(buffer);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		finally {
			if (reader != null)
				try {reader.close();} catch (IOException e) {throw new RuntimeException(e);}
		}
	}
	
	/* backup before use columnType
	@SuppressWarnings({"rawtypes", "unchecked"})
	static final <T> List<T> build(ResultSet rs, Class<? extends Model> modelClass) throws SQLException, ReflectiveOperationException {
		List<T> result = new ArrayList<T>();
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		String[] labelNames = getLabelNames(rsmd, columnCount);
		while (rs.next()) {
			Model<?> ar = modelClass.newInstance();
			Map<String, Object> attrs = ar.getAttrs();
			for (int i=1; i<=columnCount; i++) {
				Object attrValue = rs.getObject(i);
				attrs.put(labelNames[i], attrValue);
			}
			result.add((T)ar);
		}
		return result;
	}
	
	private static final String[] getLabelNames(ResultSetMetaData rsmd, int columnCount) throws SQLException {
		String[] result = new String[columnCount + 1];
		for (int i=1; i<=columnCount; i++)
			result[i] = rsmd.getColumnLabel(i);
		return result;
	}
	*/
	
	/* backup
	@SuppressWarnings({"rawtypes", "unchecked"})
	static final <T> List<T> build(ResultSet rs, Class<? extends Model> modelClass) throws SQLException, ReflectiveOperationException {
		List<T> result = new ArrayList<T>();
		ResultSetMetaData rsmd = rs.getMetaData();
		List<String> labelNames = getLabelNames(rsmd);
		while (rs.next()) {
			Model<?> ar = modelClass.newInstance();
			Map<String, Object> attrs = ar.getAttrs();
			for (String lableName : labelNames) {
				Object attrValue = rs.getObject(lableName);
				attrs.put(lableName, attrValue);
			}
			result.add((T)ar);
		}
		return result;
	}
	
	private static final List<String> getLabelNames(ResultSetMetaData rsmd) throws SQLException {
		int columCount = rsmd.getColumnCount();
		List<String> result = new ArrayList<String>();
		for (int i=1; i<=columCount; i++) {
			result.add(rsmd.getColumnLabel(i));
		}
		return result;
	}
	*/
}
