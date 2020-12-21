package com.eova.common.base;

import java.util.List;

import com.eova.common.utils.xx;
import com.eova.config.EovaConst;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;
import com.jfinal.plugin.activerecord.cache.ICache;

/**
 * @author Administrator
 * 提供了缓存查询方案，支持 送 cacheName 以及不送的情况
 * @param <M>
 */
@SuppressWarnings("rawtypes")
public class BaseModel<M extends Model> extends Model<M> {

	private static final long serialVersionUID = 1702469565872353932L;

	
//	public List<M> findByCache( String sql) {
//		
//		return this.findByCache(this.getClass().getSimpleName(), key, sql);
//	}
//	
//	
//	public List<M> findByCache( String sql, Object... paras) {
//		return super.findByCache(this.getClass().getSimpleName(), key, sql, paras);
//	}

	/**
	 * 根据主键获取对象(cache 3 min)
	 * 
	 * @param id 主键
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public M getByCache(Object id) {
		return this.getByCache(this.getClass().getSimpleName(), id);
	}

	/**
	 * 查询自动缓存
	 * 
	 * @param sql
	 * @return
	 */
	public List<M> queryByCache(String sql) {
		// 查询SQL作为Key值
		return findByCacheWithCacheName(this.getClass().getSimpleName(), sql, sql);
	}

	/**
	 * 查询自动缓存
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public List<M> queryByCache( String sql, Object... paras) {
		// sql_xx_xx_xx
		
		return findByCacheWithCacheName(this.getClass().getSimpleName(),  sql, paras);
	}

	/**
	 * 缓存查询第一项
	 * 
	 * @param sql
	 * @return
	 */
	public M queryFisrtByCache(String sql) {
		return this.queryFisrtByCacheWithCacheName(this.getClass().getSimpleName(), sql);
		
	}

	/**
	 * 缓存查询第一项
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public M queryFisrtByCache(String sql, Object... paras) {
		return this.queryFisrtByCacheWithCacheName(this.getClass().getSimpleName(), sql, paras);
	}

	/**
	 * 缓存分页查询
	 * 
	 * @param pageNumber 页码
	 * @param pageSize 数量
	 * @param select 查询前缀
	 * @param sqlExceptSelect 查询条件
	 * @return
	 */
	public Page<M> pagerByCache(int pageNumber, int pageSize, String select, String sqlExceptSelect) {
		return this.pagerByCacheWithCacheName(this.getClass().getSimpleName(), pageNumber, pageSize, select, sqlExceptSelect);
	}

	/**
	 * 缓存分页查询
	 * 
	 * @param pageNumber 页码
	 * @param pageSize 数量
	 * @param select 查询前缀
	 * @param sqlExceptSelect 查询条件
	 * @param paras SQL参数
	 * @return
	 */
	public Page<M> pagerByCache(int pageNumber, int pageSize, String select, String sqlExceptSelect, Object... paras) {
		return this.pagerByCacheWithCacheName(this.getClass().getSimpleName(), pageNumber, pageSize, select, sqlExceptSelect, paras);
	}
	
	/**
	 * 清除缓存
	 */
	public void removeAllCache() {
		this.removeAllCache(this.getClass().getSimpleName());
	}
	public void removeByKey(String key ) {
		remove(null,key);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public List<M> findByCacheWithCacheName(String cacheName, Object key, String sql) {
		// Base数据缓存30Min
		// if (sql.contains("from base_")) {
		// cacheName = BaseCache.BASE;
		// }
		return super.findByCache(cacheName, key, sql);
	}
	
	
	public List<M> findByCacheWithCacheName(String cacheName,  String sql, Object... paras) {
		String key = sql;
		for (Object obj : paras) {
			key += "_" + obj.toString();
		}
		return super.findByCache(cacheName, key, sql, paras);
	}

	/**
	 * 根据主键获取对象(cache 3 min)
	 * 
	 * @param id 主键
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public M getByCache(String cacheName,Object id) {
		String key = this.getClass().getSimpleName() + "_" + id;
		
		
		Config config = _getConfig();
		ICache cache = config.getCache();
		M me = cache.get(cacheName, key);
		if (me == null) {
			me = findById(id);
			cache.put(cacheName, key, me);
		}
		return me;
	}

	/**
	 * 查询自动缓存
	 * 
	 * @param sql
	 * @return
	 */
	public List<M> queryByCacheWithCacheName(String cacheName,String sql) {
		// 查询SQL作为Key值
		return findByCache(cacheName, sql, sql);
	}

	/**
	 * 查询自动缓存
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public List<M> queryByCacheWithCacheName(String cacheName, String sql, Object... paras) {
		// sql_xx_xx_xx
		String key = sql;
		for (Object obj : paras) {
			key += "_" + obj.toString();
		}
		return findByCache(cacheName, key, sql, paras);
	}

	/**
	 * 缓存查询第一项
	 * 
	 * @param sql
	 * @return
	 */
	public M queryFisrtByCacheWithCacheName(String cacheName,String sql) {
		List<M> list = findByCacheWithCacheName(cacheName,sql,sql);
		if (xx.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}
	
	/**
	 * 缓存查询第一项
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public M queryFisrtByCacheWithCacheName(String cacheName,String sql, Object... paras) {
		List<M> list = findByCacheWithCacheName(cacheName,sql, paras);
		if (xx.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	/**
	 * 缓存分页查询
	 * 
	 * @param pageNumber 页码
	 * @param pageSize 数量
	 * @param select 查询前缀
	 * @param sqlExceptSelect 查询条件
	 * @return
	 */
	public Page<M> pagerByCacheWithCacheName(String cacheName,int pageNumber, int pageSize, String select, String sqlExceptSelect) {
		String key = select + sqlExceptSelect + "_" + pageNumber + "_" + pageSize;
		return super.paginateByCache(cacheName, key, pageNumber, pageSize, select, sqlExceptSelect);
	}

	/**
	 * 缓存分页查询
	 * 
	 * @param pageNumber 页码
	 * @param pageSize 数量
	 * @param select 查询前缀
	 * @param sqlExceptSelect 查询条件
	 * @param paras SQL参数
	 * @return
	 */
	public Page<M> pagerByCacheWithCacheName(String cacheName,int pageNumber, int pageSize, String select, String sqlExceptSelect, Object... paras) {
		String key = select + sqlExceptSelect + "_" + pageNumber + "_" + pageSize;
		for (Object obj : paras) {
			key += "_" + obj.toString();
		}
		return super.paginateByCache(cacheName, key, pageNumber, pageSize, select, sqlExceptSelect, paras);
	}

	/**
	 * 是否存在
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public boolean isExist(String sql, Object... paras) {
		String configName = DbKit.getConfig(this.getClass()).getName();
		Long count = Db.use(configName).queryNumber(sql, paras).longValue();
		if (count != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 保存
	 */
	@Override
	public boolean save() {
		String pk = null;
		if (xx.isOracle()) {
			Table table = TableMapping.me().getTable(getClass());
			pk = table.getPrimaryKey()[0];
			// 序列默认值,
			if (this.get(pk) == null) {
				if(table.getName().toUpperCase().startsWith("T_")) {
					this.set(pk, EovaConst.SEQ_ + table.getName().toUpperCase().substring(2) + ".nextval");
				}else
					this.set(pk, EovaConst.SEQ_ + table.getName().toUpperCase() + ".nextval");
			}
		}
		boolean isSave = super.save();
		if (xx.isOracle()) {
			// 新增成功后 主键 BigDecimal->Integer
			this.set(pk, Integer.valueOf(this.get(pk).toString()));
		}
		return isSave;
	}
	
	/**
	 * 原则上更新过数据以后，必须执行此操作
	 * @param cacheName
	 */
	public void removeAllCache(String cacheName ) {
		if(xx.isEmpty(cacheName))
			cacheName = this.getClass().getSimpleName();
		//System.err.print(cacheName);
		Config config = _getConfig();
		ICache cache = config.getCache();
		cache.removeAll(cacheName);
	}
	
	public void remove(String cacheName,String key ) {
		if(xx.isEmpty(cacheName))
			cacheName = this.getClass().getSimpleName();
		//System.err.print(cacheName);
		Config config = _getConfig();
		ICache cache = config.getCache();
		cache.remove(cacheName, key);
	}
	
	
}
