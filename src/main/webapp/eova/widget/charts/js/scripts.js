function supportstorage() {
	if (typeof window.localStorage=='object') 
		return true;
	else
		return false;		
}

function handleSaveLayout() {
	var e = $(".demo").html();
	if (!stopsave && e != window.demoHtml) {
		stopsave++;
		window.demoHtml = e;
		saveLayout();
		stopsave--;
	}
}

var layouthistory; 
function saveLayout(){
	var data = layouthistory;
	if (!data) {
		data={};
		data.count = 0;
		data.list = [];
	}
	if (data.list.length>data.count) {
		for (i=data.count;i<data.list.length;i++)
			data.list[i]=null;
	}
	data.list[data.count] = window.demoHtml;
	data.count++;
	if (supportstorage()) {
		localStorage.setItem("layoutdata",JSON.stringify(data));
	}
	layouthistory = data;
	console.log(data);
	/*$.ajax({  
		type: "POST",  
		url: "/build/saveLayout",  
		data: { layout: $('.demo').html() },  
		success: function(data) {
			//updateButtonsVisibility();
		}
	});*/
}

function downloadLayout(){
	
	$.ajax({  
		type: "POST",  
		url: "/build/downloadLayout",  
		data: { layout: $('#download-layout').html() },  
		success: function(data) { window.location.href = '/build/download'; }
	});
}

function downloadHtmlLayout(){
	$.ajax({  
		type: "POST",  
		url: "/build/downloadLayout",  
		data: { layout: $('#download-layout').html() },  
		success: function(data) { window.location.href = '/build/downloadHtml'; }
	});
}

function undoLayout() {
	var data = layouthistory;
	//console.log(data);
	if (data) {
		if (data.count<2) return false;
		window.demoHtml = data.list[data.count-2];
		data.count--;
		$('.demo').html(window.demoHtml);
		if (supportstorage()) {
			localStorage.setItem("layoutdata",JSON.stringify(data));
		}
		return true;
	}
	return false;
	/*$.ajax({  
		type: "POST",  
		url: "/build/getPreviousLayout",  
		data: { },  
		success: function(data) {
			undoOperation(data);
		}
	});*/
}

function redoLayout() {
	var data = layouthistory;
	if (data) {
		if (data.list[data.count]) {
			window.demoHtml = data.list[data.count];
			data.count++;
			$('.demo').html(window.demoHtml);
			if (supportstorage()) {
				localStorage.setItem("layoutdata",JSON.stringify(data));
			}
			return true;
		}
	}
	return false;
	/*
	$.ajax({  
		type: "POST",  
		url: "/build/getPreviousLayout",  
		data: { },  
		success: function(data) {
			redoOperation(data);
		}
	});*/
}

function handleJsIds() {
	
	handleModalIds();
	
	handleAccordionIds();
	
	handleCarouselIds();
	
	handleTabsIds();
	
	hangleEchartsInit();
}

/** 初始化拖拽好的echart **/
function hangleEchartsInit(){
	var e = $(".demo");
	//var t = randomNumber();
	e.find(".bb_charts").each(function(e, t) {
		
		let name = $(t).attr("name");
		let code =  $(t).attr("dg-chart-widget");
		let hasInit = $(t).hasClass("inited");
		
		let id = $.uuid();
		if(code == null ){
			id = $.uuid();
			$(t).attr("dg-chart-widget",id);
			
			$(t).attr("id",id);
		}else{
			id = $(t).attr("id");
		}
		
		
		
		
		if(code == null || !hasInit){
			
			let editBn = $(t).parent().prev().prev().children()[0];
			if(editBn && $(editBn).attr('target') == null){
				$(editBn).attr('target',id);
			}
			
			let result = initByName($(t));
			
			//if(result)
			//	$(t).addClass("inited");
			
		}
		
		
		
		
		
		
		
		
		
	})
}

function initByName(chartObj){
	let id = chartObj.attr("id");
	let name = chartObj.attr("name");
	if(name == 'line'){
		line_init(id);
		
		if(!chartObj.hasClass("inited"))
			chartObj.addClass("inited");
	}else if(name == 'bar'){
		bar_init(id);
		
		if(!chartObj.hasClass("inited"))
			chartObj.addClass("inited");
	}else if(name == 'radar'){
		radar_init(id);
		
		if(!chartObj.hasClass("inited"))
			chartObj.addClass("inited");
	}else if(name == 'scatter'){
		scatter_init(id);
		
		
		if(!chartObj.hasClass("inited"))
			chartObj.addClass("inited");
	}else if(name == 'pie'){
		pie_init(id);
		
		if(!chartObj.hasClass("inited"))
			chartObj.addClass("inited");
	}else if(name == 'gauge'){
		gauge_init(id);
		
		if(!chartObj.hasClass("inited"))
			chartObj.addClass("inited");
	}else{
		console.log('未知控件：'+name);
		
		return false;
	}
	
	return true;
}

function handleAccordionIds() {
	var e = $(".demo #myAccordion");
	var t = randomNumber();
	var n = "accordion-" + t;
	var r;
	e.attr("id", n);
	e.find(".accordion-group").each(function(e, t) {
		r = "accordion-element-" + randomNumber();
		$(t).find(".accordion-toggle").each(function(e, t) {
			$(t).attr("data-parent", "#" + n);
			$(t).attr("href", "#" + r)
		});
		$(t).find(".accordion-body").each(function(e, t) {
			$(t).attr("id", r)
		})
	})
}
function handleCarouselIds() {
	var e = $(".demo #myCarousel");
	var t = randomNumber();
	var n = "carousel-" + t;
	e.attr("id", n);
	e.find(".carousel-indicators li").each(function(e, t) {
		$(t).attr("data-target", "#" + n)
	});
	e.find(".left").attr("href", "#" + n);
	e.find(".right").attr("href", "#" + n)
}
function handleModalIds() {
	var e = $(".demo #myModalLink");
	var t = randomNumber();
	var n = "modal-container-" + t;
	var r = "modal-" + t;
	e.attr("id", r);
	e.attr("href", "#" + n);
	e.next().attr("id", n)
}
function handleTabsIds() {
	var e = $(".demo #myTabs");
	var t = randomNumber();
	var n = "tabs-" + t;
	e.attr("id", n);
	e.find(".tab-pane").each(function(e, t) {
		var n = $(t).attr("id");
		var r = "panel-" + randomNumber();
		$(t).attr("id", r);
		$(t).parent().parent().find("a[href=#" + n + "]").attr("href", "#" + r)
	})
}
function randomNumber() {
	return randomFromInterval(1, 1e6)
}
function randomFromInterval(e, t) {
	return Math.floor(Math.random() * (t - e + 1) + e)
}
function gridSystemGenerator() {
	$(".lyrow .preview input").bind("keyup", function() {
		var e = 0;
		var t = "";
		var n = $(this).val().split(" ", 12);
		$.each(n, function(n, r) {
			e = e + parseInt(r);
			t += '<div class="span' + r + ' column"></div>'
		});
		if (e == 12) {
			$(this).parent().next().children().html(t);
			$(this).parent().prev().show()
		} else {
			$(this).parent().prev().hide()
		}
	})
}
function configurationElm(e, t) {
	$(".demo").delegate(".configuration > a", "click", function(e) {
		e.preventDefault();
		var t = $(this).parent().next().next().children();
		$(this).toggleClass("active");
		t.toggleClass($(this).attr("rel"))
	});
	$(".demo").delegate(".configuration .dropdown-menu a", "click", function(e) {
		e.preventDefault();
		var t = $(this).parent().parent();
		var n = t.parent().parent().next().next().children();
		t.find("li").removeClass("active");
		$(this).parent().addClass("active");
		var r = "";
		t.find("a").each(function() {
			r += $(this).attr("rel") + " "
		});
		t.parent().removeClass("open");
		n.removeClass(r);
		n.addClass($(this).attr("rel"))
	})
}
function removeElm() {
	$(".demo").delegate(".remove", "click", function(e) {
		e.preventDefault();
		$(this).parent().remove();
		if (!$(".demo .lyrow").length > 0) {
			clearDemo()
		}
	})
}
function clearDemo() {
	$(".demo").empty();
	layouthistory = null;
	if (supportstorage())
		localStorage.removeItem("layoutdata");
}
function removeMenuClasses() {
	$("#menu-layoutit li button").removeClass("active")
}
function changeStructure(e, t) {
	$("#download-layout ." + e).removeClass(e).addClass(t)
}
function cleanHtml(e) {
	$(e).parent().append($(e).children().html())
}
//true:数值型的，false：非数值型
function isInteger(value) {
	var r = /^\+?[1-9][0-9]*$/;　　//正整数

	return r.test(value);
}
function downloadLayoutSrc() {
	var e = "";
	$("#download-layout").children().html($(".demo").html());
	var t = $("#download-layout").children();
	t.find(".preview, .configuration, .drag, .remove").remove();
	t.find(".lyrow").addClass("removeClean");
	t.find(".box-element").addClass("removeClean");
	
	
	
	t.find(".lyrow .lyrow .lyrow .lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .lyrow .lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".lyrow .removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".removeClean").each(function() {
		cleanHtml(this)
	});
	t.find(".removeClean").remove();
	$("#download-layout .column").removeClass("ui-sortable");
	$("#download-layout .row-fluid").removeClass("clearfix").children().removeClass("column");
	if ($("#download-layout .container").length > 0) {
		changeStructure("row-fluid", "row")
	}
	
	{
		
		//行样式替换成row
		t.find(".row-fluid").removeAttr("class").addClass("row");
		//列样式由 spanx=》col-sm-8
		t.find("div[class^='span']").each(function() {
			let cValue = $(this).attr('class');
			if(isInteger(cValue.substr(4)) && Number(cValue.substr(4))>=1 && Number(cValue.substr(4))<=12){
				$(this).removeAttr("class").addClass("col-sm-"+cValue.substr(4));
			}
		});
		
	}
	
	//删除图表的子节点以及init
	t.find(".bb_charts").removeClass("inited").children().remove();
	
	formatSrc = $.htmlClean($("#download-layout").html(), {
		format: true,
		allowedAttributes: [
			["id"],
			["class"],
			["data-toggle"],
			["data-target"],
			["data-parent"],
			["role"],
			["data-dismiss"],
			["aria-labelledby"],
			["aria-hidden"],
			["data-slide-to"],
			["data-slide"],["dg-chart-widget"],["name"],["style"]
		]
	});
	$("#download-layout").html(formatSrc);
	$("#downloadModal textarea").empty();
	$("#downloadModal textarea").val(formatSrc);
	return formatSrc;
}

var currentDocument = null;
var timerSave = 10000;
var stopsave = 0;
var startdrag = 0;
var demoHtml = $(".demo").html();
var currenteditor = null;
$(window).resize(function() {
	$("body").css("min-height", $(window).height() - 90);
	$(".demo").css("min-height", $(window).height() - 160)
});

function restoreData(){
	let layoutdata = $("#boardUi").val();
	
	//layouthistory = JSON.parse(layoutdata);
	if (!layoutdata) 
		return false;
		
	{
		//div row=>row-fluid  col-sm-x=>spanx
		var el = $( layoutdata );
		
		//行样式替换成row
		el.find(".row").removeAttr("class").addClass("row-fluid");
		//列样式由 col-sm-x=》spanx
		el.find("div[class^='col-sm-']").each(function() {
			let cValue = $(this).attr('class');
			if(isInteger(cValue.substr(7)) && Number(cValue.substr(7))>=1 && Number(cValue.substr(7))<=12){
				$(this).removeAttr("class").addClass("span"+cValue.substr(7));
			}
		});
		layoutdata = el.html();
	}
	console.log(layoutdata);
		
	window.demoHtml = layoutdata;
	if (window.demoHtml)
		$(".demo").html(window.demoHtml);
	console.log('restoreData');
	
	hangleEchartsInit();
}

function initContainer(){
	$(".demo, .demo .column").sortable({
		connectWith: ".column",
		opacity: .35,
		handle: ".drag",
		start: function(e,t) {
			if (!startdrag) stopsave++;
			startdrag = 1;
		},
		stop: function(e,t) {
			if(stopsave>0) stopsave--;
			startdrag = 0;
		}
	});
	configurationElm();
}

function openLayer(url,bn){
	 let code = $(bn).attr("target");
	 let name = $(bn).attr("name");
	if(url == null)
		url = '/dashboard/toEditChart/'+code;
	layer.open({
        type: 2,
        title: '编辑echarts参数以及绑定DB数据。',
        shadeClose: true,
        shade: false,
        maxmin: true, //开启最大化最小化按钮
        area: ['1150px', '650px'],
        content: url,
        cancel: function(){
			// 右上角关闭事件的逻辑
        	alert('关闭啦');
        	//刷新下图表 
        	initByName($("#"+code));
		}
    });
}

//

$(document).ready(function() {
	CKEDITOR.disableAutoInline = true;
	restoreData();
	var contenthandle = CKEDITOR.replace( 'contenteditor' ,{
		language: 'zh-cn',
		contentsCss: ['css/bootstrap-combined.min.css'],
		allowedContent: true
	});
	$("body").css("min-height", $(window).height() - 90);
	$(".demo").css("min-height", $(window).height() - 160);
	
	//布局拖拽器
	$(".sidebar-nav .lyrow").draggable({
		connectToSortable: ".demo",
		helper: "clone",
		handle: ".drag",
		start: function(e,t) {
			if (!startdrag) stopsave++;
			startdrag = 1;
		},
		drag: function(e, t) {
			t.helper.width(400)
		},
		stop: function(e, t) {
			$(".demo .column").sortable({
				opacity: .35,
				connectWith: ".column",
				start: function(e,t) {
					if (!startdrag) stopsave++;
					startdrag = 1;
				},
				stop: function(e,t) {
					if(stopsave>0) stopsave--;
					startdrag = 0;
				}
			});
			if(stopsave>0) stopsave--;
			startdrag = 0;
		}
	});
	
	//控件拖拽器
	$(".sidebar-nav .box").draggable({
		connectToSortable: ".column",
		helper: "clone",
		handle: ".drag",
		start: function(e,t) {
			if (!startdrag) stopsave++;
			startdrag = 1;
		},
		drag: function(e, t) {
			t.helper.width(400)
		},
		stop: function() {
			handleJsIds();
			if(stopsave>0) stopsave--;
			startdrag = 0;
		}
	});
	initContainer();
	$('body.edit .demo').on("click","[data-target=#editorModal]",function(e) {
		e.preventDefault();
		currenteditor = $(this).parent().parent().find('.view');
		var eText = currenteditor.html();
		contenthandle.setData(eText);
	});
	$("#savecontent").click(function(e) {
		e.preventDefault();
		currenteditor.html(contenthandle.getData());
	});
	$("[data-target=#downloadModal]").click(function(e) {
		e.preventDefault();
		downloadLayoutSrc();
	});
	$("[data-target=#shareModal]").click(function(e) {
		e.preventDefault();
		handleSaveLayout();
		//保存
		let uihtml = downloadLayoutSrc();
		//layouthistory = data;
		//console.log(data);
		saveDesign(uihtml);
	});
	$("#download").click(function() {
		downloadLayout();
		return false
	});
	$("#downloadhtml").click(function() {
		downloadHtmlLayout();
		return false
	});
	$("#edit").click(function() {
		$("body").removeClass("devpreview sourcepreview");
		$("body").addClass("edit");
		removeMenuClasses();
		$(this).addClass("active");
		return false
	});
	$("#clear").click(function(e) {
		e.preventDefault();
		clearDemo()
	});
	$("#devpreview").click(function() {
		$("body").removeClass("edit sourcepreview");
		$("body").addClass("devpreview");
		removeMenuClasses();
		$(this).addClass("active");
		return false
	});
	$("#sourcepreview").click(function() {
		$("body").removeClass("edit");
		$("body").addClass("devpreview sourcepreview");
		removeMenuClasses();
		$(this).addClass("active");
		return false
	});
	$("#fluidPage").click(function(e) {
		e.preventDefault();
		changeStructure("container", "container-fluid");
		$("#fixedPage").removeClass("active");
		$(this).addClass("active");
		downloadLayoutSrc()
	});
	$("#fixedPage").click(function(e) {
		e.preventDefault();
		changeStructure("container-fluid", "container");
		$("#fluidPage").removeClass("active");
		$(this).addClass("active");
		downloadLayoutSrc()
	});
	$(".nav-header").click(function() {
		$(".sidebar-nav .boxes, .sidebar-nav .rows").hide();
		$(this).next().slideDown()
	});
	$('#undo').click(function(){
		stopsave++;
		if (undoLayout()) initContainer();
		stopsave--;
	});
	$('#redo').click(function(){
		stopsave++;
		if (redoLayout()) initContainer();
		stopsave--;
	});
	$('#openLayer').click(function(){
		openLayer();
	});
	
	//$('.echart-edit').click(function(){
	//	openLayer();
	//});
	
	removeElm();
	gridSystemGenerator();
	setInterval(function() {
		handleSaveLayout()
	}, timerSave)
})