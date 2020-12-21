package com.eova.template.bi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eova.model.Button;
import com.eova.template.Template;
import com.eova.template.common.config.TemplateConfig;
import com.eova.template.common.util.TemplateUtil;

public class BiTemplate implements Template {

	@Override
	public String name() {
		return "图形报表";
	}

	@Override
	public String code() {
		return TemplateConfig.BI;
	}

	@Override
	public Map<Integer, List<Button>> getBtnMap() {
		Map<Integer, List<Button>> btnMap = new HashMap<>();

		{
			List<Button> btns = new ArrayList<>();
			
			//目前和单表的功能一致（测试看看是否需要调整）
			btns.add(TemplateUtil.getQueryButton());
		

			btnMap.put(0, btns);
		}

		return btnMap;
	}

}
