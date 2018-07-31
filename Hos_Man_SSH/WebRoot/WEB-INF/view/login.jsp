<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>Login</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1,user-scalable=no">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- <script src="JQ/jquery-1.9.1.min.js"></script> -->
<script src="js/jquery.js"></script>
<style>
/* body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
} */
canvas {
	background-color: rgb(0, 142, 173);
	margin-top: -10.5%;
	margin-left: 21%;
	width: 20%;
	height: 1700%;
	z-index: -1;
	padding-left: 3%;
}

</style>
<style type="text/css">
        .over {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #f5f5f5;
            opacity:0.5;
            z-index: 1000;
        }

        .layout {
            display: none;
            position: absolute;
            top: 40%;
            left: 40%;
            width: 20%;
            height: 20%;
            z-index: 1001;
            text-align:center;
        }
    </style>
<script src="js/verificationNumbers.js"></script>
<script src="js/Particleground.js"></script>

<link type="text/css" rel="stylesheet" href="css/JFGrid.css" />
<link type="text/css" rel="stylesheet" href="css/login.css" />
<link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
<script type="text/javascript" src="js/JFCore.js"></script>
<script type="text/javascript" src="js/JFForms.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<!-- 
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=aoa63udeoO2URUTOINiyo0daXBtKrrgv"></script> -->

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
	/* session列表信息显示 */
	$(function() {
		ses();
		$("#c_logid").val(getCookie("logid"));
		$("#c_logid").focus();
	});
	function ses() {
		$
				.post(
						"HosMan/cussession",
						{},
						function(data) {
							var name = "";
							var name1 = "";
							var end = "";
							name += "<li ><a href='HosMan/index'>皇家建桥酒店</a></li> |";
							name += "<li><a href='HosMan/rooms'>套房</a></li> |";
							name += "<li><a href='HosMan/pay'>支付</a></li> |";
							name += "<li><a href='HosMan/book'>预订</a></li> |";
							name1 += "<li ><a href='HosMan/index'>皇家国际酒店</a></li> ";
							name1 += "<li><a href='HosMan/rooms'>套房</a></li> ";
							name1 += "<li><a href='HosMan/pay'>支付</a></li> ";
							name1 += "<li><a href='HosMan/book'>预订</a></li> ";
							end += "<li><a href='HosMan/index'>首页</a></li><li><a href='HosMan/rooms'>套房</a></li><li><a href='HosMan/book'>预订</a></li><li><a href='HosMan/hotelimformation'>联系方式</a></li>";
							if (data == "null") {
								name += "<li class='active'><a href='HosMan/login'>登录</a></li>";
								name1 += "<li class='active'><a href='HosMan/login'>登录</a></li>";
								end += "<li><a href='HosMan/login'>登录</a></li>"
							} else {
								var lis = $.parseJSON(data);
								$
										.each(
												lis,
												function(i, n) {
													name += "<li class='active'><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>";
													name1 += "<li class='active'><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>";
													end += "<li><a style='cursor:pointer' onclick='forgetlo();'>退出登录</a></li>";
												});
							}

							name += "<div class='clear'></div>";
							name1 += "<div class='clear'></div>";
							$("#tt").html(name);
							$("#tt1").html(name1);
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
	function login() {
		//setest();
		var logidv = $("#c_logid").val();
		var pwdv = $("#c_pwd").val();
		if (logidv == "" || logidv == "请输入账号！") {
			alert("请输入账号！");
			//document.getElementById("logid").focus(); 
			$("#c_logid").focus();
			return;
		}

		if (pwdv == "" || pwdv == "请输入密码！") {
			alert("请输入密码！");
			$("#c_pwd").focus();
			return;
		}
		var res = validate();
		if (res == "null") {
			alert("请输入验证码！");
			$("#J_codetext").focus();
			return;
		}
		if (res == "false") {
			alert("验证码错误！");
			return;
		}
		setCookie("logid", logidv);
		$.post("HosMan/cuslogin", {
			/* logid : $("#c_logid").val(),
			pwd : $("#c_pwd").val() */
			logid : logidv,
			pwd : pwdv
		}, function(data) {
			if (data == "true") {
				alert("登录成功！");
				//sesave($("#logid").val());
				//window.location.href="login.jsp";
				/* window.location = "index.html"; */
				/* window.history.go(-1); */
				if (document.referrer.indexOf("HosMan/register") > -1) {
					window.location = "HosMan/index";
				} else if (document.referrer.indexOf("HosMan/login") > -1) {
					window.location = "HosMan/index";
				} else {
					window.history.go(-1);
				}
			} else if (data == "pwdfalse") {
				alert("密码错误！");
				$("#c_pwd").focus();
			} else if (data == "false") {
				alert("无此账号！");
				$("#c_logid").focus();
			}

		});

	}

	function diag() {
		
		//window.open("HosMan/forgetpwd", "newwindow", "height=100, width=400, toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");  
		
		var str = prompt("请输入你忘记密码的账号！\n我们将发送一份邮件至你账号对应的邮箱！\n请注意查收！", "");
		if (str != null && str != "") {
			document.getElementById("over").style.display = "block";
		    document.getElementById("layout").style.display = "block";
			$.post("HosMan/getpwd", {
				logid : str
			}, function(data) {
				if (data == "true") {
					show1();
					alert("邮件发送成功！请查收！");
				} else {
					show1();
					alert("邮件发送失败！请再试一次！");
				}
			});
		}else{
			alert("您未输入！或已取消！");
		}
	}
	function show1(){
		document.getElementById("over").style.display = "none";
	    document.getElementById("layout").style.display = "none";
	}
		 
	function KeyDown()
	{
		if (event.keyCode == 13)
		{
			event.returnValue=false;
			event.cancel = true;
		    login();
		 }
	}
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
					<ul class="menu" id="tt">
						<!-- <li><a href="index.html">皇家国际酒店</a></li> |
						<li><a href="rooms.html">套房</a></li> |
						<li><a href="pay.html">支付</a></li> |
						<li><a href="activities.html">预订</a></li> |
						<li class="active"><a href="contact.html">登录</a></li>
						<div class="clear"></div> -->
					</ul>
					<!-- start profile_details -->
					<form class="style-1 drp_dwn">
						<div class="row">
							<div class="grid_3 columns">
								<select class="custom-select" id="select-1">
									<option selected="selected">中文</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="clear"></div>
				<div class="top-nav">
					<nav class="clearfix">
					<ul id="tt1">
						<!-- <li><a href="index.html">皇家国际酒店</a></li>
							<li><a href="rooms.html">套房</a></li>
							<li><a href="pay.html">支付</a></li>
							<li><a href="activities.html">预订</a></li>
							<li class="active"><a href="contact.html">登录</a></li>
							<div class="clear"></div> -->
					</ul>
					<a href="#" id="pull">菜单</a> </nav>
				</div>
			</div>
		</div>
	</div>
	<!-- start main -->
	<div class="main_bg">
		<div class="wrap ">
			<div class="main1 ">
				<div class="contact ">
					<div class="contact_left ">
						<div class="contact_info "
							style="text-align: center;color:white; ">
							<h3 style="color: white;">皇家建桥酒店</h3>
							<small>欢迎您的体验</small>
							<!-- <div class="map">
								<img src="Picture/bgdb.jpg"> <br>
							</div> -->
						</div>
					</div>
					<div class="contact_right ">
						<div class="contact-form ">
							<div class="top_div "></div>
							<div class=" "
								style="background: rgb(255, 255, 255); margin: -10% auto auto; border: 1px solid rgb(231, 231, 231) ; width: 40%; height:25%; text-align: center;">
								<div class="" style="width: 18%;  position: absolute;">
									<div class="tou "></div>
									<div class="initial_left_hand " id="left_hand"></div>
									<div class="initial_right_hand " id="right_hand"></div>
								</div>
								<P style="padding: 30px 0px 10px; position: relative;">
									<SPAN class="u_logo"></SPAN> <INPUT class="ipt" type="text2"
										placeholder="账号" required="" id="c_logid"
										onfocus="if (value =='请输入账号！'){value ='';this.style.color='#000000';}"
										onblur="if (value ==''){value='请输入账号！';this.style.color='#999999';}"
										value="请输入账号！" style="color: #999999 ;" onkeydown="KeyDown();"/>
								</P>
								<P style="position: relative;" class="">
									<SPAN class="p_logo"></SPAN> <INPUT class="ipt" id="c_pwd"
										type="password" placeholder="密码" required="" onkeydown="KeyDown();"
										 style="color: #999999; font-size:10px;   width: 80% !important;height: 18%;margin-left: 10%; padding-left: 11%;    margin-top: 0%;">
								<!-- onfocus="if (value =='请输入密码！'){value ='';this.style.color='#000000';}"
										onblur="if (value ==''){value='请输入密码！';this.style.color='#999999';}"
										value="请输入密码！" -->
								</P>
								<P class="" style="position: relative; height: 0.01%;">
								<div class="checkcode " style="height: 1%;">

									<SPAN class="p_logo1 " style=""></SPAN><input type="text2" onkeydown="KeyDown();"
										id="J_codetext" placeholder="验证码" maxlength="4" class="ipt"
										style="width: 62%;float: left;margin-left: 10%; margin-top: 1%;" />
									<canvas class="J_codeimg " id="myCanvas"
										onclick="createCode();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
								</div>
								<a
									style="float:right;margin-top:-4px;margin-right:9.8%; text-decoration:none; cursor:pointer;  padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(0, 142, 173); color: rgb(0, 142, 173); "
									class="ver_btn" onclick="check();">验证</a>
								</P>
								<div class=""
									style="height: 50px; line-height: 50px; margin-top: 45px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
									<P class=" " style="margin: -4px 35px 20px 45px;">
										<span class=" " style="float: left;"><a
											style="color: rgb(204, 204, 204); cursor: pointer; "
											onclick="diag();">忘记密码?</a></span> <span class=" "
											style="float: right;"><a
											style="color: rgb(204, 204, 204); margin-right: 10px;"
											href="HosMan/register">注册</a> <a class=" "
											style="text-decoration:none; cursor:pointer; background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); color: rgb(255, 255, 255); "
											onclick="login();">登录</a> </span>
									</P>
								</div>

							</div>
						</div>
						<div class="" style="height: 20%;"></div>
						<!-- <div class="container ">
								<section id="content">
								<form class="x">
									<h1>上海皇家酒店</h1>
									<div>
										<input type="text1" placeholder="账号" required="" id="c_logid"
											onfocus="if (value =='请输入账号！'){value ='';this.style.color='#000000';}"
											onblur="if (value ==''){value='请输入账号！';this.style.color='#999999';}"
											value="请输入账号！" style="color: #999999" />
									</div>
									<div>
										<input type="password1" placeholder="密码" required=""
											id="c_pwd"
											onfocus="if (value =='请输入密码！'){value ='';this.style.color='#000000';}"
											onblur="if (value ==''){value='请输入密码！';this.style.color='#999999';}"
											value="请输入密码！" style="color: #999999" />
									</div>

									<div>

										<input type="button" value="登录" onclick="login();"
											style="font-size: 17px" /> <a href="#">忘记密码?</a> <a
											href="HosMan/register">注册</a>
										<span>记住密码 </span>
										<input
												type="checkbox" id="repwd"  
												 />	
									</div>
									<div class="clear"></div>
								</form>
								form <div class="button">
			<a href="#">Download source file</a>
		</div> button </section>
								content
							</div> -->


					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>






	<!--start main -->
	<div class="footer_bg">
		<div class="wrap">
			<div class="footer">
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
	<!-- <div style="display:none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div> -->

	<!-- <div id="allmap"></div> -->
	
	<div id="stuimf">
    </div>
    <div id="over" class="over"></div>

    <div id="layout" class="layout"><img src="images/2013112931.gif" alt="" /></div>
</body>
</html>
<script>
	createCode();
	function check() {
		var res = validate();
		if (res == "true") {
			alert("验证成功！");
			return true;
		} else if (res == "null") {
			alert("请输入验证码！");
			$("#J_codetext").focus();
			return null;
		} else {
			alert("验证码错误！");
			return false;
		}

	}
</script>

<!-- <script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(121.43853, 31.186964), 18);
	var local = new BMap.LocalSearch(map, {
		renderOptions : {
			map : map
		}
	});
	local.search("上海徐汇区中山西路2368号华鼎大厦");
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
</script> -->