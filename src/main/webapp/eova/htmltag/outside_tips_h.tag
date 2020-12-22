<%
//外部提示，如果设置为内部提示，则外部不显示提示，除了几个特殊字段：布尔框、单选框
if(BB_FORM_TIPS_IN! != 1 || f.type=='布尔框' ||  f.type=='单选框'){ %>
	<span class="help-block m-b-none">${!isEmpty(f.placeholder!)?('<i class="fa fa-info-circle"></i> '+f.placeholder)}</span>
<% } %>
