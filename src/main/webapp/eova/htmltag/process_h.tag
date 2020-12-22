<%
// data-options
var verify = "";
//只读，不支持查询
var disabled="readonly";
//查询进程
var queryUrl = "/widget/findTheProcessDetail";
queryUrl = queryUrl +"/"+  code +"-"+record[object['pk_name']];//objId
//基于开源 steps.js
//http://www.fxss5201.cn/project/plugin/steps/2.0/
//https://github.com/fxss5201/steps
%>
<div class="bb_step" id="${id!}" name="${name!}"></div>
<script>

$(function () {
	
$.ajax({
	url : '${queryUrl}',
	dataType: "json",
	type : 'get',
	success : function(data) {
		if(data.data != null){
			initBBStep(data.data);
		}else{
			$("#${id!}").text("未发起审核");;
		}
	}
});


function initBBStep(process){
	var tasks = process['tasks'];
	console.log(tasks);
	//审批状态:0=创建,1=运行中,2=被终止,3=完成
	var status = process['status'];
	

	var step = -1;
	var stepDatas = [];
	
	var i = 0;
	tasks.forEach(function(value,index,array){
		//审批结果:1=同意,0=拒绝,2=转交,3=无
		var result = value["result"];
		var user = value["userinfo"];
		var remark = process['remark'];
		var name = '';
		if(user != null){
			name = user['nickname'];
		}
		//String  value[user_id];
		
		if(status ==2 || status ==3){
			if(result == 3){
				return true;
			}
		}
		stepDatas[i]= {};
		if(result == 0){

			stepDatas[i]['title'] = name+' 拒绝了你'; 
			stepDatas[i]['description'] = name+':'+remark; 
			stepDatas[i]['icon'] = '<div class="step-error"></div>';
			step = i;
		}else if(result == 1){
	
			stepDatas[i]['title'] = name+' 表示同意'; 
			stepDatas[i]['description'] = ''; 
			stepDatas[i]['icon'] = '<div class="step-success"></div>';
			
			step = i;
		}else if(result == 2){
		
			stepDatas[i]['title'] = name+' 转交审核'; 
			stepDatas[i]['description'] = ''; 
			stepDatas[i]['icon'] = '<div class="">-</div>';
			
			step = i;
		}else if(result == 3){
	
			stepDatas[i]['title'] = name+' 审核中'; 
			stepDatas[i]['description'] = ''; 
		}
	    i++;
	 });
	
	
	if(status ==3){//完成
		step = stepDatas.length;
		//审批结果:1=同意,0=拒绝,2=终止
		var result = process['result'];
		var remark = process['remark'];
		
		stepDatas[stepDatas.length] =onestep={};
		if(result == 1){
			onestep['title'] = '审批通过'; 
			onestep['description']= ''; 
			onestep['icon'] = '<div class="step-success"></div>';
		}else{
			onestep['title'] = '审批失败'; 
			onestep['description'] = remark; 
			
			onestep['icon'] = '<div class="step-error"></div>';
		}
		
	}else if(status ==2){//被终止
		step = titles.length;
	
		stepDatas[stepDatas.length] =onestep={};
		onestep['title'] = '审批终止'; 
		onestep['description']= ''; 
	}else{
		
		stepDatas[stepDatas.length] =onestep={};
		onestep['title'] = '审批结束'; 
		onestep['description']= ''; 
	}
	
	
	var steps1 = steps({
	    el: "#${id!}",
	    data: stepDatas,
	    dataOrder: ["title", "line", "description"],
	    iconType: "custom",
	    customClass: "custom-class",
	   // center: true,
	    active:step
	});
}
	
});

</script>