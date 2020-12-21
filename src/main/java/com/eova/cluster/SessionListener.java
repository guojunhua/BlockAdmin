package com.eova.cluster;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.util.JacksonUtil;
import com.eova.config.EovaConst;
import com.eova.interceptor.SessionInterceptor;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.fasterxml.jackson.databind.ObjectMapper;


/**
* @Description:监控session，主要是用户登录退出的时候同步RedisSession(本处的session失效，不会触发被踢出)
* 如果可以可以增加MQ，通知存在此session的服务器同步session信息
* 此方案存在问题：单用户在A服务器运行，后因为什么原因切到B服务器，此时会拿到最新的session，操作了session后，又切回A服务器，可能导致不是最新的session（后面有空了增加同步session version来控制是否最新）
* 2、同一个对象 重新设置进 不会触发attributeReplaced,系统设计的操作过X次，系统将自动同步session
* @author 作者:Administrator
* @createDate 创建时间：2020年4月16日 下午11:32:44
* @version 1.0     
*/
public class SessionListener implements HttpSessionAttributeListener  {
	
	private final static String SESSION_SYN_FLAG_KEY = "bb_session_syn";
	
	
	 public void attributeAdded(HttpSessionBindingEvent event) {
		 Cache cache = Redis.use();
			if(cache == null) {//直接退出
				return;
			}
			
//			System.out.println(event.getName()+" add");
			
			if(excludeEvent(event.getName()))
				return ;
				
			
         // 如果添加的属性是 ，(不管是什么信息)，都同步下redis
         //if (event.getName().equals(EovaConst.USER)) {
			session2cache(event.getSession(),cache);
       
	 }

  
     public void attributeRemoved(HttpSessionBindingEvent event) {
    	 Cache cache = Redis.use();
 		if(cache == null) {//直接退出
 			return;
 		}
 		
// 		System.out.println(event.getName()+" Remove");
 		
 		if(excludeEvent(event.getName()))
			return ;
 		
 		//有可能是退出
 		session2cache(event.getSession(),cache);
     }

     public void attributeReplaced(HttpSessionBindingEvent event) {
    	 Cache cache = Redis.use();
 		if(cache == null) {//直接退出
 			return;
 		}
 		
// 		System.out.println(event.getName()+" Replace");
 		
 		if(excludeEvent(event.getName()))
			return ;
 		
 		session2cache(event.getSession(),cache);
     }
     
     
     private boolean excludeEvent(String eventName) {
    	 if(SessionInterceptor.BB_TOKEN_SYN_COUNT.equals(eventName) 
  				|| SessionInterceptor.BB_TOKEN_KEY.equals(eventName)
  				|| SESSION_SYN_FLAG_KEY.equals(eventName))
  			return true;
    	 else
    		 return false;
     }
     
     /**
      * 提取session值至cache（强制）
     * @param session
     * @param sessionValues
     */
    public static void session2cache(HttpSession session,Cache cache) {
    	String flag =(String)session.getAttribute(SESSION_SYN_FLAG_KEY);
    	
    	if(flag != null ) {
    		//System.out.println("正在同步，不上送至cache");
    		return;
    	}
    	Map sessionValues = new HashMap();
    	Enumeration<String> keys = session.getAttributeNames();
    	 while(keys.hasMoreElements()) {
    		 
    		 String key = keys.nextElement();
    		 if(SessionInterceptor.BB_TOKEN_SYN_COUNT.equals(key)){
    			 continue;
    		 }
    		 sessionValues.put(key, session.getAttribute(key));
    	 }
    	String bbToken = (String)session.getAttribute(SessionInterceptor.BB_TOKEN_KEY);
    	//ObjectMapper mapper = new ObjectMapper();
    	
//     	cache.set(bbToken, JacksonUtil.bean2Json(sessionValues));
    	
    	int maxInactiveSeconds = session.getMaxInactiveInterval();//
    	if(maxInactiveSeconds > 0)
    		maxInactiveSeconds = maxInactiveSeconds+10*60;//延后10分钟
    	
    	cache.setex(bbToken, maxInactiveSeconds, sessionValues);
     }
     
     public static void cacheObject2session(HttpSession session,Map cacheValues) {
    	 if(cacheValues != null) {//同步进本地session
    		 try {
				session.setAttribute(SESSION_SYN_FLAG_KEY, "");
				java.util.Set<String> keys = cacheValues.keySet();
				for (String key : keys) {
					session.setAttribute(key, cacheValues.get(key));
				} 
			} finally {
				session.removeAttribute(SESSION_SYN_FLAG_KEY);
			}
		}else {
		}
    	
     }


	
}
