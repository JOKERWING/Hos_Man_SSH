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

<title>My JSP 'indexfirst.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

</head>

<body>
	<div class=""> 
	</br></br></br></br></br></br></br></br>
		<h1
			style="color:red;font-size:20px;font-weight:bold;text-align:center;">
			<div id="staffimf"></div>
		</h1>
		<p
			style="color:red;font-size:16px;font-weight:bold;text-align:center;">欢迎登录上海皇家建桥酒店后台管理！</p>
	</div>
	<script>
		$().ready(function() {
			admingetses();
		});
		function admingetses() {
			$.post("HosMan/admin/getses", {}, function(data) {
				if (data != "null") {
					var lst = $.parseJSON(data);
					$.each(lst, function(i, n) {
						$("#staffimf").html(n.slogid);
					});
				}
			});
		}
	</script>
</body>
</html>
