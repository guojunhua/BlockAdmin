package com.oss.office.doc;

import java.util.HashMap;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.eova.template.office.OfficeIntercept;
import com.eova.template.office.OfficeTemplate;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.oss.office.xls.Xls1Intercept;

/**
* @Description:TODO
* @author 作者:Administrator
* @createDate 创建时间：2020年4月21日 下午11:53:16
* @version 1.0     
*/
public class ZmDocIntercept extends OfficeIntercept {
	private static final Logger log = LogManager.getLogger(ZmDocIntercept.class);
	
	public String init(Controller ctrl, HashMap<String, Object> data) throws Exception {

		// ctrl.getPara(1);// 只支持索引取参数
		//执行数据库操作，提取相应数据
		data.put("name", "赵金");
		data.put("cid", "3201231234567890");
		
		data.put("org", "积木6比");
		log.info("全部参数："+ctrl.getParaMap());
		return null;//可以返回地址，优先级比配置的高，
	}
}
