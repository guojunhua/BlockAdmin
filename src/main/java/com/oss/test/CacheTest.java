package com.oss.test;

import net.oschina.j2cache.CacheChannel;
import net.oschina.j2cache.J2Cache;

/**
* @Description:TODO
* @author 作者:jzhao
* @createDate 创建时间：2020年5月18日 下午11:41:12
* @version 1.0     
*/
public class CacheTest {
	
	public static void main(String[] args) {
		CacheChannel cache = J2Cache.getChannel();
	    
	    //缓存操作
	    cache.set("default", "1", "Hello J2Cache1");
	    cache.set("default", "2", "Hello J2Cache2");
	    System.out.println(cache.get("default", "1"));
	    cache.evict("default", "1");
	    System.out.println(cache.get("default", "1"));
	    
	    cache.clear("default");
	    System.out.println(cache.get("default", "2"));
	    cache.close();
	}
}
