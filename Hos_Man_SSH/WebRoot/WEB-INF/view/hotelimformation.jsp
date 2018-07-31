<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>HOTELIMFORMATION</title>
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1,user-scalable=no">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- <script src="js/jquery.min.js"></script> --> 

<script src="JQ/jquery-1.9.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/JFGrid.css" />
<link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
<script type="text/javascript" src="js/JFCore.js"></script>
<script type="text/javascript" src="js/JFForms.js"></script>
<script src="JQ/jquery.query-2.1.7.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=aoa63udeoO2URUTOINiyo0daXBtKrrgv"></script>

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
						<a href="#" id="pull">菜单</a>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- start main -->
	<div class="main_bg">
		<div class="wrap">
			<div class="main">
				<div class="contact ">
					<div class="contact_left ">
						<!-- <div class="contact_info">
							<h3>酒店地点</h3>
							<div class="map">
								<iframe width="100%" height="175" frameborder="0" scrolling="no"
									marginheight="0" marginwidth="0"> </iframe>

								<br> <small><a
									href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265"
									style="color: #242424;text-shadow: 0 1px 0 #ffffff;text-align: left;font-size: 0.7125em;padding: 5px;font-weight: 600;">看全图</a></small>
							</div>
						</div> -->
						<div class="company_address">
							<h3>酒店信息 :</h3>
							<p>拥有几千平方米面积</p>
							<p>中国</p>
							<p>上海 浦东新区</p>
							<p>电话:(00) 666 666 666</p>
							<p>传真: (000) 000 00 00 0</p>
							<p>
								Email: <a >XXXX@king.com</a>
							</p>
							<p>
								支持: <a href="http://www.facebook.com/">Facebook</a>, <a href="http://www.twitter.com/">Twitter</a>
							</p>
						</div>
					</div>
					<div class="contact_right ">
						<div class="contact-form ">
						<h3>皇家建桥酒店地点</h3>
						<div class="contact-fdiv " id="allmap" style="height:460px;width: 800px;"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
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
							reserved.<a href="HosMan/index">皇家国际酒店</a>
					</p>
				</div>
				<div class="f_nav">
					<ul id="end">
						<!-- <li><a href="HosMan/index">首页</a></li>
						<li><a href="HosMan/rooms">套房</a></li>
						<li><a href="HosMan/activities">预订</a></li>
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

	




</body>
</html>
<script>
/* session列表信息显示 */
Init();
function Init() {
	ses();
	showmap();
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
												end+="<li ><a style='cursor:pointer' onclick='forgetlo();'>退出登录</a></li>";
											});
						}
						
						name += "<div class='clear'></div>";
						name1+="<div class='clear'></div>";
						$("#tt").html(name);
						$("#tt1").html(name1);
						$("#end").html(end);
						//showmap();
					});
}
function forgetlo(){
var r = confirm("确认退出吗");
if (r == true) {
	$.post("HosMan/forgetlo",{},function(data){
	if(data=="true"){
	alert("退出成功！");
	window.location = "HosMan/contact";
	}
	else if(data=="false"){
	alert("退出失败！");
	}
	});
}
else{}
}
function showmap(){
	$("#allmap").load("HosMan/map1");
}
</script>

<!-- <script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(121.898512,30.899755), 18);
	var local = new BMap.LocalSearch(map, {
		renderOptions : {
			map : map
		}
	});
	local.search("上海建桥学院临港新校区");
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
</script>	 -->
