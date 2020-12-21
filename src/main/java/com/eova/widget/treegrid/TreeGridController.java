/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget.treegrid;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.common.Response;
import com.eova.common.utils.xx;
import com.eova.config.EovaConst;
import com.eova.core.menu.config.TreeConfig;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.template.common.util.TemplateUtil;
import com.eova.widget.WidgetManager;
import com.eova.widget.WidgetUtil;
import com.eova.widget.tree.TreeUtil;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * TreeGrid组件
 *
 * @author Jieven
 *
 */
public class TreeGridController extends Controller {

	final Controller ctrl = this;

	/** 元对象业务拦截器 **/
	protected MetaObjectIntercept intercept = null;

	/**
	 * 分页查询
	 *默认返回 treejson
	 *部分treetable控件不需要tree平铺返回即可，目前的  bootstrap-treetable 也是这种模式
	 *现对控件类型做判断：widget=空则老模式，widget=bootstrap-treetable 则list平铺且 Response包裹
	 * @throws Exception
	 */
	public void query() throws Exception {

		String code = getPara(0);
		String menuCode = getPara(1);

		MetaObject object = MetaObject.dao.getByCode(code);
		List<MetaField> fields = MetaField.dao.queryByObjectCode(code);
		Menu menu = null;
		if (!xx.isEmpty(menuCode))
			menu = Menu.dao.findByCode(menuCode);

		String filter = object.getStr("filter");
		// 菜单初始过滤条件优先级高于对象初始过滤条件
		if (menu != null) {
			String menuFilter = menu.getStr("filter");
			if (!xx.isEmpty(menuFilter))
				filter = menuFilter;
		}
		if (!xx.isEmpty(filter)) {
			// 不对超级管理员做数据限制
			User user = (User) this.getSessionAttr(EovaConst.USER);
			if (user.isAdmin()) {
				// filter = null;暂时注释
			}
		}

		TreeConfig treeConfig = menu.getConfig().getTree();

		List<Object> parmList = new ArrayList<Object>();

		// 获取条件
		String where = WidgetManager.getWhere(this, fields, parmList, filter);

		// 获取排序
		String sort = WidgetManager.getSort(this);

		// 分页查询Grid数据
		String view = object.getView();
		String sql = "from " + view + where + sort;

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());

		// 查询前置任务
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl);
			intercept.queryBefore(ac);

			// AOP自定义条件和参数
			if (!xx.isEmpty(ac.condition)) {
				sql = String.format("from %s where %s %s", view, ac.condition, sort);
				parmList = ac.params;
			}
		}

		// 转换SQL参数
		Object[] paras = new Object[parmList.size()];
		parmList.toArray(paras);
		List<Record> list = Db.use(object.getDs()).find("select * " + sql, paras);

		// 有条件时，自动方向查找父节点数据(会找到重复得数据)
		if (!xx.isEmpty(where)) {
			// 向上查找父节点数据
			findParent(treeConfig, object.getDs(), view, list, list);
			//去重
			//
//			Record r = null;
//			r.get(object.getPk());
			//使用map去重
			list = list.stream()
	                .filter(distinctByKey(o -> o.get(object.getPk())))
	                .collect(Collectors.toList());
		}
		
		


		// 查询后置任务
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl, list,object);
			intercept.queryAfter(ac);
		}

		// 备份Value列，然后将值列转换成Key列
		WidgetUtil.copyValueColumn(list, object.getPk(), fields);
		// 根据表达式将数据中的值翻译成汉字
		WidgetManager.convertValueByExp(this,object, fields, list, treeConfig.getIdField(), treeConfig.getParentField());
		
		if("bootstrap-treetable".equalsIgnoreCase(this.getPara("widget"))) {
			
			renderJson(Response.sucData(list));
			
		}else {
			String json = null;
			if (!xx.isEmpty(list)) {
				json = TreeUtil.toTreeJson(list, treeConfig);
			}else
				json = "{}";
	
			renderJson(json);
		}	
	}
	
	   public static <T> Predicate<T> distinctByKey(Function<? super T, Object> keyExtractor) {
	        Map<Object, Boolean> seen = new HashMap<>();
	        System.out.println("这个函数将应用到每一个item");
	        return t -> seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
	    }
	
	
	/**
	 * 向上递归查找父节点数据
	 * 
	 * @param treeConfig 树配置
	 * @param view 数据源表名
	 * @param list 显示结果数据
	 * @param parents 待查找数据
	 */
	private void findParent(TreeConfig treeConfig, String ds, String view, List<Record> list, List<Record> parents) {
		Set<String> pids = new HashSet<>();
		for (Record x : parents) {
			pids.add(x.get(treeConfig.getParentField()).toString());
		}
		if (!xx.isEmpty(pids)) {
			if (pids.size() == 1 && pids.toArray()[0].equals(treeConfig.getRootPid())) {
				// 到根节点停止递归
				return;
			}
			parents = Db.use(ds).find(String.format("select * from %s where %s in (%s)", view, treeConfig.getIdField(), xx.join(pids.toArray(), ',')));
			list.addAll(parents);
			findParent(treeConfig, ds, view, list, parents);
		}
	}

}