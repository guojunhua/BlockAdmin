package com.jfinal.plugin.activerecord;

/**
 * Copyright (c) 2011-2016, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


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
 * RecordBuilder.
 */
public class RecordBuilder {
	
	public static final RecordBuilder me = new RecordBuilder();
	
	@SuppressWarnings("unchecked")
	public List<Record> build(Config config, ResultSet rs) throws SQLException {
		List<Record> result = new ArrayList<Record>();
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		String[] labelNames = new String[columnCount + 1];
		int[] types = new int[columnCount + 1];
		buildLabelNamesAndTypes(rsmd, labelNames, types);
		while (rs.next()) {
			Record record = new Record();
			record.setColumnsMap(config.containerFactory.getColumnsMap());
			Map<String, Object> columns = record.getColumns();
			for (int i=1; i<=columnCount; i++) {
				Object value;
//				if (types[i] < Types.BLOB) {
//					value = rs.getObject(i);
//				} else {
//					if (types[i] == Types.CLOB) {
//						value = ModelBuilder.me.handleClob(rs.getClob(i));
//					} else if (types[i] == Types.NCLOB) {
//						value = ModelBuilder.me.handleClob(rs.getNClob(i));
//					} else if (types[i] == Types.BLOB) {
//						value = ModelBuilder.me.handleBlob(rs.getBlob(i));
//					} else {
//						value = rs.getObject(i);
//					}
//				}
//				
//				columns.put(labelNames[i], value);
				
				
			
				value = column2java(types,rs,i);

				columns.put(labelNames[i], value);
				
			}
			result.add(record);
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
		
		
		// Oracle强制类型转换,没法提取到 字段NUMBER(10,2)
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
	
	/* backup before use columnType
	static final List<Record> build(ResultSet rs) throws SQLException {
		List<Record> result = new ArrayList<Record>();
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		String[] labelNames = getLabelNames(rsmd, columnCount);
		while (rs.next()) {
			Record record = new Record();
			Map<String, Object> columns = record.getColumns();
			for (int i=1; i<=columnCount; i++) {
				Object value = rs.getObject(i);
				columns.put(labelNames[i], value);
			}
			result.add(record);
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
	static final List<Record> build(ResultSet rs) throws SQLException {
		List<Record> result = new ArrayList<Record>();
		ResultSetMetaData rsmd = rs.getMetaData();
		List<String> labelNames = getLabelNames(rsmd);
		while (rs.next()) {
			Record record = new Record();
			Map<String, Object> columns = record.getColumns();
			for (String lableName : labelNames) {
				Object value = rs.getObject(lableName);
				columns.put(lableName, value);
			}
			result.add(record);
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

