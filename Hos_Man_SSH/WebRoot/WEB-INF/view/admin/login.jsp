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

<title>ADMIN LOGIN</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js"></script>
<script src="js/Particleground.js"></script>
<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#5cbdaa',
			lineColor : '#5cbdaa'
		});
		//验证码
		createCode();
		//测试提交，对接程序删除即可

	});
	function setCookie(name,value)
	{
	  var Days = 30; //此 cookie 将被保存 30 天
	  var exp  = new Date();    //new Date("December 31, 9998");
	  exp.setTime(exp.getTime() + Days*24*60*60*1000);
	  document.cookie = name + "="+ escape(value) +";expires="+ exp.toGMTString();
	}
	function getCookie(name)
	{
	  var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	  if(arr != null) return unescape(arr[2]); return null;
	}
	function delCookie(name)
	{
	  var exp = new Date();
	  exp.setTime(exp.getTime() - 1);
	  var cval=getCookie(name);
	  if(cval!=null) document.cookie=name +"="+cval+";expires="+exp.toGMTString();
	}
	function KeyDown()
	{
	    if (event.keyCode == 13)
	    {
	        event.returnValue=false;
	        event.cancel = true;
	        slogin();
	    }
	}
</script>
</head>
<body>
	<dl class="admin_login">
		<dt>
			<strong>上海建桥皇家酒店管理系统</strong> <em>Management System</em>
		</dt>
		<dd class="user_icon ">
			<input type="text" id="slogid" placeholder="账号" class="login_txtbx"
				style="height: 100%;width: 100%;" onkeydown="KeyDown();"/>
		</dd>
		<dd class="pwd_icon">
			<input type="password" id="spwd" placeholder="密码" class="login_txtbx"
				style="height: 100%;width: 100%;" onkeydown="KeyDown();"/>
		</dd>
		<dd class="val_icon">
			<div class="checkcode ">
				<input type="text" id="J_codetext" placeholder="验证码" maxlength="4" 
					class="login_txtbx" onkeydown="KeyDown();">
				<canvas class="J_codeimg"  id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
			</div>
			<input type="button" value="验证码核验" class="ver_btn"
				onClick="check();">
		</dd>
		<dd>
			<input type="button" value="立即登录" class="submit_btn"
				onclick="slogin();" />
		</dd>
		<dd>
			<p>© 2016-20XX 皇家建桥 版权所有</p>
			<p>沪XX-XXXXXXX-X</p>
		</dd>
	</dl>
	<script>
		function slogin() {
			var slogidv = $("#slogid").val();
			var spwdv = $("#spwd").val();
			if (slogidv == null || slogidv == "") {
				alert("用户名不能为空！");
				$("#slogid").focus();
				return;
			}
			if (spwdv == null || spwdv == "") {
				alert("密码不能为空！");
				$("#spwd").focus();
				return;
			}
			var res=validate();
			if(res=="null"){
				alert("验证码为空，请输入！");
				$("#J_codetext").focus();
				return ;
			}else if(res=="false"){
				alert("验证码错误！");
				return ;
			}
			setCookie("slogid", slogidv);
			
					$.post("HosMan/admin/logchk", {
						slogid : slogidv,
						spwd : spwdv
					},
							function(data) {
								if (data == "nostaff") {
									alert("请输入正确用户名！");
									$("#slogid").focus();
								} else if (data == "pwdfalse") {
									alert("密码错误！请重新输入！");
									$("#spwd").focus();
								} else {
									$.post("HosMan/checkrolepriall", {
										slogid : slogidv,
										flag : "login"
									},function(data1) {
										if(data1=="true"){
									alert("登录成功！");
									window.location = "HosMan/admin/index";
										}else{
											alert("抱歉！您没有登陆权限！");
										}
									});
								}
			});
			
			
		}

		$().ready(function() {
			admingetses();
			$("#slogid").val(getCookie("slogid"));
			$("#slogid").focus();
		});
		function admingetses(){
			$.post("HosMan/admin/getses", {}, function(data) {
				if (data != "null") {
					var lst = $.parseJSON(data);
					$.each(lst, function(i, n) {
						$("#slogid").val(n.slogid);
						$("#spwd").val(n.spwd);
					});
				}
			});
		}
		function check(){
			var res=validate();
			if(res=="true"){
				alert("验证成功！");
				return true;
			}else if(res=="null"){
				alert("验证码为空，请输入！");
				$("#J_codetext").focus();
				return null;
			}else{
				alert("验证码错误！");
				return false;
			}
		}
	</script>
</body>
</html>

