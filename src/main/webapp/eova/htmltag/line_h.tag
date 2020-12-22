<% 
//折线
%>
<div class="bb_charts" id="${id!}" code="${code!}" style="width: 100%;height:400px;"></div>

<script type="text/javascript">
var url = "/dashboard/charts/${code!}";
$.ajax({
	url : url,
	dataType: "json",
	type : 'get',
	success : function(data) {
		
		if(data.status == 200){
			var opt = "option_${id!}="+data.data.content;
			eval(opt);

			var chart = $.init_bbchart('${id!}',option_${id!}) ;
			
			if(data.data.data_type == 1){//sql绑定数据模式
				var url = "/dashboard/chartsData/${code!}";
				$.init_line_data(url,chart);
			}
		}else
			alert(data.msg);
	}
});
</script>