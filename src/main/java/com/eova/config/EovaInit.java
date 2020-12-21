/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 * <p/>
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.config;

import java.io.File;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.common.utils.io.FileUtil;
import com.eova.common.utils.io.NetUtil;
import com.eova.common.utils.io.ZipUtil;
import com.eova.service.InstallService;
import com.jfinal.kit.PathKit;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EovaInit {

	/**
	 * 异步初始化JS插件包<br>
	 * 1.通过网络自动下载plugins.zip <br>
	 * 2.解压到webapp/plugins/ <br>
	 * 3.删除下载临时文件 <br>
	 */
	public static void initPlugins() {
		// 异步下载插件包
		Thread t = new Thread() {
			@Override
			public void run() {
				try {
					// 下载到Web根目录
					String zipPath = EovaConst.DIR_WEB + "plugins.zip";

					if (!FileUtil.isExists(EovaConst.DIR_PLUGINS)) {
						System.err.println("正在下载：" + EovaConst.PLUGINS_URL);
						NetUtil.download(EovaConst.PLUGINS_URL, zipPath);

						System.err.println("开始解压：" + zipPath);
						ZipUtil.unzip(zipPath, EovaConst.DIR_PLUGINS, null);
						System.err.println("已解压到：" + EovaConst.DIR_PLUGINS);

						FileUtil.delete(zipPath);
						System.err.println("清理下载Zip");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
		t.start();
	}

	/**
	 * 初始化输出Oracle脚本
	 */
	public static void initCreateSql() {
		// 异步下载插件包
		Thread t = new Thread() {
			@Override
			public void run() {
				System.out.println("正在生成 eova oracle sql ing...");
				DbUtil.createOracleSql(xx.DS_EOVA, "EOVA%");
				// System.out.println("生成成功:/sql/oracle/eova.sql");

				System.out.println();
				System.out.println();

				System.out.println("正在生成 web oracle sql ing...");
				DbUtil.createOracleSql(xx.DS_MAIN, "%");
				// System.out.println("生成成功:/sql/oracle/*.sql");
			}
		};
		t.start();
	}

	/**
	 *  初始化静态配置
	 */
	public static void initStatic(){
		FileUtil.IMG_TYPE  = xx.getConfig("upload_img_type",FileUtil.IMG_TYPE);
		FileUtil.ALL_TYPE  = xx.getConfig("upload_file_type",FileUtil.ALL_TYPE);
	}
	
	/**
	 * 初始化配置
	 */
	public static String initConfig(Map<String, String> props) {
		String resPath = PathKit.getRootClassPath() + File.separator;
		
		String path = "";
		
		// 加载默认配置
		boolean flag = loadConfig(props, resPath + "default");
		if (flag) {
			path = "/default";
			System.out.println("默认配置加载成功:(resources/default)\n");
		}
		//#环境标识：开发环境=DEV,测试环境=TEST,预发布环境=PRE,正式环境=PRD
		String env = props.get("env");
		if( "DEV".equalsIgnoreCase(env) || "TEST".equalsIgnoreCase(env) || xx.isEmpty(env)){
			// 加载本地配置
			flag = loadConfig(props, resPath + "dev");
			if (flag) {
				path = "/dev";
				log.info("开发配置覆盖成功:(resources/dev)\n");
			}
		}
		
		//再次覆盖 根路径下： jdbc.config
		
		flag = loadConfig(props, resPath);
		if (flag) {
			log.info("加载了 根路径db配置");
		}
		
		initStatic();
		
		return path;
	}
	
	/**
	 * 加载配置
	 * 
	 * @param path
	 * @return
	 */
	private static boolean loadConfig(Map<String, String> props, String path) {
		if (!FileUtil.isDir(path)) {
			return false;
		}
		int fileNum = 0;
		File[] files = FileUtil.getFiles(path);
		for (File file : files) {
			if (!file.getName().endsWith(".config")) {
				continue;
			}
			Properties properties = FileUtil.getProp(file);
			Set<Object> keySet = properties.keySet();
			for (Object ks : keySet) {
				String key = ks.toString();
				props.put(key, properties.getProperty(key));
			}
			System.out.println(file.getName());
			fileNum ++;
		}
		if(fileNum>0)
			return true;
		else
			return false;
	}
}