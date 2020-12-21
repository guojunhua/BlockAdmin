package com.eova.template.dashboard;

import java.sql.SQLSyntaxErrorException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.alibaba.druid.util.JdbcUtils;
import com.eova.common.Response;
import com.eova.common.base.BaseCache;
import com.eova.common.utils.xx;
import com.eova.common.utils.util.GsonUtil;
import com.eova.common.utils.util.HttpClientUtil;
import com.eova.config.EovaConst;
import com.eova.core.button.ButtonController;
import com.eova.core.menu.config.MenuConfig;
import com.eova.engine.DynamicParse;
import com.eova.engine.EovaExp;
import com.eova.model.Button;
import com.eova.model.Charts;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.service.sm;
import com.eova.widget.WidgetController;
import com.google.common.collect.Lists;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
* @Description:显示/设计仪表板
* @author 作者:jzhao
* @createDate 创建时间：2020年8月28日 下午10:40:58
* @version 1.0     
*/
public class DashboardController extends Controller {
	final Controller ctrl = this;
	protected static Log log;
	
	public void list() {
		String menuCode = this.getPara(0);
		

		// 获取元数据
		Menu menu = Menu.dao.findByCode(menuCode);
		MenuConfig config = menu.getConfig();
		String objectCode = config.getObjectCode();
		//MetaObject object = MetaObject.dao.getByCode(objectCode);
//		List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);

		// 根据权限获取功能按钮
		User user = this.getSessionAttr(EovaConst.USER);


	
		List<Button> btnList = Button.dao.queryByMenuCode(menuCode, user,this);
		
		if(!xx.isEmpty( menu.getStr("url") ) ) {
			this.redirect(menu.getStr("url"));
		}else {
			setAttr("menu", menu);
			setAttr("btnList", btnList);
			
			xx.render(this,"/eova/template/dashboard/list.html");
		}
	}
	
	
	public void design() {
		String menuCode = this.getPara(0);
		

		// 获取元数据
		Menu menu = Menu.dao.findByCode(menuCode);
		MenuConfig config = menu.getConfig();
		String objectCode = config.getObjectCode();
		//MetaObject object = MetaObject.dao.getByCode(objectCode);
//		List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);

		// 根据权限获取功能按钮
		User user = this.getSessionAttr(EovaConst.USER);


	
		List<Button> btnList = Button.dao.queryByMenuCode(menuCode, user,this);
		
		setAttr("menu", menu);
		setAttr("btnList", btnList);
			
		xx.render(this,"/eova/widget/charts/design.html");

	}
	
	//保存menu中的报表模块参数
	public void save() {
		String menuCode = this.getPara(0);
		String reqJson = HttpKit.readData(getRequest()) ;
		Map req = GsonUtil.GsonToMaps(reqJson);
		
		Menu menu = Menu.dao.findByCode(menuCode);
		
		menu.set("board_ui", (String)req.get("boardUi"));
		menu.update();
		
		renderJson	(Response.suc("保存成功"));
	}
	
	/**
	 * 根据code查询charts信息
	 */
	public void charts() {
		String chartCode = this.getPara(0);
		Charts charts = Charts.dao.queryByCode(chartCode);
		

		if(charts != null)
			renderJson(Response.sucData(charts));
		else
			renderJson	(Response.err("无此图表"));
	}
	
	
	
	public void chartsData() {
		String chartCode = this.getPara(0);
		Charts charts = Charts.dao.queryByCode(chartCode);
		
		String sql = charts.getDataSql();
		if(!xx.isEmpty(sql)) {
			List<Record> list =	buildSqlData(sql,  this);
			renderJson(Response.sucData(list));
			return;
		}
		
		renderJson	(Response.err("图表未配置数据"));
	}
	
	
	public void designWidget() throws Exception{
		String chartCode = this.getPara(0);
		Charts charts = Charts.dao.queryByCode(chartCode);

		setAttr("widget", charts);

		xx.render(this, "/eova/widget/charts/designCharts.html");
	}
	
	public void defaultOpt() {
		String charts = this.getPara(0);
		//支持：pie,line,bar,radar,scatter,gauge(依次为：饼图、折线、柱图、雷达图、散射图、仪表盘)
		
		
		//xx.render(this,);
		this.render("/eova/widget/charts/charts_opt/"+charts+".js");
	} 
	
	public void getCharts() {
		String chartCode = this.getPara(0);
		Charts charts = Charts.dao.queryByCode(chartCode);
		if(charts == null) {//新建一个
			String chartsType = this.getPara("chartsType");
			
			
			
			//图表类型:1=饼图,2=折线/柱图
			Record dicts = Db.use(xx.DS_EOVA).findFirst("select * from dicts where object = ? and field=? and value=?", "bb_charts","code",chartsType);
			if(dicts == null) {
				renderJson	(Response.err("无此类型图表"));
				return;
			}
			
			//3、获取文件
			String getUrl =  this.getRequest().getRequestURL().toString()
					.replace(this.getRequest().getRequestURI(), "")
					+"/dashboard/defaultOpt/"+dicts.get("ext");
			
			String cookies = ButtonController.ReadCookie(this.getRequest());
			String result = HttpClientUtil.getInstance().get(getUrl,cookies);
			
			
			
			charts = new Charts();
			charts.set("name", "");
			charts.set("content", result);
			charts.set("code", chartCode);
			charts.set("describe", "默认参数配置");
			charts.set("type", chartsType);
			charts.set("data_type",2 );
			charts.save();
		}
		
		// url = "/form/add/"+objectCode+"?template=h";
		
		
		
		
		renderJson(Response.sucData(charts));
	}
	
	
	public void toEditChart() {
		String chartCode = this.getPara(0);
		this.setAttr("chartCode", chartCode);
		
		Charts charts = Charts.dao.queryByCode(chartCode);
		
		
		this.setAttr("charts", charts);
		xx.render(this,"/eova/widget/charts/editChart.html");
	}
	
	public void saveChart() {
		String chartCode = this.getPara(0);
		String reqJson = HttpKit.readData(getRequest()) ;
		Map req = GsonUtil.GsonToMaps(reqJson);
		
		this.setAttr("chartCode", chartCode);
		
		Charts charts = Charts.dao.queryByCode(chartCode);
		charts.set("name", req.get("name"));
		charts.set("content", req.get("content"));
		charts.set("describe", req.get("describe"));
		charts.set("data_type", req.get("data_type"));
		charts.set("data_sql", req.get("data_sql"));
		
		charts.update();
		
		renderJson(Response.suc("成功"));
	}
	
	public void tryQuerySql() {
			String reqJson = HttpKit.readData(getRequest()) ;
			Map req = GsonUtil.GsonToMaps(reqJson);
			try {
				List<Record> list = buildSqlData((String)req.get("sql"),  this);
				
				
				renderJson(Response.sucData(list));
				
				return;
			} catch (ActiveRecordException se){
				Response r =	Response.err("执行Sql失败!");
				r.setData(se.getMessage());
				
				renderJson(r);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				Response r =	Response.err("执行Sql失败!");
				r.setData(e.getMessage());
				
				renderJson(r);
			}
	}

	
	private  List<Record> buildSqlData(String exp, Controller c) {
		exp = exp.trim();

		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, (Object)c.getSessionAttr(EovaConst.USER));

		// 解析表达式
		String sql = exp;
		String ds = xx.DS_MAIN;
		if (exp.contains(";")) {//selelct * from user;ds=main
			String[] strs = exp.split(";");
			if(strs.length == 2) {
				if(!xx.isEmpty(strs[1].trim()) && strs[1].trim().startsWith("ds=")) {
					sql = strs[0];
					ds = strs[1].substring(3);
				}
			}
		} 
		

		
		String key = sql;
		List<Record> list = Db.use(ds).findByCache(BaseCache.ECHARTS, key, sql);
		// 初始化首项
		//initItemToList(isMultiple, list);

		return list;
	}
	
	
	
}
