<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="CSS/styles.css">
<script src="JQ/jquery-1.9.1.min.js"></script>
<script>
	function login() {
		//setest();
		var logidv = $("#c_logid").val();
		var pwdv = $("#c_pwd").val();
		if (logidv == "" || logidv == "请输入账号！") {
			alert("请输入账号！")
			//document.getElementById("logid").focus(); 
			$("#c_logid").focus();
			return;
		}

		if (pwdv == "" || pwdv == "请输入密码！") {
			alert("请输入密码！")
			$("#c_pwd").focus();
			return;
		}

		$.post("HosMan/cuslogin", {
			logid:logidv,
			pwd:pwdv
		}, function(data) {
			if (data == "true") {
				alert("登录成功！");
				//sesave($("#logid").val());
				window.open("login.jsp");
			} else {
				alert("登录失败！");
			}

		});

	}
	/* function sesave(data) {
		session.setAttribute("Welcome", data);
	}
	function setest() {
		if (session.getAttribute("Welcome") != null) {
			$("#logsta").val("个人信息");
		} else {
			$("#logsta").val("注册");
		} 
	}*/
	/* $("#logid").click(function() {
		var msg = $(this).next("span").html();
		$(this).attr("title", msg);
	}).blur(function() {
		$(this).removeAttr("title");
	}); */
</script>

</head>

<body>
	<a class="a1" id="logsta" href="register.jsp">注册</a>
	<form name="frm">
		账号： <input id="c_logid" type="text"
			onfocus="if (value =='请输入账号！'){value ='';this.style.color='#000000';}"
			onblur="if (value ==''){value='请输入账号！';this.style.color='#999999';}"
			value="请输入账号！" style="color: #999999">
		<!-- <input id="logid" type="text"><span style="display:none;">请输入账号！</span> -->
		密码： <input id="c_pwd" type="text"
			onfocus="if (value =='请输入密码！'){value ='';this.style.color='#000000';}"
			onblur="if (value ==''){value='请输入密码！';this.style.color='#999999';}"
			value="请输入密码！" style="color: #999999">
	</form>
	<input type="button" value="登录" onclick="login();">
	<input type="button" value="游客进入" onclick="window.open('login.jsp');">
</body>
</html>
