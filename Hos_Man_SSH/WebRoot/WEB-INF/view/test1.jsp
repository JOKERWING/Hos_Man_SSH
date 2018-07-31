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

<title>Hotel</title>

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
<!-- <script src="JQ/jquery-1.9.1.min.js"></script> -->
<!--start slider -->
<link rel="stylesheet" href="css/fwslider.css" media="all">
<script src="js/jquery-ui.min.js"></script>
<script src="js/css3-mediaqueries.js"></script>
<script src="js/fwslider.js"></script>
<!--end slider -->
<!---strat-date-piker---->
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/jquery-ui.js"></script>
<script>
	$(function() {

		$("#indate").datepicker({
			minDate : new Date(),
			maxDate : 30
		});
		$("#outdate").datepicker({
			minDate : 1,
			maxDate : 30
		});

	});

	/* function newoutdate() {
	var sdate = $("#indate").val();
	var edate = new Date();
	var edate1 = edate.toLocaleDateString();
	var sArr = sdate.split("/");
	var eArr = edate1.split("/");
	var sRDate = new Date(sArr[0], sArr[1], sArr[2]);
	var eRDate = new Date(eArr[0], eArr[1], eArr[2]);
	var result;
	if(sdate=="年/月/日"){
	result=1;}
	else{
	result = (sRDate - eRDate) / (24 * 60 * 60 * 1000)+1;
	}
	 $("#outdate").datepicker({
		minDate : result,
		maxDate:30
	}); 
	alert(result);

	}  */
</script>
<!---/End-date-piker---->
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

	function book() {
		var sdate = $("#indate").val();
		var edate = $("#outdate").val();
		var sArr = sdate.split("/");
		var eArr = edate.split("/");
		var sRDate = new Date(sArr[0], sArr[1], sArr[2]);
		var eRDate = new Date(eArr[0], eArr[1], eArr[2]);
		if (sdate == "年/月/日") {
			alert("请输入入住日期！");
			$("#indate").focus();
			return false;
		} else if (edate == "年/月/日") {
			alert("请输入退房日期！");
			$("#outdate").focus();
			return false;
		} else if (eRDate <= sRDate) {
			alert("退房日期比入住日期应至少大于一天！");
			$("#outdate").focus();
			return false;
		}
		/* if(newoutdate()=="false"){
		return;}
		else{ */
		var type = $("#type").val();
		var indate = $("#indate").val();
		var outdate = $("#outdate").val();
		var pnum = $("#pnum").val();
		/* $.post("HosMan/bookimf", {
			name : type,
			indate : indate,
			outdate : outdate,
			pnum : pnum
		}); */
		window.location="HosMan/bookimf?type="+type+"&&indate="+indate+"&&outdate="+outdate+"&&pnum="+pnum;
	}
</script>
<script>
	/* session列表信息显示 */
	Init();
	function Init() {
		ses();
		tftop3();
		dateset();
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
							name += "<li class='active'><a href='HosMan/index'>皇家建桥酒店</a></li> |";
							name += "<li><a href='HosMan/rooms'>套房</a></li> |";
							name += "<li><a href='HosMan/pay'>支付</a></li> |";
							name += "<li><a onclick='book2();' style='cursor:pointer'>预订</a></li> |";
							name1 += "<li class='active'><a href='HosMan/index'>皇家建桥酒店</a></li> ";
							name1 += "<li><a href='HosMan/rooms'>套房</a></li> ";
							name1 += "<li><a href='HosMan/pay'>支付</a></li> ";
							name1 += "<li><a onclick='book2();' style='cursor:pointer'>预订</a></li> ";
							end += "<li><a href='HosMan/index'>首页</a></li><li><a href='HosMan/rooms'>套房</a></li><li><a href='HosMan/book'>预订</a></li><li><a href='HosMan/hotelimformation'>联系方式</a></li>";
							if (data == "null") {
								name += "<li ><a href='HosMan/login'>登陆</a></li>";
								name1 += "<li ><a href='HosMan/login'>登陆</a></li>";
								end += "<li><a href='HosMan/login'>登陆</a></li>"
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
	function dateset() {
		var indate = $("#indate").val();
		var outdate = $("#outdate").val();
		var indate1;
		var outdate1;
		if (indate == "年/月/日") {
			var mydate = new Date();
			indate1 = mydate.toLocaleDateString();
			var nextdate = new Date(mydate.getTime() + 24 * 60 * 60 * 1000);
			outdate1 = nextdate.toLocaleDateString();
		} else {
			indate1 = indate;
			outdate1 = outdate;
		}
		$("indate").val(indate1);
		$("outdate").val(outdate1);
	}
	function tftop3() {
		$
				.post(
						"HosMan/hotimftop3",
						{},
						function(data) {
							var lst = $.parseJSON(data);
							var flag = 1;
							var str = "";
							$
									.each(
											lst,
											function(i, n) {
												str += "<div class='grid1_of_3'><div class='grid1_of_3_img'><a href='HosMan/detail' id='tfj1'> <img src='Picture/"+n.hi_type+".jpg' alt='' /></a></div><h4><a class=''  href='#' style='float: left'>"
														+ n.h_name
														+ "</a><a class='a1 '  href='#' style='float: left;'>"
														+ n.hi_price
														+ "￥</a><div class='clear'></div></h4><p id='tfi1'>"
														+ n.hi_imfor
														+ "。</p></div>";
												flag++;
											});
							str += "<div class='clear'></div>";
							$("#se3ho").html(str);
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
	function book2(){
		$("#test2div").load("HosMan/test2");
	}
</script>

</head>
<body>
	<div id="test2div">
	<!-- start header -->
	<div class="header_bg ">
		<div class="wrap ">
			<div class="header">
				<div class="logo">
					<a href="HosMan/index" ><img src="images/logo.png" alt=""></a>
				</div>
				<div class="h_right ">
					<!--start menu -->
					<ul class="menu" id="tt">
						<!-- <li class="active"><a href="index.html">皇家国际酒店</a></li> |
						<li><a href="rooms.html">套房</a></li> |
						<li><a href="pay.html">支付</a></li> |
						<li><a href="activities.html">预订</a></li> |
						<li><a href="contact.html">登陆</a></li>
						<div class="clear"></div> -->
					</ul>
					<!-- start profile_details -->
					<form class="style-1 drp_dwn">
						<div class="row">
							<div class="grid_3 columns">
								<select class="custom-select" id="select-1">
									<option selected="selected">中文</option>
									<option>EN/USA</option>
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
							<li><a href="contact.html">登陆</a></li> -->
					</ul>
					<a href="#" id="pull">菜单</a> </nav>
				</div>
			</div>
		</div>
	</div>
	
	<!----start-images-slider---->
	<div class="images-slider">
		<!-- start slider -->
		<div id="fwslider">
			<div class="slider_container">
				<div class="slide">
					<!-- Slide image -->
					<img src="images/slider-bg.jpg" alt="" />
					<!-- /Slide image -->
					<!-- Texts container -->
					<div class="slide_content">
						<div class="slide_content_wrap">
							<!-- Text title -->
							<h4 class="title">
								<i class="bg"></i>享受至上 <span class="hide">生活</span>
							</h4>
							<h5 class="title1">
								<i class="bg"></i>皇家建桥酒店<span class="hide">欢迎您</span>
							</h5>
							<!-- /Text title -->
						</div>
					</div>
					<!-- /Texts container -->
				</div>
				<!-- /Duplicate to create more slides -->
				<div class="slide">
					<img src="images/slider-bg.jpg" alt="" />
					<div class="slide_content">
						<div class="slide_content_wrap">
							<!-- Text title -->
							<h4 class="title">
								<i class="bg"></i>奢华 <span class="hide"> 臻贵 </span>
							</h4>
							<h5 class="title1">
								<i class="bg"></i>大气 <span class="hide">典雅</span>
							</h5>
							<!-- /Text title -->
						</div>
					</div>
				</div>
				<!--/slide -->
			</div>
			<div class="timers"></div>
			<div class="slidePrev">
				<span> </span>
			</div>
			<div class="slideNext">
				<span> </span>
			</div>
		</div>
		<!--/slider -->
	</div>
	
	<!--start main -->
	<div class="main_bg">
		<div class="wrap">
			<div class="online_reservation ">
				<div class="b_room ">
					<div class="booking_room ">
						<h4>线上预订</h4>
						<p>轻松 快捷 方便 实惠</p>
					</div>
					<div class="reservation ">
						<ul>
							<li class="span1_of_1 ">
								<h5>房型:</h5> <!----------start section_room----------->
								<div class="section_room ">
									<select id="type" onchange="change_country(this.value)"
										class="frm-field required ">
										<option value="所有房型">所有房型</option>
										<option value="标准套房">标准套房</option>
										<option value="标准双床房">标准双床房</option>
										<option value="高级套房">高级套房</option>
										<option value="高级双床房">高级双床房</option>
										<option value="豪华套房">豪华套房</option>
										<option value="豪华双床房">豪华双床房</option>
										<option value="总统套房">总统套房</option>
									</select>
								</div>
							</li>
							<li class="span1_of_1 left ">
								<h5>入住日期:</h5>
								<div class="book_date ">

									<input class="date" id="indate" type="text" value="年/月/日"
										onfocus="if(this.value=='年/月/日')this.value = '';"
										onblur="if (this.value == '') {this.value = '年/月/日';}">


								</div>
							</li>
							<li class="span1_of_1 left ">
								<h5>退房日期:</h5>
								<div class="book_date ">

									<input class="date" id="outdate" type="text" value="年/月/日"
										onfocus="if(this.value=='年/月/日')this.value = '';"
										onblur="if (this.value == '') {this.value = '年/月/日';return;}">

								</div>
							</li>
							<li class="span1_of_2 left ">
								<h5>入住人数:</h5> <!----------start section_room----------->
								<div class="section_room ">
									<select id="pnum" onchange="change_country(this.value)"
										class="frm-field required">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</div>
							</li>
							<li class="span1_of_3 left ">
								<h5></h5>
								<div class="date_btn ">
									<input type="button" value="现在预订" onclick="book();" />
								</div>
							</li>
							<!-- <div class="clear" ></div> -->
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<!--start grids_of_3 -->
			<div class="grids_of_3" id="se3ho">
				<!-- <div class="grid1_of_3">
					<div class="grid1_of_3_img">
						<a href="details.html" id="tfj1"> <img src="Picture/gjtf.jpg" alt="" />
							<span class="next"> </span>
						</a>
					</div>
					<h4>
						<a class="" id="tf1" href="#" style="float: left"></a><a
							class="a1 " id="tfp1" href="#" style="float: left;"></a>
						<div class="clear"></div>
					</h4>
					<p id="tfi1"></p>
				</div>
				<div class="grid1_of_3">
					<div class="grid1_of_3_img">
						<a href="details.html"> <img src="Picture/hhtf.jpg" alt="" />
							<span class="next"> </span>
						</a>
					</div>
					<h4>
						<a class="" id="tf2" href="#" style="float: left"></a><a
							class="a1 " id="tfp2" href="#" style="float: left;"></a>
						<div class="clear"></div>

					</h4>
					<p id="tfi2"></p>
				</div>
				<div class="grid1_of_3">
					<div class="grid1_of_3_img">
						<a href="details.html"> <img src="Picture/zttf.jpg" alt="" />
							<span class="next"> </span>
						</a>
					</div>
					<h4>
						<a class="" id="tf3" href="#" style="float: left"></a><a
							class="a1 " id="tfp3" href="#" style="float: left;"></a>
						<div class="clear"></div>

					</h4>
					<p id="tfi3"></p>
				</div> -->

				<!-- <div class="clear"></div> -->

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
						<li><a class="icon1" href="#"></a></li>
						<li><a class="icon2" href="#"></a></li>
						<li><a class="icon3" href="#"></a></li>
						<li><a class="icon4" href="#"></a></li>
						<li><a class="icon5" href="#"></a></li>
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
