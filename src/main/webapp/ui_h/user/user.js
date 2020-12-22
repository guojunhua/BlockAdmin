$("#form-user-resetPwd").validate({
		
			messages: {
				oldPwd: {
	                required: "请输入原密码",
	                remote: "原密码错误"
	            },
	            newPwd: {
	                required: "请输入新密码",
	                minlength: "密码不能小于6个字符",
	                maxlength: "密码不能大于20个字符"
	            },
	            confirmPwd: {
	                required: "请再次输入新密码",
	                equalTo: "两次密码输入不一致"
	            }

	        },
	        focusCleanup: true
});
		
		function submitHandler() {
	        if ($.validate.form()) {
	        	$.operate.save(ctx + "user/updatePwd", $('#form-user-resetPwd').serialize());
	        }
	    }