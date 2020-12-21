package com.eova.interceptor;

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
import com.eova.common.utils.xx;
import com.eova.config.EovaConst;
import com.eova.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.jfinal.template.stat.ast.Set;

/**
* @Description:检测上送的 bb_authorization_token ，
* 1、如果本地Session已经标记为同步过，则不处理
* 2、如果本地Session已经标记为未同步过，则同步一次session同时标记为同步过
* @author 作者:jzhao
* @createDate 创建时间：2020年4月16日 下午11:46:15
* @version 1.0     
*/
public class SessionInterceptor implements Interceptor {
	
	public static final String DEFAULT_SESSION_ID = "JSESSIONID";
	public static final String BB_TOKEN_KEY = "bb_authorization_token";
	public static final String BB_TOKEN_SYN_COUNT = "bb_authorization_token_syn_count";

	@Override
	public void intercept(Invocation inv) {
		// TODO Auto-generated method stub
		Cache cache = Redis.use();
		if(cache == null) {//直接退出
			inv.invoke();
			return;
		}
		
		
		HttpSession session = inv.getController().getSession();//无则创建
	
		
	
		String token = getCookie(inv.getController().getRequest(),BB_TOKEN_KEY);
		if(!xx.isEmpty(token)) {//存在token
			AtomicInteger count = null;
			if(session.getAttribute(BB_TOKEN_SYN_COUNT) == null) {//本地session无信息
				count = new AtomicInteger(1);
				session.setAttribute(BB_TOKEN_SYN_COUNT, count);//不管怎么样，标为同步过了
				session.setAttribute(BB_TOKEN_KEY, token);
				
				//缓存服务器同步一次session
//				String sessionValuesString = cache.get(token); 
//				
//				if(!xx.isEmpty(sessionValuesString)) {
//					SessionListener.cacheObject2session(session, JSON.parseObject(sessionValuesString));
////					SessionListener.cacheObject2session(session,JacksonUtil.json2Bean(sessionValuesString, java.util.Map.class) );
//
//				}
				
				Map sessionValues2 = (Map)cache.get(token); 
				if(sessionValues2 != null)
				SessionListener.cacheObject2session(session,sessionValues2);
			}else {//都存在，需要更新token时间
				count = (AtomicInteger)session.getAttribute(BB_TOKEN_SYN_COUNT);
				count.getAndIncrement();
				
				
				
				if(count.intValue() % 20 == 0) {//次数越大性能越好，反之数据越精准
					SessionListener.session2cache(session, cache);
				}
			}
			
		}
		
		if(xx.isEmpty(token)) {//完全新用户
			token = setCookie(inv.getController().getResponse(),BB_TOKEN_KEY);
			
			AtomicInteger count = new AtomicInteger(1);
			session.setAttribute(BB_TOKEN_SYN_COUNT, count);//也同样标为同步过了
			session.setAttribute(BB_TOKEN_KEY, token);
		}
		
		
		inv.invoke();
		return;
	}
	
	/**
     * 获取cookie
     * @param request
     * @param key
     * @return
     */
    public static String getCookie(HttpServletRequest request, String key){
        if(request == null || xx.isEmpty(key)){
            return null;
        }
        Cookie[] cookies = request.getCookies();
        if(cookies != null)
	        for (Cookie cookie : cookies) {
	            if(key.equals(cookie.getName())){
	                return cookie.getValue();
	            }
	        }
        return null;
    }
    
    public static String setCookie(HttpServletResponse response, String key){
    	String cookieValue = UUID.randomUUID().toString();
    	Cookie cookie = new Cookie(key, cookieValue);
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        //cookie.setDomain("*");
        cookie.setMaxAge(86400);//1天=24*60*60 秒
        response.addCookie(cookie);
        
        return cookieValue;
    }
}
