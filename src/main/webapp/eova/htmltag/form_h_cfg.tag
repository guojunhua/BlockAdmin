<form class="form-horizontal m " id="${id}" name="${id}" method="post">
<input name="BB_PROCESS_APPROVAL" id="BB_PROCESS_APPROVAL" type="hidden"/>
<%
		// Form Widget: 。
		// 下面的代码，必须非常熟悉Beetl再看如下代码。
		// 用到Beetl各种常规语法+自定义函数+Tag
		
		//2中模式，第一无配置信息的情况 ，第二有配置新版数据的情况（拖拽形成的配置）结构如下
		/* {
"addForm": {
"force": 2,
"maxColumn":2,
"list": [
  {
    "name": "请输入分组名",
    "order": 1,
    "datas": [
      {
        "line": 1,
        "data": [
          {
            "width": "12",
            "name": "名称",
            "explain": "名称[name]",
            "id": "name",
            "defaultVal": "",
            "ismust": false
          }
        ]
      },
      {
        "line": 2,
        "data": [
          {
            "width": "6",
            "name": "班级号",
            "explain": "班级号[class_no]",
            "id": "class_no",
            "defaultVal": "",
            "ismust": false
          },
          {
            "width": "6",
            "name": "状态",
            "explain": "状态[status]",
            "id": "status",
            "defaultVal": "请选择",
            "ismust": false
          }
        ]
      }
    ]
  },
  {
    "name": "隐藏域",
    "order": 0,
    "datas": [
      {
        "line": 1,
        "data": [
          {
            "id": "id",
            "defaultVal": "",
            "placeholder": "",
            "verify": "",
            "ismust": true
          }
        ]
      },
      {
        "line": 2,
        "data": [
          {
            "id": "create_user",
            "defaultVal": "${user.id}",
            "verify": "",
            "ismust": false
          }
        ]
      }
    ]
  }
]
} */
		
		var config = null;//from 的配置信息，比如一行几个 都有谁，如果不存在则使用目前老的模式，分组，顺序铺
		var formViews = null;
		var force = 0;

		var formtype = type;
		
		//debug(VIEW_FORM!);
		//debug(formtype!);
		//是否要强制用view来显示，而不取决数据的是否隐藏
		if(!isEmpty(object.config!)){
			//formView = object.config[formtype];
			config = object.config.config;
			if(!isEmpty(VIEW_FORM!)){
				formViews = config[VIEW_FORM];
			}else{
				formViews = config[formtype];
				if(formViews == null){
					formViews = config.form;
				}
			}
		}

		//debug(formViews!);
		
		formViews = formViews.list!;
		// 获取分组元字段数据（友查询改成 后台直接可以带出来）
		//var fields = query("fields", objectCode); 
		var fields = object.fields;
		
		
		
		//注意隐藏的如果没配置也需要输出出来
	
		
		
		var formViewsLen = formViews.~size;
		
		var x = 0;
		
		var hiddenGroup = null;
		if(formViewsLen>0)	{
			if(formViews[formViewsLen-1].order == 0){
				hiddenGroup = formViews[formViewsLen-1];
				
				formViewsLen = formViewsLen-1;
			}
				
		}
		
		 
		for(var i=0;i<formViewsLen;i++){
			var g = formViews[i];
			var order = g.order;//如果是0 则是隐藏组，不需要输出
			var groupName = g.name;
			var datas = g.datas;
			%>

 			<h4 class="form-header h4">${groupName!}</h4>
 			
 			
 			<%
			for(oneline in datas){
				var lineNum = oneline.line;
				var lineDatas = oneline.data;
				
				//
				var lineColumn = lineDatas.~size;
				
				//输出line字段  开始	
		   %>
			<div class="row">
					<%
					
					var col ;
					for(onefield in lineDatas){ 
						var outlabel = true;
						var fieldid = onefield.id;
						var isReadOnly = onefield.readOnly;
						var defaultVal = strutil.out(onefield.defaultVal,null);
						var placeholder = strutil.out(onefield.placeholder,null);
						var ismust = onefield.ismust;
						var verify = strutil.out(onefield.verify,null);
						var limit = strutil.out(onefield.limit,null);
						
						var expandLevel = strutil.out(onefield.expandLevel,null);//弹出树用
						
						if(isEmpty(fieldid!))
							continue;
						
						
						//debug(fieldid);
						//debug(defaultVal);
						
						if(isEmpty(onefield.name!))
							outlabel = false;
						
						var f = null;
						for(ftemp in fields){
							if(ftemp.en == fieldid){//输出
								f = ftemp;
							
								break;
							}
						}
						///debug(f);//添加字段，从配置json=》f ,set是之前有值，put是直接放入
						if(!isEmpty(verify!))
							@f.set('validator',verify);
						@f.set('is_required',ismust);
						if(!isEmpty(limit!))
							@f.put('limit',limit);
						if(!isEmpty(expandLevel!))
							@f.put('expandLevel',expandLevel);
						
						
						var value = null;
						if(data != null)
							value = @data.get(f.en);// 获取当前字段的值
							
						
						// 获取固定值(必须是JSON)
						if(!isEmpty(fixed!)){
							// JSON对象化
							var fix = parseJson(fixed);
							
							var fixedValue = fix[f.en];
							// 固定值覆盖动态值并且只读
							if(!isEmpty(fixedValue)){
								value = fixedValue;
								isReadOnly = true;
							}
						}
						
						var width = 6;
					    if(lineColumn == 1){
					    	//debug(onefield.width!);
					    	if(parseInt(onefield.width!) > 6){
					    		width = 12;
					    	}else{
					    		width = 6;
					    	}
					    }
					%>	
						
						<div class="col-sm-${width!}">
						<div class="form-group" >
						<% if(outlabel){//需要输出lab %>
										
									<label class="col-sm-${(width == 6) ?4:2} control-label ${isTrue(onefield.ismust!) ?'is-required'}">${onefield.name!}：</label>
									<div class="col-sm-${(width == 6) ?8:10}">
						<% } %>			
										
									<#field_h item="${f}" placeholder="${placeholder!}" defaultValue="${defaultVal!}"  value="${value!}" readonly="${isReadOnly}" />
					     			<#outside_tips_h f="${f}"/>
					     <% if(outlabel){ %>
					                  </div>
					     <% } %>
					     </div>	
					   </div>
						
					<%	
					}
					%>
			</div>
			<% } //输出line字段 结束  %>
 			
            
 <% }//组结束 %>
 
 <%  if(hiddenGroup!= null){//隐藏组开始
			debug(hiddenGroup);
			
			for(oneline in hiddenGroup.datas){
			
				for(onefield in oneline.data){
					////debug(onefield);
					var fieldid = onefield.id;
					var isReadOnly = onefield.readOnly;
					var defaultVal = strutil.out(onefield.defaultVal,null);
					var placeholder = strutil.out(onefield.placeholder,null);
					var ismust = onefield.ismust;
					var verify = strutil.out(onefield.verify,null);
					
					if(isEmpty(fieldid))
						continue;
					//if(!isEmpty(verify!))
					//	@f.set('validator',validator);
					//@f.set('is_required',ismust);
					
					//debug(fieldid);
			
					var f = null;
					for(ftemp in fields){
						if(ftemp.en == fieldid){//输出
							f= ftemp;
						
							break;
						}
					}
					var value = null;
					if(data != null)
						value = @data.get(f.en);// 获取当前字段的值
					//debug(f);
					// 获取固定值(必须是JSON)
					if(!isEmpty(fixed!)){
						// JSON对象化
						var fix = parseJson(fixed!);
						var fixedValue = fix[f.en];
						// 固定值覆盖动态值并且只读
						if(!isEmpty(fixedValue)){
							value = fixedValue;
							isReadOnly = true;
						}
					}
	
						
						%>
						<#field_hidden item="${f}" fixed="${fixed!}" value="${value!onefield.defaultVal!}" />
						<%
					}
				
			}
		} //隐藏组结束%>
 
            
 <!--    
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>手机号码：</label>
                        <div class="col-sm-8">
                            <input id="phonenumber" name="phonenumber" placeholder="请输入手机号码" class="form-control" type="text" maxlength="11" required>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>邮箱：</label>
                        <div class="col-sm-8">
                            <input id="email" name="email" class="form-control email" type="text" maxlength="50" placeholder="请输入邮箱" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>登录账号：</label>
                        <div class="col-sm-8">
                            <input id="loginName" name="loginName" placeholder="请输入登录账号" class="form-control" type="text" maxlength="30" required>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>登录密码：</label>
                        <div class="col-sm-8">
                            <input name="password" placeholder="请输入登录密码" class="form-control" type="password" value="123456" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户性别：</label>
                        <div class="col-sm-8">
                            <select name="sex" class="form-control m-b">
				                <option value="0">男</option>
				                <option value="1">女</option>
				                <option value="2">未知</option>
				            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户状态：</label>
                        <div class="col-sm-8">
                            <label class="toggle-switch switch-solid">
	                            <input type="checkbox" id="status" checked>
	                            <span></span>
	                        </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-xs-2 control-label">岗位：</label>
                        <div class="col-xs-4">
                            <select id="post" class="form-control select2-multiple" multiple>
								<option value="1">董事长</option>
								<option value="2">项目经理</option>
								<option value="3">人力资源</option>
								<option value="4">普通员工</option>
							</select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-xs-2 control-label">角色：</label>
                        <div class="col-xs-10">
                            <label class="check-box">
								<input name="role" type="checkbox" value="1">管理员</input>
							</label><label class="check-box">
								<input name="role" type="checkbox" value="2">普通角色</input>
							</label>
                        </div>
                    </div>
                </div>
            </div>
            <h4 class="form-header h4">其他信息</h4>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-xs-2 control-label">备注：</label>
                        <div class="col-xs-10">
                            <textarea name="remark" maxlength="500" class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                </div>
            </div>
  -->       


</form>
<script>


layui.use(['form','code'], function(){
	  var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
	   $ = layui.$;
	   
       // 代码块
       layui.code({
           title: 'html',
           encode: true,
           about: false

       });
	
       // 手动赋值
       //$('select[name="简化多选+搜索+大小写敏感"]').val(['sing1', 'movie2']);
       form.render();
	  
	  //但是，如果你的HTML是动态生成的，自动渲染就会失效
	  //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
       form.on('submit(submit)', function(data){
    		  //console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
    		  //console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
    		  //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
    		  //console.log(syntaxHighlight(data.field));
    		  
    		  //提交数据
    		  submitNow(data);
    		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    		});
	  
	}); 

// json 格式化+高亮
function syntaxHighlight(json) {
    if (typeof json != 'string') {
        json = JSON.stringify(json, undefined, 2);
    }
    json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');
    return json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function(match) {
        var cls = 'number';
        if (/^"/.test(match)) {
            if (/:$/.test(match)) {
                cls = 'key';
            } else {
                cls = 'string';
            }
        } else if (/true|false/.test(match)) {
            cls = 'boolean';
        } else if (/null/.test(match)) {
            cls = 'null';
        }
        return '<span class="' + cls + '">' + match + '</span>';
    });
}
</script>