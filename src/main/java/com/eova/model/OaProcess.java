package com.eova.model;

import com.eova.common.base.BaseModel;

/**
* @Description:工作流主表
* @author 作者:jzhao
* @createDate 创建时间：2020年5月7日 下午5:55:37
* @version 1.0     
*/
public class OaProcess extends BaseModel<OaProcess> {
	public static final OaProcess dao = new OaProcess();
	
	
	public OaProcess getTheOaProcess(String objectCode,Number rowId) {
		
		OaProcess process = this.findFirstByCache(this.getClass().getSimpleName()
				, objectCode+"_"+rowId.toString()
				, "select * from bb_oa_process where object_code = ? and object_row_id=? ",objectCode,rowId);
		return process;
	}
	
	
	public OaProcess getTheOaProcessByProcessId(String processId) {
		OaProcess process = this.findFirst("select * from bb_oa_process where process_id = ?  ",processId);
		return process;
	}
}
