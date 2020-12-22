<%
// data-options
var data = "";
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
//debug(verify);
var disabled="";
if(isTrue(isReadonly!) ||isTrue(view!)){
	disabled = 'readonly';
	verify = '';
}
var ismultiple = true;
if(!isEmpty(multiple!)){
	ismultiple = multiple;
}

// 默认URL
var findUrl = item.config.queryUrl!;//暂时不用这个参数
findUrl = "/widget/findTheObjectCnByEn"+"/"+  code +"-"+ field;






var url = item.config.findUrl!;//根据菜单code查找url
var nameField = item.config.showField!;//config 提取
var mode = 'radio';//单选（radio） or 复选（check）
if(ismultiple){
	mode = 'check';
}


var placeholderstr = "请选择";
if(isTrue(isQuery!)){//查询
	placeholderstr = "请选择"+placeholder;
}else if(!isEmpty(placeholder!) ){
	placeholderstr = placeholder;
}

value = isEmpty( value! ) ? defaultValue!:value!;
// 将URL作为属性放置于值所在的隐藏文本框上，方面级联时JS修改URL
//单选复选，最多多少，最少多少，是否必填

%>



<div class="bb-find">
              <input id="${id!}_show" name="${name}_show" data-pure-clear-button="true"  autocomplete="off" placeholder="${placeholderstr!}"  class="form-control" ${disabled} bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')}>
<!-- <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span> -->
<a id="${id!}_a" class="glyphicon glyphicon-remove btn form-control-feedback" style="pointer-events: auto;"></a>
<!--               <span class="input-group-addon"><i class="fa fa-search"></i></span> -->

              <input type="hidden" id="${id!}" name="${name}" value="${value!}" placeholder="${placeholderstr!}" title='${item.cn!}'  >

</div> 



<script type="text/javascript">
$(function () {


var init${id!}Data = function(value) {	
	// 手动赋值,如果有值的花
 	$.ajax({
		url :'${findUrl!}-'+value,
		type : 'get',
		 dataType: "json",
		success : function(data) {
			if(data.status == 200){
				
			
				$('#${id!}_show').val(data.data['${item.config.showField!}']);
			}
			
		}
	});
}
if('${value!}' != ''){
	init${id!}Data('${!isEmpty(value!)? value!:defaultValue!}');
}

 	 	
 	 	 //点击事件（只读模式不需事件）
 	 	 $("#${id!}_show").click(function(){
 	 		if($("#${id!}_show").attr('readonly') != "readonly"){
 	 			 //单选（radio） or 复选（check）
 	  	 		$.modal.open("选择${item.cn!}",  "${url!}?&mode=${mode!}&isQuery=false&choiceField=${id!}&nameField=${nameField!}&choiceFieldValue="+$("#${id!}").val());
 	 		  }
 	 	});

 	    $('#${id!}_a').click(function () {
 	    	if($("#${id!}_show").attr('readonly') != "readonly"){
	 	    	$('#${id!}_show').val('');
	 	    	$('#${id!}').val('');
 	    	}
 	    });
 	    
});	 




</script>
