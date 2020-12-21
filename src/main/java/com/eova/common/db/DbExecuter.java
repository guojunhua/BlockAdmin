package com.eova.common.db;


import lombok.extern.slf4j.Slf4j;

import javax.sql.DataSource;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.apache.tools.ant.types.EnumeratedAttribute;

import com.eova.common.Response;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.JdbcUtil;
import com.eova.exception.BusinessException;

import cn.hutool.db.ds.simple.SimpleDataSource;
import cn.hutool.db.sql.SqlExecutor;

import java.io.File;
import java.sql.*;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class DbExecuter {

    private String dbName;
    private String dbUser;
    private String dbPassword;
    private String dbHost;
    private int dbHostPort;
    private String jdbcUrl;


    private DataSource dataSource;

    public DbExecuter(DataSource dataSource) {
        this.dataSource = dataSource;
    }


    public DbExecuter(String dbName, String dbUser, String dbPassword, String dbHost, int dbHostPort) {
        this.dbName = dbName;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
        this.dbHostPort = dbHostPort;
this.dbHost = dbHost;
 
        
        this.jdbcUrl = MessageFormat.format("jdbc:mysql://{0}:{1}/{2}?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true"
				, dbHost
				, String.valueOf(dbHostPort) 
				,dbName);

    
        SimpleDataSource simple =   new SimpleDataSource(this.jdbcUrl, dbUser, dbPassword);
       // simple.init(this.jdbcUrl, dbUser, dbPassword);
        this.dataSource = simple;
    }

    

    public List<String> queryTables() {
        try {
            return query("show tables;");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    
    /**
     * 也有问题，对于mysql的 函数模块没法导入
     * @param sqlfile
     * @param delimiter
     * @throws SQLException
     */
    public void executeSql(File sqlfile,String delimiter) throws SQLException {
    	if(!sqlfile.exists())
    		throw new SQLException("sql is null or empty");
    	
    	log.info("开始导入DB:"+this.getDbName());
    	SQLExec sqlExec = new SQLExec();
		String driverClass8 = "com.mysql.cj.jdbc.Driver";
		String url = this.getJdbcUrl();// "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8";
		String username = this.dbUser;
		String password = this.dbPassword;
		sqlExec.setDriver(driverClass8);
		sqlExec.setUrl(url);
		sqlExec.setUserid(username);
		sqlExec.setPassword(password);
		sqlExec.setSrc(sqlfile);
		sqlExec.setEncoding("UTF-8");
		if(!xx.isEmpty(delimiter))
			sqlExec.setDelimiter(delimiter);
		//如果有出错的语句继续执行.
		sqlExec.setOnerror((SQLExec.OnError) (EnumeratedAttribute.getInstance(SQLExec.OnError.class, "continue")));
		sqlExec.setPrint(true);
		
		sqlExec.setOutput(new File(sqlfile.getAbsolutePath()+".out"));
		sqlExec.setProject(new Project()); 
		sqlExec.execute();
		
		log.info("导入DB:{},完成",this.getDbName());
    }
    
    public void executeSql(List<String> batchSqls) throws SQLException {
    	
        try(Connection conn = getConnection(true);
        		Statement pst= conn.createStatement();) {
        		
        	
        	
             log.info("开始导入库：{}",this.getDbName());
            if (batchSqls == null || batchSqls.isEmpty()) {
                throw new SQLException("sql is null or empty");
            }
            
            StringBuilder sql = new StringBuilder();
            log.info("开始遍历数据");
            boolean delimiterOpen = false;
            for(String line:batchSqls) {
	         
	            	if(xx.isEmpty(line) || xx.isEmpty(line.trim()) ) {
	            		continue;
	            	}
	            	
	            	if(line.indexOf("delimiter") != -1) {//delimiter ; 不能抛弃，有用
	            		if(!delimiterOpen) {
	            			//结束上一个，启动本次
	            			if(sql.length()>0) {
	            				pst.addBatch(sql.toString());
	            			}
	            			sql.setLength(0);
	            			
	            			delimiterOpen = true;
	            			//sql.append(line);	
	            			
	            			//pst.addBatch(line);
	            		}else {
	            			//sql.append(line);
	            			pst.addBatch(sql.toString());
	            			
	            			log.info(sql.toString());
	            			//pst.addBatch(line);
		            		//清空
		            		sql.setLength(0);
		            		delimiterOpen = false;
	            		}
	            		
	            	}else if(line.endsWith(";") && !delimiterOpen) {
	            		
	            		sql.append(line);
	            		pst.addBatch(sql.toString());
	            		//清空
	            		sql.setLength(0);
	            	}else {
	            		if(line.endsWith(";"))
	            			sql.append(line);
	            		else {//无符号添加一个换行符吧
	            			sql.append(line+"\r\n");
	            		}
	            	}
	          
            }
            
            if(sql.length()>0) {
            	pst.addBatch(sql.toString());
            }
            log.info("遍历数据完成");
            
            log.info("开始保存");
            pst.executeBatch();
            log.info("保存完成");
            log.info("导入库：{} 完成",this.getDbName());
        } 
    }


    public <T> List<T> query(String sql) throws SQLException {
        List result = new ArrayList();
       
        try(Connection conn = getConnection(false);
        		PreparedStatement pst= conn.prepareStatement(sql);
        		ResultSet rs = pst.executeQuery();) {
           
            
            int colAmount = rs.getMetaData().getColumnCount();
            if (colAmount > 1) {
                while (rs.next()) {
                    Object[] temp = new Object[colAmount];
                    for (int i = 0; i < colAmount; i++) {
                        temp[i] = rs.getObject(i + 1);
                    }
                    result.add(temp);
                }
            } else if (colAmount == 1) {
                while (rs.next()) {
                    result.add(rs.getObject(1));
                }
            }
        } 
        return result;
    }


    private Connection getConnection(boolean autoCommit) throws SQLException{
//        try {
    	Connection conn = dataSource.getConnection();
            conn.setAutoCommit(autoCommit);
            return conn;
//        } catch (SQLException e) {
//            throw new BusinessException(e.getErrorCode(),e.getMessage());
//        }
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
	public Response sureAndCreateDB(boolean allowCreate) {
		
			Response res = connDbTest();
			if(res.getStatus() == -1) {//dou OK,完成
				
			}else if(res.getStatus() == 1049 && allowCreate) {//创建库(同意创建)
				log.info("创建库：{}",this.dbName);
				String url = MessageFormat.format("jdbc:mysql://{0}:{1}/{2}?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&serverTimezone=GMT%2B8"
						,  this.dbHost
						, String.valueOf(this.dbHostPort) 
						,"");
				
				 try(Connection conn = DriverManager.getConnection(url, this.dbUser, this.dbPassword);
						 Statement stmt = conn.createStatement(); ) {
					 
					// CREATE DATABASE IF NOT EXISTS " + dbName + " DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
					 String sql = "CREATE DATABASE "+this.dbName+" DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;";
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
	public Response connDbTest() {
		//System.out.println("Connecting to database...");
		log.info("尝试连接库：{}",this.jdbcUrl);
		
		try(Connection conn = this.getConnection(false)) {
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
			log.warn("尝试连接库：{},失败：{}",this.jdbcUrl,msg);
			return new Response(code,msg);
			
		}

	      
		return new Response(-1,"成功");
	}
    
    public DataSource getDataSource() {
        return dataSource;
    }

  

    public String getDbName() {
        return dbName;
    }

    public String getDbUser() {
        return dbUser;
    }

    public String getDbPassword() {
        return dbPassword;
    }

    public int getDbHostPort() {
        return dbHostPort;
    }

    public String getJdbcUrl() {
        return jdbcUrl;
    }
}
