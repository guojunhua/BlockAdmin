package com.eova.model;

import java.util.List;

import com.eova.common.base.BaseModel;

/**
* @Description:钉钉渠道配置
* @author 作者:jzhao
* @createDate 创建时间：2020年5月6日 下午8:58:39
* @version 1.0     
*/
public class DdCfg extends BaseModel<DdCfg> {
	public static final DdCfg dao = new DdCfg();
	
	
	public List<DdCfg> queryAllCfgs() {
		return dao.queryByCache("select * from bb_dd_cfg where status=1");
	}
	
	public DdCfg queryTheCfg(Integer org_id) {
		return dao.findFirstByCache(this.getClass().getSimpleName(), "org_id="+org_id, "select * from bb_dd_cfg where status=1 and org_id=? ",org_id);
	}
	

}
