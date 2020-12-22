<%
// data-options
var verify = "";
//只读，不支持查询
var disabled="readonly";
//查询进程
var queryUrl = "/widget/findTheProcessDetail";
queryUrl = queryUrl +"/"+  code +"-"+record[object['pk_name']];//objId
//基于jquery step 效果不好，尤其是不支持节点失败的效果
//http://www.yu313.cn/unit/demo/yanshi161
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
	
	//datas[datas.length] = "";
	var step = -1;
	var titles = [];
	
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
		 
		if(result == 0){
			titles[i] = name+' 拒绝了你('+remark+')'; 
			
			step = i;
		}else if(result == 1){
			titles[i] = name+' 表示同意'; 
			
			step = i;
		}else if(result == 2){
			titles[i] = name+' 转交审核'; 
			
			step = i;
		}else if(result == 3){
		
			titles[i] = name+' 审核中'; 
		}
	    i++;
	 });
	
	
	if(status ==3){//完成
		step = titles.length;
		//审批结果:1=同意,0=拒绝,2=终止
		var result = process['result'];
		var remark = process['remark'];
		
		if(result == 1){
			titles[titles.length] = '审批通过'; 
		}else{
			titles[titles.length] = '审批失败('+remark+')'; 
		}
		
	}else if(status ==2){//被终止
		step = titles.length;
	
		titles[titles.length] = '审批终止'; 
		
	}else{
		titles[titles.length] = '审批结束'; 
		
	}
	
	
	
	
	var $step = $("#${id!}");
	//console.log(titles);
	$step.step({
		index: -1,
		time: 500,
		//title: ["填写申请表", "上传资料", "待确认", "已确认", "预约完成"]
		title: titles
	});
	
	//console.log(step);
	//$step.toStep(2);  
	//$step.getIndex() 获取步骤节点
	if(step>=0)
		$step.toStep(step);
}
	
});

</script>