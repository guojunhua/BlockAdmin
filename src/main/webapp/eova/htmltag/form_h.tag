<%
//Form Widget: 。
		// 下面的代码，必须非常熟悉Beetl再看如下代码。
		// 用到Beetl各种常规语法+自定义函数+Tag
		//只是查看模式view，所有字段都是只读并且按钮为“确认”
		
		//2中模式，第一无配置信息的情况 ，第二有配置数据的情况，（如果没有配置信息则走第一种默认情况）
		var config = null;//from 的配置信息，比如一行几个 都有谁，如果不存在则使用目前老的模式，分组，顺序铺
		var formView = null;
		
		var formtype = type+'Form';
		if(!isEmpty(VIEW_FORM!))
			formtype = VIEW_FORM!;
		
		
		//debug(VIEW_FORM!);
		if(!isEmpty(object.config!)){
			//formView = object.config[formtype];
			config = object.config.config;
			if(!isEmpty(VIEW_FORM!)){
				
				formView = config[VIEW_FORM];
			}else{
				formView = config[formtype];
				if(formView == null){
					formView = config.form;
				}
			}
		}
		
		
		//有配置数据formView走配置试图，否则走常规
		
		//测试用，只进入普通模式

//现在存在3种情况:1、平铺 =form_h_default ，2、复杂表单（一行至多12格）form_h_cfg_V2 但是排版不好看，3、现在提供另外一种，一行至多使用2格子（每隔支持多个控件）
if(formView == null){//无配置文件则走默认模式	 %>
<#form_h_default id="${id}" type="${formtype}" objectCode="${objectCode}" fixed="${fixed!}" object="${object}" data="${data!}"  view="${view!}"/>
<% }else{ //只支持拖拽形成的json ，当然也可以手工形成
	//debug(formView!);
	var maxColumn = formView.maxColumn!;//以后设置的会存在此参数，如果无以及大于2则走 form_h_cfg_V2，其他情况走 form_h_cfg
	//debug(maxColumn!);
	if(maxColumn! != null && maxColumn<=2){	
	%>
		<#form_h_cfg id="${id}" type="${formtype}" objectCode="${objectCode}" fixed="${fixed!}" object="${object}" data="${data!}"  view="${view!}"/>
	<% }else{ %>
		<#form_h_cfg_V2 id="${id}" type="${formtype}" objectCode="${objectCode}" fixed="${fixed!}" object="${object}" data="${data!}"  view="${view!}"/>
	<% } %>
<% } %>

