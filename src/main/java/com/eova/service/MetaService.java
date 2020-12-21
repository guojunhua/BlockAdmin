/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.service;

import java.util.List;

import com.eova.common.base.BaseService;
import com.eova.common.utils.xx;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaFieldConfig;
import com.eova.model.MetaObject;

/**
 * 元数据服务
 *
 * @author Jieven
 * @date 2013-1-3
 */
public class MetaService extends BaseService {

	/**
	 * 获取元数据(对象和字段)
	 * @param objectCode
	 * @return
	 */
	public MetaObject getMeta(String objectCode) {
		MetaObject object = MetaObject.dao.getByCode(objectCode);
		if(object != null){
			List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);
			for (MetaField metaField : fields) {
				String type = metaField.getStr("type");//菜单查找框
				if(MetaField.TYPE_FIND2.equals(type)) {
					
					// 获取控件表达式
					String exp = metaField.getStr("exp");
					if (xx.isEmpty(exp)) {
						continue;
					}
					Menu menu = Menu.dao.findByCode(exp);
					if(menu != null) {
						
						MetaFieldConfig config = metaField.getConfig();
						if(config == null)
							config = new MetaFieldConfig();
						
						
						config.setFindUrl(menu.getUrl());
						config.setQueryUrl(menu.getQueryUrl());
						metaField.setConfig(config);
					}
						
				}
			}
			object.setFields(fields);
		}
		return object;
	}
	
	public void updateMeta(MetaObject obj) {
		obj.update();
	}
}