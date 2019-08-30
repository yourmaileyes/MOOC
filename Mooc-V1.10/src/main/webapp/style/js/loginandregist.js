function validatePassword() {
			var username = $("#username").val();
			var password = $("#password").val();
			/* 判断用户名密码是否为空 */
			if (username == "") {
				$("#loginInfo").html(
						"<b style='color:red;font-size:15px;'>用户名不能为空！</b>");
				$("#username").focus();
				return;
			}
			if (password == "") {
				$("#loginInfo").html(
						"<b style='color:red;font-size:15px;'>密码不能为空！</b>");
				$("#password").focus();
				return;
			}
			var xmlHttpRequest;
			//不同的浏览器获取对象xmlhttprequest 对象方法不一样
			if (window.ActiveXObject) {

				xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");

			} else {

				xmlHttpRequest = new XMLHttpRequest();
			}
			myXmlHttpRequest = xmlHttpRequest;
			//怎么判断创建ok
			if (myXmlHttpRequest) {
				var url = "passwordcheck";
				var data = "username=" + username + "&password=" + password;
				//window.alert(data);
				myXmlHttpRequest.open("post", url, true);
				//指定回调函数.chuli是函数名
				myXmlHttpRequest.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				myXmlHttpRequest.onreadystatechange = chuli;
				myXmlHttpRequest.send(data);
			}
		}
		function chuli() {
			if (myXmlHttpRequest.readyState == 4) {
				var i = myXmlHttpRequest.responseText;
				if (i == 0) {
					$("#loginInfo")
							.html(
									"<b style='color:red;font-size:15px;'>用户名密码错误！</b>");
					$("#username").focus();
					return;
				} else
					$("#login").submit();
			}
		}
		function validate() {
			var username = $("#registname").val();
			var password = $("#registpassword").val();
			var confimpw = $("#password1").val();
			var okUsername = false;
			var okPassword = false;
			var o =$("#spanUsername").val();
			if (username == "") {
				$("#spanUsername").html("<b style='color:red;font-size:15px;margin-top:auto;'>用户名不能为空！</b>");
			} else {
				if(o=="")
					okUsername = true;
			
			}
			if (password == "") {
				$("#spanregistpassword").html("<b style='color:red;font-size:15px;margin-top:auto;'>密码不能为空！</b>");
			} else {
				if(password!=confimpw)
					$("#spanconfimpw").html("<b style='color:red;font-size:15px;margin-top:auto;'>两次密码不同！</b>");
				else
				okPassword = true;
			}
			if (okUsername && okPassword) {
				$("#quickregist").submit();
			}
	    
		}
		function ajax(){
			var i;
		var username = $("#registname").val();
		var xmlHttpRequest;
		//不同的浏览器获取对象xmlhttprequest 对象方法不一样
		if(window.ActiveXObject){
			
			xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
			
		}else{

			xmlHttpRequest=new XMLHttpRequest();
		}
		myXmlHttpRequest=xmlHttpRequest;
		//怎么判断创建ok
		if(myXmlHttpRequest){
			var url = "usercheck";
			var data = "username="+username;
			//window.alert(data);
			myXmlHttpRequest.open("post",url,true);
			//指定回调函数.chuli是函数名
			myXmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			myXmlHttpRequest.onreadystatechange=chuli;
			myXmlHttpRequest.send(data); 
			
		}
		function chuli(data){
			if(myXmlHttpRequest.readyState==4){
				 i = myXmlHttpRequest.responseText;
			if (i  == 1) {
				 
				$("#spanUsername")
						.html(
								"<b style='color:red;font-size:15px;margin:5px auto;text-align:left'>用户名已被使用！</b>");
				return i;
			} else {
				$("#spanUsername")
						.html("");
				
			}
		}
			}
		return i;
		}