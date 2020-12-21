/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

import java.io.File;
import java.util.List;

import com.eova.common.base.BaseModel;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;

/**
 * 功能按钮
 *
 * @author Jieven
 * @date 2014-9-10
 */
public class Button extends BaseModel<Button> {

	private static final long serialVersionUID = 3481288366186459644L;

	/** 基本通用功能-查询 **/
	public static final int FUN_QUERY = 1;
	public static final int FUN_QUERY_INDEX = 1;
	public static final String FUN_QUERY_NAME = "查询";
	public static final String FUN_QUERY_UI = "query";
	public static final String FUN_QUERY_BS = "/grid/query";
	/** 基本通用功能-新增 **/
	public static final int FUN_ADD = 2;
	public static final int FUN_ADD_INDEX = 2;
	public static final String FUN_ADD_NAME = "新增";
	public static final String FUN_ADD_UI = "/eova/widget/form/btn/add.html";
	public static final String FUN_ADD_BS = "/form/add";
	/** 基本通用功能-修改 **/
	public static final int FUN_UPDATE = 3;
	public static final int FUN_UPDATE_INDEX = 3;
	public static final String FUN_UPDATE_NAME = "修改";
	public static final String FUN_UPDATE_UI = "/eova/widget/form/btn/update.html";
	public static final String FUN_UPDATE_BS = "/form/update";
	/** 基本通用功能-删除 **/
	public static final int FUN_DELETE = 4;
	public static final int FUN_DELETE_INDEX = 4;
	public static final String FUN_DELETE_NAME = "删除";
	public static final String FUN_DELETE_UI = "/eova/widget/form/btn/delete.html";
	public static final String FUN_DELETE_BS = "/grid/delete";
	/** 基本通用功能-查看 **/
	public static final int FUN_DETAIL = 5;
	public static final int FUN_DETAIL_INDEX = 5;
	public static final String FUN_DETAIL_NAME = "查看";
	public static final String FUN_DETAIL_UI = "/eova/widget/form/btn/detail.html";
	public static final String FUN_DETAIL_BS = "/form/detail";
	
	
	/** 基本通用功能-送审 **/
	public static final int FUN_APPROVAL = 6;
	public static final int FUN_APPROVAL_INDEX = 6;
	public static final String APPROVAL = "送审";
	public static final String FUN_APPROVAL_UI = "/eova/widget/form/btn/approval.html";
	public static final String FUN_APPROVAL_BS = "/form/approval";
	
	/** 单表模版功能-导入 **/
	public static final int FUN_IMPORT = 6;
	public static final int FUN_IMPORT_INDEX = 6;
	public static final String FUN_IMPORT_NAME = "导入";
	public static final String FUN_IMPORT_UI = "/eova/template/single/btn/import.html";
	public static final String FUN_IMPORT_BS = "/single_grid/import";
	
	

	/** 单表树模版功能-新增 **/
	public static final int SINGLETREE_ADD = 7;
	public static final int SINGLETREE_ADD_INDEX = 2;
	public static final String SINGLETREE_ADD_NAME = "新增";
	public static final String SINGLETREE_ADD_UI = "/eova/template/singletree/btn/add.html";
	public static final String SINGLETREE_ADD_BS = "/form/import";
	/** 单表树模版功能-新增 **/
	public static final int SINGLETREE_UPDATE = 8;
	public static final int SINGLETREE_UPDATE_INDEX = 3;
	public static final String SINGLETREE_UPDATE_NAME = "修改";
	public static final String SINGLETREE_UPDATE_UI = "/eova/template/singletree/btn/update.html";
	public static final String SINGLETREE_UPDATE_BS = "/form/import";

	public static final Button dao = new Button();

	public Button() {
	}
	
	public Button(String name, String ui, boolean isHide) {
		this.set("name", name);
		this.set("ui", ui);
		this.set("order_num", 0);
		this.set("group_num", 0);
		this.set("is_base", true);
		this.set("is_hide", isHide);
	}

	public Button(String menuCode, int type) {
		String ui = null;
		String bs = null;
		String name = null;
		int index = 0;

		switch (type) {
		case FUN_QUERY:
			ui = FUN_QUERY_UI;
			bs = FUN_QUERY_BS;
			name = FUN_QUERY_NAME;
			index = FUN_QUERY_INDEX;
			break;
		case FUN_ADD:
			ui = FUN_ADD_UI;
			bs = FUN_ADD_BS;
			name = FUN_ADD_NAME;
			index = FUN_ADD_INDEX;
			break;
		case FUN_UPDATE:
			ui = FUN_UPDATE_UI;
			bs = FUN_UPDATE_BS;
			name = FUN_UPDATE_NAME;
			index = FUN_UPDATE_INDEX;
			break;
		case FUN_DELETE:
			ui = FUN_DELETE_UI;
			bs = FUN_DELETE_BS;
			name = FUN_DELETE_NAME;
			index = FUN_DELETE_INDEX;
			break;
		case FUN_DETAIL:
			ui = FUN_DETAIL_UI;
			bs = FUN_DETAIL_BS;
			name = FUN_DETAIL_NAME;
			index = FUN_DETAIL_INDEX;
			break;
		case FUN_IMPORT:
			ui = FUN_IMPORT_UI;
			bs = FUN_IMPORT_BS;
			name = FUN_IMPORT_NAME;
			index = FUN_IMPORT_INDEX;
			break;
		case SINGLETREE_ADD:
			ui = SINGLETREE_ADD_UI;
			bs = SINGLETREE_ADD_BS;
			name = SINGLETREE_ADD_NAME;
			index = SINGLETREE_ADD_INDEX;
			break;
		case SINGLETREE_UPDATE:
			ui = SINGLETREE_UPDATE_UI;
			bs = SINGLETREE_UPDATE_BS;
			name = SINGLETREE_UPDATE_NAME;
			index = SINGLETREE_UPDATE_INDEX;
			break;
		}
		this.set("menu_code", menuCode);
		this.set("name", name);
		this.set("ui", ui);
		this.set("bs", bs);
		this.set("order_num", index);
		this.set("is_base", true);
		this.set("group_num", 0);
	}

	/**
	 * 根据权限获取非查询功能按钮
	 *
	 * @param menuCode
	 * @param rid
	 * @return
	 */
	public List<Button> queryByMenuCode(String menuCode, User user) {
		// 为了同时兼容Mysql和Oracle的写法
		
		return dao.queryByCache("select * from eova_button where is_hide <> 1 and menu_code = ? and ui <> ? and id in (select bid from eova_role_btn where rid in"+DbUtil.joinIds(user.getRids())+") order by order_num",
				menuCode, FUN_QUERY_UI);
	}
	

	/**
	 * 根据当前的模板设置 后缀文件（例外：如果已经添加了如 xx_h.html）
	 * @param menuCode
	 * @param user
	 * @param c
	 * @return
	 */
	public List<Button> queryByMenuCode(String menuCode, User user,Controller c) {
		List<Button> buttons = queryByMenuCode(menuCode,user);
		String currentTemplate =xx.getCurrentTemplate(c);
		if(xx.isEmpty(currentTemplate))
			return buttons;
		for(Button b:buttons) {
			String ui = b.getStr("ui");
			if(!xx.isEmpty(ui) ) {
				File file = new File(ui);
				String name = file.getName();
				if(name.indexOf("_")  != -1) {
					continue;
				}
				ui = xx.viewReal(ui, currentTemplate);
				b.set("ui", ui);	
			}
			
		}
		return buttons;
	}
	 

	/**
	 * 是否存在功能按钮
	 *
	 * @param menuCode 菜单编码
	 * @param bs 服务端
	 * @return 是否存在该按钮
	 */
	public boolean isExistButton(String menuCode, String bs, int groupNum) {
//		String sql = "select count(*) from eova_button where menu_code = ? and bs = ? and group_num = ?";
//		long count = Db.use(xx.DS_EOVA).queryLong(sql, menuCode, bs, groupNum);
		String sql = "select * from eova_button where menu_code = ? and bs = ? and group_num = ?";
		List<Button> buttons = this.queryByCache(sql, menuCode, bs, groupNum);
		if (buttons.size() != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 删除基础功能按钮(删除不用查询)
	 *
	 * @param menuCode
	 */
	public void deleteFunByMenuCode(String menuCode) {
		String sql = "delete from eova_button where is_base = 1 and ui <> 'query' and menu_code = ?";
		Db.use(xx.DS_EOVA).update(sql, menuCode);
		this.removeAllCache();
	}

	/**
	 * 删除菜单下所有按钮
	 *
	 * @param menuCode
	 */
	public void deleteByMenuCode(String menuCode) {
		String sql = "delete from eova_button where menu_code = ?";
		Db.use(xx.DS_EOVA).update(sql, menuCode);
		this.removeAllCache();
	}

	/**
	 * 获取功能按钮(不包括查询)
	 * @param menuCode 菜单编码
	 * @return
	 */
	public List<Button> findFunByMenuCode(String menuCode){
//		return this.find("select * from eova_button where ui <> 'query' and menu_code = ?", menuCode);
		
		return this.queryByCache("select * from eova_button where ui <> 'query' and menu_code = ?", menuCode);
	}

	/**
	 * 有序按组获取非查询功能按钮
	 * @param menuCode
	 * @return
	 */
	public List<Button> findNoQueryByMenuCode(String menuCode) {
		String sql = "select * from eova_button where ui <> 'query' and menu_code = ? order by group_num, order_num";
		return this.queryByCache(sql, menuCode);
	}

	/**
	 * 查询按钮当前最大排序值
	 * @param menuCode 菜单编码
	 * @param groupNum 按钮分组号
	 * @return
	 */
	public int getMaxOrderNum(String menuCode, int groupNum) {
		//String sql = "select max(order_num) from eova_button where menu_code = ? and group_num = ?";
		//return Db.use(xx.DS_EOVA).queryNumber(sql, menuCode, groupNum).intValue();
		String sql = "select * from eova_button where menu_code = ? and group_num = ? order by order_num desc ";
		Button lastButton = this.queryFisrtByCache(sql, menuCode, groupNum);
		if(lastButton != null) {
			return lastButton.getInt("order_num");
		}else
			return 1;
	}

	

//	public List<Integer> queryMenuIdByRid1(int rid) {
//		// 已授权菜单的父节点
//		String pidSql = "select DISTINCT(parent_id) from eova_menu where code in ( select b.menu_code from eova_role_btn rf left join eova_button b on rf.bid = b.id where b.ui = 'query' and rf.rid = ? )";
//		return Db.use(xx.DS_EOVA).query(pidSql, rid);
//	}
	
	public List<Button> roleButtons(List<String> rids) {
		String sql = "SELECT b.* FROM eova_role_btn rf LEFT JOIN eova_button b ON rf.bid = b.id WHERE rf.rid in "+DbUtil.joinIds(rids);
		List<Button> bts = this.queryByCache(sql);
		return bts;
	}
	
	public static void main(String[] args) {
		Button b = new Button();
		b.removeAllCache(null);
	}
	
}