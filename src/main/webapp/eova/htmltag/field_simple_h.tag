<%
// 查询控件name自动追加前缀，此控件只是为了显示，只用2个控件 文本框input 和 文本域 textarea 且全只读，文件、图片、布尔
var name = item.en;
if(isTrue(isQuery!)){
	name = "query_" + name;
}



var isNon = item.is_required!;
if(isTrue(isQuery!))
	isNon = false;
	
var multiple = item.is_multiple!;
var isReadonly = readonly!false;
var validator = item.validator!;
if(isTrue(isQuery!))
	validator = '';
var placeholder = placeholder!item.placeholder!;
var defaultValue = defaultValue!item.defaultValue!;

var options = item.options!;
var style = item.style!;
var filedir = item.filedir!;


var width = '100%';



%>
<% if(item.type == "布尔框"){%>
<label class="checkbox-inline">
	<input type="checkbox" value="lock" id="${item.en}" name="${name}"/>
</label>
<%} else if(item.type == "图片框"){
	var filename = item[item.en+'_name'];
	if(isEmpty(filename!)){
		filename = value!;
	}
	var url = "";
	if(!isEmpty(value!)){
		if(strutil.index(value,'http://') == -1 && strutil.index(value,'https://') == -1){
			url = IMG! +  '/' +  value;
		}else
			url =  value;
	}
%>
	<img class="img-responsive"   src="${url!}"/>
<%} else if(item.type == "文件框"){
	debug(value!);
	var fileName = item[item.en+'_name'];
	if(isEmpty(fileName!)){
		fileName = value!;
		
		if(!isEmpty(fileName!)){//提取/后面得文件名
			
		}
	}
	debug(fileName!);
	var url = "";
	if(!isEmpty(value!)){
		if(strutil.index(value,'http://') == -1 && strutil.index(value,'https://') == -1){
			url = FILE! +  '/' +  value;
		}else
			url =  value;
	}
%>
	<a href="${url!}" id="${id!}" name="${name}" target="view_window" download=""></a>
	<script>
	var fileName = $.getFilePathName('${fileName!}');
	console.log(fileName);
	$("#${id!}").text(fileName);
	$('#${id!}').attr('download',fileName); 
	</script>
<%} else if(item.type == "流程框"){ debug(value!);//显示流程当前状态%>
	
	<% if(value!= null && value['status'] == 3){ %>
	
		<% if(value['result'] == 1){ %>
		
		<input class="form-control" id="${item.en}" name="${name}" type="text"  value="同意" />
		<% }else{ %>
		
		<input class="form-control" id="${item.en}" name="${name}" type="text"  value="拒绝(${value['remark']} })" />
		<% } %>
	
	<% }else if(value!= null && value['status'] == 2){ %>
	
	<input class="form-control" id="${item.en}" name="${name}" type="text"  value="已终止" />
	<% }else if(value!= null){ %>
	<input class="form-control" id="${item.en}" name="${name}" type="text"  value="审核中" />
	<% }else{ %>
	<input class="form-control" id="${item.en}" name="${name}" type="text"  value="未发起" />
	<% } %>
	
	
	
<%} else if( item.type == "编辑框"){%>
	<label class="checkbox-inline">
		${value!}
	</label>
<%} else if(item.type == "文本域"){%>
	<textarea class="form-control" id="${id!}" name="${name}" style="${style!}" >${value!}</textarea>
<%} else {// 默认为文本框%>
	<input class="form-control" id="${item.en}" name="${name}" type="text"  value="${value!}" />
<%}%>