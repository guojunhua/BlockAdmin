<%
var disabled = "";
if( isTrue(isReadonly!) ||isTrue(view!)){
	disabled =   "readonly "  ;
}
var lay_text = "是|否";
if(!isEmpty(options!)){
	lay_text =   options  ;
}

var checked = "";
//debug(value!);
//debug(defaultValue!);
value = isEmpty( value! ) ? defaultValue!:value!;

//新增的情况
if(isEmpty( value! ) ){
	checked =   ""  ;
}else{
	if(isTrue(value!) || value! =='on'){
		checked =   "checked"  ;
	} 
}

if(checked != "checked"){
	value = "off";
}else
	value = "on";

%>




<div class="bb_switch">
<input type="checkbox" class="js-switch form-control" id="${id!}_checkbox" name="${name!}_checkbox" ${disabled} ${checked} />
<input type="hidden" id="${id!}" name="${name!}" value="${value!}">
</div>
<script>

$(function(){
	
	var elem = document.getElementById("${id!}_checkbox");
	//size 设置禁用可用按钮的大小、secondaryColor：设置右边的颜色为红色color: '#1AB394'
	//var switchery = new Switchery(elem,{size:"small",secondaryColor:"#1AB394"});
	var disabled =false;
	if($("#${id!}_checkbox").attr('readonly') == "readonly"){
		disabled = true;
	}
	var switchery = new Switchery(elem,{size:"small", color: '#26a8eb',secondaryColor:"#e4e4e4",disabled          : disabled});

	//$(".chzn-select")
	elem.onchange = function() {
		
		//获取按钮的选中状态
		isChecked = elem.checked;
		// console.log(isChecked);   
		if(isChecked){
				  $("#${id!}").val("on");
		}else{
				  $("#${id!}").val("off");
	    }
	};
});

</script>
