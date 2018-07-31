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

<title>Rooms</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- <link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700'
	rel='stylesheet' type='text/css'> -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
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
						<!-- <li><a href="index.html">皇家国际酒店</a></li> |
						<li class="active"><a href="rooms.html">套房</a></li> |
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
									<!-- <option>EN/USA</option> -->
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
							<li class="active"><a href="rooms.html">套房</a></li>
							<li><a href="pay.html">支付</a></li>
							<li><a href="activities.html">预订</a></li>
							<li><a href="contact.html">登录</a></li> -->
					</ul>
					<a href="#" id="pull">菜单</a> </nav>
				</div>
			</div>
		</div>
	</div>
	<!--start main -->
	<div class="main_bg">
		<div class="wrap">
			<div class="main">
				<div class="content">
					<div class="room " id="room">
						<h4><div id="roomname"></div></h4>
						<!-- <p class="para">There are many variations of passages of Lorem
							Ipsum available, but the majority have suffered alteration in
							some form, by injected humour, or randomised words which don't
							look even slightly believable. If you are going to use a passage
							of Lorem Ipsum, you need to be sure there isn't anything
							embarrassing hidden in the middle of text. All the Lorem Ipsum
							generators on the Internet tend to repeat.</p> -->
					</div>
					<div id="hotimf">
					<!-- <div class="grids_of_2 " >
						<div class="grids_of_img ">
							<img src="images/pic4.jpg" alt="" />
						</div>
						<div class="grids_of_para ">
							<p class="para"><hw4>There are many variations</hw4> <br>of passages of
								Lorem Ipsum available, but the majority have suffered alteration
								in some form, by injected humour, or randomised words which
								don't look even slightly believable. If you are going to use a
								passage of Lorem Ipsum, you need to be sure there isn't anything
								embarrassing hidden in the middle of text. All the Lorem Ipsum
								generators on the Internet tend to repeat.</p>
						</div>
						<div class="clear"></div>
					</div> -->
					</div>
					<!-- <div class="grids_of_2" id="tf2">
						<div class="grids_of_img">
							<img src="images/pic5.jpg" alt="" />
						</div>
						<div class="grids_of_para">
							<p class="para">There are many variations of passages of
								Lorem Ipsum available, but the majority have suffered alteration
								in some form, by injected humour, or randomised words which
								don't look even slightly believable. If you are going to use a
								passage of Lorem Ipsum, you need to be sure there isn't anything
								embarrassing hidden in the middle of text. All the Lorem Ipsum
								generators on the Internet tend to repeat.</p>
						</div>
						<div class="clear"></div>
					</div> -->

				</div>
				<div class="sidebar">
					<h5>房型:</h5>
					<!----------start section_room----------->
					<div class="section_room ">
						<select id="type" 
							class="frm-field required ">
							<option value="标准">标准房</option>
							<option value="高级">高级房</option>
							<option value="豪华">豪华房</option>
							<option value="总统">总统房</option>
						</select>
					</div>
					<div class="date_btn">
						<input type="button" onclick="showimf();" value="查询"
							style="width: 82px; ">
					</div>
					<h4>房间配置</h4>
					<ul class="s_nav" id="hotconf">
						<!-- <li><a>laptop-size safe</a></li>
						<li><a >Lorem ipsum dolor sit amet, consectetur
								adipiscing elit.</a></li>
						<li><a>Etiam malesuada leo ornare</a></li>
						<li><a>Sed eu magna sed lorem tincidunt</a></li>
						<li><a>Proin id diam eleifend neque auctor
								scelerisque.</a></li> -->
					</ul>
					<br>
					<br>
					<br>
					<br>
					<div class="logo" style="background-color: black; width: 100%;height: 7%; text-align: center;">
						<img src="images/logo.png" alt=""></a>
					</div>
					<!-- <h4>we accept</h4>
					<ul class="s_nav1">
						<li><a class="icon1" href="#"></a></li>
						<li><a class="icon2" href="#"></a></li>
						<li><a class="icon3" href="#"></a></li>
						<li><a class="icon4" href="#"></a></li>
					</ul> -->
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
							reserved.<a href="HosMan/index">皇家国际酒店</a>
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
<script>
	/* session列表信息显示 */
	Init();
	function Init() {
		ses();
		showimf();
	}
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
							name += "<li class='active'><a href='HosMan/rooms'>套房</a></li> |";
							name += "<li><a href='HosMan/pay'>支付</a></li> |";
							name += "<li><a href='HosMan/book'>预订</a></li> |";
							name1 += "<li ><a href='HosMan/index'>皇家建桥酒店</a></li> ";
							name1 += "<li class='active'><a href='HosMan/rooms'>套房</a></li> ";
							name1 += "<li><a href='HosMan/pay'>支付</a></li> ";
							name1 += "<li><a href='HosMan/book'>预订</a></li> ";
							end += "<li><a href='HosMan/index'>首页</a></li><li><a href='HosMan/rooms'>套房</a></li><li><a href='HosMan/book'>预订</a></li><li><a href='HosMan/hotelimformation'>联系方式</a></li>";
							if (data == "null") {
								name += "<li ><a href='HosMan/login'>登录</a></li>";
								name1 += "<li ><a href='HosMan/login'>登录</a></li>";
								end += "<li><a href='HosMan/login'>登录</a></li>"
							} else {
								var lis = $.parseJSON(data);
								$
										.each(
												lis,
												function(i, n) {
													name += "<li ><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>";
													name1 += "<li ><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>";
													end += "<li ><a style='cursor:pointer' onclick='forgetlo();'>退出登录</a></li>";
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
	function tobook() {
		window.location = "HosMan/book";
	}
	function showimf() {
		var typeq =  $.query.get("type"); 
		if(typeq!=null&&typeq!=""){
			$("#type").val(typeq.substring(0,2));
		}
		var type = $("#type").val();
		$("#roomname").html(type+"  房型");
		$.post("HosMan/hotimfbyname", {
			hiname:type
		}, function(data) {
			if (data == null) {
				window.location = "HosMan/rooms";
			} else {
				var lst=$.parseJSON(data);
				var str="";
				var str1="";
				$.each(lst,function(i,n){
					str+="<div class='grids_of_2 ' >";
					str+="	<div class='grids_of_img '>";
					str+="	<img src='Picture/"+n.hiType+".jpg' alt='' />";
					str+="	</div>";
					str+="	<div class='grids_of_para '>";
					str+="	<p class='para'><hw4>"+n.hiName+"</hw4></br>价格："+n.hiPrice+"￥&nbsp;&nbsp;&nbsp;类型：";
					str+=""+n.hiType+"&nbsp;&nbsp;&nbsp;楼层："+n.hiFloor+"&nbsp;&nbsp;&nbsp;面积："+n.hiArea+"&nbsp;&nbsp;&nbsp;积分：";
					str+=""+n.hiAddlevsco+"</br>"+n.hiImfor+"</p>";
					str+="	</div>";
					str+="	<div class='clear'></div>";
					str+="</div>";
					if(i==0){
					str1+="<li><a>床型：大床/双床</a></li>";
					str1+="<li><a>WIFI："+n.hiWifi+"</a></li>";
					str1+="<li><a>空调："+n.hiAirt+"</a></li>";
					str1+="<li><a>早餐："+n.hiBreakf+"</a></li>";
					}
				});
				$("#hotimf").html(str);
				$("#hotconf").html(str1);
			}
		});
	}
</script>