package com.oss.job;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

import org.quartz.JobExecutionContext;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.xx;
import com.eova.common.utils.util.HttpClientUtil;
import com.eova.model.EovaLog;

/**
 * 每分钟执行
 *
 * @author Jieven
 * @date 2014-7-7
 */
public class EveryMinJob extends AbsJob {

	@Override
	protected void process(JobExecutionContext context) {
		//System.out.println("每分钟任务");
		
		initLogs();
	}
	
	
	public static Map<String,JSONObject> cache = new ConcurrentHashMap();
	
	/*
	 * 比较好收费的： https://mall.ipplus360.com/pros/IPGeoAPI
	 */		
		
	//{"code":0,"data":{"ip":"121.237.235.0","country":"中国","area":"","region":"江苏","city":"南京","county":"XX","isp":"电信","country_id":"CN","area_id":"","region_id":"320000","city_id":"320100","county_id":"xx","isp_id":"100017"}}
	private static final String query_tb = "http://ip.taobao.com/service/getIpInfo.php?ip=";
	//var lo="加利福尼亚州", lc="芒廷维尤"; var localAddress={city:"芒廷维尤", province:"加利福尼亚州"}
	private static final String query_ws = "http://ip.ws.126.net/ipquery?ip=";
	//返回一个复杂页面
	private static final String query_ip = "https://ip.cn/?ip=";
	
	private void initLogs() {
		// 查询500条无城市日志，并修复
		List<EovaLog> logs = EovaLog.dao.getUnInitLogs();
		int x= 0 ;
		for (EovaLog one : logs) {
			String ip = one.getStr("ip");
			System.out.println((x++)+":"+ip);
			if (!StringUtils.isEmpty(ip)) {
				if("0:0:0:0:0:0:0:1".equalsIgnoreCase(ip) || "127.0.0.1".equalsIgnoreCase(ip)){
					one.set("city", "本地").update();

						continue;
				}
				
				JSONObject obj = cache.get(ip);
				boolean isNew = false;
				if (obj == null) {
					obj = getByIP( ip);
					isNew = true;
				}
				
				
				
				
				
				if( obj != null ){
					
					{
				
							
							if(isNew)
								cache.put(ip, obj);
							
							String value = obj.getString("region") + "-"
									+ obj.getString("city");
							one.set("city", value).update();
						
					}
					
					
				}

			}

		}

	}
	
	public static JSONObject getByIP(String ip) {
		try {
			Random r = new Random();
			String json = null;
			if(r.nextBoolean()) {
//			if(false) {
				json = HttpClientUtil.getInstance().getWithRealHeader(EveryMinJob.query_tb + ip);
				JSONObject jsonObj = JSON.parseObject(json, JSONObject.class);
				
				Integer code = jsonObj.getInteger("code");
				if (code != null && code == 0) { 
					return jsonObj.getJSONObject("data");
				}
			}else {
				json = HttpClientUtil.getInstance().getWithRealHeader(query_ws + ip);
				//数据需要处理成规范的格式 var lo="加利福尼亚州", lc="芒廷维尤"; var localAddress={city:"芒廷维尤", province:"加利福尼亚州"}
				//JSONObject jsonObj  = new JSONObject();
				
					//所在地理位置
				if(json.indexOf("localAddress=")  != -1) {
					json = 	json.substring(json.indexOf("localAddress=")+"localAddress=".length());
					JSONObject jsonObj = JSON.parseObject(json, JSONObject.class);
					
					if(!xx.isEmpty(jsonObj.getString("city")) || !xx.isEmpty(jsonObj.getString("province")) ) {
						JSONObject newObj  = new JSONObject();
						//"region":"江苏","city":"南京"
						newObj.put("region", jsonObj.getString("province"));
						newObj.put("city", jsonObj.getString("city"));
						return newObj;
					}
				}	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		
		return null;
	}
			 
	
	public static void main(String[] args) {
		System.out.println(getByIP("121.237.235.0"));
		
		System.out.println(getByIP("121.237.235.0"));
		System.out.println(getByIP("121.237.235.0"));
		System.out.println(getByIP("121.237.235.0"));
		System.out.println(getByIP("121.237.235.0"));
	}
						
	
}
