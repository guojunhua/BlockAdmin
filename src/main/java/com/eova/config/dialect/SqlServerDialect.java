package com.eova.config.dialect;

import com.jfinal.plugin.activerecord.ModelBuilder;
import com.jfinal.plugin.activerecord.RecordBuilder;

/**
* @Description:TODO
* @author 作者:jzhao
* @createDate 创建时间：2020年5月29日 上午11:22:57
* @version 1.0     
*/
public class SqlServerDialect extends com.jfinal.plugin.activerecord.dialect.SqlServerDialect {
	
	public SqlServerDialect() {
		this.modelBuilder = ModelBuilder.me;
		this.recordBuilder = RecordBuilder.me;
	}
}
