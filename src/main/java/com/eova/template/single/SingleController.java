/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.template.single;

import java.util.List;

import com.eova.aop.AopContext;
import com.eova.common.Response;
import com.eova.common.utils.xx;
import com.eova.common.utils.io.FileUtil;
import com.eova.config.EovaConst;
import com.eova.config.PageConst;
import com.eova.core.menu.config.MenuConfig;
import com.eova.model.Button;
import com.eova.model.EovaLog;
import com.eova.model.Menu;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.service.sm;
import com.eova.template.common.util.TemplateUtil;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.upload.UploadFile;

/**
 * 业务模版：单表(DataGrid)
 * list 添加选择模式
 * @author Jieven
 * 
 */
public class SingleController extends Controller {

	final Controller ctrl = this;

	/** 自定义拦截器 **/
	protected SingleIntercept intercept = null;

	public void list() {

		String menuCode = this.getPara(0);
		
		

		// 获取元数据
		Menu menu = Menu.dao.findByCode(menuCode);
		MenuConfig config = menu.getConfig();
		String objectCode = config.getObjectCode();
		MetaObject object = MetaObject.dao.getByCode(objectCode);
//		List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);

		// 根据权限获取功能按钮
		User user = this.getSessionAttr(EovaConst.USER);
		List<Button> btnList = Button.dao.queryByMenuCode(menuCode, user,this);

		isQuery(this,objectCode,object);

		setAttr("menu", menu);
		setAttr("btnList", btnList);
		setAttr("object", object);
//		setAttr("fields", fields);
		
		choiceMode();
		
		xx.render(this,"/eova/template/single/list.html");
	}
	
	
	
	//主要用来弹出选择数据用的列表
	private void choiceMode() {
		String mode = this.getPara(PageConst.Mode);//模式
		String choiceField = this.getPara("choiceField");
		String nameField = this.getPara("nameField");
		//2个字段不能空 mode 
		if(xx.isEmpty(mode) || xx.isEmpty(choiceField) || xx.isEmpty(nameField))
			return;
		
		String choiceFieldValue = this.getPara("choiceFieldValue");//逗号分隔：1，2，3
		
		
		setAttr(PageConst.Mode, mode);
		setAttr("choiceField", choiceField);
		setAttr("nameField", nameField);
		if(!xx.isEmpty(choiceFieldValue))
			setAttr("choiceFieldValue",choiceFieldValue);
		
		if("radio".equals(mode)) {//单选（radio） or 复选（check）
			
			
			setAttr("isSingle", true);
		}else if("check".equals(mode)) {
			
			
			setAttr("isSingle", false);
			
			//可以不送，则不控制
			setAttr("maxNum", this.getPara("maxNum"));
			setAttr("minNum", this.getPara("minNum"));
		}
	}
	
	public void importXls() {
		String menuCode = this.getPara(0);
		setAttr("menuCode", menuCode);
		

		
		
		xx.render(this,"/eova/template/single/dialog/import.html");
	}
	
public void doImportXls() throws Exception {
		
		String menuCode = this.getPara(0);
		
		// 获取元数据
		Menu menu = Menu.dao.findByCode(menuCode);
		MenuConfig config = menu.getConfig();
		String objectCode = config.getObjectCode();
		final MetaObject object = sm.meta.getMeta(objectCode);
		
		intercept = TemplateUtil.initIntercept(menu.getBizIntercept());
		
		// 默认上传到/upload/temp/xls 临时目录
		String fileDir = xx.getConfig("eova_upload_xls");
		
		
		final UploadFile file = getFile("upfile", fileDir);
		if (file == null) {
			//uploadCallback(false, "上传失败，文件不存在！");
			
			renderJson(Response.err("上传失败，文件不存在！"));
			return;
		}
		
		// 获取文件后缀
		String suffix = FileUtil.getFileType(file.getFileName());
		if (!suffix.equals(".xls") && !suffix.equals(".xlsx")) {
//			uploadCallback(false, "请导入.xls或者.xlsx格式的Excel文件！");
//			return;
			renderJson(Response.err("请导入.xls或者.xlsx格式的Excel文件！"));
			return;
		}

		// 事务(默认为TRANSACTION_READ_COMMITTED)
		SingleAtom atom = new SingleAtom(file.getFile(), object, intercept, ctrl);
		boolean flag = Db.use(object.getDs()).tx(atom);

		if (!flag) {
			atom.getRunExp().printStackTrace();
//			uploadCallback(false, "导入失败,服务异常!<br>" + atom.getRunExp().getMessage());
//			return;
			
			renderJson(Response.err("导入失败,服务异常!<br>" + atom.getRunExp().getMessage()));
			return;
		}

		// 记录导入日志
		EovaLog.dao.info(this, EovaLog.IMPORT, object.getStr("code"),null);

		// 导入成功之后
		if (intercept != null) {
			try {
				AopContext ac = new AopContext(ctrl, atom.getRecords(),object);
				intercept.importSucceed(ac);
			} catch (Exception e) {
				e.printStackTrace();
//				uploadCallback(false, "导入成功,后置任务执行异常!<br>" + e.getMessage());
//				return;
				
				renderJson(Response.err("导入成功,后置任务执行异常!<br>" + e.getMessage()));
				return;
			}
		}

		
		Response res =	Response.suc("导入成功！");
		res.setCount(atom.getRecords().size());
		renderJson(res);
	}

	// ajax 上传回调
	private void uploadCallback(boolean succeed, String msg) {
		renderHtml("<script>parent.callback(\"" + msg + "\", " + succeed + ");</script>");
	}
	
	
	//判断是否要显示查询条件（统一用）
	public static void isQuery(Controller c,String objectCode,MetaObject object) {
		// 是否需要显示快速查询（多条件：1、入参控制条件查询 2、是否设置了查询字段 3、是否设置需要查询 ）
		Boolean isQuery = c.getParaToBoolean("isQuery");
		if(isQuery == null) {
			
			 isQuery = MetaObject.dao.isExistQuery(objectCode);
			 if(isQuery) {//存在条件
				 
				 Integer is_show_condition = object.getInt("is_show_condition");
				 if( is_show_condition!= null && is_show_condition.equals(1))
					 isQuery = true;
				 else
					 isQuery = false;
			 }
			
		}
		
		c.setAttr("isQuery", isQuery);
	}

}