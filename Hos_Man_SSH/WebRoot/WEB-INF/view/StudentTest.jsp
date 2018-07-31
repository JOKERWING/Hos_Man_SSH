<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'StudentTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery.min.js"></script>
  </head>
  
  <body>
    <h3 align="center">考试成绩查询网站程序</h3><br><br>
    <div align="center">请输入学生编号<input id="studentid"> <input type="button" id="btn" onclick="search();" value="确认"><br><br><br>
    <table id="table" border="1px solid black" style="display: none;width: 40%;text-align: center" align="center" >
    <tr>
    	<td>
    	学生姓名
    	</td>
    	<td>
    	性别
    	</td>
    	<td>
    	成绩
    	</td>
    </tr>
    <tr id="tr">
    </tr>
    </table>
    </div>
    <script>
    function search(){
    	var id=$("#studentid").val();
    	if(id==null||id==""){
    		alert("请输入学生编号！");
    		return;
    	}
    	$.post(
				"StudentTest/seltestbystuid",
				{
					studentid : id
				},
				function(data) {
					if(data=="null"){
						alert("无数据！");
						$("#table").hide();
					}else{
						var lst = $.parseJSON(data);
						var html="";
						$.each(lst,function(i, n) {
							html += "<td>"+ n.name+ "</td>";
							html += "<td>"+ n.gender+ "</td>";
							html += "<td>"+ n.score+ "</td>";
								});
						$("#tr").html(html);
						$("#table").show();
					}
					
    			});	
   }
    
    
    
    </script>
  </body>
</html>
