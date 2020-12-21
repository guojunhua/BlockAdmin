package com.eova.config.dialect;

import com.jfinal.plugin.activerecord.ModelBuilder;
import com.jfinal.plugin.activerecord.RecordBuilder;

/**
* @Description:TODO
* @author 作者:jzhao
* @createDate 创建时间：2020年5月29日 上午11:23:29
* @version 1.0     
*/
public class AnsiSqlDialect extends com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect {
	public AnsiSqlDialect() {
		this.modelBuilder = ModelBuilder.me;
		this.recordBuilder = RecordBuilder.me;
	}
}
