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
<title>Register</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1,user-scalable=no">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- <script src="js/jquery.min.js"></script> -->
<script src="JQ/jquery-1.9.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/JFGrid.css" />
<link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
<script type="text/javascript" src="js/JFCore.js"></script>
<script type="text/javascript" src="js/JFForms.js"></script>



<!-- Set here the key for your domain in order to hide the watermark on the web server -->
<script type="text/javascript">
	(function() {
		JC.init({
			domainKey : ''
		});
	})();
</script>
<!--nav-->
<script>
	$(function() {
		var pull = $('#pull');
		menu = $('nav ul');
		menuHeight = menu.height();

		$(pull).on('click', function(e) {
			e.preventDefault();
			menu.slideToggle();
		});

		$(window).resize(function() {
			var w = $(window).width();
			if (w > 320 && menu.is(':hidden')) {
				menu.removeAttr('style');
			}
		});
	});
</script>



<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="JQ/jquery-1.9.1.min.js"></script>
<script>
	function register() {
		var logidv = $("#c_logid").val();
		var pwdv = $("#c_pwd").val();
		var pwd1v = $("#c_pwd1").val();
		var namev = $("#c_name").val();
		var sexv = $("input[name='c_sex']:checked").val();
		var telev = $("#c_tele").val();
		var idcardv = $("#c_idcard").val();
		var emailv = $("#c_email").val();
		if (lidonb() == false) {
			$("#c_logid").focus();
			return;
		} else if (pwdonb() == false) {
			$("#c_pwd").focus();
			return;
		} else if (pwd1onb() == false) {
			$("#c_pwd1").focus();
			return;
		} else if (nameonb() == false) {
			$("#c_name").focus();
			return;
		} else if (teleonb() == false) {
			$("#c_tele").focus();
			return;
		} else if (idcdonb() == false) {
			$("#c_idcard").focus();
			return;
		} else if (emailonb() == false) {
			$("#c_email").focus();
			return;
		} else {
			var r = confirm("确认信息准确吗？");
			if (r == true) {
				$.post("HosMan/regcus", {
					logid : logidv,
					pwd : pwdv,
					name : namev,
					sex : sexv,
					tele : telev,
					idcard : idcardv,
					email : emailv
				}, function(data) {
					if (data == "true") {
						alert("注册成功!");
						setCookie("logid", logidv);
						window.location = "HosMan/login";
					} else if (data == "havelogid") {
						alert("账号已被注册！");
						$("#c_logid").focus();
					} else if (data == "false") {
						alert("注册失败!");
					}
				});
			}else{}
		}
	}
	function setCookie(name,value)
	{
	  var Days = 30; //此 cookie 将被保存 30 天
	  var exp  = new Date();    //new Date("December 31, 9998");
	  exp.setTime(exp.getTime() + Days*24*60*60*1000);
	  document.cookie = name + "="+ escape(value) +";expires="+ exp.toGMTString();
	}
	function lidonb() {
		var reglogid = /^[a-zA-Z]\w{5,17}$/;
		var logida = $("#c_logid").val();
		if (logida == "") {
			$("#c_logidprompt").html("*请输入账号");
			return false;
		} else {
			$("#c_logidprompt").html("");
		}
		if (!reglogid.test(logida)) {
			$("#c_logidprompt").html("*字母开头，6-18位，只包含字符、数字和下划线");
			return false;
		}
	}
	function pwdonb() {
		var regpwd = /^[\x21-\x7E]{6,20}$/;
		var pwda = $("#c_pwd").val();
		if (pwda == "") {
			$("#c_pwdprompt").html("*请输入密码");
			return false;
		} else {
			$("#c_pwdprompt").html("");
		}
		if (!regpwd.test(pwda)) {
			$("#c_pwdprompt").html("*字母开头，6-18位，只包含字符、数字和下划线");
			return false;
		}
	}
	function pwd1onb() {
		var regpwd1 = /^[\x21-\x7E]{6,20}$/;
		var pwd1a = $("#c_pwd1").val();
		if (pwd1a == "") {
			$("#c_pwd1prompt").html("*请再次输入密码");
			return false;
		} else {
			$("#c_pwd1prompt").html("");
		}

		if (!regpwd1.test(pwd1a)) {
			$("#c_pwd1prompt").html("*字母开头，6-18位，只包含字符、数字和下划线");
			return false;
		}
		if ($("#c_pwd").val() != pwd1a) {
			$("#c_pwd1prompt").html("*前后密码不一致");
			return false;
		}
	}
	function nameonb() {
		var regname = /^[\u4E00-\u9FA5]{2,}(?:·[\u4E00-\u9FA5]{1,})*$/;
		var namea = $("#c_name").val();
		if (namea == "") {
			$("#c_nameprompt").html("*请输入姓名");
			return false;
		} else {
			$("#c_nameprompt").html("");
		}
		if (!regname.test(namea)) {
			$("#c_nameprompt").html("*请输入正确姓名");
			return false;
		}
	}
	function teleonb() {
		var regtele = /^(\(\d{3,4}\)|\d{3,4})?\d{7,8}$/;
		var telea = $("#c_tele").val();
		if (telea == "") {
			$("#c_teleprompt").html("*请输入电话号码");
			return false;
		} else {
			$("#c_teleprompt").html("");
		}
		if (!regtele.test(telea)) {
			$("#c_teleprompt").html("*请输入正确号码");
			return false;
		}
	}
	function idcdonb() {
		var regidcard = /^\d{15}|\d{}18$/;
		var idcarda = $("#c_idcard").val();
		if (idcarda == "") {
			$("#c_idcardprompt").html("*请输入身份证号");
			return false;
		} else {
			$("#c_idcardprompt").html("");
		}
		if (!regidcard.test(idcarda)) {
			$("#c_idcardprompt").html("*请输入正确身份账号");
			return false;
		}
	}
	function emailonb() {
		var regemail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		var email = $("#c_email").val();
		if (email == "") {
			$("#c_emailprompt").html("*请输入电子邮箱");
			return false;
		} else {
			$("#c_emailprompt").html("");
		}
		if (!regemail.test(email)) {
			$("#c_emailprompt").html("*请输入正确电子邮箱");
			return false;
		}
	}
	Init();
	function Init() {
		ses();
	}
	function ses() {
		$
				.post(
						"HosMan/cussession",
						{},
						function(data) {
							var end = "";
							end += "<li><a href='HosMan/index'>首页</a></li><li><a href='HosMan/rooms'>套房</a></li><li><a href='HosMan/book'>预订</a></li><li><a href='HosMan/hotelimformation'>联系方式</a></li>";
							if (data == "null") {
								end += "<li><a href='HosMan/login'>登录</a></li>"
							} else {
								var lis = $.parseJSON(data);
								$
										.each(
												lis,
												function(i, n) {
													end += "<li><a style='cursor:pointer' onclick='forgetlo();'>退出登录</a></li>";
												});
							}
							$("#end").html(end);
						});
	}
	function forgetlo() {
		var r = confirm("确认退出吗");
		if (r == true) {
			$.post("HosMan/forgetlo", {}, function(data) {
				if (data == "true") {
					alert("退出成功！");
					window.location = "HosMan/login";
				} else if (data == "false") {
					alert("退出失败！");
				}
			});
		} else {
		}
	}
	
</script>
</head>

<body>
	<!-- start header -->
	<div class="header_bg">
		<div class="wrap">
			<div class="header">
				<div class="logo">
					<a href="index.html"><img src="images/logo.png" alt=""></a>
				</div>
				<div class="h_right">
					<!-- start menu -->
					<ul id="tt" class="menu">
						<li><a href="HosMan/index">皇家国际酒店</a></li> |
						<li><a href="HosMan/rooms">套房</a></li> |
						<li><a href="HosMan/pay">支付</a></li> |
						<li><a href="HosMan/book">预订</a></li> |
						<li class="active"><a href="HosMan/register">注册</a></li>
						<div class="clear"></div>
					</ul>
					<!-- start profile_details -->
					<form class="style-1 drp_dwn">
						<div class="row">
							<div class="grid_3 columns">
								<select class="custom-select" id="select-1">
									<option selected="selected">中文</option>
									<!-- <option>EN/USA</option> -->
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
				<div class="top-nav">
					<nav class="clearfix">
					<ul>
						<li><a href="HosMan/index">皇家国际酒店</a></li>
						<li><a href="HosMan/rooms">套房</a></li>
						<li><a href="HosMan/pay">支付</a></li>
						<li><a href="HosMan/activities">预订</a></li>
						<li class="active"><a href="HosMan/register">注册</a></li>
					</ul>
					<a href="#" id="pull">语言</a> </nav>
				</div>
			</div>
		</div>
	</div>
	<!-- start main -->
	<div class="main_bg ">
		<div class="wrap ">
			<div class="main ">
				<div class="clear"></div>
				<div class="  ">
					
					<table class="  "   cellspacing="0" style="width: 100%; height: 60%;">
						<tr class=" " align="center" style=" height: 50px;line-height: 1;">
							<th class=" " style="width: 33%;"></th>
							<th class=" " style="width: 33%;"><a1
								style="font-size: 180%;">账号注册</a1></th>
							<th class=" " style="width: 33%;"></th>
						</tr>
						<tr class=" " style="height: 50px;">
							<td class=" " style="width: 33%; "
								align="right"><div>
								<a1>账号:</a1></div></td>
							<td class=" "><input id="c_logid" type="text"
								onblur="lidonb();"></td>
							<td class=" " align="left"><div id="c_logidprompt"
									class="red" style="font-size: 20px;"></div></td>
						</tr>
						<tr class=" " style="height: 50px;">
							<td class=" " align="right"><a1>密码:</a1></td>
							<td class=" "><input id="c_pwd" type="password"
								onblur="pwdonb();"></td>
							<td class=" " align="left"><div id="c_pwdprompt" class="red"
									style="font-size: 20px;"></div></td>
						</tr>
						<tr class=" "style="height: 50px;">
							<td class=" " align="right"><a1>确认密码:</a1></td>
							<td class=" "><input id="c_pwd1" type="password"
								onblur="pwd1onb();"></td>
							<td class=" " align="left"><div id="c_pwd1prompt"
									class="red" style="font-size: 20px;"></div></td>
						</tr>
						<tr class=" "style="height: 50px;">
							<td class=" " align="right"><a1>姓名:</a1></td>
							<td class=" "><input id="c_name" type="text"
								onblur="nameonb();"></td>
							<td class=" " align="left"><div id="c_nameprompt"
									class="red" style="font-size: 20px;"></div></td>
						</tr>
						<tr class=" "style="height: 50px;">
							<td class=" " align="right"><div><a1>性别:</a1></div></td>
							<td class=" " height="50px;""><div 
									style="padding-left: 20%;width: 30%; float: left;">
									<input id="c_sex" name="c_sex" type="radio" value="男"
										checked="" style="">
										<a1 >男</a1>
								</div>
								
								<div  style="padding-left: 12%; width: 30%; float: right;">
									<input id="c_sex" name="c_sex" type="radio" value="女" style="">
									<a1 >女</a1>
								</div>
								<div class="clear"></div>
								</td>
							<td class=" " align="left"><div id="c_sexprompt" class="red"
									style="font-size: 20px;"></div></td>
							<div class="clear"></div>
						</tr>
						<tr class=" "style="height: 50px;">
							<td class=" " align="right"><a1>手机:</a1></td>
							<td class=" "><input id="c_tele" type="text"
								onblur="teleonb();"></td>
							<td class=" " align="left"><div id="c_teleprompt"
									class="red" style="font-size: 20px;"></div></td>
						</tr>
						<tr class=" "style="height: 50px;">
							<td class=" " align="right"><a1>身份证:</a1></td>
							<td class=" "><input id="c_idcard" type="text"
								onblur="idcdonb();"></td>
							<td class=" " align="left"><div id="c_idcardprompt"
									class="red" style="font-size: 20px;"></div></td>
						</tr>
						<tr class=" "style="height: 50px;">
							<td class=" " align="right"><a1>电子邮箱:</a1></td>
							<td class=" "><input id="c_email" type="text"
								onblur="emailonb();"></td>
							<td class=" " align="left"><div id="c_emailprompt"
									class="red" style="font-size: 20px;"></div></td>
						</tr>
						<tr class=" "style="height: 50px;">
							<td class=" " align="right"></td>
							<td class="wbtn" style="text-align: center; padding-left: -40%; "><input
								id="bureg" type="button" value="立即注册" onclick="register();"
								style="margin-top:4px;margin-right: 38%; padding-top: 2px;"></td>
							<td class=" " align="left"></td>
						</tr>
					</table>
				</div>

			</div>
			<div class="clear"></div>
		</div>
	</div>






	<!--start main -->
	<div class="footer_bg ">
		<div class="wrap ">
			<div class="footer ">
				<div class="copy">
					<p class="link">
						<span>Copyright &copy; 2016.Company name All rights
							reserved.<a href="HosMan/index">皇家建桥酒店</a>
					</p>
				</div>
				<div class="f_nav">
					<ul id="end">
						<!-- <li><a href="index.html">首页</a></li>
						<li><a href="rooms.html">套房</a></li>
						<li><a href="activities.html">预订</a></li>
						<li><a href="hotelimformation.jsp">联系方式</a></li>
						<li><a style="cursor:pointer" onclick="forgetlo();">退出登录/切换账号</a></li> -->
					</ul>
				</div>
				<div class="soc_icons">
					<ul>
						<li><a class="icon1" href="http://www.facebook.com/"></a></li>
						<li><a class="icon2" href="http://www.twitter.com/"></a></li>
						<li><a class="icon3" href="http://weibo.com/"></a></li>
						<li><a class="icon4" href="https://www.football.com/en/"></a></li>
						<li><a class="icon5" href="http://www.baidu.com/"></a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>





</body>
</html>
