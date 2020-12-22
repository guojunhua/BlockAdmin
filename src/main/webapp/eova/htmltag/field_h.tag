<%
// 查询控件name自动追加前缀
var name = item.en;
if(isTrue(isQuery!)){
	name = "query_" + name;
}

//字段2种方案，见表eova_widget
//第一 对应的tag 
//第二 在数据库制定类型对应 widget 地址 /widget/password/index.html
/*
字段属性说明： 除了value（5） isReadonly(6) defaultValue(14)是传入值，其他都是属性值
1、id ${item.en}
2、name ("query_"+)${item.en}
3、code ${item.object_code}
4、field ${item.en}
5、value

6、isNon ${item.is_required!} //如果是查询则 无必填控制（如果真需要则自己添加js控制把）
7、multiple ${item.multiple}
8、isReadonly ${readonly}
9、validator ${item.validator}
10、placeholder ${placeholder} ${item.placeholder} （优先从前面）
11、options ${item.options} 推荐是格式化
12、style ${item.style}
13、filedir ${item.filedir}
14、defaultValue ${defaultValue} 和 ${item.defaultValue}   原则上只有新增有默认值，否则为空（优先从前面）

15、其他值：${item.其他} 其他控件的特殊属性从item中提取
*/

var isNon = item.is_required!;
if(isTrue(isQuery!))
	isNon = false;
	
var multiple = item.is_multiple!;
var isReadonly = readonly!false;
var validator = item.validator!;
if(isTrue(isQuery!))
	validator = '';
var placeholder = placeholder!item.placeholder!;
//debug(item.defaultValue!);
var defaultValue = defaultValue!item.defaultValue!;

var options = item.options!;
var style = item.style!;
var filedir = item.filedir!;
if(isTrue(model!)){
	value = "${@record.get(\'"+item.en+"\')}";
}else{
	//可能值是"${xx}"这样的默认值，需要处理
	//debug(value!);
	//debug(defaultValue!);
	if(!isEmpty(value!) 
			&& strutil.startWith(value!+'','${') && strutil.endWith(value!+'','}') ){
		//EovaConst.USER
		value =	strutil.toBeetlValue(value!,session.user);
	}
	if(!isEmpty(defaultValue!) 
			&& strutil.startWith(defaultValue!+'','${') && strutil.endWith(defaultValue!+'','}') ){
		defaultValue =	strutil.toBeetlValue(defaultValue!,session.user);
	}
}
//其他值自己提取去把（内部去取）
//外置提示则，默认提示设置为空
if(BB_FORM_TIPS_IN! != 1){
	placeholder = "";
}
//placeholder = '111';
//isReadonly = true;//测试用

//defaultValue="${defaultValue!}"   
//placeholder="${placeholder!}" 
//isNoN="${isNon!}" 
//multiple="${multiple}" 
//isReadonly="${isReadonly}"

//目前数据类型不支持设置98%，所以现在宽度 统一设置98%，后期生效了再允许这个业务
var width = '100%';
/* if(!isEmpty(item.width!)){
	if( strutil.contain(item.width+"","%"))
		width = item.width;
	else
		width = item.width+"px";
} */

%>


<%if(type! == "detailSimpleForm"){//纯看数据模式%>
	<#field_simple_h item="${item!}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" limit="${item.limit!}"/>
<% }else{ %>

<%if(item.type == "下拉框"){%>
	<#combo_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" limit="${item.limit!}"/>
<%} else if(item.type == "下拉树"){//暂时不实现%>
	<#tree_select_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" expandLevel="${item.expandLevel!}" />

<%} else if(item.type == "下拉树2"){//弹出%>
	<#tree_select_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" expandLevel="${item.expandLevel!}"/>


<%} else if(item.type == "菜单查找框"){%>
    <#find2_h f="${item}" defaultValue="${defaultValue!}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" />

<%} else if(item.type == "时间框"){
	if(isTrue(model!)){
		value = "${strutil.formatDate(@record.get(\'"+item.en+"\'), 'yyyy-MM-dd HH:mm:ss')}";
	}
%>
    <#time_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" options="yyyy-MM-dd hh:mm:ss" />
<%} else if(item.type == "日期框"){
	if(isTrue(model!)){
		value = "${strutil.formatDate(@record.get(\'"+item.en+"\'), 'yyyy-MM-dd')}";
	}%>
    <#time_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" options="yyyy-MM-dd"/>
<%} else if(item.type == "文本域"){%>
	<#texts_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}"  style="width:${width};height:${item.height!340}px;" />
<%} else if(item.type == "编辑框"){%>
	<#edit_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" style="width:${width};height:${item.height!340}px;" width="${width}" height="${item.height!340}"/>
<%} else if(item.type == "布尔框"){%>
	<#bool_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" />
<%} else if(item.type == "图片框"){%>
	<#img_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" filedir="${item.config.filedir!}" />
<%} else if(item.type == "文件框"){%>
	<#file_h f="${item}" id="${item.en}" name="${name}" code="${item.object_code}" field="${item.en}" value="${value!}" defaultValue="${defaultValue!}"   placeholder="${placeholder!}" isNoN="${isNon!}" multiple="${multiple}" isReadonly="${isReadonly}" validator="${validator!}" filedir="${item.config.filedir!}" />
<%} else if(item.type == "图标框"){%>
    <#icon_h f="${item}" defaultValue="${defaultValue!}" id="${item.en}" name="${name}" value="${value!}" isNoN="${item.is_required!}" placeholder="${placeholder!item.placeholder!}" isReadonly="${readonly!false}" />
<%} else if(item.type == "自增框" || item.type == "文本框" || item.type == "数字框" || item.type == "JSON框"){%>
    <#text_h f="${item}" defaultValue="${defaultValue!}" id="${item.en}" name="${name}" value="${value!}" placeholder="${placeholder!item.placeholder!}" isNoN="${item.is_required!}" validator="${item.validator!}" options="" isReadonly="${isReadonly}" />
<%} else if(item.type == "JSON框"){//json 暂时并入edit_lay%>
	<#edit_lay f="${item}" defaultValue="${defaultValue!}" id="${item.en}" name="${name}" value="${value!}" isNoN="${item.is_required!}" placeholder="${placeholder!item.placeholder!}" style="width: auto;height:${item.height!250}px;" isReadonly="${isReadonly}" />

<%} else if(item.type == "流程框"){//显示流程当前状态%>
	<#process_h f="${item}" defaultValue="${defaultValue!}" id="${item.en}" name="${name}" code="${item.object_code}"  value="${value!}" placeholder="${placeholder!}" isNoN="${item.is_required!}" validator="${item.validator!}" options="" isReadonly="${isReadonly}" />

<%} else {// 默认为文本框%>
	<% var widgets = query("widget"); %>
    <%for(widget in widgets){%>
	    <%if(widget.value == item.type){%>
	    <%include(widget.path, {'field' : item,'defaultValue':defaultValue!, 'name' : name!, 'value' : value!, 'isNoN' : item.is_required!, 'validator' : item.validator!,'isReadonly':isReadonly,'placeholder':placeholder!,'limit':item.limit!}){}%>
	    <%}%>
    <%}%>
<%}%>

<% } %>