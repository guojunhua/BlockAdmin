package com.eova.template.bi;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.HttpUtils;
import com.eova.common.utils.xx;
import com.eova.common.utils.util.HttpClientUtil;
import com.eova.config.EovaConst;
import com.eova.core.menu.config.MenuConfig;
import com.eova.model.Button;
import com.eova.model.Menu;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.jfinal.core.Controller;

/**
* @Description:2种模式：（集成帆软）
* 1、直接url 则重定向
* 2、根据名称显示bi图（提取accessToken），推荐是一个小时提取一次（还是系统启动提取一次文档未给明确信息）
* @author 作者:jzhao
* @createDate 创建时间：2020年4月29日 下午3:34:13
* @version 1.0     
*/
public class BiController extends Controller {
	final Controller ctrl = this;
	
	private static String tokenUrl = "/login/cross/domain?fine_username=%s&fine_password=%s&validity=-1";
	//private static String tokenUrl = "/login/cross/domain?fine_username=%&fine_password=%&validity=-1";
	
	public void list() {

		String menuCode = this.getPara(0);

		// 获取元数据
		Menu menu = Menu.dao.findByCode(menuCode);
		MenuConfig config = menu.getConfig();
		//String objectCode = config.getObjectCode();
		//MetaObject object = MetaObject.dao.getByCode(objectCode);
//		List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);

		// 根据权限获取功能按钮
		User user = this.getSessionAttr(EovaConst.USER);
		List<Button> btnList = Button.dao.queryByMenuCode(menuCode, user,this);


		setAttr("menu", menu);
		setAttr("btnList", btnList);
		//setAttr("object", object);
		
		
		
		//如果配置的是地址，直接重定向，否则提取
		if(!xx.isEmpty( menu.getStr("url") ) ) {
			this.redirect(menu.getStr("url"));
		}else {
			//String token = getAccessToken();
			
			String reportId = menu.getConfig().getParams().getString("reportId");
			
			//setAttr("accessToken", token);
			setAttr("reportId", reportId);
			
	
			setAttr("domain", xx.getConfig("bi.domain"));
			setAttr("acc", xx.getConfig("bi.view.acc"));
			setAttr("psw", xx.getConfig("bi.view.psw"));
			
	
			//this.forwardAction(actionUrl);
			xx.render(this,"/eova/template/bi/list.html");
		}
		
		
	}
	private String getAccessToken() {
		HttpClientUtil http = HttpClientUtil.getInstance();
		String domain = xx.getConfig("bi.domain");
		String acc = xx.getConfig("bi.view.acc");
		String psw = xx.getConfig("bi.view.psw");
		
		//callback({"accessToken":"eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJmYW5ydWFuIiwiaWF0IjoxNTg4MTQ1NTMxLCJleHAiOjE1ODgxNDkxMzEsInN1YiI6Imp6aGFvIiwiZGVzY3JpcHRpb24iOiJqemhhbyhqemhhbykiLCJqdGkiOiJqd3QifQ.Tcl8y9nipCszAxbpTYOmyy3rz3TUy6KGmh23jAxIK3c","url":"http://127.0.0.1:37799/webroot/decision?fine_username=jzhao&fine_password=000000&validity=-1","status":"success"})
		String url = domain+String.format(tokenUrl, acc,psw);
		String result = http.get(url);
		if(!xx.isEmpty(result) && result.indexOf("accessToken") != -1) {
			result = result.substring(result.indexOf("(")+1,result.lastIndexOf(")"));
			
			return JSON.parseObject(result).getString("accessToken");
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		String result = "callback({\"accessToken\":\"eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJmYW5ydWFuIiwiaWF0IjoxNTg4MTQ1NTMxLCJleHAiOjE1ODgxNDkxMzEsInN1YiI6Imp6aGFvIiwiZGVzY3JpcHRpb24iOiJqemhhbyhqemhhbykiLCJqdGkiOiJqd3QifQ.Tcl8y9nipCszAxbpTYOmyy3rz3TUy6KGmh23jAxIK3c\",\"url\":\"http://127.0.0.1:37799/webroot/decision?fine_username=jzhao&fine_password=000000&validity=-1\",\"status\":\"success\"})";
		result = result.substring(result.indexOf("(")+1,result.lastIndexOf(")"));
		 ;
		System.out.println(JSON.parseObject(result).getString("accessToken"));
	}
}
