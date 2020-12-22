var $form = $('#myForm');

function typeChange(newValue, oldValue) {
	// diy 需要显示 自定义URL字段,并启用校验
	if (newValue == 'diy') {
		$('#trUrl').show();
		$form.validator("setField", "url", "自定义业务URL:required;");
	} else {
		if (oldValue == 'diy') {
			$form.validator("setField", "url", null);
			$('#trUrl').hide();
		}
	}
	
	console.log('oldValue:'+oldValue+' newValue:'+newValue);
	$('#template').hide();
	
	
	// dashboard
	if (newValue == 'dashboard') {

		$('#templatename').text('[Dashboard]');
		$('#templateimg').html('<img src="/ui/images/template/dashboard.png" >');
	
		$('#template').show();
		
	} else {
		if (oldValue == 'dashboard') {

		}
	}
	
	
	// office
	if (newValue == 'office') {
		$('#office_tr').show();
		
		$form.validator('setField', {
			office_type : '文件类型必须:required;',
			path : '模板路径必填:required;'
		});
		
		$('#templatename').text('[Office]');
		$('#templateimg').html('<img src="/ui/images/template/office.png" >');
	
		$('#template').show();
		
	} else {
		if (oldValue == 'office') {
			$form.validator('setField', {
				office_type : null,
				path : null
			});
			$('#office_tr').hide();
		}
	}
	
	
	// bi
	if (newValue == 'bi') {
		$('#bi_tr').show();
		
		//没法添加自定义规则
		/*$form.validator('setField', {
			bi_report_id : 'BI资源ID必须:required(from,bi_report);',
			bi_report_url : 'BI资源URL必填:required(from,bi_report);'
		});*/
		
	

		$('#templatename').text('[Bi]');
		$('#templateimg').html('<img src="/ui/images/template/bi.png" >');
	
		$('#template').show();
		
	} else {
		if (oldValue == 'bi') {
			$form.validator('setField', {
				bi_report_url : null,
				bi_report_id : null
			});
			$('#bi_tr').hide();
		}
	}
	
	

	if (newValue == 'single_grid') {
		$form.validator('setField', {
			objectCode : '元对象:required;'
		});
	
			$('#templatename').text('[单表]');
			$('#templateimg').html('<img src="/ui/images/template/single_grid.png" >');
		
		$('#template').show();
	} else {
		if (oldValue == 'single_grid') {
			$form.validator('setField', {
				objectCode : null
			});
		}
	}
	
	if (newValue == 'img_grid') {
		$form.validator('setField', {
			imgObjectCode : '元对象:required;'
		});
		$('#templatename').text('[单图表]');
		$('#templateimg').html('<img src="/ui/images/template/img_grid.png" >');
		$('#template').show();
	} else {
		if (oldValue == 'img_grid') {
			$form.validator('setField', {
				imgObjectCode : null
			});
		}
	}

	if (newValue == 'single_tree') {
		$form.validator('setField', {
			rootPid : '根节点父ID:required;',
			singleTreeObjectCode : '元对象:required;',
			treeField : '树形字段:required;',
			parentField : '关联字段:required;'
		});
		$('#templatename').text('[单表树]');
		$('#templateimg').html('<img src="/ui/images/template/single_tree.png" >');
		$('#template').show();
	} else {
		if (oldValue == 'single_tree') {
			$form.validator('setField', {
				rootPid : null,
				singleTreeObjectCode : null,
				treeField : null,
				parentField : null
			});
		}
	}
	
	
	if (newValue == 'org_grid') {
		$form.validator('setField', {
			orgIdField : 'ID字段:required;',
			orgGridObjectCode : '元对象:required;',
			orgGridField : '树形字段:required;',
			orgParentField : '关联字段:required;'
		});
		$('#templatename').text('[单组织]');
		$('#templateimg').html('<img src="/ui/images/template/org_grid.png" >');
		$('#template').show();
	} else {
		if (oldValue == 'org_grid') {
			$form.validator('setField', {
				orgGridObjectCode : null,
				orgParentField : null,
				orgIdField : null,
				orgGridField : null
			});
		}
	}
	

	if (newValue == 'single_chart') {
		$form.validator('setField', {
			singleChartObjectCode : '元对象:required;',
			singleChartYunit : 'Y轴单位:required;',
			singleChartX : 'X轴字段:required;',
			singleChartY : 'Y轴字段:required;'
		});
		$('#templatename').text('[单表图]');
		$('#templateimg').html('<img src="/ui/images/template/single_chart.png" >');
		$('#template').show();
	} else {
		if (oldValue == 'single_chart') {
			$form.validator('setField', {
				singleChartObjectCode : null,
				singleChartYunit : null,
				singleChartX : null,
				singleChartY : null
			});
		}
	}

	if (newValue == 'master_slave_grid') {
		$form.validator('setField', {
			masterObjectCode : '主对象:required;',
			slaveObjectCode : '子对象:required;',
			masterFieldCode : '主外键字段:required;',
			slaveFieldCode : '子关联字段:required;'
		});
		$('#templatename').text('[主子表]');
		$('#templateimg').html('<img src="/ui/images/template/master_slave_grid.png" >');
		$('#template').show();
	} else {
		if (oldValue == 'master_slave_grid') {
			$form.validator('setField', {
				masterObjectCode : null,
				slaveObjectCode : null,
				masterFieldCode : null,
				slaveFieldCode : null
			});
		}
	}

	if (newValue == 'tree_grid') {
		$form.validator('setField', {
			treeGridTreeObjectCode : '树元对象:required;',
			treeGridTreeFieldCode : '树关联字段:required;',

			treeGridRootPid : '根节点父ID:required;',
			treeGridParentField : 'PID字段:required;',
			treeGridTreeField : '树形字段:required;',

			treeGridObjectCode : 'Grid元对象:required;',
			treeGridFieldCode : 'Grid外键字段:required;'
		});
		$('#templatename').text('[树&表]');
		$('#templateimg').html('<img src="/ui/images/template/tree_grid.png" >');
		$('#template').show();
	} else {
		if (oldValue == 'tree_grid') {
			$form.validator('setField', {
				treeGridTreeObjectCode : null,
				treeGridTreeFieldCode : null,

				treeGridRootPid : null,
				treeGridParentField : null,
				treeGridTreeField : null,

				treeGridObjectCode : null,
				treeGridFieldCode : null,
			});
		}
	}

	$('#' + newValue).show();
	$('#' + oldValue).hide();
}




$(function() {

	// --------------------------------------------------单表树 级联
	var $single_tree_object = $('#single_tree_object');
	var $single_tree_icon = $('#single_tree_icon');
	var $single_tree_field = $('#single_tree_field');
	var $single_tree_parent = $('#single_tree_parent');
	var $single_tree_id = $('#single_tree_id');

	// 初始化禁用
	$single_tree_icon.mask();
	$single_tree_field.mask();
	$single_tree_parent.mask();
	$single_tree_id.mask();


	$single_tree_object.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$single_tree_icon.mask();
				$single_tree_field.mask();
				$single_tree_parent.mask();
				$single_tree_id.mask();
				return;
			}

			// $single_tree_icon.attr('url', buildUrl(newValue));
			$single_tree_icon.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$single_tree_icon.unmask();

			$single_tree_field.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$single_tree_field.unmask();

			$single_tree_parent.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$single_tree_parent.unmask();

			$single_tree_id.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$single_tree_id.unmask();
		}
	});

	// --------------------------------------------------单表图 级联
	var $single_chart_object = $('#single_chart_object');
	var $single_chart_x = $('#single_chart_x');
	var $single_chart_y = $('#single_chart_y');

	// 初始化禁用
	$single_chart_x.mask();
	$single_chart_y.mask();

	$single_chart_object.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$single_chart_x.mask();
				$single_chart_y.mask();
				return;
			}

			$single_chart_x.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$single_chart_x.unmask();

			$single_chart_y.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$single_chart_y.unmask();
		}
	});

	// --------------------------------------------------主子表级联

	var $masterObjectCode = $('#masterObjectCode');
	var $masterFieldCode = $('#masterFieldCode');

	var $slaveObjectCode1 = $('#slaveObjectCode1');
	var $slaveFieldCode1 = $('#slaveFieldCode1');

	var $slaveObjectCode2 = $('#slaveObjectCode2');
	var $slaveFieldCode2 = $('#slaveFieldCode2');

	var $slaveObjectCode3 = $('#slaveObjectCode3');
	var $slaveFieldCode3 = $('#slaveFieldCode3');

	var $slaveObjectCode4 = $('#slaveObjectCode4');
	var $slaveFieldCode4 = $('#slaveFieldCode4');

	var $slaveObjectCode5 = $('#slaveObjectCode5');
	var $slaveFieldCode5 = $('#slaveFieldCode5');

	// 初始化禁用
	$masterFieldCode.mask();
	$slaveFieldCode1.mask();
	$slaveFieldCode2.mask();
	$slaveFieldCode3.mask();
	$slaveFieldCode4.mask();
	$slaveFieldCode5.mask();

	$masterObjectCode.eovafind({
		onChange : function(oldValue, newValue) {
			// console.log(oldValue +'|'+newValue);
			if (newValue == '') {
				$masterFieldCode.mask();
				return;
			}

			$masterFieldCode.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$masterFieldCode.unmask();
		}
	});

	$slaveObjectCode1.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$slaveFieldCode1.mask();
				return;
			}

			$slaveFieldCode1.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$slaveFieldCode1.unmask();
		}
	});
	$slaveObjectCode2.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$slaveFieldCode2.mask();
				return;
			}

			$slaveFieldCode2.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$slaveFieldCode2.unmask();
		}
	});
	$slaveObjectCode3.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$slaveFieldCode3.mask();
				return;
			}

			$slaveFieldCode3.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$slaveFieldCode3.unmask();
		}
	});
	$slaveObjectCode4.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$slaveFieldCode4.mask();
				return;
			}

			$slaveFieldCode4.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$slaveFieldCode4.unmask();
		}
	});
	$slaveObjectCode5.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$slaveFieldCode5.mask();
				return;
			}

			$slaveFieldCode5.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$slaveFieldCode5.unmask();
		}
	});

	// --------------------------------------------------树&表 级联

	var $tree_grid_tree_object = $('#tree_grid_tree_object');
	var $tree_grid_tree_field = $('#tree_grid_tree_field');

	var $tree_grid_parent = $('#tree_grid_parent');
	var $tree_grid_id = $('#tree_grid_id');
	var $tree_grid_tree = $('#tree_grid_tree');
	var $tree_grid_icon = $('#tree_grid_icon');

	var $tree_grid_object_code = $('#tree_grid_object_code');
	var $tree_grid_field_code = $('#tree_grid_field_code');

	// 初始化禁用
	$tree_grid_tree_field.mask();

	$tree_grid_parent.mask();
	$tree_grid_id.mask();
	$tree_grid_tree.mask();
	$tree_grid_icon.mask();

	$tree_grid_field_code.mask();
	// Tree字段级联
	$tree_grid_tree_object.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$tree_grid_parent.mask();
				$tree_grid_id.mask();
				$tree_grid_tree.mask();
				$tree_grid_icon.mask();
				return;
			}

			$tree_grid_tree_field.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$tree_grid_tree_field.unmask();

			$tree_grid_parent.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$tree_grid_parent.unmask();

			$tree_grid_id.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$tree_grid_id.unmask();

			$tree_grid_tree.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$tree_grid_tree.unmask();

			$tree_grid_icon.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$tree_grid_icon.unmask();
		}
	});
	// Grid字段级联
	$tree_grid_object_code.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$tree_grid_field_code.mask();
				return;
			}

			$tree_grid_field_code.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$tree_grid_field_code.unmask();
		}
	});

	// org字段级联
	var $org_grid_object = $('#org_grid_object');
	var $org_grid_parent = $('#org_grid_parent');
	var $org_grid_id = $('#org_grid_id');
	var $org_grid_field = $('#org_grid_field');
	var $org_grid_icon = $('#org_grid_icon');

	// 初始化禁用
	$org_grid_parent.mask();
	$org_grid_id.mask();
	$org_grid_field.mask();
	$org_grid_icon.mask();

	$org_grid_object.eovafind({
		onChange : function(oldValue, newValue) {
			if (newValue == '') {
				$org_grid_parent.mask();
				$org_grid_id.mask();
				$org_grid_field.mask();
				$org_grid_icon.mask();
				return;
			}

			// $single_tree_icon.attr('url', buildUrl(newValue));
			$org_grid_parent.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$org_grid_parent.unmask();

			$org_grid_id.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$org_grid_id.unmask();

			$org_grid_field.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$org_grid_field.unmask();

			$org_grid_icon.eovafind({
				exp : 'selectEovaFieldByObjectCode,' + newValue
			});
			$org_grid_icon.unmask();
		}
	});
	

	$form.validator({
		debug : true,
		stopOnError : true,
		focusInvalid : false,
		showOk : false,
		timely : false,
		msgMaker : false,
		rules:{
			reportIdHasNoValue:function(){
				var result = false;
				 if($('bi_report_id').text()=='')
					 return true;
				 console.log(result);
				 return result;
			},
			reportUrlHasNoValue:function(){
				console.log($('bi_report_url').text());
				
				var result = false;
				 if($('bi_report_url').text()=='')
					 result = true;
				 console.log(result);
				 return result;
			},
			biResourceBothNull:function(){
				
				var result = true;
				 if($('bi_report_url').text()=='' || $('bi_report_id').text()=='')
					 result = 'BI资源Url 或者 ID必填一个';
				 console.log(result);
				 return result;
			},
		},
		fields : {
			parent_id : {
				rule : '父级:required;'
			},
			name : {
				rule : '名称:required;'
			},
			code : {
				rule : '编码:required;eovacode;'
			},
			indexNum : {
				rule : '序号:required;'
			},
			type : {
				rule : '业务类型:required;'
			},
			objectCode : {
				rule : '元对象:required;'
			}
		},
		
	});

	$form.on("validation", function(e, current) {
		// 当前字段未验证通过，Tip提示
		if (!current.isValid) {
			var tip = $.tipwarn($(current.element).parent(), current.msg);
			// alert(current.msg);
			// 开始输入销毁提示
			$(current.element).keydown(function(event) {
				tip.tooltip('destroy');
				$(this).unbind("keydown");
			});
		}
	});
});

var btnSaveCallback = function($dialog, $grid, $pjq) {
	// buildUrl($pjq);
	
	$form.isValid(function(isValied) {
		if (isValied) {
			var result = null;
			var form =sy.serializeObject($form);
			 if(form['bi_report_url']=='' && form['bi_report_id']=='')
				 result = 'BI资源Url 或者 ID必填一个';

			 if($("[name='type']").val() == 'bi' && result != null){//bi资源不能为空的，自己写校验把
				 
				 $pjq.messager.alert('提示', result, 'error');
				 return;
			 }
			
			
			submitNow($dialog, $grid, $pjq);
		}
	});
};


var submitNow = function($dialog, $grid, $pjq) {
	var url = "/menu/add";
	$.post(url, sy.serializeObject($form), function(result) {
		if (result.success) {
			$.slideMsg("添加菜单成功！", $pjq);
			$grid.treegrid('load');
			$dialog.dialog('destroy');
		} else {
			$pjq.messager.alert('提示', result.msg, 'error');
		}
	}, 'json');
};
