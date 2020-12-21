package com.eova.oa.config;

public class URLConstant {
    /**
     * 钉钉网关gettoken地址
     */
    public static final String URL_GET_TOKKEN = "https://oapi.dingtalk.com/gettoken";

    /**
     *获取用户在企业内userId的接口URL（不知道干嘛的）
     */
    public static final String URL_GET_USER_INFO = "https://oapi.dingtalk.com/user/getuserinfo";

    /**
     *获取用户详情 的接口url
     */
    public static final String URL_USER_GET = "https://oapi.dingtalk.com/user/get";

    /**
     * 发起审批实例的接口url
     */
    public static final String URL_PROCESSINSTANCE_START = "https://oapi.dingtalk.com/topapi/processinstance/create";

    /**
     * 获取审批实例的接口url
     */
    public static final String URL_PROCESSINSTANCE_GET = "https://oapi.dingtalk.com/topapi/processinstance/get";

    /**
     * 发送企业通知消息的接口url
     */
    public static final String MESSAGE_ASYNCSEND = "https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2";

    /**
     * 删除企业回调接口url
     */
    public static final String DELETE_CALLBACK = "https://oapi.dingtalk.com/call_back/delete_call_back";

    /**
     * 注册企业回调接口url
     */
    public static final String REGISTER_CALLBACK = "https://oapi.dingtalk.com/call_back/register_call_back";
    /**
     * 更新企业回调接口url
     */
    public static final String UPDATE_CALLBACK = "https://oapi.dingtalk.com/call_back/update_call_back";

    /**
     * 获取部门列表url(全部部门)
     */
    public static final String URL_DEPARTMENT_LIST_GET = "https://oapi.dingtalk.com/department/list";
    
    /**
     * 获取部门用户列表（概要只有 userid和name）
     */
    public static final String URL_DEPARTMENT_USERS_GET = "https://oapi.dingtalk.com/user/simplelist";

    /**
     * 获取全部角色（是分页的）
     */
    public static final String URL_ROLES_GET = "https://oapi.dingtalk.com/topapi/role/list";
 
   

}
