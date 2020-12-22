/**
 * jQuery Eova Common
 */
(function ($) {
	//弹出图片的id
	var layerImgIndex;
    /**
     * 拓展全局静态方法
     */
    $.extend({
        /** 同步Post **/
        syncPost: function (url, data, success) {
            $.ajax({
                async: false,
                type: 'POST',
                url: url,
                data: data,
                success: success,
                dataType: "json"
            });
        },
        /** 同步获取JSON **/
        syncGetJson: function (url, success) {
            $.ajax({
                async: false,
                type: 'GET',
                url: url,
                success: success,
                dataType: "json"
            });
        },
        /** Html转义 **/
        encodeHtml: function (s) {
            return (typeof s != "string") ? s :
                s.replace(/"|&|'|<|>|[\x00-\x20]|[\x7F-\xFF]|[\u0100-\u2700]/g,
                    function ($0) {
                        var c = $0.charCodeAt(0), r = ["&#"];
                        c = (c == 0x20) ? 0xA0 : c;
                        r.push(c);
                        r.push(";");
                        return r.join("");
                    });
        },
        /** 追加URL参数 **/
        appendUrlPara: function (url, key, val) {
        	if(!val || val == ''){
        		return url;
        	}
            if(url.indexOf('?') == -1){
            	url = url + '?';
            } else {
            	url = url + '&';
            }
            return url + key + '=' + val;
        },
        /** 获取URL参数 **/
        getUrlPara: function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return;
        },
        /** 获取URL QueryString **/
        getUrlParas: function () {
        	var url = location.href;
        	if(url.indexOf("?") == -1){
        		return;
        	}
        	return url.substring(url.indexOf("?")+1,url.length); 
        },
        /** 获取Form参数对象-用于Post请求 **/
        getFormParasObj: function (form) {
        	var o = {};
        	
        	
    		$.each(form.serializeArray(), function(index) {
    			if (o[this['name']]) {
    				o[this['name']] = o[this['name']] + "," + this['value'];
    			} else {
    				o[this['name']] = this['value'];
    			}
    		});
    		return o;
        },
        /** 获取Form参数字符-用于get请求 **/
        getFormParasStr: function (form) {
        	var o = "";
        	$.each(form.serializeArray(), function(index) {
        		var key = this['name'], val = this['value'];
        		if(val && val.length > 0){
        			o = o + key + "=" + val + "&";        			
        		}
        	});
        	return o.substring(0, o.length-1); 
        },
        /** 获取浏览器类型 **/
        getBrowser: function() {
        	var explorer = window.navigator.userAgent;
			if (explorer.indexOf("MSIE") >= 0) {
				return 'ie';
			} else if (explorer.indexOf("Firefox") >= 0) {
				return 'firefox';
			} else if (explorer.indexOf("Chrome") >= 0) {
				return 'chrome';
			} else if (explorer.indexOf("Opera") >= 0) {
				return 'opera';
			} else if (explorer.indexOf("Safari") >= 0) {
				return 'safari';
			}
        },
        /** 格式化自动2位补零，制保留2位小数，如：2，会在2后面补上00.即2.00 **/
		formatDouble : function(x) {
			var f = Math.round(x * 100) / 100;
			var s = f.toString();
			var rs = s.indexOf('.');
			if (rs < 0) {
				rs = s.length;
				s += '.';
			}
			while (s.length <= rs + 2) {
				s += '0';
			}
			return s;
		},
		/**
		 * 格式化JSON
		 * @param txt 
		 * @param compress 是否压缩
		 * @returns
		 */
		jsonformat : function(json, compress) {
			var indentChar = '    ';
			if (/^\s*$/.test(json)) {
				alert('数据为空,无法格式化! ');
				return;
			}
			try {
				var data = eval('(' + json + ')');
			} catch (e) {
				return;
			}
			var draw = [], last = false, This = this, line = compress ? '' : '\n', nodeCount = 0, maxDepth = 0;
			var notify = function(name, value, isLast, indent, formObj) {
				nodeCount++;
				for ( var i = 0, tab = ''; i < indent; i++)
					tab += indentChar;
				tab = compress ? '' : tab;
				maxDepth = ++indent;
				if (value && value.constructor == Array) {
					draw.push(tab + (formObj ? ('"' + name + '":') : '') + '[' + line);
					for ( var i = 0; i < value.length; i++)
						notify(i, value[i], i == value.length - 1, indent, false);
					draw.push(tab + ']' + (isLast ? line : (',' + line)));
				} else if (value && typeof value == 'object') {
					draw.push(tab + (formObj ? ('"' + name + '":') : '') + '{' + line);
					var len = 0, i = 0;
					for ( var key in value)
						len++;
					for ( var key in value)
						notify(key, value[key], ++i == len, indent, true);
					draw.push(tab + '}' + (isLast ? line : (',' + line)));
				} else {
					if (typeof value == 'string')
						value = '"' + value + '"';
					draw.push(tab + (formObj ? ('"' + name + '":') : '') + value + (isLast ? '' : ',') + line);
				}
				;
			};
			var isLast = true, indent = 0;
			notify('', data, isLast, indent, false);
			return draw.join('');
		},
		/**
		 * 压缩空格
		 * @param s
		 * @returns
		 */
		compressWhiteSpace : function(s) {
			s = s.replace(/\s+/g, " ");
			s = s.replace(/^\s(.*)/, "$1");
			s = s.replace(/(.*)\s$/, "$1");
			s = s.replace(/\s([\x21\x25\x26\x28\x29\x2a\x2b\x2c\x2d\x2f\x3a\x3b\x3c\x3d\x3e\x3f\x5b\x5d\x5c\x7b\x7c\x7d\x7e])/g, "$1");
			s = s.replace(/([\x21\x25\x26\x28\x29\x2a\x2b\x2c\x2d\x2f\x3a\x3b\x3c\x3d\x3e\x3f\x5b\x5d\x5c\x7b\x7c\x7d\x7e])\s/g, "$1");
			return s;
		},
		
		/** 显示图标 **/
        showTag: function (tagvalue) {
        	//layui== &#xe614 ,h+=faXX
        	if(tagvalue != null &&tagvalue !='' && tagvalue.indexOf('fa') != -1)
        		return '<i class="fa '+tagvalue+'"></i>';
        	else
        		return '<i class="layui-icon">'+tagvalue+'</i>';
        },
        /** 提取路径文件名 例：/upload/1530094529530.jpg **/
        getFilePathName: function (path) {
        	  var index = path.lastIndexOf('/');
        	  if(index != -1)
        		  path = path.substring(index+1);
        	return path;
        },
        
       
        
        /** 保存有修改的可编辑Grid，成功返回 ‘’ ，否则返回错误信息 **/
        saveGridLine: function (myGrid,objectCode) {
        	 var inserted = myGrid.datagrid('getChanges', 'inserted');
             var deleted = myGrid.datagrid('getChanges', 'deleted');
             var updated = myGrid.datagrid('getChanges', 'updated');
             
            var errorMsg = '';
            if (inserted.length > 0) {
                var json1 = JSON.stringify(inserted);
                // console.log('保存add数据' + json1);
                $.syncPost('/grid/add/' + objectCode, {rows: json1},
                        function (result, status) {
                            if (!result.success) {
                                isOk = false;
                                errorMsg += result.msg + '<br>';
                            }
                        });
            }
            if (updated.length > 0) {
                var json3 = JSON.stringify(updated);
                // console.log('保存update数据' + json3);
                $.syncPost('/grid/update/' + objectCode, {rows: json3},
                        function (result, status) {
                            if (!result.success) {
                                isOk = false;
                                errorMsg += result.msg + '<br>';
                            }
                        });
            }
            if (deleted.length > 0) {
                var json2 = JSON.stringify(deleted);
                // console.log('保存delete数据' + json2);
                $.syncPost('/grid/delete/' + objectCode, {rows: json2},
                        function (result, status) {
                            if (!result.success) {
                                isOk = false;
                                errorMsg += result.msg + '<br>';
                            }
                        });
            }
            return errorMsg;
        },
        
        
        /** 获取Get条件的参数 且只要query_开头的参数,组织成 template=lay&query_hotel_id=1 => query_hotel_id:1,a:2,b:3 **/
        getGetParasRef: function () {
        	
        	var params = null;
        	//template=lay&query_hotel_id=1
        	var para = this.getUrlParas();
        	if(para){
        		var paras = para.split("&") ;
            	for(var i=0;i<paras.length;i++){
            		if(paras[i].indexOf('query_') != -1){
            			var temps = paras[i].split("=") ;
            			
            			if(temps.length>=2 && temps[1]!= ''){
            				if(params == null){
                				params = temps[0].replace("query_","")  +':'+temps[1];
                			}else{
                				params =params+','+ temps[0].replace("query_","")+':'+temps[1];
                				
                			}
            				
            			}
            			
            			
            		}
            	}
        	}
        	
        	return params;
        },
        
        getTableLineImg: function (url,id,name) {
        	
        	var temp = '<div  onclick="javascript:$.tableLineImgShow(\''+url+'\')" >';
        	var temp = '';
        	//temp += '<img layer-pid=""  layer-src="';
        	
        	//<img class="small_img"  src="'  + value + '" height="100%">
        	
//        	if(id != null && id != ''){
//        		temp += '<img layer-pid="'+id+'"  layer-src="';
//        	}else{
//        		temp += '<img layer-src="';
//        	}
//        	temp += url +'" src="'+url+'" height="100%" alt="'+name+'">';
        	
        	temp += '<img onclick="javascript:$.tableLineImgShow(\''+url+'\')"  class="small_img"  src="'  + url + '" height="100%" alt="'+name+'">'
        	
        	//temp += '</div>';
            
        	return temp;
           // return '<img class="small_img"  src="'  + url + '" height="100%">';
        },
        tableLineImgShow: function (url) {
        	//onsole.log("进来了")
            var img = "<img src='" + url + "' onclick='window.open (\""+url+"\")'/>";  
            
            if(layerImgIndex != null)
            	layer.close(layerImgIndex);
            
            
        	layerImgIndex = layer.open({  
        	    type: 1,  
        	    shade: false,  
        	    title: false, //不显示标题  
        	    
        	    area: [img.width + 'px', img.height+'px'],   //跨域图片尺寸拿不到
        	    content: img, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响  
        	    cancel: function () {  
        	        layer.msg('图片查看结束！', { time: 500, icon: 6 });  
        	    }  
        	});
        	
        	layerInitWidth  = $("#layui-layer"+layerImgIndex).width();
            layerInitHeight = $("#layui-layer"+layerImgIndex).height();

        	
        	$.resizeLayer(layerImgIndex,layerInitWidth,layerInitHeight);
        },
        resizeLayer:function (layerIndex,layerInitWidth,layerInitHeight) {
            var docWidth = $(document).width()*0.8;
            var docHeight = $(document).height()*0.8;
            var minWidth = layerInitWidth > docWidth ? docWidth : layerInitWidth;
            var minHeight = layerInitHeight > docHeight ? docHeight : layerInitHeight;
            if(minWidth != layerInitWidth || minHeight!=layerInitHeight){
            	
            	console.log("doc:",docWidth,docHeight);
                console.log("lay:",layerInitWidth,layerInitHeight);
                //console.log("min:",minWidth,minHeight);
                layer.style(layerIndex, {
                    top:25,
                    width: minWidth,
                    height:minHeight
                });
            }
            
        }　,
        /** 列表数据转树形数据[{ id: 1, name: "办公管理", pid: 0 }...]=> [{ id: 1,isLast=1,level=1, name: "办公管理", pid: 0,children:[{}...] }...] 
         * level 从1开始
         * isLast = 是否最后一级节点 false、true
         * **/
        toTree:function (data,pkey,idkey,name,checkArr ) {
        	
        	
        	
        	if(pkey == null)
				 pkey = 'pid';
        	if(idkey == null)
        		idkey = 'id';
	        // 删除 所有 children,以防止多次调用
	        data.forEach(function (item) {
	            delete item.children;
	        });

	        // 将数据存储为 以 id 为 KEY 的 map 索引数据列
	        var map = {};
	        data.forEach(function (item) {
	            map[item[idkey]] = item;
	            
	            //换名字字段由 name=》 name指定的字段 比如title
	            if(name){
	            	item[name] = item['name'];
	            }
	            //dtree的复选需要这玩意。。。
	            if(checkArr){
	            	item['checkArr'] = checkArr;
	            }
	        });
//	        console.log(map);
	        var val = [];
	        data.forEach(function (item) {
	            // 以当前遍历项，的pid,去map对象中找到索引的id
	            var parent = map[item[pkey]];
	            // 好绕啊，如果找到索引，那么说明此项不在顶级当中,那么需要把此项添加到，他对应的父级中
	            if (parent) {
	                (parent.children || ( parent.children = [] )).push(item);
	            } else {
	                //如果没有在map中找到对应的索引ID,那么直接把 当前的item添加到 val结果集中，作为顶级
	                val.push(item);
	            }
	        });
	        
	        //需要设置level 以及 isLast        
	        function fn(objs,lv){
	        	objs.forEach(function (item) {
	        		item.level = lv;
	        		var children =	item.children;
	        		if(children && children.length>0){
	        			fn(children,lv+1);
	        			item.isLast = false;
	        		}else
	        			item.isLast = true;
		        });
	        };
	        fn(val,1);
	        return val;
        },
        /** id/name获取值 是不是需要根据类型取值？,目前就是单选取不到值**/
        getValueBykey:function (key) {
        	var value = null;
        	
        	/*if($('#'+key).length > 0){
        		value = $('#'+key).val();
        	}else{
        		value =	$("input[name='"+key+"']") .val();
        	}*/
       
        	if($("[name='"+key+"']").length>1){//单选、复选
        		
        		
        		value = '';
        		$("input[name='"+key+"']:checked").each(function(i) {
        	        if (0 === i) {
        	            value = $(this).val();
        	        } else {
        	            value += "," + $(this).val();
        	        }
        	    });
        	}else{
        		value = $('#'+key).val();
        	}
        	
        	return value;
        },
        
        /**
         * 
         * 查找数组，返回匹配到的第一个index
         * https://blog.csdn.net/haibo0668/article/details/83244058
         * @param array 被查找的数组
         * @param feature 查找特征 或者为一个具体值，用于匹配数组遍历的值，或者为一个对象，表明所有希望被匹配的key-value
         * @param or boolean 希望命中feature全部特征或者只需命中一个特征，默认false
         * 
         * @return 数组下标  查找不到返回-1
         */
        findArray(array, feature, all = false) {
            for (let index in array) {
                let cur = array[index];
                if (feature instanceof Object) {
                    let allRight = true;
                    for (let key in feature) {
                        let value = feature[key];
                        if (cur[key] == value && !all) return index;
                        if (all && cur[key] != value) {
                            allRight = false;
                            break;
                        }
                    }
                    if (allRight) return index;
                } else {
                    if (cur == feature) {
                        return index;
                    }
                }
            }
            return -1;
        },
        
        exitsFunction(funcName) {
        	  try {
        		    if (typeof(eval(funcName)) == "function") {
        		      return true;
        		    }
        		  } catch(e) {}
        	 return false;
        },
        
        init_bbchart(id,option){
        	var obj = document.getElementById(id);

        	var objclass = $(obj).attr("class");
        	
        	
        	 var bbChart = echarts.init(obj);
        	 
        	 bbChart.setOption(option);
        	 $(obj).addClass("inited");
        	 
        	 return bbChart;
        },
        init_pie_data(url,chart){

            $.ajax({
            	url : url,
            	dataType: "json",
            	type : 'get',
            	success : function(data) {
            		
            		if(data.status == 200){
            			var option = chart.getOption();
            			var labels =new Array();
            			var seriesDatas =new Array();
            			for(var one of data.data){
            				labels.push(one.x);
            				
            				//
            				var d = {"value":one.y1,"name":one.x}
            				seriesDatas.push(d);
            			}
            			
            			option.legend[0].data =  labels;
            		    option.series[0].data = seriesDatas;
            		    chart.setOption(option); 
            		    console.log('刷新饼图数据吧。。。');
            		   
            		   //console.log(chart.getOption())
            		}else
            			console.log(data.msg);
            	}
            });
        },
        init_line_data(url,chart){//组图 or 折线都用此
        	$.ajax({
            	url : url,
            	dataType: "json",
            	type : 'get',
            	success : function(data) {
            		
            		if(data.status == 200){
            			var option = chart.getOption();
            			
            			var legend = option.legend;
            			var defaultYNum = 1;
            			if(legend != null && legend[0].data!= null){
            				defaultYNum = legend[0].data.length;
            				console.log('y 数量：'+defaultYNum);
            			}
            			
            			//全局的
            			var labels =new Array();
            			
            			var seriess = new Array(defaultYNum);
            			for(var i=0;i<seriess.length;i++){
            				seriess[i] = new Array();
            			}
            			
            			for(var one of data.data){
            				labels.push(one.x);
            				var d = one.y;
            				
          
            				
            				for(var i=0;i<seriess.length;i++){
                				seriess[i].push(one['y'+(i+1)]);
                			}
            			}
            			
            			option.xAxis[0].data =  labels;
            			for(var i=0;i<seriess.length;i++){
            		    	option.series[i].data = seriess[i];
            			}
            		    chart.setOption(option); 
            		    console.log('刷新折线/组图数据吧。。。');
            		   
            		   console.log(chart.getOption())
            		}else
            			console.log(data.msg);
            	}
            });
        },
 		init_scatter_data(url,chart){//散点
        	$.ajax({
            	url : url,
            	dataType: "json",
            	type : 'get',
            	success : function(data) {
            		
            		if(data.status == 200){
            			var option = chart.getOption();
            			
            			var legend = option.legend;
            			var defaultYNum = 1;
            			if(legend != null && legend[0].data!= null){
            				defaultYNum = legend[0].data.length;
            				console.log('y 数量：'+defaultYNum);
            			}
            			
            			//全局的
            			var labels =new Array();
            			
            			var seriess = new Array(defaultYNum);
            			for(var i=0;i<seriess.length;i++){
            				seriess[i] = new Array();
            			}
            			
            			for(var one of data.data){
            				labels.push(one.x);
            				var d = one.y;
            				
          
            				
            				for(var i=0;i<seriess.length;i++){
                				seriess[i].push(one['y'+(i+1)]);
                			}
            			}
            			
            			option.xAxis[0].data =  labels;
            			for(var i=0;i<seriess.length;i++){
            		    	option.series[i].data = seriess[i];
            			}
            		    chart.setOption(option); 
            		    console.log('刷新折线/组图数据吧。。。');
            		   
            		   console.log(chart.getOption())
            		}else
            			console.log(data.msg);
            	}
            });
        },
		init_radar_data(url,chart){//雷达:select y1,y2,y3,y4,y5,y1_max,y2_max,y3_max,y4_max,y5_max from table
        	$.ajax({
            	url : url,
            	dataType: "json",
            	type : 'get',
            	success : function(data) {
            		
            		if(data.status == 200){
            			let option = chart.getOption();
						
						let  radarDimension  = 0;           			

						//设置最大值
            			let indicators = option.radar.indicator;
						radarDimension  = indicators.length;  
						for(let i=0;i<indicators.length;i++){
							if(data.date[0]['Y'+(i+1)+'_MAX'])
								indicators[i].max = data.date[0]['Y'+(i+1)+'_MAX'];
						}
						
						let series = option.series;
						
						for(let i =0;series.data.length;i++){
							let one = series.data[i];
							
							if(data.data[i]){
								let line =	data.data[i];
								let lineData = [];
								for(let j =0 ;j<radarDimension;j++){
									let y = 0;
									if(line['Y'+(j+1)])
										y = line['Y'+(j+1)];
									lineData.push(y);
								}
								
								one.value = lineData;
							}
						}
						
            			
            		    chart.setOption(option); 
            		    console.log('刷新雷达数据吧。。。');
            		   
            		   console.log(chart.getOption())
            		}else
            			console.log(data.msg);
            	}
            });
        },
		init_gauge_data(url,chart){//仪表盘y值以此填充  series，select y1,y2 from table
        	$.ajax({
            	url : url,
            	dataType: "json",
            	type : 'get',
            	success : function(data) {
            		
            		if(data.status == 200){
            			var option = chart.getOption();
            			
            			let series = option.series;
						
						for(let i = 0;i<series.length;i++){
							let  y = 0;
							
							let j = 0;
							for(var one of data.data){
								if(i+1 == j+1){
									if(one['y'+(i+1)])
										y = one['y'+(i+1)];
									break;
								}
								j++;
							}
            				
							
							series[i].data[0].value=y;
						}

            			
            		   chart.setOption(option,true); 
            		   console.log('刷新仪表盘数据吧。。。');
            		   
            		   console.log(chart.getOption())
            		}else
            			console.log(data.msg);
            	}
            });
        },
        initChartsByCode(id,chartsCode){
        	var chartInfoUrl = "/dashboard/charts/"+chartsCode;
        	$.ajax({
        		url : chartInfoUrl,
        		dataType: "json",
        		type : 'get',
        		success : function(data) {
        			
        			if(data.status == 200){
        				 
        				$.initChartsByOptData(id,data.data,chartsCode);
        			}else{
        				//alert(data.msg);
        				layer.alert(data.msg, {icon: 2});
        			}
        				
        		}
        	});
        	
        	
        },
        
        initChartsByOptData(id,data,chartsCode){
        	
        				 
        				//var opt = "var option="+data.content;
        				var opt = data.content;
        				eval(opt);
        				
        				
        				var chart = $.init_bbchart(id,option) ;
        				
        				 if(data.data_type == 1){//sql绑定数据模式
        					var chartDataUrl = "/dashboard/chartsData/"+chartsCode;
        					//图表类型:1=饼图,2=折线 3=柱图 4=散点 5=雷达 6=仪表盘
        					if(data.type == 1){
        						$.init_pie_data(chartDataUrl,chart);
        					}else if(data.type == 2||data.type == 3){
        						$.init_line_data(chartDataUrl,chart);

        					//}else if(data.type == 4){//散点
        					//	$.init_line_data(chartDataUrl,chart);	
							}else if(data.type == 5){
        						$.init_radar_data(chartDataUrl,chart);
							}else if(data.type == 6){
        						$.init_gauge_data(chartDataUrl,chart);
        					}else {
        						//alert('未实现的图表');
        						
        						layer.alert('未实现的图表', {icon: 2});
        					}
        				} 

        	
        },
        
        uuid() {
        	var s = [];
        	var hexDigits = "0123456789abcdef";
        	for (var i = 0; i < 36; i++) {
        		s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
        	}
        	s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
        	s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
        	//s[8] = s[13] = s[18] = s[23] = "-";
        	//s[8] = s[13] = s[18] = s[23] = "";

        	var uuid = s.join("");
        	return uuid;
        },
		
    });
})(jQuery);



function isExitsFunction(funcName) {
	  try {
	    if (typeof(eval(funcName)) == "function") {
	      return true;
	    }
	  } catch(e) {}
	  return false;
	}

function tagchoice(objShow,obj,findUrl,isMultiple){
	//console.log(obj);
	//console.log('data：'+data);
	
	//alert(objShow.val()+":"+obj.val());
	var url = findUrl+"&multiple="+(isMultiple?"true":"false")+"&val="+obj.val();
	var dex = layer.open({
		  type: 2,
		  shade: 0.3,
		  anim: 5,
		  title : "请选择数据",
		  area: ['600px', '520px'],
		  scrollbar: false,
		 // content: '/widget/find?code=test_info&field=tag&multiple=true&val=3,2',
		  content: [url, 'no'],
		  btn: ['确定'],
		
	 	 yes: function(index, layero){
	   		 //按钮【按钮一】的回调
	    	console.log('确定');
	   		 
	   		 //获取选中值（name="",value=""）
	    	var iframeWin = window[layero.find('iframe')[0]['name']];
	    	console.log(iframeWin.choiceed);
	    	
	    	
	    	//先清除全部，然后再次赋值
	    	for(var i = 0;i<iframeWin.choiceed.length;i++){
	    		//var pk_name = iframeWin.choiceed[i].pk_name;
	    		var needInit = false;
	    		if(i == 0 )
	    			needInit = true;
	    		addTag(objShow,obj
	    				,iframeWin.choiceed[i].pk_id
	    				,iframeWin.choiceed[i][iframeWin.choiceed[i].cn_name],needInit);
	    		
	    		
	    			
	    	}
	    	
	    	
	    	
	    	
	    	//alert(objShow.val()+":"+obj.val());
	    	
	    	layer.close(index); //如果设定了yes回调，需进行手工关闭
	    	//console.log(layero);
	    	//layer.iframeAuto(dex) ;
	    	//$(layero).find("input").each(function(i, v) {
             //   alert($(v).text());
            //});
	    	
	    	
	 	 },
		  success: function(layero, index){
		    //var body = layer.getChildFrame('body', index);
		    //var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		    //console.log(body.html()) //得到iframe页的body内容
		    //body.find('input').val('Hi，我是从父页来的')
		    
		    //数据加载完成再次自适应
			  //layer.iframeAuto(index) ;
		  }
		});   
}

//objShow,obj
function addTag(objShow,obj,key,value,needInit){
	//console.log(obj);
	if(needInit != null && needInit){
		//console.log("执行一次重置");  
		obj.val('');
		var parant = objShow.get(0).parentNode;
		//tags-item
		$(parant).children(".tags-item").each(function(obj){  
			$(this).remove();
	       // console.log($(this).html());  
	    });  
	}
	
	//console.log(obj.val()+",增加tag:"+value);
	objShow.before('<span class="tags-item"><span>'+(value)+'</span><i class="layui-icon '+obj[0].id+'" value="'+(key)+'" name="'+obj[0].id+'">&#x1006;</i></span>');
	

	
	if(obj.val() == '')
		obj.val(key);
	else
		obj.val(obj.val()+","+key);
}

function addTags(objShow,obj,keys,values,needInit){
	//console.log(obj);
	if(needInit != null && needInit){
		//console.log("执行一次重置");  
		obj.val('');
		var parant = objShow.get(0).parentNode;
		//tags-item
		$(parant).children(".tags-item").each(function(obj){  
			$(this).remove();
	       // console.log($(this).html());  
	    });  
	}
	
	//确保 keys 和 values 数量一致，本地未检测
	for(var i = 0;i<keys.length;i++){
		addTag(objShow,obj,keys[i],values[i],false);		
	}
}


//移除tag以及实际值
function removeTag(objTag){
	if(objTag == null)
		return;
	objTag.parentNode.remove();
	var value = objTag.attributes["value"].value;
	var tagId = objTag.attributes["name"].value;//id
	
	var targsValue = $("#"+tagId).val();
     
     var values = targsValue.split(',');
     var after = "";
     for(var x=0;x<values.length;x++){
  	   if(values[x] != value){
  		   if(after == ""){
  			   after =  values[x];
  		   }else{
  		   	   after += ","+ values[x];
  		   }   
  	   }
     }
     $("#"+tagId).val(after);
}

function saveGridLines(gridid,objectCode) {
	var grid = $("#"+gridid);

	
	var errorMsg = $.saveGridLine(grid,objectCode);
	if (errorMsg == '') {
        $.slideMsg("保存成功！");
        // 确认改动
        grid.datagrid('acceptChanges');
        console.log('标记更改');
    } else {
        $.alert($, errorMsg);
    }
    //移除按钮
    $("#"+objectCode+"_toolbar_saveall").remove();
}

function updateGridLines(gridid,objectCode) {
	var grid = $("#"+gridid);
	var updated = grid.datagrid('getRows');
	
	var errorMsg = '';
	 var json = JSON.stringify(updated);
                // console.log('保存update数据' + json3);
                $.syncPost('/grid/update/' + objectCode, {rows: json},
                        function (result, status) {
                            if (!result.success) {
                                isOk = false;
                                errorMsg = result.msg ;
                            }
                        });

	if (errorMsg == '') {
        //$.slideMsg("保存成功！");
        // 确认改动
        //grid.datagrid('acceptChanges');
        console.log('标记更改');
        return true;
    } else {
        $.alert($, errorMsg);
        return false;
    }

}

//重新渲染表单 ,更新filter下的控件
function renderForm(filter){
  layui.use('form', function(){
   var form = layui.form;//高版本建议把括号去掉，有的低版本，需要加()
//form.render(type, filter);form.render(type, filter);
   if(filter == null)
	   form.render();
   else
	   form.render(null,filter);
  });
 }