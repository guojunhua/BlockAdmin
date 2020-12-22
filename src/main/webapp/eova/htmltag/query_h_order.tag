<%
//isShow = false;
//debug(isQuery!);
//debug(query_params!);
%>
<div class="col-sm-12 search-collapse" style="${isTrue(isQuery!true) ?'':'display: none;'}" >
				<form id="${id!}">
					<div class="select-list">
						<ul style="display:flex;flex-wrap:wrap;">
						
						<%
	
	var diyHeight = 0;
	// 自动计算高度
	var count = 0;
	// 获取分组元字段数据
	var fields = query("fields", objectCode); 
	for(f in fields){
		// 只输出允许查询的条件,count累计一共有多少个查询条件
		if(!isTrue(f.is_query)){
			continue;
		}
		count++;
		
		// 特殊处理，因为复选框可能独占一行(本来无一物何处惹尘埃)，如果不是跟钱过不去，还是用推荐用下拉框
		if(f.type == "复选框"){
			diyHeight = diyHeight + 25;
		}
		var value = query_params['query_'+f.en]!;
		var start_value = query_params['start_'+f.en]!;
		var end_value = query_params['end_'+f.en]!;
	
		var isReadonly = false;
		if(value! != null){//只读
			isReadonly = true;
		}else if(start_value! != null || end_value! != null){
			isReadonly = true;
		}
		//debug(f.en);
		//debug(isReadonly);
		//参照不知道为啥效果有些不一致，比如行间隔 http://lovetime.gitee.io/weadmin/pages/order/list.html
		
	%>	
				 
<!--  <li style="display:flex;flex-wrap:wrap;"> -->
					<%if(f.type == "文本框" || f.type == "文本域" || f.type == "编辑框" || f.type == "图片框" || f.type == "文件框" || f.type == "密码框"){%>
		       			<li style="display:flex;justify-content:flex-end;align-items:center;width:270px;height:30px" >
		       			<span >${f.cn}:</span><#text_h  id="query_${f.en}" name="query_${f.en}" value="${value!}" isReadonly="${isReadonly!}" placeholder="请输入${f.cn}" />
					<%}else if(f.type == "日期框" || f.type == "时间框"){%>
						<li style="display:flex;justify-content:flex-end;align-items:center;width:270px;height:30px" class="select-time">
						 <span >${f.cn}:</span><#times_h id="${f.en}" name="${f.en}" value="${start_value!}+${end_value!}" isReadonly="${isReadonly!}" start_placeholder="${f.cn}开始时间" end_placeholder="${f.cn}结束时间"  />
					<%}else if(f.type == "数字框"){%>
						<li style="display:flex;justify-content:flex-end;align-items:center;width:270px;height:30px" >
						<span >${f.cn}:</span><#num_h id="${f.en}" name="${f.en}" value="${value!}" isReadonly="${isReadonly!}" start_placeholder="${f.cn}大与等于" end_placeholder="${f.cn}小于" />
					<%}else if(f.type == "布尔框"){%>
						<li style="display:flex;justify-content:flex-end;align-items:center;width:270px;height:30px" >
						 <span >${f.cn}:</span><#bool_h item="query_${f}" id="query_${f.en}" value="${value!}" isReadonly="${isReadonly!}" defaultValue="on" name="query_${f.en}" />
					
					<%}else if(f.type == "单选框"  ){%>
						<li style="display:flex;justify-content:flex-end;align-items:center;width:270px;height:30px" >
						<span>${f.cn}:</span><#combo_h id="query_${f.en}" name="query_${f.en}" value="${value!}" isReadonly="${isReadonly!}" code="${f.object_code}" field="${f.en}"  placeholder="${f.cn}"   />
					
					<%}else if(f.type == "流程框"  ){//暂时无查询%>
						 
					<%}else{%>
						<li style="display:flex;justify-content:flex-end;align-items:center;width:270px;height:30px" >
						<span >${f.cn}:</span><#field_h item="${f}" value="${value!}" isQuery="true" readonly="${isReadonly!}" placeholder="${f.cn}"  />
					<%}%>
				</li>
	<% } %>	
						
							
							<li>
								<a class="btn btn-primary btn-rounded btn-sm" onclick="refresh()"><i class="fa fa-search"></i>&nbsp;搜索</a>
<!-- 							    <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a> -->
							</li>
						</ul>
					</div>
				</form>
	<script>
		$(".form-control").keypress(function (e) {
			if (e.which == 13) {
				refresh();
			}
		});
	</script>
			</div>