package com.eova.common.plugin.cache;

import java.io.IOException;
import java.util.Map;

import com.eova.common.utils.xx;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.cache.ICache;

import net.oschina.j2cache.CacheChannel;
import net.oschina.j2cache.J2CacheBuilder;
import net.oschina.j2cache.J2CacheConfig;

/**
 * J2Cache 同时支持无缓存
 * @author jzhao
 *
 */
public class J2Cache implements ICache{
	
	private String db ;
	private CacheChannel cache ;
	private Map<String,String> cacheExpire;
	private long defaultTimeToLiveInSeconds = 0;//默认不缓存
	
	public J2Cache(String dbName,CacheChannel cache,Map<String,String> cacheExpire) {
		this.cache = cache;
		this.db = dbName;
		this.cacheExpire = cacheExpire;
		if(cacheExpire != null)
		this.defaultTimeToLiveInSeconds = expireValue2Long(cacheExpire.get("default"));
	}
	
	@Override
	public <T> T get(String cacheName, Object key) {
		// TODO Auto-generated method stub
		
		if(cache == null)
			return null;

		return (T)cache.get(db+"_"+cacheName, key.toString()).getValue();
	}

	@Override
	public void put(String cacheName, Object key, Object value) {
		if(cache == null)
			return ;

		
		// TODO Auto-generated method stub
		if(cacheExpire != null) {
			long timeToLiveInSeconds = getTimeToLiveInSeconds(db+"_"+cacheName);
			if(timeToLiveInSeconds>0)
				cache.set(db+"_"+cacheName, key.toString(), value, timeToLiveInSeconds);
		}else
			cache.set(db+"_"+cacheName, key.toString(), value);
	}

	@Override
	public void remove(String cacheName, Object key) {
		if(cache == null)
			return ;

		// TODO Auto-generated method stub
		cache.evict(db+"_"+cacheName, key.toString());
	}

	@Override
	public void removeAll(String cacheName) {
		if(cache == null)
			return ;

		// TODO Auto-generated method stub
		LogKit.info("clearn cache:" + db+"_"+cacheName);
		//cache.clear(db+"_"+cacheName);//清除直接卡死
		cache.clear(db+"_"+cacheName);
		
		LogKit.info("clearn cache:%s end" , db+"_"+cacheName);
	}
	
	
	public long getTimeToLiveInSeconds(String cacheName) {
		String value = cacheExpire.get(cacheName);
		if(!xx.isEmpty(value)) {
			return expireValue2Long(value);
		}
		return defaultTimeToLiveInSeconds;
	}
	
	//xxxx[s|m|h|d]结尾
	private long expireValue2Long(String expireValue) {
		long mstime = 0;
		expireValue = expireValue.trim();
		try {
			if(expireValue.endsWith("s")) {
				mstime = Long.parseLong(expireValue.substring(0, expireValue.length()-1));
			}else if(expireValue.endsWith("m")) {
				mstime = Long.parseLong(expireValue.substring(0, expireValue.length()-1))*60;
			}else if(expireValue.endsWith("h")) {
				mstime = Long.parseLong(expireValue.substring(0, expireValue.length()-1))*60*60;
			}else if(expireValue.endsWith("d")) {
				mstime = Long.parseLong(expireValue.substring(0, expireValue.length()-1))*24*60*60;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		return mstime;
	}

}
