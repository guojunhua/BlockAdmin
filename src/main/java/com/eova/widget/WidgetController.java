/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Optional;

import com.alibaba.fastjson.JSONObject;
import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.common.Response;
import com.eova.common.base.BaseCache;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.config.EovaConfig;
import com.eova.config.EovaConst;
import com.eova.config.PageConst;
import com.eova.engine.DynamicParse;
import com.eova.engine.EovaExp;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaFieldConfig;
import com.eova.model.MetaObject;
import com.eova.model.OaProcess;
import com.eova.model.OaProcessTask;
import com.eova.model.User;
import com.eova.model.UserInfo;
import com.eova.service.sm;
import com.eova.template.common.util.TemplateUtil;
import com.jfinal.core.Controller;
import com.jfinal.core.NotAction;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * EOVA 控件
 *
 * @author Jieven
 *
 */
public class WidgetController extends Controller {

	/**
	 * 查找Dialog
	 */
	public void toFind() {
		
		
		xx.render(this,"/eova/widget/find/find.html");
		
	}

	/**
	 * 查找框Dialog
	 */
	public void find() {

		List<Object> parmList = new ArrayList<Object>();

		String url = "/widget/findJson?";

		String exp = getPara("exp");
		String code = getPara("code");
		String field = getPara("field");
		boolean isMultiple = getParaToBoolean("multiple", false);
		// 自定义表达式
		if (xx.isEmpty(exp)) {
			// 根据表达式获取ei
			MetaField ei = MetaField.dao.getByObjectCodeAndEn(code, field);
			exp = ei.getStr("exp");
			url += "code=" + code + "&field=" + field;
		} else {
			url += "exp=" + exp;
			// 预处理表达式
			try {
				String[] strs = exp.split(",");
				if (strs.length > 1) {
					exp = EovaConfig.getExps().get(strs[0]);
					for (int i = 1; i < strs.length; i++) {
						parmList.add(getSqlParam(strs[i]));
					}
				}
			} catch (Exception e) {
				throw new RuntimeException("预处理自定义查找框表达式异常，Exp=" + exp);
			}
		}

		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, (Object)this.getSessionAttr(EovaConst.USER));

		// 根据表达式构建元数据
		EovaExp se = new EovaExp(exp);
		MetaObject mo = se.getObject();
		List<MetaField> mfs = se.getFields();
		if (isMultiple) {
			mo.set("is_single", false);
		}
		// mo.set("is_celledit", true);
		// for (MetaField mf : mfs) {
		// mf.set("is_edit", true);
		// mf.put("editor", "eovatext");
		// }

		setAttr("action", url);
		// 用于Grid呈现
		setAttr("objectJson", JsonKit.toJson(mo));
		setAttr("fieldsJson", JsonKit.toJson(mfs));
		// 用于query条件
		setAttr("itemList", mfs);
		setAttr("pk", se.pk);

		toFind();
	}

	/**
	 * Find Dialog Grid Get JSON
	 */
	public void findJson() {

		List<Object> parmList = new ArrayList<Object>();

		String exp = getPara("exp");
		String code = getPara("code");
		String en = getPara("field");
		if (xx.isEmpty(exp)) {
			// 根据表达式获取ei
			MetaField ei = MetaField.dao.getByObjectCodeAndEn(code, en);
			exp = ei.getStr("exp");
		} else {
			// 预处理表达式
			try {
				String[] strs = exp.split(",");
				if (strs.length > 1) {
					exp = EovaConfig.getExps().get(strs[0]);
					for (int i = 1; i < strs.length; i++) {
						parmList.add(getSqlParam(strs[i]));
					}
				}
			} catch (Exception e) {
				throw new RuntimeException("预处理自定义查找框表达式异常，Exp=" + exp);
			}
		}

		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, (Object)this.getSessionAttr(EovaConst.USER));
		// 解析表达式
		EovaExp se = new EovaExp(exp);
		String select = se.simpleSelect;
		String from = se.from;
		String where = se.where;
		String ds = se.ds;
		List<MetaField> eis = se.getFields();

		// 获取分页参数
		int pageNumber = getParaToInt(PageConst.PAGENUM, 1);
		int pageSize = getParaToInt(PageConst.PAGESIZE, 15);

		// 获取条件
		where = WidgetManager.getWhere(this, eis, parmList, where);
		Object[] parm = new Object[parmList.size()];
		parmList.toArray(parm);

		// 获取排序
		String sort = WidgetManager.getSort(this, se.order);

		// 分页查询Grid数据
		String sql = from + where + sort;
		Page<Record> page = Db.use(ds).paginate(pageNumber, pageSize, select, DbUtil.formatSql(sql), parm);

		// 将分页数据转换成JSON
		String json = JsonKit.toJson(page.getList());
		json = "{\"status\": 200, \"total\":" + page.getTotalRow() + ",\"rows\":" + json + "}";
		// System.out.println(json);
		
		renderJson(json);
	}

	/**
	 * Find get CN by value
	 */
	public void findCnByEn() {
		String code = getPara(0);
		String en = getPara(1);
		String value = getPara(2);
		
		//System.out.println("===="+this.getPara());
		
		//TableUser-schoolflnkid-171C73D1-4E1C-4780-BA2E-7D324D2ED9A3
		//171C73D1-4E1C-4780-BA2E-7D324D2ED9A3
//		if(this.getPara()!= null && this.getPara().split("-").length == 7){//可能是uuid数据
//			value = this.getPara().substring(this.getPara().length() - 36, this.getPara().length());
//		}
		
		
		// 根据表达式获取元字段
		MetaField ei = MetaField.dao.getByObjectCodeAndEn(code, en);

		String exp = ei.getStr("exp");
		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, (Object)this.getSessionAttr(EovaConst.USER));

		// 解析表达式
		EovaExp se = new EovaExp(exp);
		String ds = se.ds;

		// 查询本次所有翻译值
		StringBuilder sb = new StringBuilder();
		if (!xx.isEmpty(value)) {
			sb.append(se.pk);
			sb.append(" in(");
			// 根据当前页数据value列查询外表name列
			for (String id : value.split(",")) {
				// TODO There might be a sb injection risk warning
				sb.append(xx.format(id)).append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
			sb.append(")");
		}
		//System.out.println(sb.toString());

		// 根据表达式查询获得翻译的值
		String sql = WidgetManager.addWhere(se, sb.toString());
		System.out.println("sql: "+sql);
		List<Record> txts = Db.use(ds).find(sql);
		// 没有翻译值，直接返回原值
		if (xx.isEmpty(txts)) {
			JSONObject json = new JSONObject();
			json.put("code", 0);
			json.put("data", value);
			renderJson(json.toJSONString());
			return;
		}

		JSONObject json = new JSONObject();
		json.put("code", 1);
		json.put("text_field", se.cn);// 文本字段名
		json.put("data", JsonKit.toJson(txts));// 翻译字典数据
		renderJson(json.toJSONString());
	}
	
	//弹出选择指定数据转义
	public void findTheObjectCnByEn() throws Exception{
		String objectCode = getPara(0);//对象
		String en = getPara(1);//字段
		String value = getPara(2);//值
		
		Record result = null;

		MetaObject object = sm.meta.getMeta(objectCode);
		
		List<MetaField> fields = object.getFields();
		Optional<MetaField> fieldOpt = fields.stream().filter(f->f.getEn().equalsIgnoreCase(en)).findFirst();
		
		if(fieldOpt.isPresent()) {
			MetaField field = fieldOpt.get();
			String exp = field.getStr("exp");
			Menu targetMenu = Menu.dao.findByCode(exp);
			MetaFieldConfig fieldConfig= field.getConfig();
			String showField = fieldConfig.getShowField();
			//String pk = fieldConfig.getPk();

			if(targetMenu != null) {
				String targetObjectCode = targetMenu.getConfig().getObjectCode();
				//MetaObject object = MetaObject.dao.getByCode(objectCode);
				MetaObject targetMetaObject = sm.meta.getMeta(targetObjectCode);

				this.set("pk",targetMetaObject.getPk() );
				
				//只取一条
				int pageNumber = 1;
				int pageSize = 1;
				MetaObjectIntercept intercept = new FindTheObjectCnByEnIntercept();//构建一个拦截，增加自己的条件
				Menu menu = null;
				
				// 构建查询
				List<Object> parmList = new ArrayList<Object>();
				String sql = WidgetManager.buildQuery(this, targetMetaObject, menu, intercept, parmList);
		
				// 转换SQL参数
				Object[] paras = new Object[parmList.size()];
				parmList.toArray(paras);
				Page<Record> page = Db.use(object.getDs()).paginate(pageNumber, pageSize, "select *", DbUtil.formatSql(sql), paras);

				// 备份Value列，然后将值列转换成Key列
				WidgetUtil.copyValueColumn(page.getList(), object.getPk(), object.getFields());
				// 根据表达式将数据中的值翻译成汉字
				WidgetManager.convertValueByExp(this,object, object.getFields(), page.getList());
				
				
				//只给 需要的字段
				
				if(!page.getList().isEmpty()) {
					Record dbOne = page.getList().get(0);
					//
					result = new Record();
					result.set(targetMetaObject.getPk(), dbOne.get(targetMetaObject.getPk()));
					result.set(showField, dbOne.get(showField));
				}
				
			}
			
		}
		

		if(result != null) {
			renderJson(Response.sucData(result));
		}else
			renderJson(Response.err("未查到数据"));
	}
	
	
	public void findTheProcessDetail() throws Exception{
		String objectCode = getPara(0);//对象
		//String en = getPara(1);//字段
		String value = getPara(1);//值
		
		//查询
		OaProcess process = OaProcess.dao.getTheOaProcess(objectCode,Integer.parseInt(value));
		if(process != null) {
			List<OaProcessTask> tasks =	OaProcessTask.dao.getTheOaProcessTasks(process.getNumber("id").intValue());
			tasks.forEach(t->{
				UserInfo user = UserInfo.dao.findById(t.getNumber("user_id"));
				 if(user != null)
					 t.put("USERINFO", user);
			});
			process.put("TASKS", tasks);
		}
			
		renderJson(Response.sucData(process));
		
	}

	
	/**
	 * 获取SQL参数，优先Integer，不能转就当String
	 *
	 * @param str
	 * @return
	 */
	private static Object getSqlParam(String str) {
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return str;
		}
	}

	/**
	 * Combo Load Data Get JSON
	 */
	public void comboJson() {
		String exp = getPara("exp");

		List<Object> parmList = new ArrayList<Object>();

		MetaField ei = null;
		if (xx.isEmpty(exp)) {
			// 根据元数据获取表达式
			String objectCode = getPara(0);
			String en = getPara(1);
			ei = MetaField.dao.getByObjectCodeAndEn(objectCode, en);
			exp = ei.getStr("exp");
		} else {
			// 预处理自定义表达式
			try {
				String[] strs = exp.split(",");
				if (strs.length > 1) {
					exp = EovaConfig.getExps().get(strs[0]);
					for (int i = 1; i < strs.length; i++) {
						parmList.add(getSqlParam(strs[i]));
					}
				}
			} catch (Exception e) {
				throw new RuntimeException("预处理自定义查找框表达式异常，Exp=" + exp);
			}
		}

		boolean isMultiple = false;
		if (ei != null && ei.getBoolean("is_multiple")) {
			isMultiple = true;
		}

		// 根据表达式构建数据
		String json = buildComboDataJson(exp, parmList, isMultiple,this);

		// json = "[value,name]";
		// System.out.println(json);
		renderJson(json);
	}
	
	public String buildComboDataJson(String exp, List<Object> parmList, boolean isMultiple,Controller c) {
		return JsonKit.toJson(buildComboData(exp,parmList,  isMultiple, c));
	}
	
	/**
	 * 根据表达式构建下拉框所需JSON数据
	 *
	 * @param exp 表达式
	 * @param parmList sql参数
	 * @param isMultiple 是否多选
	 * @param c 支持从参数中增加条件
	 * @return List
	 */
	public static List<Record> buildComboData(String exp, List<Object> parmList, boolean isMultiple,Controller c) {
		exp = exp.trim();

		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, (Object)c.getSessionAttr(EovaConst.USER));

		// 解析表达式
		EovaExp se = new EovaExp(exp);
//		String sql = se.sql;
		
		StringBuilder sqlBuilder = new StringBuilder();
		sqlBuilder.append(se.select);
		sqlBuilder.append(se.from);
		if(xx.isEmpty(se.where))
			sqlBuilder.append(" where 1=1 ");
		else
			sqlBuilder.append(se.where);
		
		//暂时不全字段匹配了，只检测是否 EovaExp.third (即为父节点)
		Enumeration<String> ps = c.getParaNames();
		while(ps.hasMoreElements()) {
			String paramName = ps.nextElement();
			if(paramName.startsWith("query_") && paramName.endsWith(se.third)) {
				sqlBuilder.append(" and "+se.thirdSql+"=?");
				parmList.add(c.getPara(paramName));
			}
		}
		if(!xx.isEmpty(se.order))
			sqlBuilder.append(se.order);
		
		String sql = sqlBuilder.toString();

		Object[] paras = new Object[parmList.size()];
		parmList.toArray(paras);
		
		String key = sql;
		for (Object obj : paras) {
			key += "_" + obj.toString();
		}
		List<Record> list = Db.use(se.ds).findByCache(BaseCache.EXP, key, sql, paras);
		// 初始化首项
		//initItemToList(isMultiple, list);

		return list;
	}

	/**
	 * 为下拉列表添加初始项(暂时不用了，前端补齐第一项 作为提示)
	 *
	 * @param isMultiple
	 * @param list
	 */
	private void initItemToList(boolean isMultiple, List<Record> list) {
		// 只有单选需要添加()
		if (!isMultiple) {
			Record re = new Record();
			re.set("id", "");
			re.set("cn", "");
			list.add(0, re);
		}
	}
	
	
	private class FindTheObjectCnByEnIntercept extends MetaObjectIntercept{
		 public void queryBefore(AopContext ac) throws Exception {
			 //pk字段，值
			 String value = getPara(2);//值
			 String pk = ac.ctrl.getAttrForStr("pk");

		     // 用法：覆盖条件
		      ac.where = " where "+pk+" =?";
		      ac.params.add(value);
		 }
	}
	
	@NotAction
	public static void main(String[] args) {
		String exp = "selectAreaByLv1AndPid,1,3,abc";
		try {
			String[] strs = exp.split(",");
			exp = EovaConfig.getExps().get(strs[0]);
			for (int i = 1; i < strs.length; i++) {
				System.out.println(getSqlParam(strs[i]) + " " + getSqlParam(strs[i]).getClass());
			}
		} catch (Exception e) {
			throw new RuntimeException("预处理自定义查找框表达式异常，Exp=" + exp);
		}
	}
	
	
	
	
}