package com.eova.template.office;

import com.alibaba.fastjson.JSONObject;
import com.eova.common.Easy;
import com.eova.common.Response;
import com.eova.common.render.Html2XlsRender;
import com.eova.common.utils.xx;
import com.eova.core.menu.config.MenuConfig;
import com.eova.model.Button;
import com.eova.model.Menu;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.template.common.util.TemplateUtil;
import com.eova.template.single.SingleController;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import java.util.HashMap;
import java.util.List;

/**
 * @Description:TODO
 * @author 作者:Administrator
 * @createDate 创建时间：2020年4月16日 下午1:09:22
 * @version 1.0
 */
public class OfficeController extends Controller {
	final Controller ctrl = this;
	protected OfficeIntercept intercept = null;
	
	/**
	 * 输出基础页面
	 */
	public void list() {
		String menuCode = getPara(0);

		Menu menu = Menu.dao.findByCode(menuCode);
		MenuConfig config = menu.getConfig();
		String objectCode = config.getObjectCode();//可能空
		
		User user = (User) getSessionAttr("user");
		List<Button> btnList = Button.dao.queryByMenuCode(menuCode, user,this);
		
		if(!xx.isEmpty(objectCode)) {
			
			MetaObject object = MetaObject.dao.getByCode(objectCode);
			SingleController.isQuery(this,objectCode,object);
			
			setAttr("object", object);
		}
		
		
		setAttr("menu", menu);
		setAttr("btnList", btnList);

//		String query = getRequest().getQueryString();
//		setAttr("para", getPara() + (xx.isEmpty(query) ? "" : query));
		
		

		xx.render(this,"/eova/template/office/list.html");
	}

	/**
	 * 显示office页面（html+beetl渲染）
	 * @throws Exception
	 */
	public void show() throws Exception {
		String menuCode = getPara(0);

		Menu menu = Menu.dao.findByCode(menuCode);
		String url = menu.getStr("url");//渲染的模板文件

		this.intercept = ((OfficeIntercept) TemplateUtil.initIntercept(menu.getBizIntercept()));

		HashMap<String, Object> data = new HashMap();
		if (this.intercept != null) {
			try {
				String tempUrl = this.intercept.init(this.ctrl, data);
				if(!xx.isEmpty(tempUrl))
					url = tempUrl ;
			} catch (Exception e) {
				renderText(e.getMessage());
				return;
			}
			for (String key : data.keySet()) {
				Object o = data.get(key);
				setAttr(key, o);
			}
		}else {
			System.err.println("未配置数据拦截器:OfficeIntercept");
		}
		
		render(url);
	}

	/**
	 * 下载office 文件
	 * @throws Exception
	 */
	public void file() throws Exception {
		String menuCode = getPara(0);

		Menu menu = Menu.dao.findByCode(menuCode);
		String url = menu.getStr("url");//渲染的模板文件

		

		this.intercept = ((OfficeIntercept) TemplateUtil.initIntercept(menu.getBizIntercept()));

		HashMap<String, Object> data = new HashMap();

		String fileType = menu.getConfig().getParams().getString("office_type");
		String fileName = menu.getStr("name") + '.' + fileType;
		if (this.intercept != null) {
			try {
				String tempUrl = this.intercept.init(this.ctrl, data);
				if(!xx.isEmpty(tempUrl))
					url = tempUrl ;
			} catch (Exception e) {
				renderJson(Response.err(e.getMessage()));
				return;
			}
		}
		String path = PathKit.getWebRootPath() + url;
		//render(new OfficeRender(fileType, fileName, path, data));
		render(new Html2XlsRender(fileType, fileName, path, data));
		
	}
	
	
}
