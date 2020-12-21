/**
 * 
 */
package com.oss.user;

import com.eova.common.Easy;
import com.eova.common.Response;
import com.eova.common.utils.EncryptUtil;
import com.eova.common.utils.xx;
import com.eova.config.EovaConst;
import com.eova.model.User;
import com.eova.model.UserInfo;
import com.eova.service.ServiceManager;
import com.eova.widget.upload.UploadAliyunController;
import com.eova.widget.upload.UploadController;
import com.eova.widget.upload.UploadQiniuController;
import com.eova.widget.upload.UploadController.FileStatus;
import com.jfinal.core.Controller;
import com.jfinal.core.NotAction;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.oss.model.Product;

/**
 * 用户管理( 修改完信息，需要更新session)
 * @author jin
 *
 */
public class UserInfoController extends UploadController  {
	/**
	 * 去修改头像
	 */
	public void toAvatar() {
		User user = getSessionAttr(EovaConst.USER);
	
		this.setAttr("user", user);
		xx.render(this,"/eova/user/avatar.html");
	}
	
	/**
	 * 更新头像
	 */
	public void updateAvatar() {
		FileStatus status = upload(null,1,"avatarfile");
		System.out.println(status);
		
		User user = getSessionAttr(EovaConst.USER);
		
		if(status.isSuccess()) {
			String url = status.getFileName();

			UserInfo info = UserInfo.dao.findById(user.get("id"));
			info.set("avatar", url);
			info.update();
			user.userInfo = info;
			
			renderJson(Response.suc("更新成功"));
		}else {
			renderJson(Response.err("更新失败"));
		}
		
		
		
		
	}
	
	
	/**
	 * 修改信息
	 */
	public void toUpdateInfo() {
		User user = getSessionAttr(EovaConst.USER);
	
		this.setAttr("user", user);
		//额外查询部分（部门 和 角色名），后面业务调整需要调整
		if(user.userInfo != null) {
			Object depId = user.userInfo.get("dep_id");
			if(depId != null) {
				Record department = Db.findById("t_department", depId);
				if(department != null)
					this.setAttr("dep_name", department.getStr("department"));
					
			
			}
		}
		xx.render(this,"/eova/user/userInfo.html");
	}
	
	public void updateInfo() {
		User user = getSessionAttr(EovaConst.USER);
		
		
		
		String nickName = getPara("nickName");
		String mobile = getPara("mobile");
		String email = getPara("email");
		Integer sexy = this.getInt("sexy");
	
		
		UserInfo info = UserInfo.dao.findById(user.get("id"));
		
		info.set("nickName", nickName);
		info.set("mobile", mobile);
		info.set("email", email);
		info.set("sexy", sexy);
		info.update();
		
		user.userInfo = info;
		renderJson(new Easy());
	}
	
	@NotAction
	public FileStatus upload( String fileDir,int type,String name) {
		FileStatus status = super.upload(fileDir, type, name);
		
		
		if(status.isSuccess()){//处理成功的云存储
			
			if("1".equals(xx.getConfig("oss_static")))
				//执行完成，修改status transStatus
				ServiceManager.qiniuService.upload(status);
			else if("2".equals(xx.getConfig("oss_static")))
				//执行完成，修改status transStatus
				ServiceManager.aliOssService.upload(status);
			
		}
		
		return status;
	}

}
