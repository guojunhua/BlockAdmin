<% 
//dashboard 
//menu.board_ui!

var type = widget.type;//图表类型:1=饼图,2=折线/柱图

%>
<%if(type! == 1){//纯看数据模式%>
	<#pie_h id="pie_${item.id}" code="${item.code}" />
<% }else if(type! == 2){ %>
	<#pie_h id="line_${item.id}" code="${item.code}" />
<% } %>