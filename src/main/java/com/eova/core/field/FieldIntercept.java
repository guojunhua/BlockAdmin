/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.field;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;

public class FieldIntercept extends MetaObjectIntercept {

	
	   public String addAfter(AopContext ac) throws Exception {
		   MetaField.dao.removeAllCache();
	        return null;
	    }
	   
	   public String deleteAfter(AopContext ac) throws Exception {
		   MetaField.dao.removeAllCache();
	        return null;
	    }
	   
	   public String updateAfter(AopContext ac) throws Exception {
		   MetaField.dao.removeAllCache();
	        return null;
	    }

}