/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.config;

import java.io.File;

import com.eova.common.utils.xx;
import com.jfinal.kit.PathKit;

/**
 * 系统配置
 *
 * @author Jieven
 * @date 2014-5-15
 */
public class EovaConst {
	/** 默认 数据源名称 **/
	public static final String DS_MAIN = "main";
	/** EOVA 数据源名称 **/
	public static final String DS_EOVA = "eova";
	/** Oracle 默认Sequence前缀，SEQ_+tablename **/
	public static final String SEQ_ = "SEQ_";

	/** 登录用户标识 **/
	public static final String USER = "user";

	/** Cache Key 所有菜单信息 **/
	public static final String ALL_MENU = "all_menu";
	
	
	/**
	 * PAGE_TYPE form提交的类型：add/update/detail/examine 等等
	 */
	public static final String PAGE_TYPE = "PAGE_TYPE";
	
	/**
	 * table新增/更新 时间配置字段
	 */
	public static final String TABLE_CREATE_TIME = "table_create_time";
	public static final String TABLE_UPDATE_TIME = "table_update_time";
	
	/** 默认超级管理员角色(创建菜单自动给角色授权) **/
	public static final int ADMIN_RID = xx.getConfigInt("admin_rid", 1);

	/** 项目根目录 **/
	public static final String DIR_PROJECT = new File(PathKit.getWebRootPath()).getParentFile().getParentFile().getParentFile().getPath() + File.separator;
	/** WebApp 根目录 **/
	public static final String DIR_WEB = PathKit.getWebRootPath() + File.separator;

	/** 插件目录 **/
	public static final String DIR_PLUGINS = PathKit.getWebRootPath() + File.separator + "plugins" + File.separator;

	/** Eova插件包URL **/
	public static final String PLUGINS_URL = "http://7xign9.com1.z0.glb.clouddn.com/eova_plugins.zip";

	/** 上传图片大小上限（K） **/
	public static final int UPLOAD_IMG_SIZE = xx.getConfigInt("UPLOAD_IMG_MAX",5120);//
	/** 上传文件大小上限（K） **/
	public static final int UPLOAD_FILE_SIZE = xx.getConfigInt("UPLOAD_FILE_MAX",5120);//
	
	/** excel导出模板路径 **/
	public static final String XLS_TEMPLATE_BATH_PATH = PathKit.getRootClassPath() + File.separator + xx.getConfig("XLS_TEMPLATE_BATH_PATH","xls") + File.separator;
	/** excel导出默认模板 **/
	public static final String XLS_TEMPLATE_DEFAULT = xx.getConfig("UPLOAD_FILE_MAX","general.html");
	
	/** redis session cache name **/
	public static final String SESSION_CACHE_NAME =  "bbSessionCache";
	
	/** 错误信息key 如500错误 **/
	public static final String BB_ERROR_KEY = "BB_ERROR";
	
	/** 表单数据送审标识，如果存在为1，即为需要送审 **/
	public static final String BB_PROCESS_APPROVAL = "BB_PROCESS_APPROVAL";
	
	/** 默认表单提示位置 1（or 空）则为内置 **/
	public static final int BB_FORM_TIPS_IN = xx.getConfigInt("form_tips_in",1);
	
	/**
	 * 初始的地址path
	 */
	public static final String INIT_PATH = "/initStepOne";
}