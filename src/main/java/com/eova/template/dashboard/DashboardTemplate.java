package com.eova.template.dashboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eova.model.Button;
import com.eova.template.Template;
import com.eova.template.common.config.TemplateConfig;
import com.eova.template.common.util.TemplateUtil;

/**
* @Description:TODO
* @author 作者:jzhao
* @createDate 创建时间：2020年8月30日 下午10:32:10
* @version 1.0     
*/
public class DashboardTemplate implements Template {

	@Override
	public String name() {
		// TODO Auto-generated method stub
		return "Dashboard";
	}

	@Override
	public String code() {
		// TODO Auto-generated method stub
		 return TemplateConfig.DASHBOARD;
	}

	@Override
	public Map<Integer, List<Button>> getBtnMap() {
		// TODO Auto-generated method stub
		Map<Integer, List<Button>> btnMap = new HashMap();
	    
		{
			List<Button> btns = new ArrayList<>();
			
			//目前和单表的功能一致
			btns.add(TemplateUtil.getQueryButton());
		

			btnMap.put(0, btns);
		}
		
	    return btnMap;
	}

}
