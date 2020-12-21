package com.oss.test;

import static com.eova.oa.config.URLConstant.URL_GET_TOKKEN;

import java.util.ArrayList;
import java.util.List;


import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.request.OapiDepartmentListIdsRequest;
import com.dingtalk.api.request.OapiDepartmentListRequest;
import com.dingtalk.api.request.OapiGettokenRequest;
import com.dingtalk.api.request.OapiProcessinstanceCreateRequest;
import com.dingtalk.api.request.OapiRoleListRequest;
import com.dingtalk.api.request.OapiUserGetRequest;
import com.dingtalk.api.request.OapiUserSimplelistRequest;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiGettokenResponse;
import com.dingtalk.api.response.OapiProcessinstanceCreateResponse;
import com.dingtalk.api.response.OapiRoleListResponse;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.dingtalk.api.response.OapiUserSimplelistResponse;
import com.eova.common.utils.util.JacksonUtil;
import com.eova.oa.config.Constant;
import com.eova.oa.util.AccessTokenUtil;
import com.taobao.api.ApiException;

import com.dingtalk.api.request.OapiProcessinstanceCreateRequest.FormComponentValueVo;

/**
* @Description:TODO
* @author 作者:Administrator
* @createDate 创建时间：2020年5月5日 下午8:34:41
* @version 1.0     
*/
public class DingDingTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		

		
		testAccessToken();
		
//		testDepartment();
//		
//		testDepartmentUserSimple();
//		
//		testUserInfo();
//		
//		testRoles();
//		
//		testProcessCreate();
	}
	
	public static void  testAccessToken() throws ApiException{
		
		DefaultDingTalkClient client = new DefaultDingTalkClient(URL_GET_TOKKEN);
        OapiGettokenRequest request = new OapiGettokenRequest();

        request.setAppkey( Constant.APPKEY );//Constant.APPKEY)
        request.setAppsecret( Constant.APPSECRET);//Constant.APPSECRET
        request.setHttpMethod("GET");
        OapiGettokenResponse response = client.execute(request);
        String accessToken = response.getAccessToken();
        
		
		System.out.println("AccessToken:"+accessToken);
	}
	
//	
//	public static void testDepartment() throws ApiException{
//		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_DEPARTMENT_LIST_GET);
//		
//		OapiDepartmentListRequest request = new OapiDepartmentListRequest();
//		request.setFetchChild(true);
//		
//		OapiDepartmentListResponse response = client.execute(request, AccessTokenUtil.getToken());
//	
//		System.out.println(JacksonUtil.bean2Json(response.getDepartment()));
//	}
//	
//	public static void testDepartmentUserSimple() throws ApiException{
//		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_DEPARTMENT_USERS_GET);
//		
//		OapiUserSimplelistRequest request = new OapiUserSimplelistRequest();
//		request.setDepartmentId(1L);
//		request.setOffset(0L);
//		request.setSize(100L);//目前一页取
//		
//
//		OapiUserSimplelistResponse response = client.execute(request, AccessTokenUtil.getToken());
//	
//		System.out.println(JacksonUtil.bean2Json(response.getUserlist()));
//	}
//	
//	public static void testUserInfo() throws ApiException{
//		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_USER_GET);
//		
//		OapiUserGetRequest request = new OapiUserGetRequest();
//		request.setUserid("manager3361");
//		//request.setHttpMethod("GET");
//		OapiUserGetResponse response = client.execute(request, AccessTokenUtil.getToken());
//		
//		System.out.println(response.getBody());
//		//System.out.println(JacksonUtil.bean2Json(response.getBody()));
//	}
//	
//	
//	public static void testRoles() throws ApiException{
//		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_ROLES_GET);
//		
//		OapiRoleListRequest  request = new OapiRoleListRequest();
//		request.setOffset(0L);
//		request.setSize(200L);//一次性提取
//
//		OapiRoleListResponse response = client.execute(request, AccessTokenUtil.getToken());
//
//		
//		//System.out.println(response.getResult());
//		System.out.println(JacksonUtil.bean2Json(response.getResult()));
//	}
//	
//	//测试一个账 通知的审批(已经可以通)
//	public static void testProcessCreate() throws Exception{
//		ProcessInstanceInputVO processInstance = null; 
//		
//		DefaultDingTalkClient client = new DefaultDingTalkClient(URLConstant.URL_PROCESSINSTANCE_START);
//		OapiProcessinstanceCreateRequest request = new OapiProcessinstanceCreateRequest();
//		request.setProcessCode(Constant.PROCESS_CODE);
//
//		
//		request.setOriginatorUserId("manager3361");
//		request.setDeptId(1L);
//		
//		
//		List<com.dingtalk.api.request.OapiProcessinstanceCreateRequest.FormComponentValueVo> formComponentValues = new ArrayList();
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
//		
//		
//		
//		
//		
//		
//		
//		formComponentValues.add(v1);
//		formComponentValues.add(v2);
//		formComponentValues.add(v3);
//		formComponentValues.add(v4);
//		
//		request.setFormComponentValues(formComponentValues);
//
////		/**
////		 * 如果想复用审批固定流程，使用或签会签的话，可以不传审批人，具体请参考文档： https://open-doc.dingtalk.com/microapp/serverapi2/ebkwx8
////		 * 本次quickstart，演示不传审批人的场景
////		 */
////		request.setApprovers(processInstance.getOriginatorUserId());
////		request.setOriginatorUserId(processInstance.getOriginatorUserId());
////		request.setDeptId(processInstance.getDeptId());
////		request.setCcList(processInstance.getOriginatorUserId());
////		request.setCcPosition("FINISH");
//
//		OapiProcessinstanceCreateResponse response = client.execute(request, AccessTokenUtil.getToken());
//
//		if (response.getErrcode().longValue() != 0) {
//			//return ServiceResult.failure(String.valueOf(response.getErrorCode()), response.getErrmsg());
//			System.err.println(response.getErrmsg());
//		}else
//		
//			System.out.println(response.getErrmsg());
////		return ServiceResult.success(response.getProcessInstanceId());
//	}

}
