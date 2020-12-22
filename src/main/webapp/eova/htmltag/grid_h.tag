<%
// https://www.cnblogs.com/zhangxiaoyong/p/6398589.html
//https://www.cnblogs.com/mr-wuxiansheng/p/8017389.html
var oa_status = '0';
if(!isEmpty(object.config!)){
	if(!isEmpty(object.config.config['bb_oa']!)){
		if(!isEmpty(object.config.config['bb_oa']['status']!)){
			oa_status = object.config.config['bb_oa']['status']!;
		}
	}
}

%>
<table id="${id}" data-mobile-responsive="true"  ></table>
<script>
// var ${'$'+id};
//${'$'+id}
var h = $(window).height() - 250;//动态获取窗口高度
$(function () {
	
	
    // init param
    var id = "${id!}";
    var masterId = "${masterId!}";
    var is_single = '${isSingle!}' === 'true';//优先用传递过来得值，否则用object.is_single
    var $grid = $("#" + id);
    //var is
 
    var page = ${isEmpty(isPage!)?'true':isPage!};//true or false
    
    var $masterGrid;
    var limit = 15;
    //框架分页有问题，直接给分页最大值
    if(masterId != ""){
    	$masterGrid = $("#" + masterId);
    	page = false;
    	limit = 2147483647;
    }
    $("#${id}").attr("is_page",page);
    
    var height = "${height!}";
    if(height == '')
    	height =  'full-85';
    
    
    
    //if(id.indexof("master"))
    
    var menuCode = '${menuCode!}';
    var objectCode = '${objectCode!}';
    var toolbar = '${toolbar!}';// grid ref toolbar
    var isPaging = eval('${isPaging!true}');// is show pagination
    var url = '${url!}';// diy grid load data url
    var objectJson = '${objectJson!}';// object is json
    var fieldsJson = '${fieldsJson!}';// fiedlds is json
    var configJson = '${configJson!}';// config is json
    var choiceMode = '${mode!}'; //空 || radio ||check

    if (url == '') {
        url = '/grid/query/' + objectCode;
        if(menuCode != ''){
        	url = url + '-' + menuCode;
        }
    }
    
    var rememberSelected = false;
    if(choiceMode != '' && !is_single)
    	rememberSelected = true;//默认不需要记住，如果是选择模式需要打开 (此参数在 单选模式下会又问题)
    
 	//自动传递所有参数
    // 是否含有关联查询条件
    if(masterId == ""){//
    	var paras = $.getUrlParas();
    	if(paras){
        	if((paras.indexOf('query_') != -1 || paras.indexOf('filter_') != -1)){
            	url = url + '?' + paras;
            }else if(paras.indexOf('start_') != -1 || paras.indexOf('end_') != -1){
            	url = url + '?' + paras;
            } 
        }
    }else{
    	//设置为空，等待页面选中第一条
    	url = "";
    }

    // console.log(objectCode + 'isFirstLoad' + isFirstLoad);

	// 初始化组件
	EovaWidget.init(objectCode, objectJson, fieldsJson, configJson);
    var config = EovaWidget.data.config,
    	object = EovaWidget.data.object,
    	fields = EovaWidget.data.fields;
	
    
    if(is_single == '' )
		is_single = object.is_single;
    
    // 当前对象是否允许初始加载数据
    var isFirstLoad = false;
    var isFirstLoadNow = eval('${isFirstLoad!true}');
	// 必须当前业务和对象都允许加载数据
    if(isFirstLoadNow && object.is_first_load){
    	isFirstLoad = true;
    }
   
    var cols = [];
    var validators = {};
    // 批量选择框
    //复选：checkbox: true 单选：radio: true
   // if (!is_single) {
        var attr = new Object;
       // attr.field = 'state';
        attr.checkbox = true;
        //attr.width = '30px';
        cols.push(attr);
   // }else {
   // 	 var attr = new Object;
    //     attr.field = 'state';
    //     attr.radio = true;
         //attr.width = '30px';
    //     cols.push(attr);
    //}
    
    
    
    // 字段属性
    $.each(fields, function (i, f) {
    	
    	 $("img").attr("width","180");
    	
        if (!f.is_show) {
            // continue;
            return true;
        }

        var attr = new Object;
        attr.field = f.en;
        attr.title = f.cn;
        
        attr.fieldtype = f.type;
        //字段多（》=5）自适应，否则按预设值来（厨房后面宽度字段生效了）
        attr.width = f.width ? f.width : null;//字段长度（,后面每种类型可能自己宽度
        
        if(f.is_order == true){
        	attr.sortable=true;
        }
        
        
        if(f.en == object.pk_name){
        	attr.ispk = true;
        	attr.width = 65;
        }else
        	attr.ispk = false;
        
        
        if(f.type == '日期框'){//时间类型需要单独定义下宽度
        	attr.width = 105;
        }else if(f.type == '时间框'){
        	attr.width = 160;
        }
        
        attr.align='center';
        
        
        //console.log(f.cn+":"+f.type+":"+f.formatter);
        if (f.formatter != null && f.formatter !='') {
        	attr.formatter = function (value, row, index) {
        		//console.log(f.formatter);
        		//加载函数
        		eval('window.fun_'+f.en+' = '+f.formatter);
        		
        		
        		
        		//四个参数（value,row,index,keyName）如果不需要则直接送value
        		return window['fun_'+f.en](row[f.en],row,row[object.pk_name],f.en);
        	}
        } else if(f.exp != null && f.exp != ''){//转码显示
        	attr.formatter= function(value, row, index) {
             	return $.table.selectTransferredLabel(value, row[f.en+'_val'],'primary');
             }
        }else{
            // 默认格式化处理
            if (f.type == '布尔框') {
            	//return '<input type="checkbox" name="newsTop" lay-filter="newsTop" lay-skin="switch" lay-text="是|否" '+d.newsTop+'>'
            	attr.width = 80;
            	
                attr.align = 'center';
                
                attr.formatter=function (value, row, index) {
                	var cn = f.cn;
                	//是否XX
                	if(cn.indexOf("是否") != -1){
                		cn = cn.substring(cn.indexOf("是否")+2);
                	}
               	  
	               	if (row[f.en] == 1) {
	               		return '<i class=\"fa fa-toggle-on text-info fa-2x\" ></i> ';
	        		} else {
	        			return '<i class=\"fa fa-toggle-off text-info fa-2x\" ></i> ';
	        		}
	        	}
                
               
            }else if(f.type == '图片框'){//图片框
            	
            	attr.align = 'center';
            	attr.width='100';
            	

            	attr.formatter= function(value, row, index) {
            		
            		if (value) {
            			if(value.indexOf('http://') == -1 && value.indexOf('https://') == -1)
            				value = IMG  + '/' + value;
            		}
            		if (value) {
            			return $.table.imageView(value,'450');//高度
            		}else
            			return value;
                 }

            }else if(f.type == '文件框'){//文件框
            	attr.align = 'center';
            	attr.formatter = function (value, row, index) {
            		if (value) {
	            		var fileName = $.getFilePathName(value);
	            		
	            		var fileNameEn = f.en+'_name';//字段可能不存在
            		
            			if(row[fileNameEn] != null && row[fileNameEn]!= '')
	            			fileName = row[fileNameEn];
	            		
	            		
	            			if(value.indexOf('http://') == -1)
	            				return '<a href="' + FILE + '/' + value + '" target="view_window" download="' + fileName + '">' + fileName + '</a>';
	            			else
	            				return '<a href="' +  value + '" target="view_window" download="' + fileName + '">' + fileName + '</a>';
            	    }

            	    return value;
            	}
         
            }else if('图标框' == f.type){
            	attr.align = 'center';
            	
            	attr.formatter = function (value, row, index) {
            		if (value) {
	            		
            			return '<i class="'+value+'"></i>';
            	    }else
            	    	return value;
            	}
            	 
            }else if('文本域' == f.type || '编辑框' == f.type){//大文本字段需要处理
            	attr. align= 'center',
            	attr.formatter= function(value, row, index) {
                 	return $.table.tooltip(value);
                 }
			
            }else if('流程框' == f.type){//
				//attr.align = 'center';
            	
            	attr.formatter = function (value, row, index) {
            		if (value) {
            			//console.log(value.status);
            			//审批状态:0=创建,1=运行中,2=被终止,3=完成
            			if(value.status == 3){
            				//审批结果:1=同意,0=拒绝
            				if(value.result == 1){
            					
            					return '<svg class="icon" aria-hidden="true"> <use xlink:href="#icon-shenhetongguo"></use></svg>';
            					
            					//return '审批通过';
            				}else{
            					
            					if(value.remark != '' && value.remark!= null){
            						//return '审批驳回('+value.remark+')';
            					}else{
            						//return '审批驳回';
            					}
            					
            					//return '<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="这里是提示内容">底部提示</button>';
            					return '<svg class="icon" aria-hidden="true"> <use xlink:href="#icon-shenheshibai"></use></svg>';
            				}
            				
            			}else if(value.status == 0){
            				//return '创建';
            				return '<svg class="icon" aria-hidden="true"> <use xlink:href="#icon-shenhezhong-copy"></use></svg>';
            			}else if(value.status == 1){
            				//return '运行中';
            				return '<svg class="icon" aria-hidden="true"> <use xlink:href="#icon-shenhezhong-copy"></use></svg>';
            			}else if(value.status == 2){//终止
            				return '<svg class="icon" aria-hidden="true"> <use xlink:href="#icon-zhongzhi"></use></svg>';
            			}
	            		
            
            	    }else
            	    	return '<svg class="icon" aria-hidden="true"> <use xlink:href="#icon-zu"></use></svg>';
            	}
            }
        }
        // Grid Cell Editor,对象和字段允许行内编辑自增，自增长禁止编辑(目前可编辑不支持)
        if (object.is_celledit && f.is_edit && 1==2) {
        	if(object.is_auto && object.is_auto == true){
        		return;
        	}
            var editor = new Object;
            editor.type = f.editor;
            // 构造参数
            editor.options = {};
            if (f.type == '下拉框') {
                editor.options = {
                    url: '/widget/comboJson/' + objectCode + '-' + f.en, valueField: 'id', textField: 'cn', multiple: f.is_multiple
                }
            } else if (f.type == '查找框') {
                editor.options = {
                    url: '/widget/find?code=' + objectCode + '&field=' + f.en + '&multiple=' + f.is_multiple
                }
            } else if (f.type == '日期框') {
                editor.options = {
            		format: 'yyyy-MM-dd'
                }
            }
            editor.options['name'] = f.en;

            attr.editor = editor;

         	// validator
            var rule = '';
            if(f.is_required){
                rule = f.cn + ':required;';
            }
            if(f.validator){
                rule = rule + f.validator;
            }
            if(rule != ''){
    	        validators[f.en] = { rule: rule };
            }
        }
		

	
		
		
		if(attr.width != null && attr.width.toString().indexOf('%') != -1){
			attr.width = attr.width.toString().substr(0,attr.width.length-1);
			console.log("attr.width:"+attr.width);
			attr.widthUnit='%';
		}
		
        cols.push(attr);
    });
    //隐藏 pk {field:'id',title:'ID', display:'none'}
  
 //console.log(cols);

	// 默认排序
	var sortName = null,sortOrder = 'asc';
	if(object.default_order){
		var defaultOrder = object.default_order.split(' ');
		sortName = defaultOrder[0];
		if(defaultOrder.length > 1){
			sortOrder = defaultOrder[1];
		}
	}

    var selectIndex;
    
    var values = $.getFormParasObj($('#queryForm'));
    if(sortName != null){
    	values['sort'] = sortName;
    	values['order'] = sortOrder;
    }
    
    
    
    
    console.log("url:"+url); 
    $("#${id}").attr("url",url);
    
    
        
    //console.log(cols);
    
            var options = {
            		id: "${id}",
            		 method: 'get', // 服务器数据的请求方式 get or post
		             url:  url, // 服务器数据的加载地址
		             rememberSelected: rememberSelected,

		             sortable: true,                     //是否启用排序
			            sortName:sortName ,
			            sortOrder: sortOrder,  
			            uniqueId:"${object.pk_name}",
			            //queryParams: oTableInit.queryParams,//传递参数（*）
			           
			           createUrl:  "/form/add/${objectCode}?template=h",
			           updateUrl: "/form/update/${objectCode}-{id}?template=h",
			           detailUrl: "/form/detail/${objectCode}-{id}?template=h",
			           approvalUrl: "/form/approval/${objectCode}-{id}",	   
			           removeUrl: "/grid/delete/${objectCode}",
			           exportUrl: "/grid/export/${object.code}?sort="+sortName+"&order="+sortOrder,
			           importUrl:   "/single_grid/doImportXls/${menu.code}",
			          
			           importTemplateUrl:"/grid/export/${object.code}?template=1&sort="+sortName+"&order="+sortOrder,
		
			        		   
		             iconSize: 'outline',
		             toolbar: toolbar,
		             striped: true, // 设置为true会有隔行变色效果
		             dataType: "json", // 服务器返回的数据类型
		             pagination: true, // 设置为true会在底部显示分页条
		             // queryParamsType : "limit",
		             // //设置为limit则会发送符合RESTFull格式的参数
		             singleSelect: is_single, // 设置为true将禁止多选
		             // contentType : "application/x-www-form-urlencoded",
		             // //发送到服务器的数据编码类型
		             
		             pageNumber: 1, // 如果设置了分布，首页页码
		             search : false, // 是否显示搜索框
		              
		              clickToSelect: true,                //是否启用点击选中行
		              //singleSelect : false,
		             sidePagination: "server", // 设置在哪里进行分页，可选值为"client" 或者
		             pageSize: 15,                     //每页的记录行数（*）
		             pageList: [15,20,25],        //可供选择的每页的行数（*）
		             
		            // height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
		        modalName: "${object.name}",
		        responseHandler: function (res) {
	            	return {
	            		"total": res.total,//总页数
	            		"rows": res.rows //数据
	            		};
	            },
	            columns: cols,
	            onLoadSuccess: function (res) {
	            	
	            	console.log("onLoadSuccess."); 
	            	$("#${id}").attr("oa_status",'${oa_status!}');//设置是否可以发起审批
	            	//oa_status="${status!}"
	            	
	            	var isNum = false;
	            	if(res.rows.length>0){
	            		value = res.rows[0]['${object.pk_name}']
	            		
	            		if( typeof value === 'number' && !isNaN(value))
	            			isNum = true;
	            	}
	            	
	            	////$('.bootstrap-table tr td').each(function () {
	                //    $(this).attr("title", $(this).text());
	                // //   $(this).css("cursor", 'pointer');
	               // });
	            	
	            	$('[data-toggle="tooltip"]').tooltip();
	            	
	            	//加载成功，设置默认选中值
	            	//看是否传默认值过来，设置默认选中
	            	<% if(!isEmpty(choiceFieldValue!)){ %>
		            	 var nursingUuids = [];
		         	     $.each('${choiceFieldValue}'.split(","), function(i, n) {
		         	    	 if(isNum)
		         	    		nursingUuids.push(Number(n));
		         	    	 else
		         	    		nursingUuids.push(n);
		         	     });
	            		$('#${id}').bootstrapTable("checkBy",{field: '${object.pk_name}', values:nursingUuids});
	            	<%  } %>
	            }
            };
      	
            //得到查询的参数 ,pageSize=10&pageNum=4&orderByColumn=&isAsc=asc=》page=1&rows=15&sort=id&order=desc
		   /*  options.queryParams = function (params) {
		        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		            rows: params.limit,   //页面大小
		            page:params.offset/params.limit+1,
		            
		            sort: params.sort,
		            order: params.order
		        };
		        return temp;
		    }; */
      
            $.table.init(options);
       

  	     
      
  	  
  	  

    
  
	
	
});


</script>
<%if(!isEmpty(object.diy_js!)){%>
<script type="text/javascript" src="${object.diy_js}"></script>
<%}%>