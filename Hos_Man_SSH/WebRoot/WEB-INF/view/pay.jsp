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

<title>Pay</title>

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
<script src="JQ/jquery-1.9.1.min.js"></script>
<script src="js/moment.js"></script>

<!---strat-date-piker---->
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#indate").datepicker({
			minDate : new Date()
		});
		$("#outdate").datepicker({
			minDate : $("#datepicker").datepicker() + 1
		});
	});
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
						<li class="active"><a href="pay.html">支付</a></li> |
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
						<!-- <li><a href="index.html">皇家国际酒店</a></li>
							<li><a href="rooms.html">套房</a></li>
							<li class="active"><a href="pay.html">支付</a></li>
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
				<div class="res_online ">
					<h4>信息</h4>
					<div id="payimfdiv"><p class="para"><!-- 本酒店支持订单入住日期的当天下午5点前取消订单，逾时自担。订单成功，则会增加相应的会员积分，积分达到阶段可自动升级VIP等级。
					拥有VIP身份，入住订房可以打折优惠哦。如是预订需预先交付总金额的30%，剩余的70%需在前台付交，才可入住酒店。 --></p></div>
				</div>

				<div class="span_of_2 " style="margin-top: 3%;">

					<div class="span2_of_1">
						<h4>入住日期:</h4>
						<div class="book_date btm">
							<form>
								<input class="date" id="indate" type="text" value="年-月-日"
									onfocus="this.value = '';"
									onblur="if (this.value == '') {this.value = '年-月-日';}"
									onmousedown="return false;">
							</form>
						</div>
						<div class="sel_room">
							<h4>房型:</h4>
							<select id="type" onchange="change_country(this.value)"
								class="frm-field required" onmousedown="return false; "
								style="width: 95%;">
								<option value="标准套房">标准套房</option>
								<option value="标准双床房">标准双床房</option>
								<option value="高级套房">高级套房</option>
								<option value="高级双床房">高级双床房</option>
								<option value="豪华套房">豪华套房</option>
								<option value="豪华双床房">豪华双床房</option>
								<option value="总统套房">总统套房</option>
							</select>
						</div>
						<div class="sel_room left">
							<h4>入住人数:</h4>
							<select id="pnum" onchange="change_country(this.value)"
								class="frm-field required" onmousedown="return false;"
								style="width: 95%;">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>
						<div class="sel_room book_date">
							<h4>用户名:</h4>
							<form>
								<input id="plogid" value="" type="text" readonly>
							</form>
						</div>
					</div>
					<div class="span2_of_1">
						<h4>退房日期:</h4>
						<div class="book_date btm">
							<form>
								<input class="date" id="outdate" type="text" value="年-月-日"
									onfocus="this.value = '';"
									onblur="if (this.value == '') {this.value = '年-月-日';}"
									onmousedown="return false;">
							</form>
						</div>
						<div class="sel_room book_date">
							<h4>房牌:</h4>
							<form>
								<input id="hoid" value="" type="text" readonly>
							</form>
						</div>
						<div class="sel_room book_date left">
							<h4>价格（￥）:</h4>
							<form>
								<input id="price" value="" type="text" readonly>
							</form>
						</div>

						<div class="sel_room book_date">
							<h4>预付价格（￥）:</h4>
							<form>
								<input id="prepay" value="" type="text" readonly>
							</form>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="res_btn">
					<form>
						<input type="button" value="预付" style="width: 280px;"
							onclick="setprepay();"> <input type="button" value="完整支付"
							style="width: 280px;" onclick="setpay();">
					</form>
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
							name += "<li ><a href='HosMan/index'>皇家国际酒店</a></li> |";
							name += "<li><a href='HosMan/rooms'>套房</a></li> |";
							name += "<li class='active'><a href='HosMan/pay'>支付</a></li> |";
							name += "<li><a href='HosMan/book'>预订</a></li> |";
							name1 += "<li ><a href='HosMan/index'>皇家国际酒店</a></li> ";
							name1 += "<li><a href='HosMan/rooms'>套房</a></li> ";
							name1 += "<li class='active'><a href='HosMan/pay'>支付</a></li> ";
							name1 += "<li><a href='HosMan/book'>预订</a></li> ";
							end += "<li><a href='HosMan/index'>首页</a></li><li><a href='HosMan/rooms'>套房</a></li><li><a href='HosMan/book'>预订</a></li><li><a href='HosMan/hotelimformation'>联系方式</a></li>";
							if (data == "null") {
								name += "<li ><a href='HosMan/login'>登录</a></li>";
								name1 += "<li ><a href='HosMan/login'>登录</a></li>";
								end += "<li><a href='HosMan/login'>登录</a></li>";
								
							} else {
								var lis = $.parseJSON(data);
								$
										.each(
												lis,
												function(i, n) {
													name += "<li ><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>|";
													name += "<li ><a href='HosMan/customerzon' id='level1' style='color: yellow;' >"
															+ n.cLevel
															+ "</a></li>";
													name1 += "<li ><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>|";
													name1 += "<li ><a href='HosMan/customerzon' id='level2' style='color: yellow;'>"
															+ n.cLevel
															+ "</a></li>";
													end += "<li><a style='cursor:pointer' onclick='forgetlo();'>退出登录</a></li>";
													$("#plogid").val(n.cLogid);
													
												});
								name += "<div class='clear'></div>";
								name1 += "<div class='clear'></div>";
							}
							$("#tt").html(name);
							$("#tt1").html(name1);
							$("#end").html(end);
							payimf();
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
	function payimf() {
		
		var type = "";
		var indate = "";
		var outdate = "";
		var pnum = "";
		var hoid = "";
		var price = "";
		var logid = "";
		
		//登录判断,获取账号
		$.post("HosMan/cussession", {}, function(data) {
			if (data == "null") {
				alert("请先登录！");
				window.location = "HosMan/login";
				return;
			} else {
				var lis = $.parseJSON(data);
				$.each(lis, function(i, n) {
					logid = n.c_Logid;
				});
			}
			$.post("HosMan/paysesget", {}, function(data) {
				/* alert("getses的data为："+data); */
				if (data == "null") {
					alert("请您先去预订页面挑选！");
					//window.open("activities.html?type=" + type +  "&pnum=" + pnum +"");
					window.location = "HosMan/book";
					return;
				} else {
					var lis = $.parseJSON(data);
					$.each(lis, function(i, n) {
						type = n.hName;
						indate = moment(n.bIndate).format('YYYY-MM-DD');
						outdate = moment(n.bOutdate).format('YYYY-MM-DD');
						pnum = n.bPnum;
						hoid = n.hId;
						price = n.bPrice;
						prepay=n.bPrepay;
						$.post("HosMan/sellsale",{
							llevel:$("#level1").html()
						},function(data){
							var lsale=data;
							//填充新信息
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
							if (hoid != $("#hoid").val() && hoid != "") {
								$("#hoid").val(hoid);
							}
							if (price != $("#price").val() && price != "") {
								$("#price").val(parseInt(price*lsale));
							}
							if (prepay != $("#prepay").val() && prepay != "") {
								$("#prepay").val(parseInt(prepay*lsale));
							} 
						});
						/* alert("getses的data的反JSON化为"+type + indate + outdate + pnum + hoid + price); */
					});
				}
				
			});
		});
	}
	
	function showimf(){
		$.post("HosMan/getlistlevel",{},function(data){
			var lst=$.parseJSON(data);
			var str="";
			var num;
			str+="<p class='para'>本酒店支持订单入住日期的当天下午5点前取消订单，逾时自担。订单成功，则会增加相应的会员积分，积分达到阶段可自动升级VIP等级。";
			str+="拥有VIP身份，入住订房可以打折优惠哦。如是预订需预先交付总金额的30%，剩余的70%需在前台付交，才可入住酒店。</br>";
			$.each(lst,function(i,n){
				if(i<8){
					num=103-(100*n.lsale);
					str+="会员等级为"+n.llevel+" 打"+n.lsale*10+"折 、限购订单数为"+num+"；";
					if(i==3){
						str+="</br>";
					}
				}
			});
			str+="</br>感谢您的预订！祝您生活愉快！</p>";
			$("#payimfdiv").html(str);
		});
		
	}
	
	function setpay() {
		//登录判断
		$.post("HosMan/cussession", {}, function(data) {
			var logid = "";
			if (data == "null") {
				alert("请先登录！");
				window.location = "HosMan/login";
				return;
			} else {
				//信息确认和提交
				//获取用户名
				var lis = $.parseJSON(data);
				$.each(lis, function(i, n) {
					logid = n.cLogid;
				});
				var r = confirm("确认信息准确吗？");
				if (r == true) {

					if ($("#hoid").val() == "" || $("#type").val() == ""
							|| $("#indate").val() == ""
							|| $("#outdate").val() == ""
							|| $("#pnum").val() == ""
							|| $("#price").val() == ""
							|| $("#prepay").val() == "") {
						alert("信息不完整！请从新选择！");
						window.location = "HosMan/book";
					}
					$.post("HosMan/paydeal", {
						hoid : $("#hoid").val(),
						type : $("#type").val(),
						indate : $("#indate").val(),
						outdate : $("#outdate").val(),
						pnum : $("#pnum").val(),
						logid : logid,
						price : $("#price").val(),
						prepay : $("#price").val()
					}, function(data) {
						if (data == "true") {
							alert("支付成功！");
							window.location = "HosMan/customerzon?flag=2";
						} else if (data == "more") {
							alert("您已超过您等级最大预订单数！无法继续预订");
							window.location = "HosMan/customerzon?flag=2";
						}else if (data == "error1") {
							alert("房间已被预订！");
							window.location = "HosMan/book";
						} else {
							alert("支付失败！");
						}
					});
				} else {
				}

			}
		});

	}
	function setprepay() {
		
		//登录判断
		$.post("HosMan/cussession", {}, function(data) {
			var logid = "";
			if (data == "null") {
				alert("请先登录！");
				window.location = "HosMan/login";
				return;
			} else {
				//信息确认和提交
				//获取用户名
				var lis = $.parseJSON(data);
				$.each(lis, function(i, n) {
					logid = n.cLogid;
				});
				var r = confirm("确认信息准确吗？");
				if (r == true) {

					if ($("#hoid").val() == "" || $("#type").val() == ""
							|| $("#indate").val() == ""
							|| $("#outdate").val() == ""
							|| $("#pnum").val() == ""
							|| $("#price").val() == ""
							|| $("#prepay").val() == "") {
						alert("信息不完整！请从新选择！");
						window.location = "HosMan/book";
					}
					$.post("HosMan/paydeal", {
						hoid : $("#hoid").val(),
						type : $("#type").val(),
						indate : $("#indate").val(),
						outdate : $("#outdate").val(),
						pnum : $("#pnum").val(),
						logid : logid,
						price : $("#price").val(),
						prepay : $("#prepay").val()
					}, function(data) {
						if (data == "true") {
							alert("支付成功！");
							window.location = "HosMan/customerzon?flag=2";
						} else if (data == "error1") {
							alert("房间已被预订！");
							window.location = "HosMan/book";
						} else {
							alert("支付失败！");
						}
					});
				} else {
				}

			}
		});

	}
</script>