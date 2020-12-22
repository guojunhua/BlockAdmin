<%
//debug(f);
//debug(value);
// data-options
var verify = "";
if(isTrue(isNoN!) ){
	verify = "required=true";
}
if(!isEmpty(validator!)){
	if(verify != ''){
		verify += ';';
	}
	verify = verify + validator!;
}



if(!isEmpty(value!)){
	
	if(!strutil.contain(value!+'','$')){
		value = strutil.formatDate(value!, options!);
	}
}
var disabled="";
if(isTrue(isReadonly!) ||isTrue(view!)){
	disabled = 'readonly';
	verify = '';
}
//options =yyyy-MM-dd hh:mm:ss 要么  yyyy-MM-dd 控件要求格式：yyyy-mm-dd hh:ii:ss  hh才是24小时制

value = isEmpty( value! ) ? defaultValue!:value!;
%>
<div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control" autocomplete="off" value="${value!}" id="${id!}" name="${name}" placeholder="${placeholder!}" bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')} ${disabled!}>
</div>
<script>
$(function(){
	<!-- datetimepicker示例 -->
	var format = '${options}'.replace('mm','ii').replace('MM','mm');
	var minView = '';
	if('${options}'.length == 10){//yyyy-MM-dd 则选择器只有年月日选择
		minView = 'month';
	}
	
	<% if(!isTrue(isReadonly!) && !isTrue(view!)){//只读模式不会触发时间选择  %>  
	$('#${id!}').datetimepicker({
			format: format,
		    minView: minView,   //
		    autoclose: true,
		    todayBtn:  true,
    });
	<% } %>
});
</script>