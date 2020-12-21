package com.eova.oa;

import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.dingtalk.oapi.lib.aes.DingTalkEncryptException;
import com.dingtalk.oapi.lib.aes.DingTalkEncryptor;
import com.eova.common.utils.xx;
import com.eova.common.utils.util.RandomUtil;
import com.eova.model.DdCfg;
import com.eova.oa.config.Constant;
import com.eova.service.ServiceManager;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.oss.job.DdSynJob;

/**
* @Description:目前钉钉的回调通知
* @author 作者:jzhao
* @createDate 创建时间：2020年5月8日 上午11:55:25
* @version 1.0     
*/
public class OaController extends Controller {
	private static final Logger log = LogManager.getLogger(OaController.class);

    private static final String CALLBACK_RESPONSE_SUCCESS = "success";
    
    /**
     * 创建套件后，验证回调URL创建有效事件（第一次保存回调URL之前）
     */
    private static final String EVENT_CHECK_CREATE_URL = "check_url";
    
    private static final String BPMS_TASK_CHANGE = "bpms_task_change";
    private static final String BPMS_INSTANCE_CHANGE = "bpms_instance_change";
	
	public void ddEventReceive() {
	 	Integer org_id = this.getInt(0);
		String signature =  this.get("signature");
		String timestamp =  this.get("timestamp");
		String nonce =  this.get("nonce");
		
		DdCfg cfg = null;
		if(org_id != null) {
			cfg = DdCfg.dao.queryTheCfg(org_id);
		}
		if(cfg == null) {
			 this.renderText("无此机构");
			 return;
		}
		
		try {
			String reqJson =  HttpKit.readData(getRequest()) ;
			
	        String paramStr = " signature:"+signature + " timestamp:"+timestamp +" nonce:"+nonce+" json:"+reqJson;
	        log.info("钉钉回调参数:"+paramStr);
			
			DingTalkEncryptor dingTalkEncryptor = new DingTalkEncryptor(Constant.TOKEN, Constant.ENCODING_AES_KEY,
					cfg.getStr("corp_id"));
			
			
			JSONObject params = JSON.parseObject(reqJson) ;
			
			String encryptMsg = params.getString("encrypt");
			String plainText = dingTalkEncryptor.getDecryptMsg(signature, timestamp, nonce, encryptMsg);
			JSONObject obj = JSON.parseObject(plainText);
			
			 String eventType = obj.getString("EventType");
			 if (EVENT_CHECK_CREATE_URL.equals(eventType)) {
				 
			 }else if(BPMS_TASK_CHANGE.equals(eventType) || BPMS_INSTANCE_CHANGE.equals(eventType)) {
				 ServiceManager.oaService.processEvent(obj);
			 }else {
				 log.info("钉钉回调其他事件不予处理。");
			 }

			
			 
			Map result =  dingTalkEncryptor.getEncryptedMap(CALLBACK_RESPONSE_SUCCESS, System.currentTimeMillis(), RandomUtil.nextIntAsStringByLength(8));
			this.renderJson(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error("钉钉回调处理失败:"+e.getMessage());
			this.renderText("发生故障") ;
		}
	}
	
	
	public void testCalback() {
		System.out.println("p0:"+this.get(0)); 
		DdCfg cfg = DdCfg.dao.queryTheCfg(10);
		
		ServiceManager.dingdingService.initDD(cfg);
		
		this.renderText("发起初始结束");
	}
	
//	private JSONObject checkUrl(JSONObject params) {
//		
//		JSONObject result = new JSONObject();
//		result.put("timeStamp", String.valueOf(System.currentTimeMillis()));
//		result.put("nonce", RandomUtil.nextIntAsStringByLength(16));
//		
//		
//		result.put("msg_signature",);
//		
//		String successStr = "";
//		
//		result.put("encrypt",successStr);
//				
//		return result;
//	}
}
