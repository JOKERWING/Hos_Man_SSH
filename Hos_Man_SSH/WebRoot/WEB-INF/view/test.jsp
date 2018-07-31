<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery.min.js"></script>
	<script>
	function print(){
		window.location="Test/print";
	}
	function fun(){
	    var val = document.getElementById("val").value.split(",");
	    var boxes = document.getElementsByName("test");
	    for(i=0;i<boxes.length;i++){
	        for(j=0;j<val.length;j++){
	            if(boxes[i].value == val[j]){
	                boxes[i].checked = true;
	                break
	            }
	        }
	    }
	}

	</script>
  </head>
  
  <body>
   <input type="button" value="打印" onclick="print();">
   <input name="test" type="checkbox" value="1" />item-1
<input name="test" type="checkbox" value="2" />item-2
<input name="test" type="checkbox" value="3" />item-3
<input name="test" type="checkbox" value="4" />item-4
<input name="test" type="checkbox" value="5" />item-5
<input type="text" id="val"><input type="button" value="确定" onclick="fun()">

   
  </body>
</html>
