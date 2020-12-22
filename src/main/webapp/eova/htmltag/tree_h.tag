<div id="${id!}" class="ztree"></div>
<script type="text/javascript">
$(function() {
		// 初始化参数
		var $tree = $("#${id}");
		var masterId = "${masterId!}";
		var $master;
		if (masterId != "") {
			$master = $("#" + masterId);
		}
		var menuCode = '${menuCode!}';
		var objectCode = '${objectCode!}';
		var objectJson = '${objectJson!}'; // object is json
		var fieldsJson = '${fieldsJson!}'; // fiedlds is json
		var configJson = '${configJson!}'; // config is json

		var url = "${url!}";
		var idKey = "${idKey!'id'}";
		var nameKey = "${nameKey!'name'}";
		var pidKey = "${pidKey!'parent_id'}";
		var expandLevel = "${expandLevel!2}";//此值可以从参数里边配置。目前没配置
		var rootPid = "${rootPid!0}";

		// 初始化组件
		EovaWidget.init(objectCode, objectJson, fieldsJson, configJson);
		var config = EovaWidget.data.config,
			object = EovaWidget.data.object,
			fields = EovaWidget.data.fields;
		// 初始化URL
		if (url == '') {
			url = '/tree/query/' + objectCode;
			if(menuCode != ''){
	        	url = url + '-' + menuCode;
	        }
		}


	
		
		var options = {
			id: "${id!}",          	
	        url: url,
	        expandLevel: expandLevel,
	        data: {
		        key: {
		            title: nameKey,         // 节点数据保存节点提示信息的属性名称
		            
		        },
		        simpleData: {
		            enable: true,          // true / false 分别表示 使用 / 不使用 简单数据模式
		            idKey: idKey,
					pIdKey: pidKey,
					rootPId: rootPid
		        },
		    },
		    
		    initComplete:initComplete,
	        onClick : zOnClick
	    }; 
		$.tree.init(options);
		
		
		function initComplete(tree) {
		
			
			//默认选择顶级节点
			var node= tree.getNodeByParam(pidKey, rootPid);
			if(node != null ){
				//console.log(node);
				//tree.selectNode(node);  
				 $("#"+node.tId+"_a").click();//主动点击的选中
			}
		}
		
		function zOnClick(event, treeId, treeNode) {
			$("#deptId").val(treeNode.id);
			$("#parentId").val(treeNode.pId);

			//$.table.search();
			//点击回调
			if($.exitsFunction("treeNodeClicked")){
				treeNodeClicked(treeNode);
			}
		}
		
		
});
function refresh_${id!}(){
	$.tree.init($.tree._option);
}
</script>