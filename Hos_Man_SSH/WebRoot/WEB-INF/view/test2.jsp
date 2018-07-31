<%@ page language="java" import="java.util.*"  pageEncoding="utf-8"%>
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

<title>Book</title>

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
<!-- <script src="js/jquery.min.js"></script> -->
<script src="JQ/jquery-1.9.1.min.js"></script>
<script src="JQ/jquery.query-2.1.7.js"></script>
<script>
	function selallhot() {

		//筛选格式判断及提交
		var sdate = $("#indate").val();
		var edate = $("#outdate").val();
		//var sArr = sdate.split("/");
		//var eArr = edate.split("/");
		//var sRDate = new Date(sArr[0], sArr[1], sArr[2]);
		//var eRDate = new Date(eArr[0], eArr[1], eArr[2]);
		var sRDate = new Date(sdate.replace(/\-/g, "\/"));  
		var eRDate = new Date(edate.replace(/\-/g, "\/"));
		var typev = $("#type").val();
		var pnumv = $("#pnum").val();
		if (sdate == "年/月/日") {
			alert("请输入入住日期！");
			$("#indate").focus();
			return false;
		}
		if (edate == "年/月/日") {
			alert("请输入退房日期！");
			$("#outdate").focus();
			return false;
		}
		if (eRDate <= sRDate) {
			alert("退房日期比入住日期应至少大于一天！");
			$("#outdate").focus();
			return false;
		}
		if(typev.indexOf("双")<=0&&typev != "所有房型"&&pnumv>3){	
			alert("单人房仅限3人及以下入住，请重新选择套房");
			$("#pnum").focus();
			return ;
		}
		$
				.post(
						"HosMan/hotsel",
						{
							type : typev,
							indate : sdate,
							outdate : edate,
							pnum : pnumv
						},
						function(data) {
							var num = 0;
							var lst = $.parseJSON(data);
							var str = "";
							var sdate = $("#indate").val();
							var edate = $("#outdate").val();
							var sArr = sdate.split("/");
							var eArr = edate.split("/");
							var sRDate = new Date(sArr[0], sArr[1], sArr[2]);
							var eRDate = new Date(eArr[0], eArr[1], eArr[2]);
							var result = (eRDate - sRDate)
									/ (24 * 60 * 60 * 1000);
							str = "<ul class='service_list'>";
							$
									.each(
											lst,
											function(i, n) {
												var indate = sdate;
												var outdate = edate;
												var name = n.hName;
												var pnum = $("#pnum").val();
												var price = n.hPrice * result;
												var h_id = n.hId;
												num++;
												/* str += "<li><div class='ser_img '><a href='details.html' > <img src='Picture/"+n.h_type+".jpg' alt='' />"
														+ "</a></div> <a href='details.html'><h3>"
														+ n.h_name
														+ "</h3></a><p class='para'>"
														+ "房间号："
														+ n.h_id
														+ "   "
														+ n.h_type
														+ "级套房       楼层:"
														+ n.h_floor
														+ "</p><h4><a href='pay.html?indate="
														+ $("#indate").val()
														+ "&outdate="
														+ $("#outdate").val()
														+ "&type="
														+ n.h_name
														+ "&pnum="
														+ $("#pnum").val()
														+ "&hoid="
														+ n.h_id
														+ "&price="
														+ n.h_price * result
														+ "'>"
														+ n.h_price
														+ "￥/晚      ×"
														+ result
														+ "  支付"
														+ "</a></h4></li>"; */

												str += "<li><div class='ser_img '><a href='HosMan/detail' > <img src='Picture/"+n.hType+".jpg' alt='' />"
														+ "</a></div> <a href='HosMan/detail'><h3>"
														+ n.hName
														+ "</h3></a><p class='para'>"
														+ "房间号："
														+ n.hId
														+ "   "
														+ n.hType
														+ "级套房       楼层:"
														+ n.hFloor
														+ "</p><h4><a style='cursor:pointer' onclick='payses(\" "
														+ indate
														+ "\",\""
														+ outdate
														+ "\",\""
														+ name
														+ "\",\""
														+ pnum
														+ "\",\""
														+ price
														+ "\",\""
														+ h_id
														+ "\");'>"
														+ n.hPrice
														+ "￥/晚      ×"
														+ result
														+ "  支付"
														+ "</a></h4></li>";

												if (num % 4 == 0) {
													str += "<div class='clear'></div></ul><ul class='service_list top'>";
												}
											});

							str += "<div class='clear'></div></ul>";
							$("#selallho").html(str);
						});
	}
	function payses(indate, outdate, name, pnum, price, h_id) {
		var logid = "";
		//检测登陆
		$.post("HosMan/cussession", {}, function(data) {
			if (data == "null") {
				alert("请先登录！");
				window.location = "HosMan/login";
				return;
			} else {
				var lis = $.parseJSON(data);
				$.each(lis, function(i, n) {
					logid = n.c_logid;
				});
			}

			$.post("HosMan/paysesset", {
				hid : h_id,
				name : name,
				indate : indate,
				outdate : outdate,
				pnum : pnum,
				logid : logid,
				price : price
			}, function(data) {
				if (data == "true") {
					window.location = "HosMan/pay";
				}
			});
		});
	}
</script>

<!---strat-date-piker---->
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/jquery-ui.js"></script>

<script>
	$(function() {
		$("#indate").datepicker({
			minDate : new Date()
		});
		$("#outdate").datepicker({
			minDate : 1
		});
	});
	function dp() {
		$("#outdate").datepicker({
			minDate : 1
		});
	}
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
						var name1 = "";
						var end = "";
						name += "<li ><a href='HosMan/index'>皇家建桥酒店</a></li> |";
						name += "<li><a href='HosMan/rooms'>套房</a></li> |";
						name += "<li><a href='HosMan/pay'>支付</a></li> |";
						name += "<li class='active'><a href='HosMan/book'>预订</a></li> |";
						name1 += "<li class='active'><a href='HosMan/index'>皇家建桥酒店</a></li> ";
						name1 += "<li><a href='HosMan/rooms'>套房</a></li> ";
						name1 += "<li><a href='HosMan/pay'>支付</a></li> ";
						name1 += "<li class='active'><a href='HosMan/book'>预订</a></li> ";
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
					<!--start menu -->
					<ul class="menu" id="tt">
						<!-- <li><a href="index.html">皇家国际酒店</a></li> |
						<li><a href="rooms.html">套房</a></li> |
						<li><a href="pay.html">支付</a></li> |
						<li class="active"><a href="activities.jsp">预订</a></li> |
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
						<!-- <li><a href="index.html">皇家国际酒店</a></li>
							<li><a href="rooms.html">套房</a></li>
							<li><a href="pay.html">支付</a></li>
							<li class="active"><a href="activities.jsp">预订</a></li>
							<li ><a href="contact.html">登陆</a></li> -->
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
				<!-- <div class="online_reservation "> -->
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
										onblur="if (this.value == '') {this.value = '年/月/日';}">
								</div>
							</li>
							<li class="span1_of_1 left ">
								<h5>退房日期:</h5>
								<div class="book_date ">
									<input class="date" id="outdate" type="text" value="年/月/日"
										onclick="dp();"
										onblur="if (this.value == '') {this.value = '年/月/日';}">
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
							<li class="span1_of_3 left">
								<div class="date_btn ">
									<input type="button" value="查询" onclick="selallhot();" />
								</div>
							</li>
							<!-- <div class="clear" ></div> -->
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<!-- start main_content -->


				<div id="selallho"></div>



				<div class="clear"></div>
				<!-- end main_content -->
			</div>
		</div>
	</div>
	
</body>
</html>

<script>
	sethotel();
	function sethotel() {

		var type =  $.query.get("type");
		var indate =  $.query.get("indate");
		var outdate = $.query.get("outdate");
		var pnum = $.query.get("pnum");
		var indate1;
		var outdate1;
		var mydate = new Date();
		indate1 = mydate.toLocaleDateString();
		var nextdate = new Date(mydate.getTime() + 24 * 60 * 60 * 1000);
		outdate1 = nextdate.toLocaleDateString();
		$("#indate").val(indate1);
		$("#outdate").val(outdate1);

		if (type != $("#type").val() && type != "") {
			$("#type").val(type);
		}
		if (indate != $("#indate").val() && indate != "") {
			$("#indate").val(indate);
		}
		if (outdate != $("#outdate").val() && outdate != "") {
			$("#outdate").val(outdate);
		}
		if (pnum != $("#pnum").val() && pnum != "") {
			$("#pnum").val(pnum);
		}
		selallhot();
	}
</script>