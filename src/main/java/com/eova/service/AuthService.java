/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.eova.common.base.BaseCache;
import com.eova.common.base.BaseService;
import com.eova.common.utils.xx;
import com.eova.common.utils.data.CloneUtil;
import com.eova.common.utils.db.DbUtil;
import com.eova.config.EovaConst;
import com.eova.model.Menu;
import com.eova.widget.WidgetUtil;
import com.jfinal.plugin.activerecord.Db;

/**
 * 权限数据访问
 * 
 * @author Jieven
 * 
 */
public class AuthService extends BaseService {

	/**
	 * 根据角色ID获取已授权查询的菜单Code
	 * 
	 * @param rid 角色ID
	 * @return
	 */
	public List<String> queryMenuCodeByRid(List<String> rids) {
		String sql = "select DISTINCT(b.menu_code) from eova_role_btn rf LEFT JOIN eova_button b on rf.bid = b.id where b.ui = 'query' and rf.rid in"+DbUtil.joinIds(rids);
		return Db.use(xx.DS_EOVA).query(sql);
	}

	/**
	 * 查询某棵树下是否存在已授权的功能
	 * 
	 * @param parentId 父节点ID 
	 * @param rid　角色ID
	 * @return
	 */
//	public boolean isExistsAuthByPidRid(int parentId, int rid) {
//		// 根据角色ID获取已授权查询的菜单Code
//		List<String> menuCodes = queryMenuCodeByRid(rid);
//		LinkedHashMap<Integer, Menu> result = (LinkedHashMap<Integer, Menu>) getByParentId(parentId);
//		for (String menuCode : menuCodes) {
//			for (Map.Entry<Integer, Menu> map : result.entrySet()) {
//				if (map.getValue().getStr("code").equals(menuCode)) {
//					return true;
//				}
//			}
//		}
//		return false;
//	}

	/**
	 * 递归获取所有父子数据
	 * 
	 * @param parentId 父节点ID
	 * @return List
	 */
	public List<Menu> queryMenuByParentId(int parentId) {
		LinkedHashMap<Integer, Menu> result = (LinkedHashMap<Integer, Menu>) getByParentId(parentId);
		List<Menu> menus = new ArrayList<Menu>();
		for (Map.Entry<Integer, Menu> map : result.entrySet()) {
			menus.add(map.getValue());
		}
		return menus;
	}

	/**
	 * 递归获取所有父子数据
	 * @param parentId 父节点
	 * @return Map
	 */
	@SuppressWarnings("unchecked")
	public Map<Integer, Menu> getByParentId(int parentId) {
		LinkedHashMap<Integer, Menu> temp = null;


		// 获取所有菜单信息
		String sql = "select * from eova_menu where is_hide = 0 order by parent_id,order_num";
		List<Menu> records = Menu.dao.queryByCache(sql);

			

			temp = WidgetUtil.menusToLinkedMap(records);

	
			
		

		// 获取某节点下所有数据
		LinkedHashMap<Integer, Menu> result = new LinkedHashMap<Integer, Menu>();
		// 递归获取子节点
		getChildren(temp, parentId, result);

		return CloneUtil.clone(result);
	}


	/**
	 * 递归查找子节点
	 * 
	 * @param all 所有菜单
	 * @param parentId 父节点ID
	 * @param result 节点下所有数据(包括父)
	 */
	private void getChildren(Map<Integer, Menu> all, int parentId, Map<Integer, Menu> result) {
		for (Map.Entry<Integer, Menu> map : all.entrySet()) {
			// 获取父节点
			if (map.getKey() == parentId) {
				result.put(map.getKey(), map.getValue());
			}
			// 获取子节点
			if (map.getValue().getInt("parent_id") == parentId) {
				result.put(map.getKey(), map.getValue());
				// 子ID递归找孙节点
				getChildren(all, map.getKey(), result);
			}
		}
	}
}