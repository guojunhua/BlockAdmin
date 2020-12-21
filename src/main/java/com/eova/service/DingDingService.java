package com.eova.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiCallBackRegisterCallBackRequest;
import com.dingtalk.api.request.OapiCallBackUpdateCallBackRequest;
import com.dingtalk.api.request.OapiDepartmentListRequest;
import com.dingtalk.api.request.OapiProcessinstanceCreateRequest;
import com.dingtalk.api.request.OapiRoleListRequest;
import com.dingtalk.api.request.OapiUserGetRequest;
import com.dingtalk.api.request.OapiUserSimplelistRequest;
import com.dingtalk.api.request.OapiProcessinstanceCreateRequest.FormComponentValueVo;
import com.dingtalk.api.response.OapiCallBackRegisterCallBackResponse;
import com.dingtalk.api.response.OapiCallBackUpdateCallBackResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiProcessinstanceCreateResponse;
import com.dingtalk.api.response.OapiRoleListResponse;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.dingtalk.api.response.OapiUserSimplelistResponse;
import com.dingtalk.api.response.OapiRoleListResponse.PageVo;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.eova.common.base.BaseService;
import com.eova.common.utils.xx;
import com.eova.common.utils.util.JacksonUtil;
import com.eova.model.DdCfg;
import com.eova.model.UserInfo;
import com.eova.oa.config.Constant;
import com.eova.oa.config.URLConstant;
import com.eova.oa.util.AccessTokenUtil;
import com.esotericsoftware.minlog.Log;
import com.taobao.api.ApiException;


/**
* @Description:钉钉OA交互接口
* @author 作者:jzhao
* @createDate 创建时间：2020年5月6日 下午8:45:33
* @version 1.0     
*/
public class DingDingService extends BaseService {
	
	
	public DdCfg initDD(DdCfg cfg) {
		String callBackUrl = xx.getConfig("app_domain")+"/oa/ddEventReceive/"+cfg.getNumber("org_id");
		
		boolean force = false;
		if(!callBackUrl.equalsIgnoreCase(cfg.getStr("domain_url")))
			force = true;

		if(cfg.getNumber("is_init").intValue() == 0 
				||(cfg.getNumber("is_init").intValue() == 1 && force)) {
			boolean result = this.registerCallBack( cfg);
			if(result) {
				
				cfg.set("is_init", 1);
				cfg.set("update_time", new Date());
				cfg.set("domain_url", callBackUrl);
				cfg.update();
				cfg.removeAllCache();
				
			}
		}
		return cfg;
	}
	
	
	/**
	 * 获取全部部门
	 * @param cfg
	 * @throws ApiException
	 */
	public List<Department> getAllDepartments(DdCfg cfg) throws ApiException{
		cfg = initDD(cfg);
		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_DEPARTMENT_LIST_GET);
		
		OapiDepartmentListRequest request = new OapiDepartmentListRequest();
		request.setFetchChild(true);
		
		OapiDepartmentListResponse response = client.execute(request, AccessTokenUtil.getToken(cfg));
		
		return  response.getDepartment();
		//System.out.println(JacksonUtil.bean2Json(response.getDepartment()));
	}
	
	/**
	 * 部门下的用户概要信息（（概要只有 userid和name））
	 * @param cfg
	 * @param departId
	 * @throws ApiException
	 */
	public List<Userlist> getDepartmentUserSimples(DdCfg cfg,Long departId) throws ApiException{
		cfg = initDD(cfg);
		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_DEPARTMENT_USERS_GET);
		
		OapiUserSimplelistRequest request = new OapiUserSimplelistRequest();
		request.setDepartmentId(departId);//1L
		request.setOffset(0L);
		request.setSize(100L);//目前一页取
		

		OapiUserSimplelistResponse response = client.execute(request, AccessTokenUtil.getToken(cfg));
		
		return response.getUserlist();
		//System.out.println(JacksonUtil.bean2Json(response.getUserlist()));
	}
	
	/**
	 * 获取用户详情
	 * @param cfg
	 * @param userId
	 * @throws ApiException
	 */
	public OapiUserGetResponse getTheUserInfo(DdCfg cfg,String userId) throws ApiException{
		cfg = initDD(cfg);
		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_USER_GET);
		
		OapiUserGetRequest request = new OapiUserGetRequest();
		request.setUserid(userId);
		//request.setHttpMethod("GET");
		OapiUserGetResponse response = client.execute(request, AccessTokenUtil.getToken(cfg));
		return response;
		//System.out.println(response.getBody());
		//System.out.println(JacksonUtil.bean2Json(response.getBody()));
	}
	
	
	/**
	 * 获取全部角色
	 * @param cfg
	 * @throws ApiException
	 */
	public PageVo getRoles(DdCfg cfg) throws ApiException{
		cfg = initDD(cfg);
		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_ROLES_GET);
		
		OapiRoleListRequest  request = new OapiRoleListRequest();
		request.setOffset(0L);
		request.setSize(200L);//一次性提取

		OapiRoleListResponse response = client.execute(request, AccessTokenUtil.getToken(cfg));

		return response.getResult();
		//System.out.println(response.getResult());
		//System.out.println(JacksonUtil.bean2Json(response.getResult()));
	}
	
	//测试一个账 通知的审批(已经可以通)
	/**
	 * 发起一个审批（审批号目前写死）,为空则未能创建成功
	 * @param cfg
	 * @param userId
	 * @throws Exception
	 */
	public OapiProcessinstanceCreateResponse processCreate(DdCfg cfg,String thirdUserId,Long thirdDepId,List<FormComponentValueVo> values) throws ApiException{
		cfg = initDD(cfg);
		
		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_PROCESSINSTANCE_START);
		OapiProcessinstanceCreateRequest request = new OapiProcessinstanceCreateRequest();
		request.setProcessCode(Constant.PROCESS_CODE);

		
		request.setOriginatorUserId(thirdUserId);
		request.setDeptId(thirdDepId);
		
		
//		List<com.dingtalk.api.request.OapiProcessinstanceCreateRequest.FormComponentValueVo> formComponentValues = new ArrayList();
		
//		values.forEach((key, value) -> {
//		    System.out.println(key + "：" + value);
//		    
//		    FormComponentValueVo v = new FormComponentValueVo();
//		    v.setName(key);
//		    v.setValue(value);
//		});
//		
//		FormComponentValueVo v1 = new FormComponentValueVo();
//		v1.setName("标题");
//		v1.setValue("一个对外通知");
//		
//		FormComponentValueVo v2 = new FormComponentValueVo();
//		v2.setName("多行输入框");
//		v2.setValue("通知内容。。。（很多多）");
//		
//		FormComponentValueVo v3 = new FormComponentValueVo();
//		v3.setName("发布区域");
//		v3.setValue("对外");
//		
//		FormComponentValueVo v4 = new FormComponentValueVo();
//		v4.setName("详情");
//		v4.setValue("[查看详情](dingtalk://dingtalkclient/page/link?pc_slide=true&url=http://www.baidu.com)");
		
		
		
		
		
		
		
//		formComponentValues.add(v1);
//		formComponentValues.add(v2);
//		formComponentValues.add(v3);
//		formComponentValues.add(v4);
		
		request.setFormComponentValues(values);

//		/**
//		 * 如果想复用审批固定流程，使用或签会签的话，可以不传审批人，具体请参考文档： https://open-doc.dingtalk.com/microapp/serverapi2/ebkwx8
//		 * 本次quickstart，演示不传审批人的场景
//		 */
//		request.setApprovers(processInstance.getOriginatorUserId());
//		request.setOriginatorUserId(processInstance.getOriginatorUserId());
//		request.setDeptId(processInstance.getDeptId());
//		request.setCcList(processInstance.getOriginatorUserId());
//		request.setCcPosition("FINISH");

		OapiProcessinstanceCreateResponse response = client.execute(request, AccessTokenUtil.getToken(cfg));

		return response;
//		if (response.getErrcode().longValue() != 0) {
//			
//			//return ServiceResult.failure(String.valueOf(response.getErrorCode()), response.getErrmsg());
//			//System.err.println(response.getErrmsg());
//			return response.getProcessInstanceId();
//		}else {
//			Log.error("发起审批失败："+response.getErrmsg());
//		}
//		
//		return null;
	}
	
	
	/**
	 * 目前只注册 流程相关事件
	 * bpms_task_change-审批任务开始，结束，转交
	 * bpms_instance_change-审批实例开始，结束
	 * @param cfg
	 * @throws ApiException
	 */
	public  boolean registerCallBack(DdCfg cfg) {
		DingTalkClient client = new DefaultDingTalkClient(URLConstant.REGISTER_CALLBACK);
		OapiCallBackRegisterCallBackRequest request = new OapiCallBackRegisterCallBackRequest();
		
		String callBackUrl = xx.getConfig("app_domain")+"/oa/ddEventReceive/"+cfg.getNumber("org_id");
		
		request.setUrl(callBackUrl);
		request.setAesKey(Constant.ENCODING_AES_KEY);
		request.setToken(Constant.TOKEN);
		//request.setCallBackTag(Arrays.asList("user_add_org", "user_modify_org", "user_leave_org"));
		request.setCallBackTag(Arrays.asList("bpms_task_change", "bpms_instance_change"));
		try {
			OapiCallBackRegisterCallBackResponse response = client.execute(request,AccessTokenUtil.getToken(cfg));
			
			boolean result = response.isSuccess();
			if(!result) {
				Log.error("审批事件注册失败："+response.getErrmsg());
				
				//尝试更新此
				result = updateCallBack(cfg);
			}
			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.error("审批事件注册失败(通讯失败)："+e.getMessage());
		
			return false;
		}
	}
	
	public boolean updateCallBack(DdCfg cfg){
		DingTalkClient  client = new DefaultDingTalkClient(URLConstant.UPDATE_CALLBACK);
		OapiCallBackUpdateCallBackRequest request = new OapiCallBackUpdateCallBackRequest();
		String callBackUrl = xx.getConfig("app_domain")+"/oa/ddEventReceive/"+cfg.getNumber("org_id");
		request.setUrl(callBackUrl);
		request.setAesKey(Constant.ENCODING_AES_KEY);
		request.setToken(Constant.TOKEN);
		request.setCallBackTag(Arrays.asList("bpms_task_change", "bpms_instance_change"));
		try {
			OapiCallBackUpdateCallBackResponse response = client.execute(request,AccessTokenUtil.getToken(cfg));
			if(!response.isSuccess()) {
				Log.error("审批事件更新失败："+response.getErrmsg());
				
				
			}
			return response.isSuccess();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.error("审批事件更新失败(通讯失败)："+e.getMessage());
		
			return false;
		}

	}
}
