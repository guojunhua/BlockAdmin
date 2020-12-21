/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core;

import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.apache.ibatis.io.Resources;

import com.alibaba.druid.util.StringUtils;
import com.eova.cloud.AuthCloud;
import com.eova.common.Easy;
import com.eova.common.Response;
import com.eova.common.install.InstallUtil;
import com.eova.common.utils.EncryptUtil;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.common.utils.db.JdbcUtil;
import com.eova.config.EovaConfig;
import com.eova.config.EovaConst;
import com.eova.config.PageConst;
import com.eova.model.Button;
import com.eova.model.EovaLog;
import com.eova.model.Menu;
import com.eova.model.User;
import com.eova.service.InstallService;
import com.eova.service.sm;
import com.eova.widget.WidgetUtil;
import com.eova.widget.tree.TreeUtil;
import com.jfinal.captcha.CaptchaRender;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.oss.job.EveryDayJob;

/**
 * Eova入口
 *
 * @author Jieven
 * @date 2015-1-6
 */
public class IndexController extends Controller {

	public void captcha() {
		render(new CaptchaRender());
	}

	public void code() {
		this.setAttr(PageConst.Template, xx.getConfig("app_template_ui"));//强制使用当前配置得
		setAttr("exp1", "select id UID,login_id CN from users where <%if(user.id != 0){%>  id > ${user.id}<%}%> order by id desc");
		xx.render(this,"/eova/code.html");
	}

	public void toIndex() {
		
		
		xx.render(this,"/eova/index.html");
	}

	public void header() {
		User user = getSessionAttr(EovaConst.USER);

		setAttr("user", user);

		xx.render(this,"/eova/header.html");
	}

	public void footer() {
		xx.render(this,"/eova/footer.html");
	}

	public void toIcon() {//只和当前配置有关
		this.setAttr(PageConst.Template, xx.getConfig("app_template_ui"));//强制使用当前配置得
		xx.render(this,"/eova/icon.html");
	}


	
	
	
	public void toUe() {
		xx.render(this,"/eova/uedemo.html");
	}

	public void toTest() {
		setAttr("id", "testGrid");
		setAttr("objectCode", getPara(0));
		xx.render(this,"/eova/test.html");
	}

	public void toForm() {
		xx.render(this,"/eova/test/form.html");
	}

	public void toLogin() {
		boolean isCaptcha = xx.toBoolean(EovaConfig.getProps().get("isCaptcha"), false);
		setAttr("isCaptcha", isCaptcha);
		
		//render("/eova/login.html");
		//DEV,测试环境=TEST
		String env = EovaConfig.getProps().get("env");
		if(("DEV".equalsIgnoreCase(env) || "TEST".equalsIgnoreCase(env) )
				&& this.getAttr("loginId") == null){
			
			setAttr("loginId", "bb");
			setAttr("loginPwd", "000000");
			xx.render(this,xx.getConfig("app_login","/eova/login.html"));
			
			
		}else{
			
			//setAttr("isCaptcha", true);
			xx.render(this,xx.getConfig("app_login","/eova/login.html"));
		}
	}

	

	public void index() {


		/*
		 * Eova契约简介 普通用户请保留底部版权声明，如需去掉版权，请捐赠成为VIP用户，支持开源项目发展，没有用户支持的项目最终只能搁浅，最后受损失的是所有Eova用户！ 所有用户请在社区进行应用认证，并且获取正确AppId和AppSecret进行配置！AppId使用场景有：VIP高级功能，Eova社区问答，Eova云服务...
		 * 如违反本契约的用户，当被检测到或被举报时，会被社区标识为非法用户，将会失去一切社区的支持和服务！一次违约，永不解禁！ 再次呼吁大家遵守契约，细水长流，和谐发展！
		 */

		User user = getSessionAttr(EovaConst.USER);
		// 已经登录
		if (user != null) {
			// 默认主页
			setAttr("URL_MAIN", xx.getConfig("app_main"));
			setAttr("user", user);
			
			//setAttr("topMenu", getTopMenu());
			
			setAttr("menu", menuList());
			
			toIndex();
			setAttr(PageConst.BB_ENV, EovaConfig.getProps().get("env"));
			return;
		}

		// 未登录
		toLogin();
	}

	public void doExit() {
		// 清除登录状态
		removeSessionAttr(EovaConst.USER);
		redirect("/");
	}
	
	
	
	public void doLogin() {
		User user = doLogin2();
		if(user == null) {
			if(xx.isJsonPattern(this)) {
				xx.redirect(this, Response.NO_AUTHORIZE, (String)this.getAttr("msg"), null);
				return;
			}else {
				toLogin();
				return ;
			}
		}
		
	
	
		
		xx.redirect(this, Response.STATUS_SUC, "登录成功", "/");
	}
	
	
	
	private User doLogin2() {
		String loginId = getPara("loginId");
		String loginPwd = getPara("loginPwd");
		setAttr("loginId", loginId);
		
		boolean isCaptcha = xx.toBoolean(EovaConfig.getProps().get("isCaptcha"), false);
		if (isCaptcha && !super.validateCaptcha("captcha")) {
			setAttr("msg", "验证码错误，请重新输入！");
			//toLogin();
			
			EovaLog.dao.info(this, EovaLog.LOGIN, loginId+":"+ getAttr("msg"),loginId);
			return null;
		}
		
		
		
		
		User user = User.dao.getByLoginId(loginId);
		if (user == null) {
			setAttr("msg", "用户名不存在");
			//toLogin();
			return null;
		}
		
		//超管在生产模式禁用
		
		
		String env = EovaConfig.getProps().get("env");
		if(user.isAdmin()){
//			if("PRE".equalsIgnoreCase(env)  ){
//			
//				setAttr("msg", "生产环境非法用户");
//				toLogin();
//				return;
//			
//			}
			if("PRD".equalsIgnoreCase(env)){
				setAttr("msg", "用户名不存在");
				//toLogin();
				EovaLog.dao.info(this, EovaLog.LOGIN, loginId+":"+ getAttr("msg"),loginId);
				return null;
			}
		}
		
//		if("PRE".equalsIgnoreCase(env) || "PRD".equalsIgnoreCase(env)){
//			if(user.getRid() == admin_rid){
//				setAttr("msg", "生产环境非法用户");
//				toLogin();
//				return;
//			}
//		}
		
		
		if (!user.getStr("login_pwd").equals(EncryptUtil.getSM32(loginPwd))) {
			setAttr("msg", "密码错误");
			keepPara("loginId");
			//toLogin();
			EovaLog.dao.info(this, EovaLog.LOGIN, loginId+":"+ getAttr("msg"),loginId);
			return null;
		}

		

		try {
			loginInit(this, user);
		} catch (Exception e) {
			e.printStackTrace();
			setAttr("msg", e.getMessage());
			keepPara("loginId");
			//toLogin();
			EovaLog.dao.info(this, EovaLog.LOGIN, loginId+":"+ getAttr("msg"),loginId);
			return null;
		}
		
		user.init();
		
		setSessionAttr(EovaConst.USER, user);
		EovaLog.dao.info(this, EovaLog.LOGIN, "成功",null);
		// 重定向到首页
		
		return user;
	}
	
	/**
	 * 初始权限（根据角色）
	 *
	 * @param user
	 * @throws Exception
	 */
	protected void loginInit(Controller ctrl, User user) throws Exception {
		// 初始化获取授权信息
		
		Set<String> auths = new HashSet<String>();
//		String sql = "SELECT bs FROM eova_role_btn rf LEFT JOIN eova_button b ON rf.bid = b.id WHERE rf.rid in "+DbUtil.joinIds(user.getRids());
//		List<Record> bss = Db.use(xx.DS_EOVA).find(sql);
		
		List<Button> bts = Button.dao.roleButtons(user.getRids());
		
		for (Button b : bts) {
			String bs = b.getStr("bs");
			if (xx.isEmpty(bs)) {
				continue;
			}
			if (!bs.contains(";")) {
				auths.add(bs);
				continue;
			}
			String[] strs = bs.split(";");
			for (String str : strs) {
				auths.add(str);
			}
		}
		if (xx.isEmpty(auths)) {
			throw new Exception("用户角色没有任何授权,请联系管理员授权");
		}
		user.put("auths", auths);

		// 子类可重写添加业务属性和对象
	}

	
	

	
	/**
	 * 获取菜单JSON
	 */
	public void showTree() {
		// 获取父节点
//		Integer rootId = getParaToInt(0);
		Integer pId = this.getParaToInt("pId");
		if (pId == null) {
			renderJson("系统异常");
			return;
		}
		// 获取登录用户的角色
		User user = getSessionAttr(EovaConst.USER);
		//int rid = user.getRid();

		// 获取所有菜单信息
		LinkedHashMap<Integer, Menu> allMenu = (LinkedHashMap<Integer, Menu>) sm.auth.getByParentId(pId);
		// 格式化EasyUI Tree Data
		WidgetUtil.formatEasyTree(allMenu);
		// 根据角色获取已授权菜单Code
		List<String> authMenuCodeList = sm.auth.queryMenuCodeByRid(user.getRids());

		// 获取已授权菜单
		LinkedHashMap<Integer, Menu> authMenu = new LinkedHashMap<Integer, Menu>();
		for (Map.Entry<Integer, Menu> map : allMenu.entrySet()) {
			Menu menu = map.getValue();
			// TODO 仅可查看已授权部分
			if (authMenuCodeList.contains(menu.getStr("code"))) {
				authMenu.put(map.getKey(), menu);
			}
		}

		// 获取已授权子菜单的所有上级节点(若功能有授权，需要找到上级才能)
		LinkedHashMap<Integer, Menu> authParent = new LinkedHashMap<Integer, Menu>();
		for (Map.Entry<Integer, Menu> map : authMenu.entrySet()) {
			WidgetUtil.getParent(allMenu, authParent, map.getValue());
		}

		// 根节点不显示排除
		authParent.remove(pId);

		// 将已授权的子菜单 放入 已授权 父菜单 Map
		// 顺序说明：父在前，子在后,子默认又是有序的
		authParent.putAll(authMenu);

		// Map 转 Tree Json
		String json = WidgetUtil.menu2TreeJson(authParent, pId);

		renderJson(json);
	}
	
//	private List<Menu> getTopMenu(){
//		User user = getSessionAttr(EovaConst.USER);
//
//		// 获取所有菜单
//		List<Menu> menus = Menu.dao.queryMenu();
//		// 获取已授权菜单ID
//		List<Integer> ids = Menu.dao.queryMenuIdByRid(user.getRids());
//
//		// 递归查找已授权功能的上级节点
//		HashSet<Integer> authPid = new HashSet<Integer>();
//		for (Integer id : ids) {
//			Menu m = getParent(menus, id);
//			
//
//			
//			findParent(authPid, menus, m);	
//		}
//		
//		Iterator<Menu> it = menus.iterator();
//		while (it.hasNext()) {
//			Menu m = it.next();
//			// 构建ztree link属性
//			m.put("link", m.getUrl());
//			m.remove("url");
//			
//			Integer mid = m.getInt("id");
//
//			// 已授权目录
//			if (authPid.contains(mid) && "0".equals(m.get("parent_id").toString()))
//				continue;
//			else
//				it.remove();
//		}
//		return menus;
//	}
	
	/**
	 * 已授权菜单
	 */
	public List<Menu> menuList() {
		String parentId = getPara("parentId");
		
		
		User user = getSessionAttr(EovaConst.USER);

		// 获取所有菜单
		List<Menu> menus = Menu.dao.queryMenu();
		// 获取已授权菜单ID
		List<Long> ids = Menu.dao.queryMenuIdByRid(user.getRids());
		
		
		// 递归查找已授权功能的上级节点
		HashSet<Long> authPid = new HashSet<Long>();
		for (Long id : ids) {
			Menu m = getParent(menus, id);
			
			
			
			
			findParent(authPid, menus, m);	
		}

		Iterator<Menu> it = menus.iterator();
		while (it.hasNext()) {
			Menu m = it.next();
			// 构建ztree link属性
			m.put("link", m.getUrl());
			m.remove("url");
			
			if(!xx.isEmpty(parentId) && !parentId.equals(m.get("parent_id").toString()))
				it.remove();
			
			long mid = m.getNumber("id").longValue();

			// 已授权目录
			if (authPid.contains(mid))
				continue;

			// 移除未授权菜单
			if (!ids.contains(mid))
				it.remove();
			
			
		}

		//处理下，变成 父子结构
		menus = TreeUtil.toTreeList(menus);
		
		return menus;
	}
	public void menu() {
		renderJson(JsonKit.toJson(menuList()));
	}
	

	/**
	 * 初始化操作
	 */
	public void initStepOne() {
		//render("/eova/init.html");
		
		xx.render(this, "/eova/initStepOne.html");
	}
	
	/**
	 * 初始化操作
	 */
	public void initStepTwo() {
		//render("/eova/init.html");
		
		xx.render(this, "/eova/initStepTwo.html");
	}

	/**
	 * 升级操作
	 */
	public void upgrade() {
		String isUpgrade = EovaConfig.getProps().get("isUpgrade");
		if (xx.isEmpty(isUpgrade) || !isUpgrade.equals("true")) {
			renderText("未开启升级模式，请启动配置 isUpgrade = true, 用完之后立马关掉,后果自负!");
			return;
		}

		xx.render(this,"/eova/help/upgrade.html");
	}

	/**
	 * 初始化操作
	 */
	public void doInit() {
		if(EovaConfig.INIT_SUC.intValue() == 1) {
			renderJson(Response.err("DB已启动成功，无需初始化。"));
			return;
		}
		boolean result = doInitDB(this);
		
		if(result == true) {
			EovaConfig.INIT_SUC.set(1);
		}
		
		return;
	}
	
	
	public void toDesign() {
		xx.render(this,"/eova/widget/layoutit/index.html");
	}
	
	public void getPieOpt() {
		//xx.render(this,);
		this.render("/eova/widget/layoutit/pie.js");
	}
	
	/**
	 * 恢复系统初始配置库
	 */
//	public void doInitSys() {
//		
//		
//		String password = getPara("password");
//		String init_password = xx.getConfig("init_password");
//		if(StringUtils.isEmpty(init_password) ){
//			renderText( "禁止恢复。");
//			return;
//		}else if(!init_password.equals(password)){
//			renderText("恢复密码错误。");
//			return;
//		}
//		
//		String init_file = xx.getConfig("init_file");
//		if(StringUtils.isEmpty(init_file)){
//			renderText("恢复文件未配置。");
//			return;
//		}
//		
//		Db.use(xx.DS_EOVA).initSqlFile(init_file);
//		  
//		renderText("执行恢复sql执行完成。");
//	}

	
	/**
	 * 获取父菜单
	 *
	 * @param menus
	 * @param id
	 * @return
	 */
	private static Menu getParent(List<Menu> menus, Long id) {
		Optional<Menu> mopt = menus.stream().filter(m->m.getNumber("id").longValue() == id).findFirst();
		return mopt.orElse(null);
	}

	/**
	 *
	 * 递归向上查找父节点
	 *
	 * @param authPid 找到的父节点
	 * @param menus 所有菜单
	 * @param id
	 */
	private void findParent(HashSet<Long> authPid, List<Menu> menus, Menu m) {
		if (m == null) {
			return;
		}
		long pid = m.getNumber("parent_id").longValue();
		if (pid == 0) {
			return;
		}
		authPid.add(pid);

		Menu p = getParent(menus, pid);
		findParent(authPid, menus, p);
	}
	

	private static synchronized  boolean  doInitDB(Controller c) {
		String ip = c.getPara("ip");
		Integer port = c.getInt("port");
		
		
		String mainDb = c.getPara("mainDb");
		String mainUserName = c.getPara("mainUserName");
		String mainPsw = c.getPara("mainPsw");
		boolean mainAllowCreate =	c.getBoolean("mainAllowCreate", false);
		
		String bbDb = c.getPara("bbDb");
		String bbUserName = c.getPara("bbUserName");
		String bbPsw = c.getPara("bbPsw");
		boolean bbAllowCreate =	c.getBoolean("bbAllowCreate", false);

		
		InstallService bbInstallService = new InstallService(bbDb, bbUserName, bbPsw, ip, port);
		InstallService mainInstallService = new InstallService(mainDb, mainUserName, mainPsw, ip, port);
		
		StringBuilder sucMsg = new StringBuilder();
		
		Response mainRes = mainInstallService.connDbTest();
		if((mainRes.getStatus() >= 0 && mainRes.getStatus() != 1049) 
				|| (mainRes.getStatus() == 1049 && !mainAllowCreate)) {
			c.renderJson(Response.err("主库/业务库连接失败:"+mainRes.getMsg()));
			return false;
		}
		
		Response bbRes = bbInstallService.connDbTest();
		if((bbRes.getStatus() >= 0 && bbRes.getStatus() != 1049)
				|| (bbRes.getStatus() == 1049 && !bbAllowCreate)) {
			c.renderJson(Response.err("从库/配置库连接失败:"+bbRes.getMsg()));
			return false;
		}
		
		
	
		
		//第二步，如果上述库都是自己创建的，则导入数据库 ,小于0为成功，-1=存在(如果表为空也可以导入)，-2=创建成功()
		if(mainRes.getStatus() == 1049) {
			mainRes = mainInstallService.sureAndCreateDB( mainAllowCreate);
			if(mainRes.getStatus()>=0) {
				c.renderJson(Response.err("主库/业务库连接失败:"+mainRes.getMsg()));
				return false;
			}else if(mainRes.getStatus() == -2)
				sucMsg.append("创建主库/业务库："+mainInstallService.getDbExecuter().getDbName() +" 成功！<br>");
		}
		
		if(bbRes.getStatus() == 1049 ) {
			bbRes = bbInstallService.sureAndCreateDB( bbAllowCreate);
			if(bbRes.getStatus()>=0) {
				
				c.renderJson(Response.err("从库/配置库连接失败:"+mainRes.getMsg()));
				return false;
			}else if(bbRes.getStatus() == -2)
				sucMsg.append("创建从库/配置库："+bbInstallService.getDbExecuter().getDbName() +" 成功！<br>");
		}
		
		
		
		
		boolean result = mainInstallService.doInitDatabase(xx.getConfig("init_file_main"));
		if(result)
			sucMsg.append("初始主库/业务库："+mainInstallService.getDbExecuter().getDbName() +" 成功！<br>");
		result = bbInstallService.doInitDatabase(xx.getConfig("init_file_bb"));
		if(result)
			sucMsg.append("初始从库/配置库："+bbInstallService.getDbExecuter().getDbName() +" 成功！<br>");
		
		//把配置文件回写入
		InstallUtil.createBBJdbcPropertiesFile(mainInstallService, bbInstallService);
		
		String msg = sucMsg.toString();
		if(xx.isEmpty(msg)) {
			msg = "初始成功.";
		}
		c.renderJson(Response.suc(msg));
		return true;
	}


}