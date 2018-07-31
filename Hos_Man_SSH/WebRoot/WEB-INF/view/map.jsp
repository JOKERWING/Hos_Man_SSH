<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MAP</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=aoa63udeoO2URUTOINiyo0daXBtKrrgv"></script>
  </head>
  
  <body>
    <div id="allmap" style="height: 100%;width: 100%;"></div>
   
    <script type="text/javascript">
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
	
</script>	
  </body>
</html>
