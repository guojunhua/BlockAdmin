package com.eova.common.utils.db;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.apache.tools.ant.types.EnumeratedAttribute;

import com.eova.common.Response;
import com.jfinal.kit.PathKit;

import cn.hutool.core.io.FileUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * JDBC工具类
 * 
 * @author jzhao
 * @date 2020-6-4
 */
@Slf4j
public class JdbcUtil {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	/**
	 * 获取数据库连接,返回提示信息
	 * 
	 * @param url
	 * @param username
	 * @param password
	 * @return
	 */
	public static String initConnection(String url, String username, String password) {
		// String oracleDrivers = "oracle.jdbc.driver.OracleDriver";
		//String mysqlDrivers = "com.mysql.jdbc.Driver";
		System.setProperty("jdbc.drivers", JDBC_DRIVER);
		try {
			Class.forName(JDBC_DRIVER);
			Connection conn = DriverManager.getConnection(url, username, password);
			if (conn == null) {
				return "创建JDBC连接失败";
			}
			return null;
		} catch (Exception ex) {
			ex.printStackTrace();
			return ex.getMessage();
		}
	}
	
	
	
	
	
	
	
	/**小于0为成功，-1=存在，-2=创建成功
	 * @param ip
	 * @param port
	 * @param db
	 * @param userName
	 * @param psw
	 * @param allowCreate
	 * @return
	 */
	public static Response sureAndCreateDB(String ip,String port,String db,String userName,String psw,boolean allowCreate) {
//		 	String ip =  "127.0.0.1";
//			String port = "3306";
//			String mainDb = "my_bb";
//			String mainUserName = "root";
//			String mainPsw = "000000";
//			boolean allowCreate = false;
			
			
			String bb_db_url = MessageFormat.format("jdbc:mysql://{0}:{1}/{2}?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
					, ip
					, port
					,db);
			      
			Response res = connDbTest(bb_db_url,userName,psw);
			if(res.getStatus() == -1) {//dou OK,完成
				
			}else if(res.getStatus() == 1049 && allowCreate) {//创建库(同意创建)
				log.info("创建库：{}",db,db);
				bb_db_url = MessageFormat.format("jdbc:mysql://{0}:{1}/{2}?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
						,  ip
						, port
						,"");
				
				 try(Connection conn = DriverManager.getConnection(bb_db_url, userName, psw);
						 Statement stmt = conn.createStatement(); ) {
	
					 String sql = "CREATE DATABASE "+db;
					 stmt.executeUpdate(sql);
					 
					 res = new Response(-2,"创建库成功.");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					res = new Response(999,"创建库失败："+e.getMessage());
				}
			}else {//其他错误直接返回
				
			}
			//System.out.println(res.getMsg()+"("+res.getStatus()+")");
			
			return res;
	}
	
	/**
	 * 测试连接
	 * 1、一般错误
	 * code 0 -连接失败，1049 未知库,1025-账户错误，1044-无权
	 * 限
	 * 2、未知错误，直接返回显示
	 * @param url
	 * @param username
	 * @param psw
	 * @return
	 */
	public static Response connDbTest(String url,String username,String psw) {
		//System.out.println("Connecting to database...");
		log.info("尝试连接库：{}",url);
		
		try(Connection conn = DriverManager.getConnection(url, username, psw)) {
			//conn = DriverManager.getConnection(url, username, psw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String msg = e.getMessage();
			int code = e.getErrorCode();
			if(code == 0) {
				msg = "连接失败";
			}else if(code == 1049){
				msg = "无此库";
			}else if(code == 1045){
				msg = "账户或密码错误";
			}else if(code == 1044){
				msg = "用户无权限";
			}
			log.warn("尝试连接库：{},失败：{}",url,msg);
			return new Response(code,msg);
			
		}

	      
		return new Response(-1,"成功");
	}
	
	public void import2db(String url,String userName,String userPsw) {
		try(Connection conn = DriverManager.getConnection(url, userName, userPsw);
				 Statement stmt = conn.createStatement(); ) {
			
			String sqlFilePath = PathKit.getWebRootPath() + "/WEB-INF/install/sqls/";
	        String upgradeSql = FileUtil.readString("", "utf-8");
	        
	        
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			
		};
	}
	
	public static void main(String[] args) {
		   Connection conn = null;
		   Statement stmt = null;
		   
		   String ip =  "127.0.0.1";
		   ip =  "127.0.0.1";
			String port = "3306";
			
			
			String mainDb = "my_bb";
			String mainUserName = "root";
			String mainPsw = "000000";
		   
			boolean allowCreate = true;
			
	
			
			try {
				Class.forName(JDBC_DRIVER);
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			//Response res =	 sureAndCreateDB(ip,port,mainDb,mainUserName,mainPsw,allowCreate);
			//System.out.println(res.getMsg()+"("+res.getStatus()+")");

	
			
			SQLExec sqlExec = new SQLExec();
			String driverClass8 = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://127.0.0.1:3306/bb_demo?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8";
			String username = "root";
			String password = "000000zJ";
			sqlExec.setDriver(driverClass8);
			sqlExec.setUrl(url);
			sqlExec.setUserid(username);
			sqlExec.setPassword(password);
			sqlExec.setSrc(FileUtil.file("d:/sqls/main.sql"));
			//如果有出错的语句继续执行.
			sqlExec.setOnerror((SQLExec.OnError) (EnumeratedAttribute.getInstance(SQLExec.OnError.class, "continue")));
			sqlExec.setPrint(true);
			//sqlExec.setOutput(sqlfile);
			sqlExec.setProject(new Project()); 
//			sqlExec.setDelimiter(";;");
//			sqlExec.execute();
			
			//sqlExec.setDelimiter("delimiter ;");
			sqlExec.execute();
			
		   System.out.println("Goodbye!2");
		}

}
