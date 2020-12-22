<form class="form-horizontal m" id="${id}" name="${id}" method="post">
<input name="BB_PROCESS_APPROVAL" id="BB_PROCESS_APPROVAL" type="hidden"/>
<%
		// Form Widget: 。
		// 下面的代码，必须非常熟悉Beetl再看如下代码。
		// 用到Beetl各种常规语法+自定义函数+Tag
		//只是查看模式view，所有字段都是只读并且按钮为“确认”
		
		
		// 获取分组元字段数据
			// 获取分组元字段数据（友查询改成 后台直接可以带出来）
		//var fields = query("fields", objectCode); 

//process控件不输出
		
%>



                
<%
var fields =object.fields; 


var lastFieldset = "";
var isFirstEnd = false;

for(f in fields){
	//debug(f.type);
	if('流程框' == f.type && !isTrue(view!)){//流程框在 非查看模式下原则不输出
		continue;
	}
				// 如果当前分组名和上一个分组名不一样，输出分组标签
				if(f.fieldset != lastFieldset){
					
					isFirstEnd = true;				// 分组标签待闭合标记
					lastFieldset = f.fieldset;		// 记录当前分组名
					%>
						 <h4 class="form-header h4"></h4>
					<%
				}
				%>



<%

if(!isEmpty(data!)){
	// 有数据为更新模式
	if(f.update_status < 50){		 	// 未禁用

		var value = @data.get(f.en);	// 获取当前字段的值
		var isReadOnly = false;		// 当前字段是否只读
		if(f.update_status == 10){
			isReadOnly = true;
		}
		
		// 获取固定值(必须是JSON)
		if(!isEmpty(fixed)){
			// JSON对象化
			var fix = parseJson(fixed);
			var fixedValue = fix[f.en];
			// 固定值覆盖动态值并且只读
			if(!isEmpty(fixedValue)){
				value = fixedValue;
				isReadOnly = true;
			}
		}
		
		
		
		
		if(f.update_status == 20){		// 隐藏字段(时间字段没格式化，建议不要带出来修改了)
			%>
			<#field_hidden item="${f}" fixed="${fixed!}" value="${value!f.defaulter}" />
			<% 
		}else{
			%>
			
			 
               
                <div class="form-group">
					<label class="col-sm-2 control-label "><% if(isTrue(f.is_required!)){ %><font size="4" face="arial" color="red">*</font><% } %>${f.cn}：</label>
					<div class="col-sm-9">
						<#field_h item="${f}" value="${value!}" defaultValue="${f.defaulter!}" readonly="${isReadOnly}" view="${view!}"/>
						<#outside_tips_h f="${f}"/>
						
					</div>
				</div>
			
			<%
		}
	}
} else {
	// 无数据为新增模式
	if(f.add_status < 50){			// 未禁用
		var value = null;
		var isReadOnly = false;		// 当前字段是否只读
		if(f.add_status == 10){
			isReadOnly = true;
		}
		
		// 获取固定值(必须是JSON)
		if(!isEmpty(fixed)){
			// JSON对象化
			var fix = parseJson(fixed);
			var fixedValue = fix[f.en];
			// 固定值覆盖动态值并且只读
			if(!isEmpty(fixedValue)){
				value = fixedValue;
				isReadOnly = true;
			}
		}
		
		
		
		if(f.add_status == 20){		// 隐藏字段 class="layui-hide"
			%>
		<#field_hidden item="${f}" fixed="${fixed!}" value="${value!f.defaulter}" />
			<% 					
		}else{
			%>
			
			
			  
			  
			
			   <div class="form-group">
					<label class="col-sm-2 control-label "><% if(isTrue(f.is_required!)){ %><span style="color: red; ">*</span><% } %>${f.cn}：</label>
					<div class="col-sm-9">
						<#field_h item="${f}" value="${value!}" defaultValue="${f.defaulter!}" readonly="${isReadOnly}" view="${view!}"/>
						<#outside_tips_h f="${f}"/>
					</div>
				</div>
			  
			
			<%
		}
	}
}

%>

					
                     

<%
}
%>
                          
                            <!-- <div class="hr-line-dashed"></div>
                            
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                	
                                    <%if(!isTrue(view!)){ %>
							    	  <button class="btn btn-primary " type="button"><i class="fa fa-check"></i>&nbsp;保存内容</button>
							       <% }else{ %>
							          <button class="btn btn-primary " type="button"><i class="fa fa-check"></i>&nbsp;确定</button>
							       <% } %>
                                    
                                    <%// 仅超级管理员可见 %>
	        						<%if(session.user!= null && session.user.isAdmin!){%>
	        						<#design_button_h objectCode="${object.code}" formType="${VIEW_FORM!(PAGE_TYPE+'Form')}" />
									<%}%>
                                    
                                     <%if(!isTrue(view!)){ %>
							    	  <button class="btn btn-white" type="submit">取消</button>
							         <% } %>
                                </div>
                            </div>
                        -->
                

</form>
<script>

</script>