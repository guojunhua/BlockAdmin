package com.eova.interceptor;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.eova.cluster.SessionListener;
import com.eova.common.Response;
import com.eova.common.utils.xx;
import com.eova.common.utils.util.AntPathMatcher;
import com.eova.config.EovaConfig;
import com.eova.config.EovaConst;
import com.eova.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.jfinal.template.stat.ast.Set;

/**
* @Description:检测上送的 检测db是否完整，可以认为是第一次初始化
* @author 作者:jzhao
* @createDate 创建时间：2020年6月3日 下午11:46:15
* @version 1.0     
*/
public class InitInterceptor implements Interceptor {
	
	public static ArrayList<String> excludes = new ArrayList<String>();
	static {
		excludes.add("/initStepOne");
		excludes.add("/initStepTwo");
		excludes.add("/doInit");

	}

	@Override
	public void intercept(Invocation inv) {
		String uri = inv.getActionKey();
		
		if(EovaConfig.INIT_SUC.intValue() == 0) {
			//排除地址继续
			AntPathMatcher pm = new AntPathMatcher();
			for (String pattern : excludes) {
				if (pm.match(pattern, uri)) {
					inv.invoke();
					return;
				}
			}

			//其他重定向
			xx.redirect(inv.getController(), Response.STATUS_ERR_UNINIT,"数据库未配置.", EovaConst.INIT_PATH);
			return;
		}
		
		inv.invoke();
	}
	
	
}
