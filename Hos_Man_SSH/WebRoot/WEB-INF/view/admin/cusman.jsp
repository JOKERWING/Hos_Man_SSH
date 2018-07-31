<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CUSTOMER MANAGE</title>
    
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

  </head>
  
  <body>
  <div id="body">
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">客户信息管理</h1>
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
  	<td style="width: 5%;" class="  "> <span class="item_name" style="width:100px;">编号: </span>
  	<td style="width: 9%;" class="  "> <span class="item_name" style="width:100px;">账号名: </span>
  	<!-- <td style="width: 8%;" class="  "> <span class="item_name" style="width:100px;">密码: </span> -->
  	<td style="width: 6%;" class="  "> <span class="item_name" style="width:100px;">姓名: </span>
  	<td style="width: 5%;" class="  "><span class="item_name" style="width:100px;">性别: </span>
  	<td style="width: 8%;" class="  "> <span class="item_name" style="width:100px;">电话: </span>
  	<td style="width: 12%;" class="  "><span class="item_name" style="width:100px;">身份证号: </span>
  	<td style="width: 12%;" class="  "><span class="item_name" style="width:100px;">电子邮箱: </span>
  	<td style="width: 8%;" class="  "><span class="item_name" style="width:100px;">会员等级: </span>
  	<td style="width: 8%;" class="  "><span class="item_name" style="width:100px;">会员积分: </span>
  	</tr>
  	<tr>
     <td><input type="text" class="textbox" placeholder="" style="width: 90%;" id="cidf" onblur="selcusby();"/></td>
      <td><input type="text" class="textbox" placeholder="" style="width: 90%;" id="clogidf" onblur="selcusby();"/></td>
      <td> <input type="text" class="textbox" placeholder="" style="width: 90%;" id="cnamef" onblur="selcusby();"/></td>
       <td><select class="select" id="csexf" style="width: 90%;" onchange="selcusby();">
      <option value="全部">全</option>
       <option value="男">男</option>
       <option value="女">女</option>
      </select></td>
       <td><input type="text" class="textbox" placeholder="" style="width: 90%;" id="ctelef" onblur="selcusby();"/></td>
       <td><input type="text" class="textbox" placeholder="" style="width: 90%;" id="cidcardf" onblur="selcusby();"/></td>
      <td><input type="text" class="textbox" placeholder="" style="width: 90%;" id="cemailf" onblur="selcusby();"/></td>
       <td><input type="text" class="textbox" placeholder="" style="width: 90%;" id="clevelf" onblur="selcusby();"/></td>
      <td> <input type="text" class="textbox" placeholder="" style="width: 90%;" id="clevscof" onblur="selcusby();"/></td>
     <!--  <td><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl"><strong style="color:grey;">用户信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px; " onclick="addcus();">添加</a>
      </div>
      
      <table class="table" id="custable" ></table>
      
      
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
     <section class="pop_bg" id="winupdcus">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;" id="customert">用户信息修改</h3>
      <div class='pop_cont_input' id="winupdcusc" >
       
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
				selcus();
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selcus(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "customerselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlistcus",{},function(data){
					   if(data!="null"){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>编号</th><th>账号名</th><th>密码</th><th>姓名</th><th>性别</th><th>电话</th><th>身份证号</th><th>电子邮箱</th><th>会员等级</th><th>会员积分</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   /* str+="<tr><td>"+n.cId+"</td><td>"+n.cLogid+"</td><td>"+n.cPwd+"</td><td>"+n.cName+"</td>"; */
						   str+="<tr><td>"+n.cId+"</td><td>"+n.cLogid+"</td><td class='cut_title ellipsis'>**************</td><td>"+n.cName+"</td>";
						   str+="<td>"+n.cSex+"</td><td>"+n.cTele+"</td><td>"+n.cIdcard+"</td><td>"+n.cEmail+"</td><td>"+n.cLevel+"</td><td>"+n.cLevsco+"</td>";
						   str+="<td><a class='inner_btn' onclick='delcus("+n.cId+")'>删除</a>";
						   str+="<a class='inner_btn' id='cid"+n.cId+"' onclick='updcus("+n.cId+")'>修改</a></td></tr>";
						  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
					   });
					   $("#custable").html(str);
					   }
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
		});
	   
   };
   
   function selcusby(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "customerselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlistcusby",{
					cid:$("#cidf").val(),
					clogid:$("#clogidf").val(),
					cname:$("#cnamef").val(),
					csex:$("#csexf").val(),
					ctele:$("#ctelef").val(),
					cidcard:$("#cidcardf").val(),
					cemail:$("#cemailf").val(),
					clevel:$("#clevelf").val(),
					clevsco:$("#clevscof").val()
				   },function(data){
					   if(data!="null"){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>编号</th><th>账号名</th><th>密码</th><th>姓名</th><th>性别</th><th>电话</th><th>身份证号</th><th>电子邮箱</th><th>会员等级</th><th>会员积分</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   /* str+="<tr><td>"+n.cId+"</td><td>"+n.cLogid+"</td><td>"+n.cPwd+"</td><td>"+n.cName+"</td>"; */
						   str+="<tr><td>"+n.cId+"</td><td>"+n.cLogid+"</td><td class='cut_title ellipsis'>**************</td><td>"+n.cName+"</td>";
						   str+="<td>"+n.cSex+"</td><td>"+n.cTele+"</td><td>"+n.cIdcard+"</td><td>"+n.cEmail+"</td><td>"+n.cLevel+"</td><td>"+n.cLevsco+"</td>";
						   str+="<td><a class='inner_btn' onclick='delcus("+n.cId+")'>删除</a>";
						   str+="<a class='inner_btn' id='cid"+n.cId+"' onclick='updcus("+n.cId+")'>修改</a></td></tr>";
						  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
					   });
					   $("#custable").html(str);
					   }else{
						   alert("查询为空！");
					   }
				   });
			}else{
				alert("抱歉！您没有查询权限！");
			}
		});
	   
   };
   function delcus(cid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "customerdelete"
		},function(data1) {
			if(data1=="true"){
				if(confirm("确认删除吗？")){
					   $.post("HosMan/admin/delcus",{
						   cid:cid
						   },function(data){
							   if(data=="nocus"){
								   alert("无此用户！");
								   if($("#cidf").val()==""&&$("#clogidf").val()==""&&$("#cnamef").val()==""&&$("#csexf").val()=="全部"&&$("#ctelef").val()==""&&$("#cidcardf").val()==""&&$("#cemailf").val()==""
										  &&$("#clevelf").val()==""&&$("#clevscof").val()==""){
									   selcus();
								   }else{
									   selcusby();
								   }
								}else if(data=="true"){
									alert("删除成功！");
									if($("#cidf").val()==""&&$("#clogidf").val()==""&&$("#cnamef").val()==""&&$("#csexf").val()=="全部"&&$("#ctelef").val()==""&&$("#cidcardf").val()==""&&$("#cemailf").val()==""
										  &&$("#clevelf").val()==""&&$("#clevscof").val()==""){
									   selcus();
								   }else{
									   selcusby();
								   }
									}else{
										alert("删除失败！");
										if($("#cidf").val()==""&&$("#clogidf").val()==""&&$("#cnamef").val()==""&&$("#csexf").val()=="全部"&&$("#ctelef").val()==""&&$("#cidcardf").val()==""&&$("#cemailf").val()==""
											  &&$("#clevelf").val()==""&&$("#clevscof").val()==""){
										   selcus();
									   }else{
										   selcusby();
									   }
										}
							   });
					   }
			}else{
				alert("抱歉！您没有删除权限！");
			}
		});
	   
   }
   function updcus(cid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "customerupdate"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/selcusbyid",{
					   cid:cid
				   },function(data){
					   if(data!="null"){
						   var lst=$.parseJSON(data);
						   var str=""; 
						   var str1="";
						   str+="<ul>";
						   str+="<table class='table1' >";
						   $.each(lst,function(i,n){
							   str+="<tr><td style='text-align: right'><span >编号:</span></td>";
							   str+="<td><input type='text' id='ccid"+n.cId+"' value="+n.cId+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >账号名:</span></td>";
							   str+="<td><input type='text' id='clogid"+n.cId+"' value="+n.cLogid+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >密码:</span></td>";
							   str+="<td><input type='password' id='cpwd"+n.cId+"' value="+n.cPwd+" class='textbox' /></td></tr>";
							   str+="<tr><td style='text-align: right'><span >确认密码:</span></td>";
							   str+="<td><input type='password' id='cpwd1"+n.cId+"' value="+n.cPwd+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >姓名:</span></td>";
							   str+="<td><input type='text' id='cname"+n.cId+"' value="+n.cName+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>性别:</span></td>";
							   str+="<td><input type='text' id='csex"+n.cId+"' value="+n.cSex+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>电话:</span></td>";
							   str+="<td><input type='text' id='ctele"+n.cId+"' value="+n.cTele+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>身份证号:</span></td>";
							   str+="<td><input type='text' id='cidcard"+n.cId+"' value="+n.cIdcard+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>电子邮箱:</span></td>";
							   str+="<td><input type='text' id='cemail"+n.cId+"' value="+n.cEmail+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>会员等级:</span></td>";
							   str+="<td><input type='text' id='clevel"+n.cId+"' value="+n.cLevel+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>会员积分:</span></td>";
							   str+="<td><input type='text' id='clevsco"+n.cId+"' value="+n.cLevsco+" class='textbox' readonly='true'/></td></tr>";
							   str+="</table1></ul>";
							   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn("+n.cId+");'/>";
							   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
							   $("#customert").html("用户信息修改");
							   $("#winupdcusc").html(str);
							   $("#btn").html(str1);
							   //弹出文本性提示框
							   $("#winupdcus").fadeIn();
						   });
						   
					   }else{
						   alert("无法找到此项！");
						   window.location="HosMan/admin/index?url=HosMan/admin/cusman";
					   }
				   });
			}else{
				alert("抱歉！您没有修改权限！");
			}
		});
	   
   }
	function truebtn(cid){
		 if(confirm("确认修改吗？")){
			 var cidv=$("#ccid"+cid+"").val();
			 var clogid=$("#clogid"+cid+"").val();
			 var cpwd=$("#cpwd"+cid+"").val();
			 var cpwd1=$("#cpwd1"+cid+"").val();
			 var cname=$("#cname"+cid+"").val();
			 var csex=$("#csex"+cid+"").val();
			 var ctele=$("#ctele"+cid+"").val();
			 var cidcard=$("#cidcard"+cid+"").val();
			 var cemail=$("#cemail"+cid+"").val();
			 var clevel=$("#clevel"+cid+"").val();
			 var clevsco=$("#clevsco"+cid+"").val();
			 if(cpwd!=cpwd1){
				 alert("密码前后不一致！");
				 $("#cpwd1"+cid+"").focus();
			 }else{
			   $.post("HosMan/admin/updcus",{
				   cid:cidv,
				   clogid:clogid,
				   cpwd:cpwd,
				   cname:cname,
				   csex:csex,
				   ctele:ctele,
				   cidcard:cidcard,
				   cemail:cemail,
				   clevel:clevel,
				   clevsco:clevsco
				   },function(data){
					   if(data=="true"){
						   alert("更新成功！");
						   if($("#cidf").val()==""&&$("#clogidf").val()==""&&$("#cnamef").val()==""&&$("#csexf").val()=="全部"&&$("#ctelef").val()==""&&$("#cidcardf").val()==""&&$("#cemailf").val()==""
								  &&$("#clevelf").val()==""&&$("#clevscof").val()==""){
							   selcus();
						   }else{
							   selcusby();
						   }
						}else{
							alert("更新失败！");
							if($("#cidf").val()==""&&$("#clogidf").val()==""&&$("#cnamef").val()==""&&$("#csexf").val()=="全部"&&$("#ctelef").val()==""&&$("#cidcardf").val()==""&&$("#cemailf").val()==""
								  &&$("#clevelf").val()==""&&$("#clevscof").val()==""){
							   selcus();
						   }else{
							   selcusby();
						   }
						}
					   $("#winupdcus").fadeOut();
				});
			}
		 }
		 }
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selcus();
			 $("#winupdcus").fadeOut();
			 }else{}	   
		 }
	 function addcus(){
		 $.post("HosMan/checkrolepriall", {
				slogid : $("#slogid").html(),
				flag : "customeradd"
			},function(data1) {
				if(data1=="true"){
					var str=""; 
					   var str1="";
					   str+="<ul>";
					   str+="<table class='table1' >";
						   str+="<tr><td style='text-align: right'><span >账号名:</span></td>";
						   str+="<td><input type='text' id='addclogid'  class='textbox'/></td></tr>";
						   str+="<tr><td style='text-align: right'><span >密码:</span></td>";
						   str+="<td><input type='password' id='addcpwd'  class='textbox'/></td></tr>";
						   str+="<tr><td style='text-align: right'><span >确认密码:</span></td>";
						   str+="<td><input type='password' id='addcpwd1'  class='textbox'/></td></tr>";
						   str+="<tr><td style='text-align: right'><span >姓名:</span></td>";
						   str+="<td><input type='text' id='addcname'  class='textbox'/></td></tr>";
						   str+="<tr><td style='text-align: right'><span>性别:</span></td>";
						   str+="<td><input type='text' id='addcsex'  class='textbox'/></td></tr>";
						   str+="<tr><td style='text-align: right'><span>电话:</span></td>";
						   str+="<td><input type='text' id='addctele'  class='textbox'/></td></tr>";
						   str+="<tr><td style='text-align: right'><span>身份证号:</span></td>";
						   str+="<td><input type='text' id='addcidcard'  class='textbox'/></td></tr>";
						   str+="<tr><td style='text-align: right'><span>电子邮箱:</span></td>";
						   str+="<td><input type='text' id='addcemail'  class='textbox'/></td></tr>";
						   str+="</table1></ul>";
						   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtnadd();'/>";
						   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtnadd();' style='margin: 0px 5%;'/>";
						   $("#customert").html("用户信息添加");
						   $("#winupdcusc").html(str);
						   $("#btn").html(str1);
						   $("#winupdcus").fadeIn();
				}else{
					alert("抱歉！您没有添加权限！");
				}
			});
				   
	   }
		function truebtnadd(){
			 if(confirm("确认添加吗？")){
				 var clogid=$("#addclogid").val();
				 var cpwd=$("#addcpwd").val();
				 var cpwd1=$("#addcpwd1").val();
				 var cname=$("#addcname").val();
				 var csex=$("#addcsex").val();
				 var ctele=$("#addctele").val();
				 var cidcard=$("#addcidcard").val();
				 var cemail=$("#addcemail").val();
				 if(clogid==null||clogid==""||cpwd==null||cpwd==""||cpwd1==null||cpwd1==""||cname==null||cname==""||csex==null||csex==""||ctele==null||ctele==""||cidcard==null||cidcard==""||cemail==null||cemail==""){
					 alert("某一项或多项未输入！");
				 }else if(cpwd!=cpwd1){
					 alert("密码前后不一致！");
					 $("#addcpwd1").focus();
				 }else{
					 $.post("HosMan/admin/addcus",{
						   clogid:clogid,
						   cpwd:cpwd,
						   cname:cname,
						   csex:csex,
						   ctele:ctele,
						   cidcard:cidcard,
						   cemail:cemail
						   },function(data){
							   if(data=="true"){
								   alert("添加成功！");
								   if($("#cidf").val()==""&&$("#clogidf").val()==""&&$("#cnamef").val()==""&&$("#csexf").val()=="全部"&&$("#ctelef").val()==""&&$("#cidcardf").val()==""&&$("#cemailf").val()==""
										  &&$("#clevelf").val()==""&&$("#clevscof").val()==""){
									   selcus();
								   }else{
									   selcusby();
								   }
								   $("#winupdcus").fadeOut();
								}else if(data=="havelogid"){
									alert("账号名已存在！请重新输入！");
									}else{
										alert("添加失败！");
										if($("#cidf").val()==""&&$("#clogidf").val()==""&&$("#cnamef").val()==""&&$("#csexf").val()=="全部"&&$("#ctelef").val()==""&&$("#cidcardf").val()==""&&$("#cemailf").val()==""
											  &&$("#clevelf").val()==""&&$("#clevscof").val()==""){
										   selcus();
									   }else{
										   selcusby();
									   }
										 $("#winupdcus").fadeOut();
										}
						});
				 }
				  
				}
			 }
		 //弹出：取消或关闭按钮
		 function falsebtnadd(){
			 if(confirm("确认取消吗？")){
				 selcus();
				 $("#winupdcus").fadeOut();
				 }else{}	   
			 }
	 
		
   </script>
  </body>
</html>
