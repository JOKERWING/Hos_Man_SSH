<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>皇家建桥酒店后台管理系统</title>
    <meta charset="utf-8"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="JQ/jquery.query-2.1.7.js"></script>
<script>
	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery);
	
	/* $('#fa a').bind('click', function(){
	    $(this).addClass('active').siblings().removeClass('active');
	}); */
</script>
</head>
<body>
<!--header-->
<header>
 <h1><img src="images/admin_logo.png" onclick="window.location='HosMan/admin/index';" style="cursor: pointer;"/></h1>
 <ul class="rt_nav">
  <li><a href="HosMan/admin/index" target="_blank" class="website_icon">站点首页</a></li>
  <li><a href="HosMan/admin/index?url=HosMan/admin/mystaman&id=mystamanl" class="admin_icon"><div id="slogid"></div></a></li>
  <li><a href="HosMan/admin/index?url=HosMan/admin/myrolepriman&id=myroleprimanl" class="set_icon"><div id="rnamec"></div></a></li>
  <li><a class="quit_icon" onclick="quit();" style="cursor: pointer;">安全退出</a></li>
 </ul>
</header>

<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar" id="fa">
 <h2><a href="HosMan/admin/index" >首页</a></h2>
 <ul>
  <li>
   <dl>
    <dt>客房信息</dt>
    <!--当前链接则添加class:active-->
    <dd><a id="hotmanl" href="HosMan/admin/index?url=HosMan/admin/hotman&id=hotmanl"  style="cursor: pointer;">客房信息管理</a></dd>
    <dd><a id="hotimfmanl" href="HosMan/admin/index?url=HosMan/admin/hotimfman&id=hotimfmanl" style="cursor: pointer;">客房分类管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>订单信息</dt>
    <dd><a id="bookmanl" href="HosMan/admin/index?url=HosMan/admin/bookman&id=bookmanl"  style="cursor: pointer;">订单信息管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>客户信息</dt>
    <dd><a id="cusmanl" href="HosMan/admin/index?url=HosMan/admin/cusman&id=cusmanl"  style="cursor: pointer;">客户信息管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>职工信息</dt>
    <dd><a id="stamanl" href="HosMan/admin/index?url=HosMan/admin/staman&id=stamanl"  style="cursor: pointer;">职工信息管理</a></dd>
    
   </dl>
  </li>
  <li>
   <dl>
    <dt>权限信息</dt>
    <dd><a id="primanl" href="HosMan/admin/index?url=HosMan/admin/priman&id=primanl"  style="cursor: pointer;">权限信息管理</a></dd>
    <dd><a id="rolemanl" href="HosMan/admin/index?url=HosMan/admin/roleman&id=rolemanl"  style="cursor: pointer;">角色信息管理</a></dd>
    <dd><a id="roleprimanl" href="HosMan/admin/index?url=HosMan/admin/rolepriman&id=roleprimanl"  style="cursor: pointer;">角色权限分配管理</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>个人信息</dt>
    <dd><a id="mystamanl" href="HosMan/admin/index?url=HosMan/admin/mystaman&id=mystamanl"  style="cursor: pointer;">个人职工信息</a></dd>
   	<dd><a id="myroleprimanl" href="HosMan/admin/index?url=HosMan/admin/myrolepriman&id=myroleprimanl"  style="cursor: pointer;">个人角色权限信息</a></dd>
   </dl>
  </li>
  <li>
   <p class="btm_infor">© 上海皇家建桥集团 版权所有</p>
  </li>
 </ul>
</aside>

<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content" id="contents">
     
 </div>
</section>
<script>
$().ready(function(){
	admingetses();
	
});
function admingetses(){
	$.post("HosMan/admin/getses", {}, function(data) {
		if (data != "null") {
			var lst = $.parseJSON(data);
			$.each(lst, function(i, n) {
				$("#slogid").html(n.slogid);
				$.post("HosMan/selrolebyname", {
					rname:n.rname
				}, function(data1) {
					var lst1 = $.parseJSON(data1);
					$.each(lst1, function(i1, n1) {
						$("#rnamec").html(n1.rnamec);
					});
				});
			});
			
			var url=$.query.get("url");
			var id=$.query.get("id");
			if(url==null||url==""){
				to("HosMan/admin/indexfirst");
				}else{
					to(url);
				}
			if(id!=null||id!=""){
				$("#"+id+"").addClass('active');
			}
		}else{
			alert("请先登录！");
			window.location="HosMan/admin/login";
		}
	});
}

function to(url){
	$("#contents").load(url);
}
function quit(){
	if (confirm("确认退出吗")) {
		$.post("HosMan/admin/logout",{},function(data){
			if(data=="true"){
				alert("退出成功！");
				window.location="HosMan/admin/login";
			}else{
				alert("退出失败！");
			}
		});
	} else {
	}
}

</script>
</body>
</html>

