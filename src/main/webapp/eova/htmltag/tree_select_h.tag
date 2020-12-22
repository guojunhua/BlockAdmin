<%
//文本域复选树形选择控件
var data = "";
if(!isEmpty(options!)){
	data = data + options;
}

var verify = "";
if(isTrue(isNoN!) ){
	verify = "required=true";
}
if(!isEmpty(validator!)){
	if(verify != ''){
		verify += ';';
	}
	verify = verify + validator!;

}

var disabled="";
if( isTrue(isReadonly!) || isTrue(view!)){
	disabled = 'readonly';
	verify = '';
}

var ismultiple = false;
if(isTrue(multiple!)){
	ismultiple = true;
}
var placeholderstr = "请选择";
if(isTrue(isQuery!)){//查询
	placeholderstr = "请选择"+placeholder;
}else if(!isEmpty(placeholder!) ){
	placeholderstr = placeholder;
}

// 默认URL
var queryUrl = "";
// 编码 或 表达式 必须存在其一
if(!isEmpty(code) || !isEmpty(exp)){
	// 存在自定义URL
	if(!isEmpty(url!)){
		// 自定义URL
		queryUrl = url;
	} else {
		queryUrl = "/widget/comboJson";
		if(!isEmpty(code) && !isEmpty(field)){
			// 存在编码和字段
			queryUrl = queryUrl +"/"+  code +"-"+ field;
		} else if(!isEmpty(exp)){
			// 存在自定义表达式
			queryUrl = queryUrl + "?exp=" + exp; 
		}
	}
}

//提取额外 expandLevel
//var expandLevel = 2;
value = isEmpty( value! ) ? defaultValue!:value!;
%>

<div class="bb-tree-select">
                            	<input name="${name}_show" id="${id!}_show" type="text" autocomplete="off" placeholder="${placeholderstr!}" class="form-control" ${disabled!} bb-verify="${verify!}" ${strutil.replace(verify!,';',' ')}>
<!--                                 <span class="input-group-addon"><i class="fa fa-search"></i></span> -->
<a id="${id!}_a" class="glyphicon glyphicon-remove btn form-control-feedback"style="pointer-events: auto;margin-right:15px"></a>
                                <input type="hidden" id="${id!}" name="${name}" value="${value!}" placeholder="${placeholderstr}"  title='${item.cn!}'  >
 
 
                                
   <!-- 模态框（Modal） -->
<div class="modal fade" id="${id!}_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">选择${item.cn!}</h4>
            </div>
            <div class="modal-body">
				<!-- <div class="wrapper"><div class="treeShowHideButton" onclick="$.tree.toggleSearch();">
					<label id="btnShow" title="显示搜索" style="display:none;">︾</label>
					<label id="btnHide" title="隐藏搜索">︽</label>
				</div> 
				<div class="treeSearchInput" id="search">
					<label for="keyword">关键字：</label><input type="text" class="empty" id="keyword" maxlength="50">
					<button class="btn" id="btn" onclick="$.tree.searchNode()"> 搜索 </button>
				</div>-->
				<div class="treeExpandCollapse">
					<a href="#" onclick="$.tree.expand()">展开</a> /
					<a href="#" onclick="$.tree.collapse()">折叠</a>
				</div>
				<div id="${id!}_tree" class="ztree treeselect"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="${id!}_click">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</div>                               



<script type="text/javascript">
$(function () {
		var url =  "${queryUrl!}";
		var options = {
			id: "${id!}_tree", 
	        url: url,
	        expandLevel: ${expandLevel!1},
	        onClick : zOnClick,
	        defaultValue:'73',
	        initComplete:initComplete,
	        data: {
                simpleData: {
                    enable: true,
                    idKey: "id",//节点id名
                    pIdKey: "p_id",//父节点id名
                }
            }
	    };
		$.tree.init(options);
		

		
	$("#${id!}_show").click(function(){
		if($("#${id!}_show").attr('readonly') != "readonly"){
			$('#${id!}_modal').modal();	
		}
    });
	
	function initComplete(treeObj) {
		 var treeId = $("#${id!}").val();
		 if(treeId != ''){
			 var node = treeObj.getNodes(); //可以获取所有的父节点
			  var nodes = treeObj.transformToArray(node); //获取树所有节点
		
				for (var i = 0; i < nodes.length; i++) {
					
					if(nodes[i].id == treeId){
						$("#${id!}_show").val(nodes[i].name);
						break;
					}
	
				}
		 }	  
	}
	
	function zOnClick(event, treeId, treeNode) {
		choiceNode = treeNode;
	    //treeId = treeNode.id;
	    //treeName = treeNode.name;
	    //$("#${id!}").val(treeId);
	   // $("#${id!}_show").val(treeName);
	}
	
	var choiceNode = null;
	$("#${id!}_click").click(function(){
		 if(choiceNode != null){
			    $("#${id!}").val(choiceNode.id);
			    $("#${id!}_show").val(choiceNode.name);
		 }
		 $('#${id!}_modal').modal('hide');	
	});
	
	$('#${id!}_a').click(function () {
		if($("#${id!}_show").attr('readonly') != "readonly"){
	    	$('#${id!}_show').val('');
	    	$('#${id!}').val('');
		}
	});
});

</script>