package com.eova.template.office;

import com.jfinal.core.Controller;
import java.util.HashMap;


/**
* @Description:用户处理数据,返回模板地址（如果为空则使用菜单配置的地址）
* @author 作者:Administrator
* @createDate 创建时间：2020年4月16日 下午1:10:31
* @version 1.0     
*/
public class OfficeIntercept
{
  protected static final char Y = '☑';
  protected static final char N = '□';
  
  public String init(Controller ctrl, HashMap<String, Object> data)
    throws Exception
  {
	  return null;
  }
}
