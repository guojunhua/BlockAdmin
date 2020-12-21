package com.eova.model;

import java.util.List;

import com.eova.common.base.BaseModel;

/**
* @Description:图表
* @author 作者:jzhao
* @createDate 创建时间：2020年9月6日 下午1:58:20
* @version 1.0     
*/
public class Charts extends BaseModel<Charts>{
	
	public static final Charts dao = new Charts();
	
	public Charts queryByCode(String code) {
		return dao.findFirstByCache(this.getClass().getSimpleName()
				,"queryByCode&code="+code, "select * from bb_charts c where c.code=?", code);
	}
	
	
	public String getDataSql() {
		String sql = this.get("data_sql");
		return sql;
	}
}
