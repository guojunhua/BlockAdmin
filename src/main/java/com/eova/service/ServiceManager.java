/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.service;

/**
 * 服务管理中心
 * 
 * @author Jieven
 *
 */
public class ServiceManager {
	/** 权限服务 **/
	public static AuthService auth;
	/** 元服务 **/
	public static MetaService meta;
	/** 7牛云服务 **/
	public static QiniuService qiniuService;
	
	/**ali oss服务**/
	public static AliOssService aliOssService;
	
	/**钉钉OA服务**/
	public static DingDingService dingdingService;
	public static OaService oaService;
	
	/**bb安装服务**/
	
	public static void init() {
		auth = new AuthService();
		meta = new MetaService();
		
		qiniuService = new QiniuService();
		aliOssService = new AliOssService();
		
		dingdingService = new DingDingService();
		oaService = new OaService();
		
	}
}