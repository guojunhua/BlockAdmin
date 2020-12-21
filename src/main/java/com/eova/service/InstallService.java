package com.eova.service;

import com.eova.common.Response;
import com.eova.common.db.DbExecuter;
import com.eova.common.utils.db.JdbcUtil;
import com.eova.exception.BusinessException;
import com.jfinal.kit.PathKit;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ArrayUtil;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;
import java.util.List;

/**
 * 数据库安装相关
 * @author jzhao
 */
@Slf4j
public class InstallService {


    private DbExecuter dbExecuter;




//    private static final InstallService me = new InstallService();
//
//    public static final InstallService me() {
//        return me;
//    }

    public  InstallService(String dbName,
            String dbUser,
            String dbPassword,
            String dbHost,
            int dbHostPort) {
    	this.dbExecuter = new DbExecuter(dbName, dbUser, dbPassword, dbHost, dbHostPort);
    }

    
    public boolean doInitDatabase(String fileName) {
    	List<String> tables = dbExecuter.queryTables();
    	if(tables == null) {
    		log.error("查询库：{} 全表失败，将不初始化。",dbExecuter.getDbName());
    		return false;
    	}
    	//System.getProperties().list(System.out);//输出当前环境属性
    	
    	if(tables.isEmpty()) {//表为空才可执行初始
	        String sqlFilePath = PathKit.getWebRootPath() + "/WEB-INF/install/sqls/"+fileName;
	        //String installSql = FileUtil.readString(sqlFilePath,"utf-8");
	        
	        //String line = FileUtil.readLines(sqlFilePath, charset);
	        List<String> lines = FileUtil.readUtf8Lines(sqlFilePath);
	        try {
				dbExecuter.executeSql(lines);
//	        	if("main.sql".equalsIgnoreCase(fileName) ) {//未想到号的办法，想执行把函数初始化进去，然后再把表初始进去
//	        		dbExecuter.executeSql(FileUtil.file(sqlFilePath),";;");
//	        	}
//	        	dbExecuter.executeSql(FileUtil.file(sqlFilePath),null);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new BusinessException("初始DB失败:"+e.getMessage());
			}
	        return true;
    	}
    	return false;
    }


//    public void doUpgradeDatabase() throws SQLException {
//        String sqlFilePath = PathKit.getWebRootPath() + "/WEB-INF/install/sqls/";
//        String upgradeSql = FileUtil.readString(new File(sqlFilePath, upgradeSqlFileName));
//        dbExecuter.executeSql(upgradeSql);
//    }

    /**
   	 * 测试连接
   	 * 1、一般错误
   	 * code 0 -连接失败，1049 未知库,1025-账户错误，1044-无权
   	 * 限
   	 * 2、未知错误，直接返回显示
   	 * @return
   	 */
    public Response connDbTest() {
    	return dbExecuter.connDbTest();
    	
    	//dbExecuter.sureAndCreateDB(allowCreate)
    }
    
    /**小于0为成功，-1=存在，-2=创建成功
	 * @param allowCreate
	 * @return
	 */
	public  Response sureAndCreateDB(boolean allowCreate) {
		return	dbExecuter.sureAndCreateDB(allowCreate)	;
	}

   

    public DbExecuter getDbExecuter() {
        return dbExecuter;
    }
}
