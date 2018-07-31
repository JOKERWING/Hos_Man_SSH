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

<title>Details</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<script src="JQ/jquery-1.9.1.min.js"></script>
<script src="JQ/jquery.query-2.1.7.js"></script>
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
<script>
/* session列表信息显示 */
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
						var name = "";
						var name1="";
						var end="";
						name += "<li class='active'><a href='HosMan/index'>皇家国际酒店</a></li> |";
						name += "<li><a href='HosMan/rooms'>套房</a></li> |";
						name += "<li><a href='HosMan/pay'>支付</a></li> |";
						name += "<li><a href='HosMan/book'>预订</a></li> |";
						name1 += "<li class='active'><a href='HosMan/index'>皇家国际酒店</a></li> ";
						name1 += "<li><a href='HosMan/rooms'>套房</a></li> ";
						name1 += "<li><a href='HosMan/pay'>支付</a></li> ";
						name1 += "<li><a href='HosMan/book'>预订</a></li> ";
						end+="<li><a href='HosMan/index'>首页</a></li><li><a href='HosMan/rooms'>套房</a></li><li><a href='HosMan/book'>预订</a></li><li><a href='HosMan/hotelimformation'>联系方式</a></li>";
						if (data == "null") {
							name +="<li ><a href='HosMan/login'>登录</a></li>";
							name1+="<li ><a href='HosMan/login'>登录</a></li>";
							end+="<li><a href='HosMan/login'>登录</a></li>"
						} else {
							var lis = $.parseJSON(data);
							$
									.each(
											lis,
											function(i, n) {
												name += "<li ><a href='HosMan/customerzon'>"
														+ n.cLogid
														+ "</a></li>";
												name1+="<li ><a href='HosMan/customerzon'>"
														+ n.cLogid
														+ "</a></li>";
												end+="<li><a style='cursor:pointer' onclick='forgetlo();'>退出登录</a></li>";
											});
						}
						
						name += "<div class='clear'></div>";
						name1+="<div class='clear'></div>";
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

</script>
</head>
<body>
	<!-- start header -->
	<div class="header_bg">
		<div class="wrap">
			<div class="header">
				<div class="logo">
					<a href="HosMan/index"><img src="images/logo.png" alt=""></a>
				</div>
				<div class="h_right">
					<!--start menu -->
					<ul class="menu" id="tt">
						<!-- <li class="active"><a href="index.html">皇家国际酒店</a></li> |
						<li><a href="rooms.html">套房</a></li> |
						<li><a href="pay.html">支付</a></li> |
						<li><a href="activities.html">预订</a></li> |
						<li><a href="contact.html">登录</a></li>
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
							<!-- <li class="active"><a href="index.html">皇家国际酒店</a></li>
							<li><a href="rooms.html">套房</a></li>
							<li><a href="pay.html">支付</a></li>
							<li><a href="activities.html">预订</a></li>
							<li><a href="contact.html">登录</a></li> -->
						</ul>
						<a href="#" id="pull">菜单</a>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!--start main -->
	<div class="main_bg">
		<div class="wrap">
			<div class="main">
				<div class="details">
					<h2>Lorem ipsum dolor sit amet consectetur adipisicing</h2>
					<div class="det_pic">
						<img src="images/det_pic.jpg" alt="" />
					</div>
					<div class="det_text">
						<p class="para">There are many variations of passages of Lorem
							Ipsum available, but the majority have suffered alteration in
							some form, by injected humour, or randomised words which don't
							look even slightly believable. If you are going to use a passage
							of Lorem Ipsum, you need to be sure there isn't anything
							embarrassing hidden in the middle of text. All the Lorem Ipsum
							generators on the Internet tend to repeat predefined chunks as
							necessary, making this the first true generator on the Internet.
							It uses a dictionary of over 200 Latin words, combined with a
							handful of model sentence structures, to generate Lorem Ipsum
							which looks reasonable.</p>
						<p class="para">Contrary to popular belief, Lorem Ipsum is not
							simply random text. It has roots in a piece of classical Latin
							literature from 45 BC, making it over 2000 years old. Richard
							McClintock, a Latin professor at Hampden-Sydney College in
							Virginia, looked up one of the more obscure Latin words,
							consectetur, from a Lorem Ipsum passage, and going through the
							cites of the word in classical literature, discovered the
							undoubtable source. Lorem Ipsum comes from sections 1.10.32 and
							1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good
							and Evil) by Cicero, written in 45 BC. This book is a treatise on
							the theory of ethics</p>
						<div class="read_more">
							<a href="HosMan/detail">read more</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--start footer -->
	<div class="footer_bg">
		<div class="wrap">
			<div class="footer">
				<div class="copy">
					<p class="link">
						<span>Copyright &copy; 2016.Company name All rights
							reserved.<a href="HosMan/index">皇家国际酒店</a>
					</p>
				</div>
				<div class="f_nav">
					<ul id="end">
						<!-- <li><a href="index.html">首页</a></li>
						<li><a href="rooms.html">套房</a></li>
						<li><a href="activities.html">预订</a></li>
						<li><a href="contact.html">联系方式</a></li> -->
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