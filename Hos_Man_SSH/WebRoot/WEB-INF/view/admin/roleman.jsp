<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ROLE MANAGE</title>
    
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
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">角色信息管理</h1>
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
  	
  	
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">角色编号: </span></td>
     <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="ridf" onblur="selroleby();"/></td>
     
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">角色名: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rnamef" onblur="selroleby();"/></td>
      
      <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">角色名称: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rnamecf" onblur="selroleby();"/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">角色信息: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rimformationf" onblur="selroleby();"/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">角色最大人数: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rmaxnumf" onblur="selroleby();"/></td>
      
     <!--  <td><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl" ><strong style="color:grey;">角色信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px; " onclick="addrole();">添加</a>
      </div>
      
      <table class="table" id="roletable" ></table>
      
      
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
     <section class="pop_bg" id="winupdrole">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;" id="rolet">角色信息修改</h3>
      <div class='pop_cont_input' id="winupdrolec" >
       
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
				selrole();
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   
   function selrole(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriselect"
		},function(data1) {
			if(data1=="true"){
				 $.post("HosMan/getlistrole",{},function(data){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>角色编号</th><th>角色名</th><th>角色名称</th><th>角色信息</th><th>角色最大人数</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   str+="<tr><td>"+n.rid+"</td><td>"+n.rname+"</td><td>"+n.rnamec+"</td><td>"+n.rimformation+"</td><td>"+n.rmaxnum+"</td>"; 
						   str+="<td><a class='inner_btn' onclick='delrole("+n.rid+")'>删除</a>";
						   str+="<a class='inner_btn'  onclick='updrole(\""+n.rid+"\")'>修改</a></td></tr>";
					   });
					   $("#roletable").html(str);
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
		});
	  
   };
   function selroleby(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriselect"
		},function(data1) {
			if(data1=="true"){
				 $.post("HosMan/getlistroleby",{
					 rid:$("#ridf").val(),
					 rname:$("#rnamef").val(),
					 rnamec:$("#rnamecf").val(),
					 rimformation:$("#rimformationf").val(),
					 rmaxnum:$("#rmaxnumf").val()
				 },function(data){
					 if(data!="null"){
						 var lst=$.parseJSON(data);
						   var str="";
						   str+="<tr><th>角色编号</th><th>角色名</th><th>角色名称</th><th>角色信息</th><th>角色最大人数</th><th>操作</th></tr>";
						   $.each(lst,function(i,n){
							   str+="<tr><td>"+n.rid+"</td><td>"+n.rname+"</td><td>"+n.rnamec+"</td><td>"+n.rimformation+"</td><td>"+n.rmaxnum+"</td>"; 
							   str+="<td><a class='inner_btn' onclick='delrole("+n.rid+")'>删除</a>";
							   str+="<a class='inner_btn'  onclick='updrole(\""+n.rid+"\")'>修改</a></td></tr>";
						   });
						   $("#roletable").html(str);
					 }else{
						 alert("查询为空！");
					 }
				   });
			}else{
				alert("抱歉！您没有查询权限！");
			}
		});
	  
   };
   function delrole(rid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepridelete"
		},function(data1) {
			if(data1=="true"){
				if(confirm("确认删除吗？")){
					   $.post("HosMan/admin/delrole",{
						   rid:rid
						   },function(data){
							   if(data=="norole"){
								   alert("无此角色信息！");
								   if($("#ridf").val()==""&&$("#rnamef").val()==""&&$("#rnamecf").val()==""&&$("#rimformationf").val()==""&&$("#rmaxnumf").val()==""){
									   		selrole();
									   }else{
										   selroleby();
									   }
							   }else if(data=="true"){
								   alert("删除成功！");
								   if($("#ridf").val()==""&&$("#rnamef").val()==""&&$("#rnamecf").val()==""&&$("#rimformationf").val()==""&&$("#rmaxnumf").val()==""){
								   		selrole();
								   }else{
									   selroleby();
								   }
								   }else{
									   alert("删除失败！");
									   if($("#ridf").val()==""&&$("#rnamef").val()==""&&$("#rnamecf").val()==""&&$("#rimformationf").val()==""&&$("#rmaxnumf").val()==""){
									   		selrole();
									   }else{
										   selroleby();
									   }
									   }
							   });
					   }
			}else{
				alert("抱歉！您没有删除权限！");
			}
		});
	   
   }
   function updrole(rid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriupdate"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/selrolebyid",{
					   rid:rid
				   },function(data){
					   if(data!="null"){
						   var lst=$.parseJSON(data);
						   var str=""; 
						   var str1="";
						   str+="<ul>";
						   str+="<table class='table1' >";
						   $.each(lst,function(i,n){
							   str+="<tr><td style='text-align: right'><span >角色编号:</span></td>";
							   str+="<td><input type='text' id='rrid"+n.rid+"' value="+n.rid+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >角色名:</span></td>";
							   str+="<td><input type='text' id='rname"+n.rid+"' value="+n.rname+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >角色名称:</span></td>";
							   str+="<td><input type='text' id='rnamec"+n.rid+"' value="+n.rnamec+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >角色信息:</span></td>";
							   str+="<td><input type='text' id='rimformation"+n.rid+"' value="+n.rimformation+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >角色最大人数:</span></td>";
							   str+="<td><input type='text' id='rmaxnum"+n.rid+"' value="+n.rmaxnum+" class='textbox'/></td></tr>";
							   str+="</table1></ul>";
							   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn("+n.rid+");'/>";
							   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
							   $("#rolet").html("角色信息修改");
							   $("#winupdrolec").html(str);
							   $("#btn").html(str1);
							   //弹出文本性提示框
							   $("#winupdrole").fadeIn();
						   });
						   
					   }else{
						   alert("无法找到此项！");
						   window.location="HosMan/admin/index?url=HosMan/admin/roleman";
					   }
				   });
			}else{
				alert("抱歉！您没有修改权限！");
			}
		});
	   
   }
	function truebtn(rid){
		 if(confirm("确认修改吗？")){
			 var ridv=$("#rrid"+rid+"").val();
			 var rname=$("#rname"+rid+"").val();
			 var rnamec=$("#rnamec"+rid+"").val();
			 var rimformation=$("#rimformation"+rid+"").val();
			 var rmaxnum=$("#rmaxnum"+rid+"").val();
			   $.post("HosMan/admin/updrole",{
				   rid:ridv,
				   rname:rname,
				   rnamec:rnamec,
				   rimformation:rimformation,
				   rmaxnum:rmaxnum
				   },function(data){
					   if(data=="true"){
						   alert("更新成功！");
						   if($("#ridf").val()==""&&$("#rnamef").val()==""&&$("#rnamecf").val()==""&&$("#rimformationf").val()==""&&$("#rmaxnumf").val()==""){
						   		selrole();
						   }else{
							   selroleby();
						   }
						}else{
							alert("更新失败！");
							if($("#ridf").val()==""&&$("#rnamef").val()==""&&$("#rnamecf").val()==""&&$("#rimformationf").val()==""&&$("#rmaxnumf").val()==""){
						   		selrole();
						   }else{
							   selroleby();
						   }
						}
					   $("#winupdrole").fadeOut();
				});
			}
		 }
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selrole();
			 $("#winupdrole").fadeOut();
			 }else{}	   
		 }
	 function addrole(){
		 $.post("HosMan/checkrolepriall", {
				slogid : $("#slogid").html(),
				flag : "rolepriadd"
			},function(data1) {
				if(data1=="true"){
					var str=""; 
					   var str1="";
					   str+="<ul>";
					   str+="<table class='table1' >";
					   str+="<tr><td style='text-align: right'><span >角色编号:</span></td>";
					   str+="<td><input type='text' id='addrrid'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >角色名:</span></td>";
					   str+="<td><input type='text' id='addrname'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >角色名称:</span></td>";
					   str+="<td><input type='text' id='addrnamec'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >角色信息:</span></td>";
					   str+="<td><input type='text' id='addrimformation'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >角色最大人数:</span></td>";
					   str+="<td><input type='text' id='addrmaxnum'  class='textbox'/></td></tr>";
					   str+="</table1></ul>";
					   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtnadd();'/>";
					   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtnadd();' style='margin: 0px 5%;'/>";
					   $("#rolet").html("角色信息添加");
					   $("#winupdrolec").html(str);
					   $("#btn").html(str1);
					   $("#winupdrole").fadeIn();
				}else{
					alert("抱歉！您没有添加权限！");
				}
			});
		 
	   }
		function truebtnadd(){
			 if(confirm("确认添加吗？")){
				 var ridv=$("#addrrid").val();
				 var rname=$("#addrname").val();
				 var rnamec=$("#addrnamec").val();
				 var rimformation=$("#addrimformation").val();
				 var rmaxnum=$("#addrmaxnum").val();
				   $.post("HosMan/admin/addrole",{
					   rid:ridv,
					   rname:rname,
					   rnamec:rnamec,
					   rimformation:rimformation,
					   rmaxnum:rmaxnum
					   },function(data){
						   if(data=="true"){
							   alert("添加成功！");
							   if($("#ridf").val()==""&&$("#rnamef").val()==""&&$("#rnamecf").val()==""&&$("#rimformationf").val()==""&&$("#rmaxnumf").val()==""){
							   		selrole();
							   }else{
								   selroleby();
							   }
							   $("#winupdrole").fadeOut();
							}else if(data=="haverole"){
								   alert("角色编号已存在！");
								   }else{
									   alert("添加失败！");
									   if($("#ridf").val()==""&&$("#rnamef").val()==""&&$("#rnamecf").val()==""&&$("#rimformationf").val()==""&&$("#rmaxnumf").val()==""){
									   		selrole();
									   }else{
										   selroleby();
									   }
									   $("#winupdrole").fadeOut();
									   }
						   });
				   }
			 }
		 function falsebtnadd(){
			 if(confirm("确认取消吗？")){
				 selrole();
				 $("#winupdrole").fadeOut();
				 }else{}	   
			 }
	 
		
   </script>
  </body>
</html>
