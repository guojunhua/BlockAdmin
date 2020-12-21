package com.eova.config.dialect;

import com.jfinal.plugin.activerecord.ModelBuilder;
import com.jfinal.plugin.activerecord.RecordBuilder;
import com.jfinal.plugin.activerecord.builder.TimestampProcessedModelBuilder;
import com.jfinal.plugin.activerecord.builder.TimestampProcessedRecordBuilder;

/**
* @Description:TODO
* @author 作者:jzhao
* @createDate 创建时间：2020年5月29日 上午11:20:05
* @version 1.0     
*/
public class OracleDialect extends com.jfinal.plugin.activerecord.dialect.OracleDialect {
	
	public OracleDialect() {
		this.modelBuilder = ModelBuilder.me;
		this.recordBuilder = RecordBuilder.me;
	}
}
