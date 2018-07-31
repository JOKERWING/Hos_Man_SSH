<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MY STAFF MANAGE</title>
    
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
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">个人职工信息</h1>
  	<section>
  	
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl" ><strong style="color:grey;">个人职工信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px;" id="slogidt"></a>
      </div>
      
      <table class="table" id="statable" ></table>
      
      
     </section>
   <!-- 弹出提示框 -->
     <section class="pop_bg" id="winupdsta">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;">个人职工信息修改</h3>
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
   <script>
   $().ready(function(){
	   admingetses();
	   
   });
   function admingetses(){
		$.post("HosMan/admin/getses", {}, function(data) {
			if (data != "null") {
				var lst = $.parseJSON(data);
				$.each(lst, function(i, n) {
					$("#slogidt").html(n.slogid);
					selsta(n.slogid);
				});
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selsta(slogid){
	   $.post("HosMan/selstabyid",{
		   slogid:slogid
	   },function(data){
		   var lst=$.parseJSON(data);
		   var str="";
		   str+="<tr><th>账号名</th><th>密码</th><th>姓名</th><th>性别</th><th>生日</th><th>电子邮箱</th><th>电话</th><th>身份证号</th><th>住址</th><th>角色名</th><th>操作</th></tr>";
		   $.each(lst,function(i,n){
			   var sbirth=moment(n.sbirth).format('YYYY-MM-DD');
			   /* str+="<tr><td>"+n.slogid+"</td><td>"+n.spwd+"</td><td>"+n.sname+"</td><td>"+n.ssex+"</td>"; */
			   str+="<tr><td>"+n.slogid+"</td><td >********</td><td>"+n.sname+"</td><td>"+n.ssex+"</td>"; 
			   str+="<td>"+sbirth+"</td><td>"+n.semail+"</td><td>"+n.stele+"</td><td>"+n.sidcard+"</td><td>"+n.saddress+"</td><td>"+n.rname+"</td>";
			   str+="<td><a class='inner_btn'  onclick='updsta(\""+n.slogid+"\")'>修改</a></td></tr>";
			  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
		   });
		   $("#statable").html(str);
	   });
   };
   function updsta(slogid2){
	   $.post("HosMan/selstabyid",{
		   slogid:slogid2
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
				   str+="<td><input type='text' id='sslogid"+n.slogid+"' value="+n.slogid+" class='textbox' readonly='true'/></td></tr>";
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
				 return;
			 }
			 if(slogidv==null||slogidv==""||spwd==null||spwd==""||spwd1==null||spwd1==""||sname==null||sname==""||ssex==null||ssex==""||sbirth==null||sbirth==""||semail==null||semail==""||stele==null||stele==""||sidcard==null||sidcard==""||saddress==null||saddress==""||rname==null||rname==""){
				 alert("部分信息未填写！请检查！");
				 return;
			 }
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
					   if(data="true"){
						   alert("更新成功！");
						   selsta(slogidv);
						}else{
							alert("更新失败！");
							selsta(slogidv);
						}
					   $("#winupdsta").fadeOut();
				});
			}
		 }
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selsta($("#slogidt").html());
			 $("#winupdsta").fadeOut();
			 }else{}	   
		 }
	 
		
   </script>
  </body>
</html>
