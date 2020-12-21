package com.eova.common.base;

import com.jfinal.plugin.ehcache.CacheKit;

import net.oschina.j2cache.CacheChannel;

/**
 * Cache 公共实现
 * 
 * @author Jieven
 *
 */
public class BaseCache {
	

	
//	/** 本系统默认CacheName-空闲30Min超时,60Min有效,最少使用策略 **/
//	public static final String SYS = "sysCache";
//	/** Service CacheName-30s有效,最好在启动的时候重置此 **/
	public static final String SER = "serviceCache";
	/** Exp CacheName-30s有效,表达式，来源比较复杂，时间最好比较短，60秒比较 **/
	public static final String EXP = "expCache";
	
	/**
	 * 图表缓存
	 */
	public static final String ECHARTS = "echartsCache";
//	/** Service CacheName-30min有效,最近最少使用策略 **/
//	public static final String BASE = "baseCache";
//	/** Player CacheName-空闲30Min超时,永久有效,最少使用策略 **/
//	public static final String PLAYER = "playerCache";
//
//	private static Object getCache(String cacheName, String key) {
//		return CacheKit.get(cacheName, key);
//	}
//
//	// System Cache方法
//	public static Object get(String key) {
//		return getCache(SYS, key);
//	}
//
//	public static void put(String key, Object value) {
//		CacheKit.put(SYS, key, value);
//	}
//
//	public static void del(String key) {
//		CacheKit.remove(SYS, key);
//	}
//
//	// Service Cache方法
//	public static Object getSer(String key) {
//		return getCache(SER, key);
//	}
//
//	public static void putSer(String key, Object value) {
//		CacheKit.put(SER, key, value);
//	}
//
//	public static void delSer(String key) {
//		CacheKit.remove(SER, key);
//	}
}
