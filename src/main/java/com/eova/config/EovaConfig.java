/**
 * Copyright (c) 2013-2017, Jieven. All rights reserved.
 * <p/>
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.config;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.Map.Entry;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.beetl.core.GroupTemplate;
import org.beetl.core.resource.ClasspathResourceLoader;
import org.beetl.core.resource.WebAppResourceLoader;
import org.beetl.ext.jfinal.JFinalBeetlRenderFactory;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.druid.wall.WallFilter;
import com.eova.cloud.AuthCloud;
import com.eova.common.plugin.cache.J2Cache;
import com.eova.common.plugin.quartz.QuartzPlugin;
import com.eova.common.utils.xx;
import com.eova.common.utils.io.FileUtil;
import com.eova.core.IndexController;
import com.eova.core.auth.AuthController;
import com.eova.core.button.ButtonController;
import com.eova.core.menu.MenuController;
import com.eova.core.meta.MetaController;
import com.eova.core.object.ObjectController;
import com.eova.core.task.TaskController;
import com.eova.handler.UrlBanHandler;
import com.eova.interceptor.AuthInterceptor;
import com.eova.interceptor.ExceptionInterceptor;
import com.eova.interceptor.InitInterceptor;
import com.eova.interceptor.JParaInterceptor;
import com.eova.interceptor.LoginInterceptor;
import com.eova.interceptor.MsqlInterceptor;
import com.eova.interceptor.SessionInterceptor;
import com.eova.model.Button;
import com.eova.model.Charts;
import com.eova.model.DdCfg;
import com.eova.model.EovaLog;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.OaProcess;
import com.eova.model.OaProcessTask;
import com.eova.model.Role;
import com.eova.model.RoleBtn;
import com.eova.model.RoleObjField;
import com.eova.model.Task;
import com.eova.model.User;
import com.eova.model.Widget;
import com.eova.monitor.server.controller.ServerController;
import com.eova.oa.OaController;
import com.eova.service.ServiceManager;
import com.eova.template.bi.BiController;
import com.eova.template.common.config.TemplateConfig;
import com.eova.template.dashboard.DashboardController;
import com.eova.template.masterslave.MasterSlaveController;
import com.eova.template.office.OfficeController;
import com.eova.template.single.SingleController;
import com.eova.template.singlechart.SingleChartController;
import com.eova.template.singleimg.SingleImgController;
import com.eova.template.singletree.SingleTreeController;
import com.eova.template.treetogrid.TreeToGridController;
import com.eova.user.UserController;
import com.eova.widget.WidgetController;
import com.eova.widget.form.FormController;
import com.eova.widget.grid.GridController;
import com.eova.widget.tree.TreeController;
import com.eova.widget.treegrid.TreeGridController;
import com.eova.widget.upload.UploadAliyunController;
import com.eova.widget.upload.UploadController;
import com.eova.widget.upload.UploadQiniuController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.config.Routes.Route;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.IDataSourceProvider;
import com.jfinal.plugin.activerecord.dialect.Dialect;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.eova.config.dialect.AnsiSqlDialect;
import com.eova.config.dialect.OracleDialect;
import com.eova.config.dialect.PostgreSqlDialect;
import com.eova.config.dialect.SqlServerDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.plugin.druid.IDruidStatViewAuth;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.jfinal.plugin.redis.RedisPlugin;
import com.jfinal.plugin.redis.serializer.ISerializer;
import com.jfinal.template.Engine;
//import com.mysql.jdbc.Connection;

import net.oschina.j2cache.CacheChannel;
import net.oschina.j2cache.J2CacheBuilder;
import net.oschina.j2cache.J2CacheConfig;

//import redis.clients.util.SafeEncoder;
//import redis.clients.jedis.util.SafeEncoder;

public class EovaConfig extends JFinalConfig {
	protected static Log log;
	/** EOVA所在数据库的类型 **/
	public static String EOVA_DBTYPE = "mysql";
	
	/**
	 * 主业务库
	 */
	public static String MAIN_DBTYPE = "mysql";
	
	/**
	 * 初始化是否成功:0=初始失败，1=成功
	 */
	public static AtomicInteger INIT_SUC = new AtomicInteger(1) ;
	
	/** 数据库命名规则-是否自动小写 **/
	public static boolean isLowerCase = true;

	/** Eova配置属性 **/
	protected static Map<String, String> props = new HashMap<String, String>();
	/** 数据源列表 **/
	protected static Set<String> dataSources = new HashSet<String>();
	/** Eova表达式集合 **/
	protected static Map<String, String> exps = new HashMap<String, String>();
	/** URI授权集合<角色ID,URI> **/
	protected static Map<Integer, Set<String>> auths = new HashMap<Integer, Set<String>>();

	private long startTime = 0;
	
	private String resourcesPath ;
	private CacheChannel cache;
	//相关cache
	private J2Cache mainCache = null;
	private J2Cache bbCache = null;
	

	public static Map<String, String> getProps() {
		return props;
	}

	public static Set<String> getDataSources() {
		return dataSources;
	}

	public static Map<String, String> getExps() {
		return exps;
	}

	public static Map<Integer, Set<String>> getAuths() {
		return auths;
	}

	/**
	 * 系统启动之后
	 */
	@Override
	public void onStart() {
		System.err.println("JFinal Started\n");
		// Load Cost Time
		xx.costTime(startTime);

		{
			Boolean isInit = xx.getConfigBool("initPlugins", true);
			if (isInit) {
				EovaInit.initPlugins();
			}
		}
		{
			Boolean isInit = xx.getConfigBool("initSql", false);
			if (isInit && EOVA_DBTYPE.equals(JdbcUtils.MYSQL)) {
				EovaInit.initCreateSql();
			}
		}
		
		//dd
		//ServiceManager.oaService.initCfgs();
	}

	/**
	 * 系统停止之前
	 */
	@Override
	public void onStop() {
		//程序退出时调用。
		if(cache != null)
			cache.close();
	}

	/**
	 * 配置常量
	 */
	@Override
	public void configConstant(Constants me) {
		startTime = System.currentTimeMillis();

		System.err.println("Config Constants Starting...");
		me.setEncoding("UTF-8");
		// 初始化配置
		resourcesPath = EovaInit.initConfig(props);
		
		
		
		//boolean devMode = xx.getConfigBool("devMode", true);
		String env = EovaConfig.getProps().get("env");
		if("DEV".equalsIgnoreCase(env) || "TEST".equalsIgnoreCase(env)  ){
			// 开发模式
			me.setDevMode(true);
			EovaConfig.getProps().put("isCaptcha", "false");
		}else{
			me.setDevMode(false);
			EovaConfig.getProps().put("isCaptcha", "true");
		}
		
		
		 
		// 设置主视图为Beetl
		JFinalBeetlRenderFactory rf = new JFinalBeetlRenderFactory();
        String root = PathKit.getWebRootPath();
        System.out.println("Beetl root："+root);
        rf.configFilePath(root);
   
        
        me.setRenderFactory(rf);

	
		// POST内容最大500M(安装包上传)
		me.setMaxPostSize(1024 * 1024 * 500);
		
		//me.setUrlParaSeparator("&");
	
		
		
		me.setError500View(xx.viewReal("/eova/500.html", xx.getConfig("app_template_ui")) );
		me.setError404View(xx.viewReal("/eova/404.html", xx.getConfig("app_template_ui")) );
		//me.setError404View("/eova/404_h.html" );

		// 设置静态根目录为上传根目录
		me.setBaseUploadPath(xx.getConfig("static_root"));

//		@SuppressWarnings("unused")
//		GroupTemplate group = BeetlRenderFactory.groupTemplate;

		// 设置全局变量
		final String STATIC = props.get("domain_static");//其他资源
		final String CDN = props.get("domain_cdn");//一些不变lib CDN
		final String IMG = props.get("domain_img");
		final String FILE = props.get("domain_file");

		Map<String, Object> sharedVars = new HashMap<String, Object>();
		if (!xx.isEmpty(STATIC))
			sharedVars.put("STATIC", STATIC);
		else
			sharedVars.put("STATIC", "");
		if (!xx.isEmpty(CDN))
			sharedVars.put("CDN", CDN);
		if (!xx.isEmpty(IMG))
			sharedVars.put("IMG", IMG);
		if (!xx.isEmpty(FILE))
			sharedVars.put("FILE", FILE);
		
		
		sharedVars.put("UPLOAD_IMG_SIZE", EovaConst.UPLOAD_IMG_SIZE);
		sharedVars.put("UPLOAD_FILE_SIZE", EovaConst.UPLOAD_FILE_SIZE);
		
		sharedVars.put("UPLOAD_IMG_TYPE", FileUtil.IMG_TYPE );
		sharedVars.put("UPLOAD_FILE_TYPE", FileUtil.ALL_TYPE );
		
		
		sharedVars.put("APP", AuthCloud.getEovaApp());
		
		sharedVars.put(PageConst.Template, xx.getConfig("app_template_ui"));
		
		sharedVars.put("BB_FORM_TIPS_IN", EovaConst.BB_FORM_TIPS_IN );
		
		// Load Template Const
		PageConst.init(sharedVars);
		GroupTemplate groupTemplate = rf.groupTemplate;
		groupTemplate.setSharedVars(sharedVars);

		// 初始化配置
		exp();// Eova表达式
		auth();// URI授权
		
		me.setToSlf4jLogFactory();
	}

	/**
	 * 配置路由
	 */
	@Override
	public void configRoute(Routes me) {
		System.err.println("Config Routes Starting...");
		// 如果要将控制器超类中的 public 方法映射为 action 配置成 true
		 me.setMappingSuperClass(true);
		// 业务模版
		me.add("/" + TemplateConfig.SINGLE_GRID, SingleController.class);
		me.add("/" + TemplateConfig.SINGLE_TREE, SingleTreeController.class);
		me.add("/" + TemplateConfig.SINGLE_CHART, SingleChartController.class);
		me.add("/" + TemplateConfig.MASTER_SLAVE_GRID, MasterSlaveController.class);
		me.add("/" + TemplateConfig.TREE_GRID, TreeToGridController.class);
		
		me.add("/" + TemplateConfig.IMG_GRID, SingleImgController.class);
		me.add("/"+TemplateConfig.ORG_GRID, com.eova.template.org.OrgController.class);
		
		me.add("/" + TemplateConfig.OFFICE, OfficeController.class);
		
		me.add("/" + TemplateConfig.BI, BiController.class);
		
		me.add("/" + TemplateConfig.DASHBOARD, DashboardController.class);
		
		// 组件
		me.add("/widget", WidgetController.class);
		//上传组件(有多种，实现了7牛 ，阿里云)
				if("1".equals(xx.getConfig("oss_static")))
					me.add("/upload", UploadQiniuController.class);
				else if("2".equals(xx.getConfig("oss_static")))
					me.add("/upload", UploadAliyunController.class);
				else
					me.add("/upload", UploadController.class);
		
		
		me.add("/form", FormController.class);
		me.add("/grid", GridController.class);
		me.add("/tree", TreeController.class);
		me.add("/treegrid", TreeGridController.class);
		
		
		// Eova业务
		me.add("/meta", MetaController.class);
		me.add("/menu", MenuController.class);
		me.add("/button", ButtonController.class);
		me.add("/auth", AuthController.class);
		me.add("/task", TaskController.class);
		me.add("/obj", ObjectController.class);
		
		//服务监控
		me.add("/server", ServerController.class);
		
		
		// me.add("/cloud", CloudController.class);
		
		me.add("/user", UserController.class);//用户相关的
		
		//oa相关
		me.add("/oa", OaController.class);//用户相关的
		
		
		LoginInterceptor.excludes.add("/cloud");
		LoginInterceptor.excludes.add("/oa/**");
		LoginInterceptor.excludes.add("/form/detailAuthView/**");//授权查看
		

		// 自定义路由
		route(me);

		// 如果有自定义，将不再注册系统默认实现
		addRoute(me,"/",IndexController.class,false);

		// 初始化Eova表达式配置
		auth();
	}
	
	/**
	 * 强制覆盖路由（jfinal不提供覆盖）
	 * @param me
	 * @param controllerKey
	 * @param controllerClass
	 */
	public void addRoute(Routes me,String controllerKey, Class<? extends Controller> controllerClass,boolean force ){
		//List<Routes>  me.getRoutesList();
		List<Route> routeItems = me.getRouteItemList();
		
		Optional<Route> opt = routeItems.stream().filter(r->r.getControllerKey().toString().equals(controllerKey)).findFirst();
		if(opt.isPresent()) {
			
			if(force) {
				System.out.println("Route ："+controllerKey +" repaced~~");
				routeItems.remove(opt.get());
				me.add(controllerKey, controllerClass);
			}else {
				System.out.println("Route ："+controllerKey +" existed~~");
			}
			
		}else {
			me.add(controllerKey, controllerClass);
		}
		
	}

	/**
	 * 配置插件
	 */
	@Override
	public void configPlugin(Plugins plugins) {
		System.err.println("Config Plugins Starting...");

		
		
		 
		
		try {
				J2CacheConfig config = J2CacheConfig.initFromConfig(resourcesPath+"/j2cache.properties");
				String l1CacheName = config.getL1CacheName();
				Map<String,String> cacheExpire = null;
				if("none".equalsIgnoreCase(l1CacheName)) {//只用redis，需要自己管理redis失效
					cacheExpire = new HashMap<String, String>();
					
					Iterator<Entry<Object, Object>> it = config.getProperties().entrySet().iterator();
					while (it.hasNext()) {
						Entry<Object, Object> entry = it.next();
						String key = entry.getKey().toString();
						String value = entry.getValue().toString();
						
						cacheExpire.put(key, value);
					}
				}

				//填充 config 变量所需的配置信息
				J2CacheBuilder builder = J2CacheBuilder.init(config);
				cache = builder.getChannel();
				
				bbCache = new J2Cache(EovaConst.DS_EOVA,cache,cacheExpire);
				mainCache = new J2Cache(EovaConst.DS_MAIN,cache,cacheExpire);
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		
		// BB数据源
		 initBBDb(plugins);
		
		// 默认数据源
		 initMainDb(plugins);
		

		

		// 自定义插件
		plugin(plugins);

		// 初始化ServiceManager
		ServiceManager.init();

		// 配置EhCachePlugin插件
		//plugins.add(new EhCachePlugin());
		
		// 配置RedisPlugin插件(默认创建)
		String redisHost = xx.getConfig("redis.host");
		int redisPort = xx.getConfigInt("redis.port",6379);
		String redisPassword = xx.getConfig("redis.password","");
		if(xx.isEmpty(redisPassword))
			redisPassword = null;
		
		int redisDatabase = xx.getConfigInt("redis.database",2);
		if(!xx.isEmpty(redisHost)) {
			 RedisPlugin sessionRedis = new RedisPlugin(EovaConst.SESSION_CACHE_NAME, redisHost,redisPort,redis.clients.jedis.Protocol.DEFAULT_TIMEOUT,redisPassword,redisDatabase);
//			 sessionRedis.setSerializer(new ISerializer() {			
//				    @Override
//				    public byte[] keyToBytes(String key) {
//				        return SafeEncoder.encode(key);			
//				    }			
//				    @Override			
//				    public String keyFromBytes(byte[] bytes) {				
//				        return SafeEncoder.encode(bytes);			
//				    }			
//				    @Override			
//				    public byte[] fieldToBytes(Object field) {				
//				        return valueToBytes(field);			
//				    }			
//				    @Override			
//				    public Object fieldFromBytes(byte[] bytes) {				
//				        return valueFromBytes(bytes);			
//				    }			
//				    @Override			
//				    public byte[] valueToBytes(Object value) {				
//				        return SafeEncoder.encode(value.toString());			
//				    }			
//				    @Override			
//				    public Object valueFromBytes(byte[] bytes) {				
//				        if(bytes == null || bytes.length == 0)					
//				            return null;				
//				        return SafeEncoder.encode(bytes);			
//				    }		
//				});

			 plugins.add(sessionRedis);
		}
		 
		
		 
		 
		initQuartz(plugins);
		
		//
		if(INIT_SUC.intValue() != 1) {
			//labdam方式
			new Thread(()-> {
				
				while(INIT_SUC.intValue() != 1) {
					try {
						Thread.sleep(100L);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				//重新加载参数
				EovaInit.initConfig(props);
				
				boolean resultBB = this.initBBDb(plugins);
				boolean resultMain = this.initMainDb(plugins);
				if(resultBB && resultMain) {
					initQuartz(plugins);
				}
				
				//log.info("找到DB文件，系统启动成功。");
			}).start();
		}
			

		
	}
	
	public boolean initMainDb(Plugins plugins) {
		String mainUrl, mainUser, mainPwd;
		mainUrl = xx.getConfig("main_url");
		mainUser = xx.getConfig("main_user");
		mainPwd = xx.getConfig("main_pwd");
		
		if(xx.isEmpty(mainUrl)) {
			INIT_SUC.set(0);
			return false;
		}
			
		// 默认数据源
		try{
					DruidPlugin dp = initDruidPlugin(mainUrl, mainUser, mainPwd);
					ActiveRecordPlugin arp = initActiveRecordPlugin(mainUrl, xx.DS_MAIN, dp);
					System.out.println("load data source:" + mainUrl + "/" + mainUser);
					if(mainCache != null)
						arp.setCache(mainCache);
					
					mapping(arp);
					
					plugins.add(dp).add(arp);

					
					// 注册数据源
					dataSources.add(xx.DS_MAIN);
					
					try {
						//Eova的数据库类型
						MAIN_DBTYPE = JdbcUtils.getDbType(mainUrl, JdbcUtils.getDriverClassName(mainUrl));
						
						if(MAIN_DBTYPE.equals(JdbcUtils.SQL_SERVER))
							arp.setDialect(new SqlServerDialect());
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					dp.start();
					arp.start();
		}catch(Exception e) {
			e.printStackTrace();
			log.error("MainDb 初始失败。");
			INIT_SUC.set(0);
			return false;
		}
		return true;
	}
	
	public boolean initBBDb(Plugins plugins) {
		String bbUrl, bbUser, bbPwd;

		bbUrl = xx.getConfig("eova_url");
		bbUser = xx.getConfig("eova_user");
		bbPwd = xx.getConfig("eova_pwd");

		if(xx.isEmpty(bbUrl)) {
			INIT_SUC.set(0);
			return false;
		}
		// BB数据源
		try{
					DruidPlugin dp = initDruidPlugin(bbUrl, bbUser, bbPwd);
					ActiveRecordPlugin arp = initActiveRecordPlugin(bbUrl, xx.DS_EOVA, dp);
					System.out.println("load eova datasource:" + bbUrl + "/" + bbUser);
					if(bbCache != null)
						arp.setCache(bbCache);
					
					mappingEova(arp);

					plugins.add(dp).add(arp);

					// 注册数据源
					dataSources.add(xx.DS_EOVA);

					try {
						// BB的数据库类型
						EOVA_DBTYPE = JdbcUtils.getDbType(bbUrl, JdbcUtils.getDriverClassName(bbUrl));
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					dp.start();
					arp.start();
		}catch(Exception e) {
			e.printStackTrace();
			log.error("BBDb 初始失败。");
			INIT_SUC.set(0);
			return false;
		}
		return true;
	}
	
	/**
	 * 配置全局拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		System.err.println("Config Interceptors Starting...");
		// JFinal.me().getServletContext().setAttribute("EOVA", "简单才是高科技");
		
		//初始配置验证
		me.add(new InitInterceptor());
		
		me.add(new SessionInterceptor());
		
		// 登录验证
		me.add(new LoginInterceptor());
		// 权限验证拦截
		me.add(new AuthInterceptor());
		
//		//mssql专用拦截（mssql特殊属性）
//		me.add(new MsqlInterceptor());
		
		// 异常处理
		me.add(new ExceptionInterceptor());
	}

	/**
	 * 配置处理器
	 */
	@Override
	public void configHandler(Handlers me) {
		System.err.println("Config Handlers Starting...");
		// 添加DruidHandler
		//DruidStatViewHandler dvh = new DruidStatViewHandler("/druid");
		 DruidStatViewHandler dvh = new
				  DruidStatViewHandler("/druid", new IDruidStatViewAuth() {
				    public boolean isPermitted(HttpServletRequest request) {
				      HttpSession hs = request.getSession(false);
				    
				  	User user = (User)hs.getAttribute(EovaConst.USER) ;
				  	if(user != null && user.isAdmin()){
				  		
				      return true;
				    }else{
				    	return false;
				    }
				    }
				  });
		 
		me.add(dvh);
		// 过滤禁止访问资源
		me.add(new UrlBanHandler(".*\\.(html|tag)", false));
	}

	/**
	 * Eova Data Source Model Mapping
	 *
	 * @param arp
	 */
	protected void mappingEova(ActiveRecordPlugin arp) {
		arp.addMapping("eova_object", MetaObject.class);
		arp.addMapping("eova_field", MetaField.class);
		arp.addMapping("eova_button", Button.class);
		arp.addMapping("eova_menu", Menu.class);
		arp.addMapping("eova_user", User.class);
		
		arp.addMapping("eova_role", Role.class);
		arp.addMapping("eova_role_btn", RoleBtn.class);
		arp.addMapping("eova_log", EovaLog.class);
		arp.addMapping("eova_task", Task.class);
		arp.addMapping("eova_widget", Widget.class);
		
		arp.addMapping("bb_role_obj_field", RoleObjField.class);
		arp.addMapping("bb_dd_cfg", DdCfg.class);
		
		arp.addMapping("bb_oa_process", OaProcess.class);
		arp.addMapping("bb_oa_process_task", OaProcessTask.class);
		arp.addMapping("bb_charts", Charts.class);
		
	}

	/**
	 * Main Data Source Model Mapping
	 *
	 * @param arp
	 */
	protected void mapping(ActiveRecordPlugin arp) {
	}

	/**
	 * Custom Route
	 *
	 * @param me
	 */
	protected void route(Routes me) {
	}

	/**
	 * Custom Plugin
	 *
	 * @param plugins
	 * @return
	 */
	protected void plugin(Plugins plugins) {
	}

	/**
	 * init Druid
	 *
	 * @param url JDBC
	 * @param username 数据库用户
	 * @param password 数据库密码
	 * @return
	 */
	protected DruidPlugin initDruidPlugin(String url, String username, String password) {
		// 设置方言
		WallFilter wall = new WallFilter();
		String dbType = null;
		try {
			dbType = JdbcUtils.getDbType(url, JdbcUtils.getDriverClassName(url));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		wall.setDbType(dbType);

		DruidPlugin dp = new DruidPlugin(url, username, password);
		dp.addFilter(new StatFilter());
		dp.addFilter(wall);
		return dp;

	}

	/**
	 * init ActiveRecord
	 *
	 * @param url JDBC
	 * @param ds DataSource
	 * @param dp Druid
	 * @return
	 */
	protected ActiveRecordPlugin initActiveRecordPlugin(String url, String ds, IDataSourceProvider dp) {
		ActiveRecordPlugin arp = new ActiveRecordPlugin(ds, dp);
		// 提升事务级别保证事务回滚
		int lv = xx.toInt(xx.getConfig("transaction_level"), Connection.TRANSACTION_REPEATABLE_READ);
		arp.setTransactionLevel(lv);

		String dbType;
		try {
			dbType = JdbcUtils.getDbType(url, JdbcUtils.getDriverClassName(url));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		// 统一全部默认小写
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(isLowerCase));

		Dialect dialect;
		if (JdbcUtils.MYSQL.equalsIgnoreCase(dbType) || JdbcUtils.H2.equalsIgnoreCase(dbType)) {
			dialect = new MysqlDialect();
		} else if (JdbcUtils.ORACLE.equalsIgnoreCase(dbType)) {
			dialect = new OracleDialect();
			((DruidPlugin) dp).setValidationQuery("select 1 FROM DUAL");
			arp.setContainerFactory(new CaseInsensitiveContainerFactory());//忽略大小写
		} else if (JdbcUtils.POSTGRESQL.equalsIgnoreCase(dbType)) {
			dialect = new PostgreSqlDialect();
		}else if (JdbcUtils.SQL_SERVER.equalsIgnoreCase(dbType)) {
			dialect = new SqlServerDialect();
		}  else {
			// 默认使用标准SQL方言
			dialect = new AnsiSqlDialect();
		}
		arp.setDialect(dialect);

		// 是否显示SQL
		Boolean isShow = xx.toBoolean(xx.getConfig("showSql"), false);
		if (isShow != null) {
			arp.setShowSql(isShow);
		}

		return arp;
	}

	/**
	 * Eova Expression Mapping
	 *
	 * @param exps
	 */
	protected void exp() {
		// Eova 系统功能需要的Exp
		exps.put("selectEovaFieldByObjectCode", "select en Field,cn Name from eova_field where object_code = ?;ds=eova");
		
		//系统库 省市区 级联，如果表不满足需求可以覆盖
		exps.put("selectAreaByLv2AndPid", "select areaId ID,areaName CN from area where level = 2  and parentId = ?;ds=eova");
        exps.put("selectAreaByLv3AndPid", "select areaId ID,areaName CN from area where level = 3  and parentId = ?;ds=eova");
	
	}

	/**
	 * URI Auth
	 */
	protected void auth() {

		// 公有授权白名单
		HashSet<String> uris = new HashSet<String>();
		uris.add("/widget/**");
		uris.add("/upload/**");
		uris.add("/widget/**");
		uris.add("/meta/object/**");
		uris.add("/meta/fields/**");
		
		//uris.add("/druid/**");
		
		
		auths.put(0, uris);

	}

	@Override
	public void configEngine(Engine me) {//暂时不需要
		// TODO Auto-generated method stub
		
		
		
		
		
	}
	
	private void initQuartz(Plugins plugins) {
		// 配置Quartz
				boolean isQuartz = xx.getConfigBool("isQuartz", true);
				if (isQuartz && INIT_SUC.intValue() == 1) {
					QuartzPlugin quartz = new QuartzPlugin();
					plugins.add(quartz);
				}
	}

}