package com.eova.config.dialect;

import com.jfinal.plugin.activerecord.ModelBuilder;
import com.jfinal.plugin.activerecord.RecordBuilder;

/**
* @Description:TODO
* @author 作者:jzhao
* @createDate 创建时间：2020年5月29日 上午11:22:16
* @version 1.0     
*/
public class PostgreSqlDialect extends com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect {
	
	public PostgreSqlDialect() {
		this.modelBuilder = ModelBuilder.me;
		this.recordBuilder = RecordBuilder.me;
	}
}
