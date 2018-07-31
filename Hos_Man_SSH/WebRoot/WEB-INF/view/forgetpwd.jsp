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

<title>My JSP 'forgetpwd.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script>
	function getpwd() {
		var logid = $("#logid").val();
		if (logid == null || logid == "") {
			alert("账号输入为空！");
			$("#logid").focus();
		} else {

			if (confirm("确认账号正确吗？")) {
				$.post("HosMan/getpwd", {
					logid : $("#logid").val()
				}, function(data) {
					if (data == "true") {
						alert("邮件发送成功！请查收！");
						window.close();
					} else {
						alert("邮件发送失败！请再试一次！");
					}
				});
			}
		}
	}
</script>
</head>

<body>
	<a>请输入您忘记密码的账号：</a>
	<input type="text" placeholder="请输入账号！" id="logid">
	<INPUT TYPE='BUTTON' VALUE='确认' onClick="getpwd();">
	<INPUT TYPE='BUTTON' VALUE='取消' onClick='window.close();'>
</body>
</html>
