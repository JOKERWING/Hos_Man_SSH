<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>STAFF MANAGE</title>
    
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
<script>


	$(function() {
		 /* $.datepicker._gotoToday = function () {
             $("#bindatef").datepicker('setDate', new Date()).datepicker('hide').blur();
         };
         $.datepicker._gotoToday = function () {
             $("#boutdatef").datepicker('setDate', new Date()).datepicker('hide').blur();
         }; */
         $.datepicker._gotoToday = function (id) { 
        	 var target = $(id); 
        	 var inst = this._getInst(target[0]); 
        	 if (this._get(inst, 'gotoCurrent') && inst.currentDay) { 
        	 inst.selectedDay = inst.currentDay; 
        	 inst.drawMonth = inst.selectedMonth = inst.currentMonth; 
        	 inst.drawYear = inst.selectedYear = inst.currentYear; 
        	 } 
        	 else { 
        	 var date = new Date(); 
        	 inst.selectedDay = date.getDate(); 
        	 inst.drawMonth = inst.selectedMonth = date.getMonth(); 
        	 inst.drawYear = inst.selectedYear = date.getFullYear(); 
        	 this._setDateDatepicker(target, date); 
        	 this._selectDate(id, this._getDateDatepicker(target)); 
        	 } 
        	 this._notifyChange(inst); 
        	 this._adjustDate(target); 
        	 } ;
		$("#sbirthf").datepicker({
			/* minDate : new Date(),
			maxDate : 90 */
		});
	});

	/* function newoutdate() {
	var sdate = $("#indate").val();
	var edate = new Date();
	var edate1 = edate.toLocaleDateString();
	var sArr = sdate.split("/");
	var eArr = edate1.split("/");
	var sRDate = new Date(sArr[0], sArr[1], sArr[2]);
	var eRDate = new Date(eArr[0], eArr[1], eArr[2]);
	var result;
	if(sdate=="年/月/日"){
	result=1;}
	else{
	result = (sRDate - eRDate) / (24 * 60 * 60 * 1000)+1;
	}
	 $("#outdate").datepicker({
		minDate : result,
		maxDate:30
	}); 
	alert(result);

	}  */
</script>
<!---/End-date-piker---->
  </head>
  
  <body>
  <div id="body">
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">职工信息管理</h1>
  	<section>
  	<!-- <table class="table1">
  	<tr>
  	<td style="text-align: center;" height="60px;" ><span class="item_name" style="width:120px;">关键字查询: </span>
  	  <input type="text" class="textbox" placeholder="模糊查询" style=""/><a class="inner_btn" onclick="" >查询</a></td>
  	</tr>
  	</table>-->
  	<br><br><br><br>
  	<table class="table1  " > 
  	<tr>
  	
  	
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">账号名: </span></td>
     <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="slogidf" onblur="selstaby();"/></td>
     
<!--      <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">密码: </span></td>
     <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="spwdf"/></td> -->
     
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">姓名: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="snamef" onblur="selstaby();"/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">性别: </span></td>
      <td style="width: ;" class="  "><select class="select" id="ssexf" style="width: 90%;" onchange="selstaby();">
      <option value="全部">全</option>
       <option value="男">男</option>
       <option value="女">女</option>
      </select></td>
      
      <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">生日: </span></td>
     <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="sbirthf" onchange="selstaby();"/></td>
      
      <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">邮箱:</span></td>
     <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="semailf" onblur="selstaby();"/></td>
      </tr><tr>
      <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">电话: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="stelef" onblur="selstaby();"/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">身份证号: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="sidcardf" onblur="selstaby();"/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">住址: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="saddressf" onblur="selstaby();"/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">角色名: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rnamef" onblur="selstaby();"/></td>
      
      
      
      
     <!--  <td><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl"><strong style="color:grey;">职工信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px; " onclick="addsta();">添加</a>
      </div>
      
      <table class="table" id="statable" ></table>
      
      
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
     <section class="pop_bg" id="winupdsta">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;" id="stat">职工信息修改</h3>
      <div class='pop_cont_input' id="winupdstac" >
       
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
				selsta();
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selsta(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "staffselect"
		},function(data1) {
			if(data1=="true"){
				 $.post("HosMan/getliststa",{},function(data){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>账号名</th><th>密码</th><th>姓名</th><th>性别</th><th>生日</th><th>电子邮箱</th><th>电话</th><th>身份证号</th><th>住址</th><th>角色名</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   var sbirth=moment(n.sbirth).format('YYYY-MM-DD');
						   /* str+="<tr><td>"+n.slogid+"</td><td>"+n.spwd+"</td><td>"+n.sname+"</td><td>"+n.ssex+"</td>"; */
						   str+="<tr><td>"+n.slogid+"</td><td >**************</td><td>"+n.sname+"</td><td>"+n.ssex+"</td>"; 
						   str+="<td>"+sbirth+"</td><td>"+n.semail+"</td><td>"+n.stele+"</td><td>"+n.sidcard+"</td><td>"+n.saddress+"</td><td>"+n.rname+"</td>";
						   str+="<td><a class='inner_btn' onclick='delsta(\""+n.slogid+"\")'>删除</a>";
						   str+="<a class='inner_btn'  onclick='updsta(\""+n.slogid+"\")'>修改</a></td></tr>";
						  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
					   });
					   $("#statable").html(str);
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
		});
	  
   };
   function selstaby(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "staffselect"
		},function(data1) {
			if(data1=="true"){
				 $.post("HosMan/getliststaby",{
					 slogid:$("#slogidf").val(),
					 sname:$("#snamef").val(),
					 ssex:$("#ssexf").val(),
					 sbirth:$("#sbirthf").val(),
					 semail:$("#semailf").val(),
					 stele:$("#stelef").val(),
					 sidcard:$("#sidcardf").val(),
					 saddress:$("#saddressf").val(),
					 rname:$("#rnamef").val()
				 },function(data){
					 if(data!="null"){
						 var lst=$.parseJSON(data);
						   var str="";
						   str+="<tr><th>账号名</th><th>密码</th><th>姓名</th><th>性别</th><th>生日</th><th>电子邮箱</th><th>电话</th><th>身份证号</th><th>住址</th><th>角色名</th><th>操作</th></tr>";
						   $.each(lst,function(i,n){
							   var sbirth=moment(n.sbirth).format('YYYY-MM-DD');
							   /* str+="<tr><td>"+n.slogid+"</td><td>"+n.spwd+"</td><td>"+n.sname+"</td><td>"+n.ssex+"</td>"; */
							   str+="<tr><td>"+n.slogid+"</td><td >**************</td><td>"+n.sname+"</td><td>"+n.ssex+"</td>"; 
							   str+="<td>"+sbirth+"</td><td>"+n.semail+"</td><td>"+n.stele+"</td><td>"+n.sidcard+"</td><td>"+n.saddress+"</td><td>"+n.rname+"</td>";
							   str+="<td><a class='inner_btn' onclick='delsta(\""+n.slogid+"\")'>删除</a>";
							   str+="<a class='inner_btn'  onclick='updsta(\""+n.slogid+"\")'>修改</a></td></tr>";
							  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
						   });
						   $("#statable").html(str);
					 }else{
						 alert("查询为空！");
					 }
					  
				   });
			}else{
				alert("抱歉！您没有查询权限！");
			}
		});
	  
   };
   function delsta(slogid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "staffdelete"
		},function(data1) {
			if(data1=="true"){
				if(confirm("确认删除吗？")){
					   $.post("HosMan/admin/delsta",{
						   slogid:slogid
						   },function(data){
							   if(data=="nosta"){
								   alert("无此员工！");
									 if($("#slogidf").val()==""&&$("#snamef").val()==""&&$("#ssexf").val()=="全部"
											 &&$("#sbirthf").val()==""&&$("#semailf").val()==""&&$("#stelef").val()==""
											 &&$("#sidcardf").val()==""&&$("#saddressf").val()==""&&$("#rnamef").val()==""){
										 	selsta();
									   }else{
										   selstaby();
									   }
							   }else if(data=="true"){
								   alert("删除成功！");
								   if($("#slogidf").val()==""&&$("#snamef").val()==""&&$("#ssexf").val()=="全部"
										 &&$("#sbirthf").val()==""&&$("#semailf").val()==""&&$("#stelef").val()==""
										 &&$("#sidcardf").val()==""&&$("#saddressf").val()==""&&$("#rnamef").val()==""){
									 	selsta();
								   }else{
									   selstaby();
								   }
								   }else{
									   alert("删除失败！");
									   if($("#slogidf").val()==""&&$("#snamef").val()==""&&$("#ssexf").val()=="全部"
											 &&$("#sbirthf").val()==""&&$("#semailf").val()==""&&$("#stelef").val()==""
											 &&$("#sidcardf").val()==""&&$("#saddressf").val()==""&&$("#rnamef").val()==""){
										 	selsta();
									   }else{
										   selstaby();
									   }
									   }
							   });
					   }
			}else{
				alert("抱歉！您没有删除权限！");
			}
		});
	   
   }
   function updsta(slogid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "staffupdate"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/selstabyid",{
					   slogid:slogid
				   },function(data){
					   if(data!="null"){
						   var lst=$.parseJSON(data);
						   var str=""; 
						   var str1="";
						   str+="<ul>";
						   str+="<table class='table1' >";
						   $.each(lst,function(i,n){
							   var sbirth=moment(n.sbirth).format('YYYY-MM-DD');
							   str+="<tr><td style='text-align: right'><span >账号名:</span></td>";
							   str+="<td><input type='text' id='sslogid"+n.slogid+"' value="+n.slogid+" class='textbox'readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >密码:</span></td>";
							   str+="<td><input type='password' id='spwd"+n.slogid+"' value="+n.spwd+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >确认密码:</span></td>";
							   str+="<td><input type='password' id='spwd1"+n.slogid+"' value="+n.spwd+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >姓名:</span></td>";
							   str+="<td><input type='text' id='sname"+n.slogid+"' value="+n.sname+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >性别:</span></td>";
							   str+="<td><input type='text' id='ssex"+n.slogid+"' value="+n.ssex+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>生日:</span></td>";
							   str+="<td><input type='text' id='sbirth"+n.slogid+"' value="+sbirth+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>电子邮件:</span></td>";
							   str+="<td><input type='text' id='semail"+n.slogid+"' value="+n.semail+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>电话:</span></td>";
							   str+="<td><input type='text' id='stele"+n.slogid+"' value="+n.stele+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>身份证号:</span></td>";
							   str+="<td><input type='text' id='sidcard"+n.slogid+"' value="+n.sidcard+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>住址:</span></td>";
							   str+="<td><input type='text' id='saddress"+n.slogid+"' value="+n.saddress+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>角色名:</span></td>";
							   str+="<td><input type='text' id='rname"+n.slogid+"' value="+n.rname+" class='textbox' readonly='true'/></td></tr>";
							   str+="</table1></ul>";
							   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn(\""+n.slogid+"\");'/>";
							   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
							   $("#stat").html("职工信息修改");
							   $("#winupdstac").html(str);
							   $("#btn").html(str1);
							   $("#sbirth"+n.slogid+"").datepicker({});
							   //弹出文本性提示框
							   $("#winupdsta").fadeIn();
						   });
						   
					   }else{
						   alert("无法找到此项！");
						   window.location="HosMan/admin/index?url=HosMan/admin/staman";
					   }
				   });
			}else{
				alert("抱歉！您没有修改权限！");
			}
		});
	   
   }
	function truebtn(slogid){
		 if(confirm("确认修改吗？")){
			 var slogidv=$("#sslogid"+slogid+"").val();
			 var spwd=$("#spwd"+slogid+"").val();
			 var spwd1=$("#spwd1"+slogid+"").val();
			 var sname=$("#sname"+slogid+"").val();
			 var ssex=$("#ssex"+slogid+"").val();
			 var sbirth=$("#sbirth"+slogid+"").val();
			 var semail=$("#semail"+slogid+"").val();
			 var stele=$("#stele"+slogid+"").val();
			 var sidcard=$("#sidcard"+slogid+"").val();
			 var saddress=$("#saddress"+slogid+"").val();
			 var rname=$("#rname"+slogid+"").val();
			 if(spwd!=spwd1){
				 alert("密码前后不一致！");
				 $("#spwd1"+slogid+"").focus();
			 }else{
			   $.post("HosMan/admin/updsta",{
				   slogid:slogidv,
				   spwd:spwd,
				   sname:sname,
				   ssex:ssex,
				   sbirth:sbirth,
				   semail:semail,
				   stele:stele,
				   sidcard:sidcard,
				   saddress:saddress,
				   rname:rname
				   },function(data){
					   if(data=="true"){
						   alert("更新成功！");
						   if($("#slogidf").val()==""&&$("#snamef").val()==""&&$("#ssexf").val()=="全部"
								 &&$("#sbirthf").val()==""&&$("#semailf").val()==""&&$("#stelef").val()==""
								 &&$("#sidcardf").val()==""&&$("#saddressf").val()==""&&$("#rnamef").val()==""){
							 	selsta();
						   }else{
							   selstaby();
						   }
						}else{
							alert("更新失败！");
							if($("#slogidf").val()==""&&$("#snamef").val()==""&&$("#ssexf").val()=="全部"
								 &&$("#sbirthf").val()==""&&$("#semailf").val()==""&&$("#stelef").val()==""
								 &&$("#sidcardf").val()==""&&$("#saddressf").val()==""&&$("#rnamef").val()==""){
							 	selsta();
						   }else{
							   selstaby();
						   }
						}
					   $("#winupdsta").fadeOut();
				});
			}
		 }
		 }
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selsta();
			 $("#winupdsta").fadeOut();
			 }else{}	   
		 }
	 function addsta(){
		 $.post("HosMan/checkrolepriall", {
				slogid : $("#slogid").html(),
				flag : "staffadd"
			},function(data1) {
				if(data1=="true"){
					var str=""; 
					   var str1="";
					   str+="<ul>";
					   str+="<table class='table1' >";
					   str+="<tr><td style='text-align: right'><span >账号名:</span></td>";
					   str+="<td><input type='text' id='addsslogid'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >密码:</span></td>";
					   str+="<td><input type='password' id='addspwd'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >确认密码:</span></td>";
					   str+="<td><input type='password' id='addspwd1'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >姓名:</span></td>";
					   str+="<td><input type='text' id='addsname'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >性别:</span></td>";
					   str+="<td><input type='text' id='addssex'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>生日:</span></td>";
					   str+="<td><input type='text' id='addsbirth'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>电子邮件:</span></td>";
					   str+="<td><input type='text' id='addsemail'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>电话:</span></td>";
					   str+="<td><input type='text' id='addstele'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>身份证号:</span></td>";
					   str+="<td><input type='text' id='addsidcard'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>住址:</span></td>";
					   str+="<td><input type='text' id='addsaddress'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>角色名:</span></td>";
					   str+="<td><input type='text' id='addrname'  class='textbox' readonly='true' value='staff' /></td></tr>";
					   str+="</table1></ul>";
					   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtnadd();'/>";
					   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtnadd();' style='margin: 0px 5%;'/>";
					   $("#stat").html("职工信息添加");
					   $("#winupdstac").html(str);
					   $("#btn").html(str1);
					   $("#addsbirth").datepicker({});
					   $("#winupdsta").fadeIn();
				}else{
					alert("抱歉！您没有添加权限！");
				}
			});
		 
	   }
		function truebtnadd(){
			 if(confirm("确认添加吗？")){
				 var slogidv=$("#addsslogid").val();
				 var spwd=$("#addspwd").val();
				 var spwd1=$("#addspwd1").val();
				 var sname=$("#addsname").val();
				 var ssex=$("#addssex").val();
				 var sbirth=$("#addsbirth").val();
				 var semail=$("#addsemail").val();
				 var stele=$("#addstele").val();
				 var sidcard=$("#addsidcard").val();
				 var saddress=$("#addsaddress").val();
				 var rname=$("#addrname").val();
				 if(slogidv==null||slogidv==""||spwd==null||spwd==""||spwd1==null||spwd1==""||sname==null||sname==""||ssex==null||ssex==""||sbirth==null||sbirth==""||semail==null||semail==""||sidcard==null||sidcard==""||saddress==null||saddress==""||slogidv==null||slogidv==""||rname==null||rname==""){
					 alert("某一项或多项未输入！");
				 }else if(spwd!=spwd1){
					 alert("密码前后不一致！");
					 $("#addspwd1").focus();
				 }else{
				   $.post("HosMan/admin/addsta",{
					   slogid:slogidv,
					   spwd:spwd,
					   sname:sname,
					   ssex:ssex,
					   sbirth:sbirth,
					   semail:semail,
					   stele:stele,
					   sidcard:sidcard,
					   saddress:saddress,
					   rname:rname
					   },function(data){
						   if(data=="true"){
							   alert("添加成功！");
							   if($("#slogidf").val()==""&&$("#snamef").val()==""&&$("#ssexf").val()=="全部"
									 &&$("#sbirthf").val()==""&&$("#semailf").val()==""&&$("#stelef").val()==""
									 &&$("#sidcardf").val()==""&&$("#saddressf").val()==""&&$("#rnamef").val()==""){
								 	selsta();
							   }else{
								   selstaby();
							   }
							   $("#winupdsta").fadeOut();
							}else if(data=="havestaff"){
								   alert("账号名已存在！");
								   }else{
									   alert("添加失败！");
									   if($("#slogidf").val()==""&&$("#snamef").val()==""&&$("#ssexf").val()=="全部"
											 &&$("#sbirthf").val()==""&&$("#semailf").val()==""&&$("#stelef").val()==""
											 &&$("#sidcardf").val()==""&&$("#saddressf").val()==""&&$("#rnamef").val()==""){
										 	selsta();
									   }else{
										   selstaby();
									   }
									   $("#winupdsta").fadeOut();
									   }
						   });
				   }
			 }
			 }
		 function falsebtnadd(){
			 if(confirm("确认取消吗？")){
				 selsta();
				 $("#winupdsta").fadeOut();
				 }else{}	   
			 }
	 
		
   </script>
  </body>
</html>
