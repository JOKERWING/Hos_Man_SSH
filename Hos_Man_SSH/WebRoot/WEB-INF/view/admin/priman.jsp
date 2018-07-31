<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>PRIVILEGE MANAGE</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/moment.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/jquery-ui.js"></script>
<!---/End-date-piker---->
  </head>
  
  <body>
  <div id="body">
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">权限信息管理</h1>
  	<section>
  	<!-- <table class="table1">
  	<tr>
  	<td style="text-align: center;" height="60px;" ><span class="item_name" style="width:120px;">关键字查询: </span>
  	  <input type="text" class="textbox" placeholder="模糊查询" style=""/><a class="inner_btn" onclick="" >查询</a></td>
  	</tr>
  	</table> -->
  	<br><br><br><br>
  	<table class="table1  " >
  	<tr>
  	
  	
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">权限编号: </span></td>
     <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="pidf" onblur="selpriby();"/></td>
     
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">权限名: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="pfunctionf" onblur="selpriby();"/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">权限信息: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="pimformationf" onblur="selpriby();"/></td>
      
      
     <!--  <td><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl"><strong style="color:grey;">权限信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px; " onclick="addpri();">添加</a>
      </div>
      
      <table class="table" id="pritable" ></table>
      
      
      <!-- <aside class="paging">
       <a>第一页</a>
       <a>1</a>
       <a>2</a>
       <a>3</a>
       <a>…</a>
       <a>1004</a>
       <a>最后一页</a>
      </aside> -->
     </section>
   <!-- 弹出提示框 -->
     <section class="pop_bg" id="winupdpri">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;" id="prit">权限信息修改</h3>
      <div class='pop_cont_input' id="winupdpric" >
       
       </div>
     <!--以pop_cont_text分界-->
       <div class="pop_cont_text" style="text-align: center; ">
        	请谨慎处理！
       </div>
      <!--  bottom:operate->button -->
       <div class="btm_btn" id="btn">
        <!-- <input type="button" value="确认" class="input_btn trueBtn" onclick="truebtn();"/>
        <input type="button" value="关闭" class="input_btn falseBtn" onclick="falsebtn();"/> -->
       </div>
      </div>
     </section>
     </div>
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
				});
				selpri();
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selpri(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlistpri",{},function(data){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>权限编号</th><th>权限名</th><th>权限信息</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   str+="<tr><td>"+n.pid+"</td><td>"+n.pfunction+"</td><td>"+n.pimformation+"</td>"; 
						   str+="<td><a class='inner_btn' onclick='delpri("+n.pid+")'>删除</a>";
						   str+="<a class='inner_btn'  onclick='updpri(\""+n.pid+"\")'>修改</a></td></tr>";
					   });
					   $("#pritable").html(str);
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
		});
   };
   function selpriby(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlistpriby",{
					 pid:$("#pidf").val(),
					 pfunction:$("#pfunctionf").val(),
					 pimformation:$("#pimformationf").val()
				},function(data){
					if(data!="null"){
						var lst=$.parseJSON(data);
						   var str="";
						   str+="<tr><th>权限编号</th><th>权限名</th><th>权限信息</th><th>操作</th></tr>";
						   $.each(lst,function(i,n){
							   str+="<tr><td>"+n.pid+"</td><td>"+n.pfunction+"</td><td>"+n.pimformation+"</td>"; 
							   str+="<td><a class='inner_btn' onclick='delpri("+n.pid+")'>删除</a>";
							   str+="<a class='inner_btn'  onclick='updpri(\""+n.pid+"\")'>修改</a></td></tr>";
						   });
						   $("#pritable").html(str);
					}else{
						alert("查询为空！");
					}
					   
				   });
			}else{
				alert("抱歉！您没有查询权限！");
			}
		});
   };
   function delpri(pid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepridelete"
		},function(data1) {
			if(data1=="true"){
				if(confirm("确认删除吗？")){
					   $.post("HosMan/admin/delpri",{
						   pid:pid
						   },function(data){
							   if(data=="nopri"){
								   alert("无此权限信息！");
								   if($("#pidf").val()==""&&$("#pfunctionf").val()==""&&$("#pimformationf").val()==""){
								   	   selpri();
								   }else{
									   selpriby();
								   }
							   }else if(data=="true"){
								   alert("删除成功！");
								   if($("#pidf").val()==""&&$("#pfunctionf").val()==""&&$("#pimformationf").val()==""){
								   	   selpri();
								   }else{
									   selpriby();
								   }
								   }else{
									   alert("删除失败！");
									   if($("#pidf").val()==""&&$("#pfunctionf").val()==""&&$("#pimformationf").val()==""){
									   	   selpri();
									   }else{
										   selpriby();
									   }
									   }
							   });
					   }
			}else{
				alert("抱歉！您没有删除权限！");
			}
		});
	   
   }
   function updpri(pid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriupdate"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/selpribyid",{
					   pid:pid
				   },function(data){
					   if(data!="null"){
						   var lst=$.parseJSON(data);
						   var str=""; 
						   var str1="";
						   str+="<ul>";
						   str+="<table class='table1' >";
						   $.each(lst,function(i,n){
							   str+="<tr><td style='text-align: right'><span >权限编号:</span></td>";
							   str+="<td><input type='text' id='ppid"+n.pid+"' value="+n.pid+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >权限名:</span></td>";
							   str+="<td><input type='text' id='pfunction"+n.pid+"' value="+n.pfunction+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >权限信息:</span></td>";
							   str+="<td><input type='text' id='pimformation"+n.pid+"' value="+n.pimformation+" class='textbox'/></td></tr>";
							   str+="</table1></ul>";
							   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn("+n.pid+");'/>";
							   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
							   $("#prit").html("权限信息修改");
							   $("#winupdpric").html(str);
							   $("#btn").html(str1);
							   //弹出文本性提示框
							   $("#winupdpri").fadeIn();
						   });
						   
					   }else{
						   alert("无法找到此项！");
						   window.location="HosMan/admin/index?url=HosMan/admin/priman";
					   }
				   });
			}else{
				alert("抱歉！您没有修改权限！");
			}
		});
   }
	function truebtn(pid){
		 if(confirm("确认修改吗？")){
			 var pidv=$("#ppid"+pid+"").val();
			 var pfunction=$("#pfunction"+pid+"").val();
			 var pimformation=$("#pimformation"+pid+"").val();
			   $.post("HosMan/admin/updpri",{
				   pid:pidv,
				   pfunction:pfunction,
				   pimformation:pimformation
				   },function(data){
					   if(data=="true"){
						   alert("更新成功！");
						   if($("#pidf").val()==""&&$("#pfunctionf").val()==""&&$("#pimformationf").val()==""){
						   	   selpri();
						   }else{
							   selpriby();
						   }
						}else{
							alert("更新失败！");
							if($("#pidf").val()==""&&$("#pfunctionf").val()==""&&$("#pimformationf").val()==""){
							   	   selpri();
							   }else{
								   selpriby();
							   }
						}
					   $("#winupdpri").fadeOut();
				});
			}
		 }
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selpri();
			 $("#winupdpri").fadeOut();
			 }else{}	   
		 }
	 function addpri(){
		 $.post("HosMan/checkrolepriall", {
				slogid : $("#slogid").html(),
				flag : "rolepriadd"
			},function(data1) {
				if(data1=="true"){
					var str=""; 
					   var str1="";
					   str+="<ul>";
					   str+="<table class='table1' >";
					   str+="<tr><td style='text-align: right'><span >权限编号:</span></td>";
					   str+="<td><input type='text' id='addppid'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >权限名:</span></td>";
					   str+="<td><input type='text' id='addpfunction'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >权限信息:</span></td>";
					   str+="<td><input type='text' id='addpimformation'  class='textbox'/></td></tr>";
					   str+="</table1></ul>";
					   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtnadd();'/>";
					   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtnadd();' style='margin: 0px 5%;'/>";
					   $("#prit").html("权限信息添加");
					   $("#winupdpric").html(str);
					   $("#btn").html(str1);
					   $("#winupdpri").fadeIn();
				}else{
					alert("抱歉！您没有添加权限！");
				}
			});
		 
	   }
		function truebtnadd(){
			 if(confirm("确认添加吗？")){
				 var pidv=$("#addppid").val();
				 var pfunction=$("#addpfunction").val();
				 var pimformation=$("#addpimformation").val();
				   $.post("HosMan/admin/addpri",{
					   pid:pidv,
					   pfunction:pfunction,
					   pimformation:pimformation
					   },function(data){
						   if(data=="true"){
							   alert("添加成功！");
							   if($("#pidf").val()==""&&$("#pfunctionf").val()==""&&$("#pimformationf").val()==""){
							   	   selpri();
							   }else{
								   selpriby();
							   }
							   $("#winupdpri").fadeOut();
							}else if(data=="havepri"){
								   alert("权限编号已存在！");
								}else{
									alert("添加失败！");
									if($("#pidf").val()==""&&$("#pfunctionf").val()==""&&$("#pimformationf").val()==""){
									   	   selpri();
									   }else{
										   selpriby();
									   }
									$("#winupdpri").fadeOut();
									}
					});
				}
			 }
		 //弹出：取消或关闭按钮
		 function falsebtnadd(){
			 if(confirm("确认取消吗？")){
				 selpri();
				 $("#winupdpri").fadeOut();
				 }else{}	   
			 }
	 
		
   </script>
  </body>
</html>
