<% //查询用 >=start_${name} 小于end_${name}
//https://my.oschina.net/kevin2kelly/blog/1489554
%>
<input type="text" class="input-sm form-control"  id="start_${id}" name="start_${name}" placeholder="${start_placeholder!}" />
<span >-</span>
<input type="text" class="input-sm form-control"   id="end_${id}" name="end_${name}" placeholder="${end_placeholder!}" />

<!-- 可以通过js设置此值，设置区间 -->
<input type="hidden" id="max_${id}" name="max_${name}" value='7'>



<script>
$(document).ready(function() {
	$("#start_${id}").datetimepicker({
	    minView: "month", //  选择时间时，最小可以选择到那层；默认是‘hour’也可用0表示
	    //language: 'zh-CN', // 语言
	    autoclose: true, //  true:选择时间后窗口自动关闭
	    format: 'yyyy-mm-dd 00:00:00', // 文本框时间格式，设置为0,最后时间格式为2017-03-23 17:00:00
	    todayHighlight: true, //高亮当日
	    clearBtn: true,   //清除按钮
	    // todayBtn: true // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
	    // startDate: '-3d',  // 窗口可选开始时间
	    // endDate: '+3d'   // 窗口可选截止时间
	}).on("changeDate", function () {
	
	    //清除开始时间时，结束时间取消限制
	    if (!this.value) {
	        $("#end_${id}").datetimepicker("setStartDate", "1970-01-01");
	        $("#end_${id}").datetimepicker("setEndDate", "3000-01-01");
	    } else {
	        //可选结束时间从当前选定时间开始的7日内
	        $("#end_${id}").datetimepicker("setStartDate", this.value);
	        var end = new Date(this.value);
	        end.setDate(end.getDate() + $("#max_${id}").val()*1);
	        $("#end_${id}").datetimepicker("setEndDate", end);
	    }
	});
	
	$("#end_${id}").datetimepicker({
	    minView: "month", //  选择时间时，最小可以选择到那层；默认是‘hour’也可用0表示
	   // language: 'zh-CN', // 语言
	    autoclose: true, //  true:选择时间后窗口自动关闭
	    format: 'yyyy-mm-dd 23:59:59', // 文本框时间格式，设置为0,最后时间格式为2017-03-23 17:00:00
	    todayHighlight: true,
	    clearBtn: true//, // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
	    // startDate: '-3d',  // 窗口可选开始时间
	    // endDate: '+3d'   // 窗口可选截止时间
	}).on("changeDate", function () {
	
	    //清楚结束时间时，开始时间取消限制
	    if (!this.value) {
	        $("#start_${id}").datetimepicker("setEndDate", "3000-01-01");
	        $("#start_${id}").datetimepicker("setStartDate", "1970-01-01");
	    } else {
	        //可选开始时间从当前选定时间向前7日内
	        $("#start_${id}").datetimepicker("setEndDate", this.value);
	        var start = new Date(this.value);
	        start.setDate(start.getDate() - $("#max_${id}").val()*1);
	        $("#start_${id}").datetimepicker("setStartDate", start);
	    }
	});

	let id = "${id}";
	let diy_value_SE = "${value}";
	if(diy_value_SE && diy_value_SE.indexOf("+")!=-1){
		let diy_start_end = diy_value_SE.split("+");
		let diy_start_time = diy_start_end[0];
		let diy_end_time = diy_start_end[1];
		if(!diy_start_time || !diy_end_time){
			return;
		}

		let start_time_dom = document.getElementById("start_"+id);
		let end_time_dom = document.getElementById("end_"+id);
		start_time_dom.value = diy_start_time;
		end_time_dom.value = diy_end_time;
		
		start_time_dom.setAttribute("disabled", "disabled");
		end_time_dom.setAttribute("disabled", "disabled");
		
	}
}); 
</script>