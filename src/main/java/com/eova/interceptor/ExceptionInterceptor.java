package com.eova.interceptor;

import org.apache.log4j.Logger;

import com.eova.common.Response;
import com.eova.common.utils.xx;
import com.eova.config.EovaConst;
import com.eova.exception.BusinessException;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.render.ErrorRender;

/**
* @Description:统一异常处理
* @author 作者:jzhao
* @createDate 创建时间：2020年3月26日 下午1:08:05
* @version 1.0     
*/
public class ExceptionInterceptor implements Interceptor {
	 private static final Logger log = Logger.getLogger(ExceptionInterceptor.class);
	@Override
	public void intercept(Invocation inv) {
		// TODO Auto-generated method stub
		try {
		      inv.invoke();
		  	}catch(BusinessException e) {
		  		log.error(e.getMessage());
		  		
		  		 if (xx.isJsonPattern(inv.getController())) {
		    		 inv.getController().renderJson(Response.err(e.getMessage()));
		    	 }else {
		    		 inv.getController().setAttr(EovaConst.BB_ERROR_KEY, e.getMessage());
		    		 inv.getController().renderError(500);
		    	 }
		    }catch(Exception e) {
		    	e.printStackTrace();
		    	log.error(e.getMessage());
		    	
		    	 if (xx.isJsonPattern(inv.getController())) {
		    		 inv.getController().renderJson(Response.err("系统故障稍后再试!"));
		    	 }else {
		    		 inv.getController().setAttr(EovaConst.BB_ERROR_KEY, "系统故障稍后再试!");
		    		 inv.getController().renderError(500);
		    	 }
		    	      
		    	      
		  }
	}

}
