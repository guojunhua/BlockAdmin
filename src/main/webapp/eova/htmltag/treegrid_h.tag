<table id="${id}"></table>
<script>
$(function () {
    // init param
    var id = "${id!}";
    var masterId = "${masterId!}";
    var $treegrid = $("#" + id);
    var $masterGrid;
    if (masterId != "") {
        $masterGrid = $("#" + masterId);
    }

    var menuCode = '${menuCode!}';// medaobject code
    var objectCode = '${objectCode!}';// medaobject code
    var toolbar = '${toolbar!}';// grid ref toolbar
    var treeField = '${tree.treeField!}';// medaobject code
    var rootPid = '${tree.rootPid!0}';//顶级pid

    var url = '${url!}';// diy grid load data url
    var objectJson = '${objectJson!}';// object is json
    var fieldsJson = '${fieldsJson!}';// fiedlds is json
    var configJson = '${configJson!}';// config is json

    if (url == '') {
        url = '/treegrid/query/' + objectCode;
        if (menuCode != '') {
            url = url + '-' + menuCode;
        }
    }
    var paras = $.getUrlParas();
    // 是否含有关联查询条件
    if (paras && paras.indexOf('query_') != -1) {
        url = url + '?' + paras;
    }

    // console.log(objectCode + 'isFirstLoad' + isFirstLoad);

    var config, object, fields;

    if (configJson != '') {
        config = JSON.parse(configJson);
    }
    if (objectJson != '') {
        object = JSON.parse(objectJson);
    } else {
        $.syncGetJson('/meta/object/' + objectCode, function (json) {
            object = json;
        });
    }
    if (fieldsJson != '') {
        fields = JSON.parse(fieldsJson);
    } else {
        $.syncGetJson('/meta/fields/' + objectCode, function (json) {
            fields = json;
        });
    }
    //    console.log(object);
    //    console.log(fields);

    // 当前对象是否允许初始加载数据
    var isFirstLoad = false;
    var isFirstLoadNow = eval('${isFirstLoad!true}');
    // 必须当前业务和对象都允许加载数据
    if (isFirstLoadNow && object.is_first_load) {
        isFirstLoad = true;
    }

    var cols = [];
    // 批量选择框
    //if (!object.is_single) {
    	   var attr = new Object;
            attr.field = 'selectItem';
            attr.radio= true;//不适合用复选会有问题
            //attr.width = '30px';
            cols.push(attr);
   // }
   
     $.each(fields, function (i, f) {//treeField 需要放在第二列
    	 if ( f.en == treeField) {//pk也不显示
    		 var attr = new Object;
    	      attr.field = f.en;
    	      attr.title = f.cn;
    	      
    	      attr.width = f.width ? f.width : null;//字段长度（,后面每种类型可能自己宽度
    	      //attr.align='center';
    	      
    	      if(attr.width != null && attr.width.toString().indexOf('%') != -1){
    				attr.width = attr.width.toString().substr(0,attr.width.length-1);
    				console.log("attr.width:"+attr.width);
    				attr.widthUnit='%';
    			}else if(attr.width != null){
    				attr.width = attr.width +"px";
    			}
    	      cols.push(attr);
    	    //  break;
    	 }
     });
    
    $.each(fields, function (i, f) {
    	
   	   //$("img").attr("width","180");
   	
       if (!f.is_show || f.en == object.pk_name || f.en == treeField || f.en == '${tree.parentField}') {//pk也不显示 ,treeField 也不需要，前面得处理过了,父节点也不能输出
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
       
       //attr.align='center';
       
       
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
       		//attr.formatter= function(value, row, index) {
            //	return $.table.selectTransferredLabel(value, row[f.en+'_val'],'primary');
            //}
       }else{
           // 默认格式化处理
           if (f.type == '布尔框') {
           	//return '<input type="checkbox" name="newsTop" lay-filter="newsTop" lay-skin="switch" lay-text="是|否" '+d.newsTop+'>'
           	attr.width = 80;
           	
               //attr.align = 'center';
               
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
           	
           	//attr.align = 'center';
           	attr.width='100';
           	

           	attr.formatter= function(value, row, index) {
           		
           		if (value) {
           			if(value.indexOf('http://') == -1 && value.indexOf('https://') == -1)
           				value = IMG  + '/' + value;
           		}
           		if (value) {
           			return $.table.imageView(value);
           		}else
           			return value;
                }

           }else if(f.type == '文件框'){//文件框
           //	attr.align = 'center';
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
           //	attr.align = 'center';
           	
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
			//attr.widthUnit='%';
		}else if(attr.width != null){
			attr.width = attr.width +"px";
		}
		
       cols.push(attr);
   });
   //隐藏 pk {field:'id',title:'ID', display:'none'}
 
console.log(cols);

	//默认排序
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
	
	var options = {
			id:id,
			code: "${tree.idField}",
			parentCode: "${tree.parentField}",
   		 	method: 'get', // 服务器数据的请求方式 get or post
            url:  url+'?widget=bootstrap-treetable', // 服务器数据的加载地址
            type: 1,
            uniqueId: "${object.pk_name}",
	        rootIdValue:rootPid,//
	
			  createUrl:  "/form/add/${objectCode}?template=h",
	           updateUrl: "/form/update/${objectCode}-{id}?template=h",
	           detailUrl: "/form/detail/${objectCode}-{id}?template=h",
	           removeUrl: "/grid/delete/${objectCode}",
	           exportUrl: "/grid/export/${object.code}?sort="+sortName+"&order="+sortOrder,
	           importUrl:   "/single_grid/doImportXls/${menu.code}",
	           importTemplateUrl:"/grid/export/${object.code}?template=1&sort="+sortName+"&order="+sortOrder,
					
	       
	        modalName: "${object.name}",
	        toolbar: toolbar,
	      
            columns: cols,
	    };
	
	    $.treeTable.init(options);
	
   
	


});

</script>