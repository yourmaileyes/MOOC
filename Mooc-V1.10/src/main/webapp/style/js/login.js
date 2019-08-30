function showdenglu() {
		$("#dengluinput").fadeIn();
	}
	function guanbi() {
		$("#dengluinput").fadeOut();
	}
	function zhuce() {
		var rpassword = document.createElement("input");
		var br = document.createElement("br");
		$("#labelrpw").text("确认密码");
		rpassword.id = "rpassword";
		rpassword.name = "rpassword";
		rpassword.type = "password";
		br.id="br";
		$("#labelrpw").after(rpassword);
		$("#labelrpw").after(br);
		$("#rpassword").addClass("denglu-input");
		$("#tijiao").html("注册");
		$("#tijiao").attr("onclick", "quickregist()");
		$("#zhuce").css("border-bottom", "1px solid #f01400");
		$("#denglu").css("border-bottom", "1px solid #d0d6d9");
		$("#zhuce").attr("onclick", "#");
		$("#denglu").attr("onclick", "denglu()");
		$("#form1").attr("action", "regist");
	}
	function denglu() {
		$("#labelrpw").text("");
		$("#rpassword").remove();
		$("#br").remove();
		$("#zhuce").css("border-bottom", "1px solid #d0d6d9");
		$("#denglu").css("border-bottom", "1px solid #f01400");
		$("#denglu").attr("onclick", "#");
		$("#zhuce").attr("onclick", "zhuce()");
		$("#tijiao").html("登录");
		$("#tijiao").attr("onclick", "quickpasswordchat()");
		$("#form1").attr("action", "login");
	}
	function quickpasswordchat() {
		var username = $("#username").val();
		var password = $("#password").val();
		var varcode = $("#varcode").val();
		var isok = true;
		if (username == "" || password == "") {
			$("#tishi").html(
					"<b style='color:red;font-size:15px;'>用户名或密码不能为空!</b>");
			isok = false;
			return;
		}
		if (varcode == "") {
			$("#tishi").html(
			"<b style='color:red;font-size:15px;'>验证码不能为空!</b>");
	        isok = false;
	        return;
        }
		$
		.ajax({
			type : "post",
			url : "varcodecheck",
			data : {
				"varcode" : varcode
			},
			async : false,
			dataType : 'text',
			success : function(data) {
				if (data == "0") {
					$("#tishi")
							.html(
									"<b style='color:red;font-size:15px;'>验证码错误!</b>");
					isok = false;
					return;
				} else{
					$
					.ajax({
						type : "post",
						url : "passwordcheck",
						data : {
							"username" : username,
							"password" : password
						},
						async : false,
						dataType : 'text',
						success : function(data) {
							if (data == 3) {
								$("#tishi")
										.html(
												"<b style='color:red;font-size:15px;'>您的账号已被屏蔽!</b>");
								changevarcode();
								isok = false;
							}else
							if (data == 0) {
								$("#tishi")
										.html(
												"<b style='color:red;font-size:15px;'>用户名或密码错误!</b>");
								changevarcode();
								isok = false;
							} else {
								$("#tishi").html("正在登录.....");
							}
						},
						error : function(data) {
							alert("登录出错！请联系管理员" + data);
							isok = false;
						}
					});
				}
			},
			error : function(data) {
				alert("登录出错！请联系管理员" + data);
				isok = false;
				return;
			}
		});
		
		if (isok) {
			$("#form1").submit();
		}
	}

	function quickregist() {
		var username = $("#username").val();
		var password = $("#password").val();
		var rpassword = $("#rpassword").val();
		var varcode = $("#varcode").val();
		var isok = true;
		if (username == "" || password == "") {
			$("#tishi").html(
					"<b style='color:red;font-size:15px;'>用户名或密码不能为空!</b>");
			isok = false;
			return;
		}
		if (rpassword == "") {
			$("#tishi").html(
					"<b style='color:red;font-size:15px;'>请输入确认密码！</b>");
			isok = false;
			return;
		}
		if (rpassword != password ) {
			$("#tishi").html(
					"<b style='color:red;font-size:15px;'>两次密码不同！</b>");
			isok = false;
			return;
		}
		if (varcode == "") {
			$("#tishi").html(
			"<b style='color:red;font-size:15px;'>验证码不能为空!</b>");
	        isok = false;
	        return;
        }
		$
		.ajax({
			type : "post",
			url : "varcodecheck",
			data : {
				"varcode" : varcode
			},
			async : false,
			dataType : 'text',
			success : function(data) {
				if (data == "0") {
					$("#tishi")
							.html(
									"<b style='color:red;font-size:15px;'>验证码错误!</b>");
					isok = false;
					return;
				} else{
					$
					.ajax({
						type : "post",
						url : "usercheck",
						data : {
							"username" : username
						},
						async : false,
						datatype : "text",
						success : function(data) {
							if (data == "1") {
								$("#tishi")
										.html(
												"<b style='color:red;font-size:15px;'>用户名已经存在!</b>");
								isok = false;
							} else {
								$("#tishi").html("正在注册.....");
							}
						},
						error : function(data) {
							alert("注册出错！请联系管理员" + data);
							isok = false;
						}
					});
				}
			},
			error : function(data) {
				alert("登录出错！请联系管理员" + data);
				isok = false;
				return;
			}
		});
		
		if (isok) {
			$("#form1").submit();
		}
    }
	function changevarcode(){
		var src = "changevarcode?t="+new Date().getTime();
		$("#varcodeimg").attr("src",src);
	}