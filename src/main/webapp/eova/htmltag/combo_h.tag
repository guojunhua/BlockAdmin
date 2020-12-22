<%
// data-options
var data = "";
if(!isEmpty(options!)){
	data = data + options;
}

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


var disabled="";
if( isTrue(isReadonly!) || isTrue(view!)){
	disabled = 'readonly';
	verify = '';
}

var ismultiple = "";
if(isTrue(multiple!)){
	ismultiple = "multiple";
}
var placeholderstr = "请选择";
if(isTrue(isQuery!)){//查询
	placeholderstr = "请选择"+placeholder;
}else if(!isEmpty(placeholder!) ){
	placeholderstr = placeholder;
}


// 默认URL
var queryUrl = "";
// 编码 或 表达式 必须存在其一
if(!isEmpty(code) || !isEmpty(exp)){
	// 存在自定义URL
	if(!isEmpty(url!)){
		// 自定义URL
		queryUrl = url;
	} else {
		queryUrl = "/widget/comboJson";
		if(!isEmpty(code) && !isEmpty(field)){
			// 存在编码和字段
			queryUrl = queryUrl +"/"+  code +"-"+ field;
		} else if(!isEmpty(exp)){
			// 存在自定义表达式
			queryUrl = queryUrl + "?exp=" + exp; 
		}
	}
}
var finalValue = strutil.finalValue(defaultValue!,value!,limit!);
//select2
//https://github.com/select2/select2
%>


<div class="input-group">
<select id="${id!}" name="${name!}" data-placeholder="${placeholderstr!}" placeholder="${placeholderstr!}" class="form-control m-b"  ${ismultiple} url0="${queryUrl!}" ${disabled!} pid="${f.pid!}" defaultValue="${defaultValue!}" bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')}>
</select>
</div>
<script type="text/javascript">

var ${id!}_init= function(defaultValue){
	//清除本节点数据（子节点也要执行初始）
	$("#${id!}").empty();
	//console.log('初始节点：${id!}');
	
	if(defaultValue == '' || typeof(defaultValue) == "undefined")
		defaultValue = '${finalValue!}';
	
	
	var parent = $('select[id="${id!}"]').attr("pid");
	var parentVal = null;
	if(typeof(parent) != "undefined" && parent!= ''){//取父节点值（要么用值 其次用 默认值）,如果父节点存在才算有父亲
		if ( $("#"+parent).length > 0 ) {//存在父节点
			parentVal = $('select[id="'+parent+'"]').val();
			//if(parentVal == null || parentVal ==''){
			//	parentVal =$('select[id="'+parent+'"]').attr("defaultValue");
			//}
		}else{
			parent = null;
		}
	}else{
		parent = null;
	}
	
	if(parent != null){//存在父节点
		if(parentVal != null && parentVal!=''){//加载
			
		}else{//不加载
			return;
		}
	}else{//加载全部
		
	}
	

	var limit = null;
	if("${limit!}" != ""){
		limit = "${limit!}".split(','); 
	}
	
	var url = '${queryUrl!}';
	if(parentVal != null && parentVal != '')
		url += '?query_'+parent+'='+parentVal;
 	$.ajax({
		url : url,
		dataType: "json",
		type : 'get',
		success : function(data) {
			
			var objects = eval(data);
			var pidKey = parent;
			var pidValue = parentVal;
			//判断是否有
			//select areaId ID,areaName CN,parentid p_id from table//如果存在ID，CN之外的字段则认为是关联的,并且指定了父节点是谁
			
			
			if(pidKey != null){
				 //如果存在 
				 if(typeof($('select[id="${id!}"]').attr("pid")) == "undefined" ){
					 $('select[id="${id!}"]').attr("pid",pidKey);
				 }
				pidValue = $('select[id="'+pidKey+'"]').val();
			}
			//检测父节点是否有值才渲染|| 无父节点也渲染
			//console.log('pidValue:'+pidValue);
			if(pidKey == null
					|| (pidValue != null && pidValue!= '')){
				
			
				var obj = document.getElementById("${id!}");
				$(objects).each(
						function(index) {
							if(index == 0){	
								$("#${id!}").append('<option value="">${placeholderstr!}</option>');
							}
							
							var object = objects[index];
							
							//disabled
							var disabled = "";
							if(limit != null){
								var limitOneIndex = $.findArray(limit,object.id);
								if(limitOneIndex==-1)
									disabled = "disabled";	
							}
							if(pidKey == null){
								var optionStr = "";
								
								
								optionStr += "<option value='" + object.id + "' "+disabled+">"
										+ object.cn + "</option>";
								$("#${id!}").append(optionStr);
								
								//$("#${id!}").add(new Option(object.id, object.cn));
							}else{
								 if(object[pidKey] == pidValue){
									var optionStr = "";
									optionStr += "<option value='" + object.id + "' "+disabled+">"
											+ object.cn + "</option>";
									$("#${id!}").append(optionStr);
									
									//$("#${id!}").add(new Option(object.id, object.cn));
									//$("#select_id").append("<option value='value'>text</option>");
								}
							}
						});
				
				
				
					
			
				
					//默认值用 1、传值 2、字段默认值 使用完记得把字段 defaultValue置为空
					if(!defaultValue){
						defaultValue =  $('select[id="${id!}"]').attr("defaultValue");
					}
					
					if(defaultValue &&typeof(defaultValue) != "undefined" && parent!= ''){
						//console.log('设置${id!}默认值：'+defaultValue);
				    	$('select[id="${id!}"]').val(defaultValue.split(','));
				    	$('select[id="${id!}"]').attr("defaultValue",'');
					}
					
				
				
				
			}
			
			// $("#${id!}").trigger("chosen:updated");
            // $("#${id!}").chosen();
			//renderForm();//由于前部还有一个重置options的操作
			
			//检查是否有子节点需要刷新数据
			  var pid = $('select[pid="${id!}"]');
			  if(pid.length != 0){
				  //关联初始
				  var funName = pid.attr("id")+"_init";
				  //${id!}_init
				  if(isExitsFunction(funName) ){
					  //funName();
					  //alert(funName);
		    	  		//dataDone(res, curr, count,is_single);
					  eval(funName+"();");

		    	  	}
			  }
		}
	});
}	


$(function(){
	//单节点||级联节点第一节点 需要主动初始
	//var son = $('select[pid="${id!}"]');
	//var parent = $('select[pid="${id!}"]');
	${id!}_init("${finalValue!}");
	
	var allowClear1 = true;
	if($('#${id!}').attr('readonly') || $('#${id!}').is(':hidden')){//只读模式，不需要清除按钮
		allowClear1 =false;
	}
	
	$('#${id!}').select2({
        placeholder: "${placeholderstr!}",
        placeholderOption: "first",
        allowClear: allowClear1
     });
	
	//https://github.com/select2/select2/issues/3387
	$("#${id!}").on("select2:opening", function (e) {
	    if($(this).attr('readonly') || $(this).is(':hidden')){
	    e.preventDefault();
	    }
	});
	
	
	//复选按选中得顺序排序  https://blog.csdn.net/Learn_1992/article/details/82985182
	$("#${id!}").on("select2:select", function (evt) {//此处会导致选中事件触发两次(非复选无需添加此事件了)
		//console.log('select');  
		
	
		if($(this).attr('multiple') ){
			var element = evt.params.data.element;
		  var $element = $(element);
		  
		  $element.detach();
		  $(this).append($element);
		  $(this).trigger("change");
		}
		 //检查是否有子节点需要刷新数据
		  var pid = $('select[pid="${id!}"]');
		  if(pid.length != 0){
			  //关联初始
			  var funName = pid.attr("id")+"_init";
			  //${id!}_init
			  if(isExitsFunction(funName) ){
				  //funName();
				  //alert(funName);
        	  		//dataDone(res, curr, count,is_single);
				  eval(funName+"();");

        	  	}
		  }
	});

 	
 	/* $('#${id!}').on('change', function(e, params) {
 		console.log('change');
 		
 		 
	}); */
 	
 	
 
 	
});


</script>
    

