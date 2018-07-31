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
<title>ZON</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/JFGrid.css" />
<link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
<script src="js/jquery-ui.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="JQ/jquery.query-2.1.7.js"></script>
<script src="js/moment.js"></script>
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

	$(function() {
		ses();
		show();
	});
	function show() {
		$.post("HosMan/cussession", {}, function(data) {
			if (data == "null") {
				alert("session已过期,请先登录！");
				window.location = "HosMan/login";
				return "false";
			} else {
				var flag =  $.query.get("flag"); 
				if(flag=="1"||flag==""|flag==null){
					selcusimf();
				}else if(flag=="2"){
					selprebook();
				}else{
					selfinbook();
				}
				
				/* var c_logid = "";
				var lis = $.parseJSON(data);
				$.each(lis, function(i1, n1) {
					c_logid = n1.c_logid;
					return c_logid; 
				}); */
			}
		});
	}
	//列出用户信息
	function selcusimf() {
		
		$.post("HosMan/cussession", {}, function(data) {
			if (data == "null") {
				alert("session已过期,请先登录！");
				window.location = "HosMan/login";
				return ;
			} else {
				var lis = $.parseJSON(data);
				var tab1 = "<table id='custab' class='pcenter' style='width:84%;' >";
				var tab2 ="";
				$.each(lis, function(i2, n2) {	
					//根据用户id获取最新个人信息
					$.post("HosMan/selcusbyid",{
						cid:n2.cId
					},function(datat){
						var list=$.parseJSON(datat);
						$.each(list,function(it,nt){
							
							tab1 += "<tr><td align='right' style='width:28%;' >用户名: </td><td style='width:28%;'>"
								+ nt.cLogid
								+ "</td><td style='width:28%;'></td></tr><td align='right'>密码:  </td><td><input type='password' onblur='cpwdonb();' id='cpwdi' value='"
								+ nt.cPwd
								+ "'></td><td><div id='cpwdprompt' style='color:red;'></div></td></tr><td align='right'>确认密码:  </td><td><input type='password' onblur='cpwd2onb();' id='cpwd2i' value='"
								+ nt.cPwd
								+ "'></td><td><div id='cpwd2prompt' style='color:red;'></div></td></tr><td align='right'>姓名:  </td><td><input type='text' onblur='cnameonb();' id='cnamei' value='"
								+ nt.cName
								+ "'></td><td><div id='cnameprompt' style='color:red;'></div></td></tr><td align='right'>性别:  </td><td><input type='text' onblur='csexonb();' id='csexi' value='"
								+ nt.cSex
								+ "'></td><td><div id='csexprompt' style='color:red;'></div></td></tr><td align='right'>电话:  </td><td><input type='text' onblur='cteleonb();' id='ctelei' value='"
								+ nt.cTele
								+ "'></td><td><div id='cteleprompt' style='color:red;'></div></td></tr><td align='right'>身份证号:  </td><td><input type='text' onblur='cidcardonb();' id='cidcardi' value='"
								+ nt.cIdcard
								+ "'></td><td><div id='cidcardprompt' style='color:red;'></div></td></tr><td align='right'>电子邮箱:  </td><td><input type='text' onblur='cemailonb();' id='cemaili' value='"
								+ nt.cEmail
								+ "'></td><td><div id='cemailprompt' style='color:red;'></div></td></tr><td align='right'>会员等级:  </td><td>"
								+ nt.cLevel
								+ "</td><td></td></tr><td align='right'>会员积分:  </td><td>"
								+ nt.cLevsco + "</td><td></td></tr>";
							tab2 +="<input  type='button' value='修改' style='margin-right: 36%;' onclick='updcusimf(\""+nt.cId+"\",\""+nt.cLogid+"\",\""+nt.cLevel+"\",\""+nt.cLevsco+"\");'>";
						});
						tab1 += "</table>";
						$("#zon").html(tab1);
						$("#zonti").html(" &nbsp;&nbsp;&nbsp;&nbsp;个人信息");
						$("#zonb").html(tab2);
						
					});
					
				});
				
		}
		});
	}
	//根据logid列出用户历史订单信息
	function selfinbook() {
		$.post("HosMan/cussession", {}, function(data) {
			if (data == "null") {
				alert("session已过期,请先登录！");
				window.location = "HosMan/login";
				return ;
			} else {
				var lis = $.parseJSON(data);
				
				var tab2 = "<table id='booktab' class='pcenter' style='text-align:center;width:80%;' >";
				$.each(lis, function(i2, n2) {
					$.post("HosMan/selfinbookbylogid",{
						clogid:n2.cLogid
					},function(datat){
						tab2 += "<tr><td >入住日期</td><td >退房日期</td><td >房号</td>";
						tab2 +="<td >房名</td><td >入住人数</td><td >价格</td></tr>";
						if(datat=="null"){
						}else{
						var list=$.parseJSON(datat);
						$.each(list,function(it,nt){
							var indate = new Date(nt.bIndate).toLocaleString();
							var outdate = new Date(nt.bOutdate).toLocaleString();
							tab2 +="<tr><td >"+indate+"</td><td >"+outdate+"</td><td >"+nt.hId+"</td>";
							tab2 +="<td >"+nt.hName+"</td><td >"+nt.bPnum+"</td><td >"+nt.bPrice+"</td></tr>";
						});
						}
						tab2 += "</table>";
						$("#zon").html(tab2);
						$("#zonti").html(" &nbsp;&nbsp;&nbsp;&nbsp;历史订单");
					});
					
				});
				
		}
		});
	}
	//根据logid列出用户未完成订单信息
	function selprebook() {
		$.post("HosMan/cussession", {}, function(data) {
			if (data == "null") {
				alert("session已过期,请先登录！");
				window.location = "HosMan/login";
				return ;
			} else {
				var lis = $.parseJSON(data);
				
				var tab2 = "<table id='booktab' class='pcenter' style='text-align:center;width:98%;' >";
				$.each(lis, function(i2, n2) {
					$.post("HosMan/selprebookbylogid",{
						clogid:n2.cLogid
					},function(datat){
						tab2 += "<tr><td >入住日期</td><td >退房日期</td><td >房号</td>";
						tab2 +="<td >房名</td><td >入住人数</td><td >完整价格</td><td >预付价格</td><td >操作</td></tr>";
						if(datat=="null"){
						}else{
						var list=$.parseJSON(datat);
						$.each(list,function(it,nt){
							var indate = new Date(nt.bIndate).toLocaleString();
							var outdate = new Date(nt.bOutdate).toLocaleString();
							tab2 +="<tr><td id='indate"+nt.bId+"'>"+indate+"</td><td >"+outdate+"</td><td >"+nt.hId+"</td>";
							tab2 +="<td >"+nt.hName+"</td><td >"+nt.bPnum+"</td><td >"+nt.bPrice+"</td><td >"+nt.bPrepay+"</td>";
							//tab2 +="<td ><input type='button' value='退订' id='delbook' onclick='delbook();'></td></tr>";
							tab2 +="<td width='10%;'><input type='button1' readonly='true' value='退订' onclick='delbook(\""+nt.bId+"\",\""+nt.bPrepay+"\");'></td></tr>";
						});
						}
						tab2 += "</table>";
						var str1="<h4  style='margin-left: 20px;color: #52ABDF;'>提醒！<br>我们提供退订服务，但仅限在入住日期的当天17点前才可退订，逾期将不再提供该服务！<br>谢谢您的配合！<br>祝你生活愉快！</h4>";
						$("#zon").html(tab2);
						$("#zonti").html(" &nbsp;&nbsp;&nbsp;&nbsp;未完成订单");
						$("#zonb").html(str1);
					});
					
				});
				
		}
		});
	}
	function delbook(bid,prepay){
		if(confirm("确认退订吗？")){
			var indate=$("#indate"+bid+"").html();
			var indateend = moment(indate).add(17, 'h');
			var now=moment();
			if(moment(now).isBefore(indateend, 'minute')){
				$.post("HosMan/admin/delbook",{
				bid:bid
			},function(data){
				if(data=="nobook"){
					   alert("无此订单！");
					   selprebook();
					}else if(data=="true"){
						alert("退订成功! 并退还您"+prepay+"元钱！");
						selprebook();
						}else{
							alert("退订失败！");
							selprebook();
							}
			});
			}else{
				var hou=(now-indateend)/3600000;
				alert("你已逾期"+Math.floor(hou) +"小时！不能退订了！");
			}
		}
	}
	/* session列表信息显示 */
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
							name1 += "<li ><a href='HosMan/index'>皇家建桥酒店</a></li> ";
							name1 += "<li><a href='HosMan/rooms'>套房</a></li> ";
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
													name += "<li class='active'><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>|";
													name += "<li class='active'><a href='HosMan/customerzon'>个人中心</a></li>";
													name1 += "<li class='active'><a href='HosMan/customerzon'>"
															+ n.cLogid
															+ "</a></li>|";
													name1 += "<li class='active'><a href='HosMan/customerzon'>个人中心</a></li>";
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
	
function updcusimf(cid,logid,level,levsco){
	var pwdv = $("#cpwdi").val();
	var pwd2v = $("#cpwd2i").val();
	var namev = $("#cnamei").val();
	var sexv = $("#csexi").val();
	var telev = $("#ctelei").val();
	var idcardv = $("#cidcardi").val();
	var emailv = $("#cemaili").val();
	 if (cpwdonb() == false) {
		$("#cpwdi").focus();
		return;
	} else if (cpwd2onb() == false) {
		$("#cpwd2i").focus();
		return;
	} else if (cnameonb() == false) {
		$("#cnamei").focus();
		return;
	}else if (csexonb() == false) {
		$("#csexi").focus();
		return;
	}else if (cteleonb() == false) {
		$("#ctelei").focus();
		return;
	} else if (cidcardonb() == false) {
		$("#cidcardi").focus();
		return;
	} else if (cemailonb() == false) {
		$("#cemaili").focus();
		return;
	} else {
		var r = confirm("确认信息准确吗？");
		if (r == true) {
			$.post("HosMan/admin/updcus", {
				cid : cid,
				clogid:logid,
				cpwd : pwdv,
				cname : namev,
				csex : sexv,
				ctele : telev,
				cidcard : idcardv,
				cemail : emailv,
				clevel :level,
				clevsco:levsco
			}, function(data) {
				if (data == "true") {
					alert("修改成功!");
					window.location = "HosMan/customerzon";
				} else if (data == "false") {
					alert("修改失败!");
					window.location = "HosMan/customerzon";
				}
			});
		}else{}
	}
}
function jcusimf(){
	window.location="HosMan/customerzon?flag=1";
}
function jprebook(){
	window.location="HosMan/customerzon?flag=2";
}
function jfinbook(){
	window.location="HosMan/customerzon?flag=3";
}
//重写tolocaleString方法，显示为年-月-日
Date.prototype.toLocaleString = function() {
    return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate();
};

function cpwdonb() {
	var regpwd = /^[\x21-\x7E]{6,20}$/;
	var pwda = $("#cpwdi").val();
	if (pwda == "") {
		$("#cpwdprompt").html("*请输入密码");
		return false;
	} else {
		$("#cpwdprompt").html("");
	}
	if (!regpwd.test(pwda)) {
		$("#cpwdprompt").html("*字母开头，6-18位，只包含字符、数字和下划线");
		return false;
	}
}
function cpwd2onb() {
	var regpwd2 = /^[\x21-\x7E]{6,20}$/;
	var pwd2a = $("#cpwd2i").val();
	if (pwd2a == "") {
		$("#cpwd2prompt").html("*请再次输入密码");
		return false;
	} else {
		$("#cpwd2prompt").html("");
	}

	if (!regpwd2.test(pwd2a)) {
		$("#cpwd2prompt").html("*字母开头，6-18位，只包含字符、数字和下划线");
		return false;
	}
	if ($("#cpwdi").val() != pwd2a) {
		$("#cpwd2prompt").html("*前后密码不一致");
		return false;
	}
}
function cnameonb() {
	var regname = /[\u4e00-\u9fa5]{2,}/;
	var namea = $("#cnamei").val();
	if (namea == "") {
		$("#cnameprompt").html("*请输入姓名");
		return false;
	} else {
		$("#cnameprompt").html("");
	}
	if (!regname.test(namea)) {
		$("#cnameprompt").html("*请输入中文");
		return false;
	}
}

function csexonb() {
	var regsex = /^[\u4e00-\u9fa5],{0,}$/;
	var sexa = $("#csexi").val();
	if (sexa == ""||(sexa!="女"&&sexa!="男")) {
		$("#csexprompt").html("*请输入男或女");
		return false;
	} else {
		$("#csexprompt").html("");
	}
	if (!regsex.test(sexa)) {
		$("#csexprompt").html("*请输入中文");
		return false;
	}
}
function cteleonb() {
	var regtele = /^(\(\d{3,4}\)|\d{3,4})?\d{7,8}$/;
	var telea = $("#ctelei").val();
	if (telea == "") {
		$("#cteleprompt").html("*请输入电话号码");
		return false;
	} else {
		$("#cteleprompt").html("");
	}
	if (!regtele.test(telea)) {
		$("#cteleprompt").html("*请输入正确号码");
		return false;
	}
}
function cidcardonb() {
	var regidcard = /^\d{15}|\d{}18$/;
	var idcarda = $("#cidcardi").val();
	if (idcarda == "") {
		$("#cidcardprompt").html("*请输入身份证号");
		return false;
	} else {
		$("#cidcardprompt").html("");
	}
	if (!regidcard.test(idcarda)) {
		$("#cidcardprompt").html("*请输入正确身份账号");
		return false;
	}
}
function cemailonb() {
	var regemail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
	var email = $("#cemaili").val();
	if (email == "") {
		$("#cemailprompt").html("*请输入电子邮箱");
		return false;
	} else {
		$("#cemailprompt").html("");
	}
	if (!regemail.test(email)) {
		$("#cemailprompt").html("*请输入正确电子邮箱");
		return false;
	}
}
</script>
</head>
<body>
	<!-- start header -->
	<div class="header_bg">
		<div class="wrap" >
			<div class="header">
				<div class="logo" >
					<a href="index.html"><img src="images/logo.png" alt=""></a>
				</div>
				<div class="h_right">
					<!--start menu -->
					<ul class="menu" id="tt">
						<!-- <li><a href="HosMan/index" >皇家国际酒店</a></li> |
						<li><a href="HosMan/rooms">套房</a></li> |
						<li><a href="HosMan/pay">支付</a></li> |
						<li><a href="HosMan/book">预订</a></li> |
						<li class="active"><a href="HosMan/customerzon">个人中心</a></li>
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
						<!-- <li><a href="HosMan/index">皇家国际酒店</a></li>
						<li><a href="HosMan/rooms">套房</a></li>
						<li><a href="HosMan/pay">支付</a></li>
						<li><a href="HosMan/book">预订</a></li>
						<li class="active"><a href="HosMan/customerzon">个人中心</a></li> -->
					</ul>
					<a href="#" id="pull">菜单</a> </nav>
				</div>
			</div>
		</div>
	</div>
	<!--start main -->
	<div class="main_bg">
		<div class="wrap">
			<div class="main ">
				<div class="contact ">
					<div class="contact_left " style="border-right: 2px solid #52ABDF;">
						<div class="contact_info">
							<h3 style="margin-left: 20px; " >设置</h3>
							<div class="date_btn " style="width: 80%;">
							<input type="button" value="个人信息" style="" onclick="jcusimf();">
							</div>
							<div class="date_btn " style="width: 80%;">
							<input type="button" value="未完成订单" style="" onclick="jprebook();">
							</div>
							<div class="date_btn " style="width: 80%;">
							<input type="button" value="历史订单" style="" onclick="jfinbook();">
							</div>
							<div class="date_btn " style="width: 80%;">
							<input type="button" value="退出登录/切换账号" onclick="forgetlo();">
							</div>
							</br></br></br></br></br></br></br></br></br>
						</div>
					</div>
					<div class="contact_right ">
						<div class="contact-form ">
						<a  style="width:100%; display:block; text-align: left;font-size: 24px;color:#52ABDF;background-color:black; text-transform:none; text-decoration:none;" id="zonti"></a>
							<div class="zon " id="zon"></div>
							<div  style="margin-top: 20px;"  display:inline-block; width: 100%;' id="zonb"></div>
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
</body>
</html>









