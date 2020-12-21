/**
 * Copyright (c) 2013-2017, Jieven. All rights reserved.
 * <p/>
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 * 火狐下载文件，中文文件名名乱码，现已调整
 */
package com.eova.common.render;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;

import org.beetl.core.Template;

import com.eova.common.utils.xx;
import com.eova.common.utils.io.TxtUtil;
import com.eova.common.utils.web.RequestUtil;
import com.eova.engine.DynamicParse;
import com.jfinal.render.Render;
import com.jfinal.render.RenderException;

public class Html2XlsRender extends Render {

    private final static String CONTENT_TYPE = "application/msexcel;charset=" + getEncoding();

    public final static String FILE_TYPE_XLS = "xls";
    public final static String FILE_TYPE_DOC = "doc";
	//private final static String FILE_TYPE_PDF = "pdf";
    
    private final String file;
    private final String fileType;
    private final String fileName;

  
    /**
     *  渲染office
     * @param fileType
     * @param fileName
     * @param path
     * @param paras
     */
    public Html2XlsRender(String fileType, String fileName, String path, HashMap<String, Object> paras) {
    	this.fileType = fileType;
        this.file = parseFile(path, paras);
       // this.fileName = fileName;
        if(xx.isEmpty(fileName)) {
        	File tempFile =new File( path.trim());
        	fileName = tempFile.getName();
        	if(fileName.indexOf(".")  != -1) {
        		this.fileName = fileName.substring(0, fileName.lastIndexOf(".")+1)+fileType;
        	}else
        		this.fileName = fileName+"."+fileType;
        }else
        	this.fileName = fileName;
    }

    @Override
    public void render() {
        PrintWriter writer = null;
        try {
            response.setHeader("Pragma", "no-cache"); // HTTP/1.0 caches might not implement Cache-Control and might only implement Pragma: no-cache
            response.setHeader("Cache-Control", "no-cache");
            
            String filename = URLEncoder.encode(fileName, "UTF-8");
            
            if("firefox".equals(RequestUtil.getExplorerType(request))){
            	filename = new String(fileName.getBytes("utf-8"),"ISO-8859-1");
            }
            
            response.setHeader("Content-disposition", "attachment; filename=" + filename);
            response.setDateHeader("Expires", 0);
            response.setContentType(CONTENT_TYPE);
            response.setCharacterEncoding(getEncoding());

            writer = response.getWriter();
            writer.write(file);
            writer.flush();
        } catch (IOException e) {
            throw new RenderException(e);
        } finally {
            if (writer != null)
                writer.close();
        }
    }


    public String parseFile(String path, HashMap<String, Object> params) {
    	String temp = TxtUtil.getTxt(path);
        Template t = DynamicParse.gt.getTemplate(temp);
        for (String key : params.keySet()) {
            Object o = params.get(key);
            t.binding(key, o);
        }
        return t.render();
    }
    
    public static void main(String[] args) {
    	//举例：
    	String fName =" G:\\Java_Source\\navigation_tigra_menu\\demo1\\img\\lev1_arrow.gif ";
    	fName =" \\img\\aaa/lev1_arrow.gif ";
    	//方法一：
    	
    	File tempFile =new File( fName.trim());
    	
    	String fileName = tempFile.getName();
    	
    	System.out.println("fileName = " + fileName);
    	
    	//方法二：
    	
    	//String fName = fName.trim();
    	
    	fileName = fName.substring(fName.lastIndexOf("/")+1);
    	//或者
    	fileName = fName.substring(fName.lastIndexOf("\\")+1);
    	
    	System.out.println("fileName = " + fileName);
    	
    	//方法三：
    	
    	
    	String temp[] = fName.split("\\\\"); /**split里面必须是正则表达式，"\\"的作用是对字符串转义*/
    	
    	fileName = temp[temp.length-1];
    	
    	System.out.println("fileName = " + fileName);
    
    }
    
}
