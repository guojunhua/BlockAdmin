/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.user;

import com.eova.common.Easy;
import com.eova.common.Response;
import com.eova.common.utils.EncryptUtil;
import com.eova.common.utils.xx;
import com.eova.config.EovaConst;
import com.eova.model.User;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 用户管理( 修改完信息，需要更新session)
 * 
 * @author Jieven
 * @date 2014-9-11
 */
public class UserController extends Controller {
	
	public void toSwitchSkin() {
		xx.render(this,"/eova/skin.html");
	}
	

	
	/**
	 * 修改密码
	 */
	public void updatePwd() {
		String oldPwd = getPara("oldPwd");
		String newPwd = getPara("newPwd");
		String confirm = getPara("confirmPwd");

		if (xx.isOneEmpty(oldPwd, newPwd, confirm)) {
			renderJson(new Easy("三个密码都不能为空"));
			return;
		}

		// 新密码和确认密码是否一致
		if (!newPwd.equals(confirm)) {
			renderJson(new Easy("新密码两次输入不一致"));
			return;
		}

		// 当前用户
		User user = getSessionAttr(EovaConst.USER);
		user = User.dao.findById(user.get("id"));
		String pwd = user.getStr("login_pwd");
		// 旧密码是否正确
		if (!pwd.equals(EncryptUtil.getSM32(oldPwd))) {
			renderJson(new Easy("密码错误"));
			return;
		}

		// 修改密码
		user.set("login_pwd", EncryptUtil.getSM32(newPwd)).update();
		
		this.setSessionAttr(EovaConst.USER, user);
		renderJson(new Easy());
	}
	
	/**
	 * 修改密码
	 */
	public void toUpdatePwd() {
		User user = getSessionAttr(EovaConst.USER);
		
		this.setAttr("user", user);
		xx.render(this,"/eova/user/changePwd.html");
	}
	

	
	// 修改密码
//	public void pwd() {
//		int id = getParaToInt(0);
//		String str = getPara(1);
//
//		if (xx.isEmpty(str)) {
//			renderJson(new Easy("密码不能为空！"));
//			return;
//		}
//		if (str.length() < 6) {
//			renderJson(new Easy("密码不能少于6位！"));
//			return;
//		}
//
//		User user = new User();
//		user.set("id", id);
//		user.set("login_pwd", EncryptUtil.getSM32(str));
//		user.update();
//
//		renderJson(new Easy());
//	}
	
	//检测自己的密码是否正确
		public void isOldPwdOK() throws Exception {
			String oldPwd = this.getPara("oldPwd");
			
			User user =	getSessionAttr(EovaConst.USER);
			
			if (user.getStr("login_pwd").equals(EncryptUtil.getSM32(oldPwd))) {
				renderJson(Response.suc(""));
			}else {
				renderJson(Response.err("原密码错误"));
			}
			
		}
		
		/**
		 * 远程校验用户是否存在
		 * @throws Exception
		 */
		public void isUserExit() throws Exception {
			String login_id = this.getPara("login_id");
			
			String id = this.getPara("id");
			
			Record user = Db.use(EovaConst.DS_MAIN).findFirst("select * from t_user where login_id=?", login_id);
			
			if(user == null || user.get("id").toString().equalsIgnoreCase(id))
				renderJson(Response.suc(""));
			else
				renderJson(Response.err("用户存在."));
			
		}

}