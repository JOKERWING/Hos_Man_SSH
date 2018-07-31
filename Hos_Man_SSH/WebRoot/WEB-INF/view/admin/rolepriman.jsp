<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ROLE PRIVILEGE MANAGE</title>
    
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
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">角色权限分配管理</h1>
  </br>
  	<section>
  	<table class="table1">
  	<tr class="">
  	<td class=""style="text-align: center;" height="60px;"  ><span class="item_name" style="width:120px;">查询角色: </span>
  	  <input id="rnameipt" type="text" class="textbox" placeholder="角色名称" style="width: 15%;" onkeydown="KeyDown();"/><a class="inner_btn" onclick="selrolepriallbyrname();"  >查询</a></td>
  	</tr>
  	</table>
  	
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
      <a class="fl top_rt_btn" style="padding-right: 20px;" id="rnamet"></a>
      <a class="fl " style="padding-left: 10px;font-size: 20px;" id="imfor" ><strong style="color:grey;">请输入角色名进行查询！</strong></a>
      </div>
      <div id="prishow">
      <!-- <div class="divt"><input class="wcheckbox" type="checkbox" id="1" value="1"><a style="font-size: 20px;">权限1</a></div>
      <div class="divt"><input class="wcheckbox" type="checkbox" id="2" value="2"><a style="font-size: 20px;">权限2</a></div>
      <div class="divt"><input class="wcheckbox" type="checkbox" id="3" value="3" checked="checked"><a style="font-size: 20px;">权限3</a></div> -->
      
      </div>
     
      <div id="pribtn" ><!-- <input type="button" value="修改权限" class="link_btn" style="font-size:20px; margin-left: 10%;margin-top: 2%;" onclick="updrolepri();"/> --></div>
     </section>
   <!-- 弹出提示框 -->
     <section class="pop_bg" id="winupdrolepri">
      <div class="pop_cont" style="width: 18%;">
      <h3 id="winroleprit" style="font-size: 17;"></h3>
      <div class='pop_cont_input' id="winupdrolepric" >
       
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
				selrolepri();
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selrolepri(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriselect"
		},function(data1) {
			if(data1=="true"){
				 $.post("HosMan/getlistpri",{},function(data){
					   var lst=$.parseJSON(data);
					   var str="";
					   var pid ="";
					   var pid2="";
					   $.each(lst,function(i,n){
						   pid+=n.pid;
						   var pid1=pid.substring(0,1);
						   pid="";
						   if(pid2!=pid1){
							   str+="</br></br>";
						   }
						   str+="<div class='divt'><input class='wcheckbox' type='checkbox'   name='checkbox' id='pid"+n.pid+"' value='"+n.pid+"'><a style='font-size: 20px;' id=imf"+n.pid+">"+n.pimformation+"("+n.pfunction+")</a></div>"; 
					   	   pid2=pid1;
					   });
					   $("#prishow").html(str);
					   if(getCookie("rname")!=null){
						   $("#rnameipt").val(getCookie("rname"));
						   selrolepriallbyrname();
					   }
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
		});
	  
   }
   function selrolepriallbyrname(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriselect"
		},function(data1) {
			if(data1=="true"){
				var rname=$("#rnameipt").val();
				   if(rname==null||rname==""){
					   alert("角色名为空！");
				   }else{
					   $.post("HosMan/selrolepriallbyrname",{
						   rname:rname
					   },function(data){
						   if(data=="null"){
							   alert("无此角色名！");
						   }else{
							   setCookie("rname", rname);
							   var lst=$.parseJSON(data);
							   $("#rnamet").html(rname);
							   var str ="<strong style='color:grey;'>角色所拥有的权限：</strong>"; 
							   var str1="<input type='button' value='修改权限' class='link_btn' style='font-size:20px; margin-left: 10%;margin-top: 2%;' onclick='updrolepri();'/>";
							   $("#imfor").html(str);
							   $("#pribtn").html(str1);
							   $("input[name='checkbox']").removeAttr("checked");
							   $("#pid1").removeAttr("checked");
							   $.each(lst,function(i,n){
								 var obj=document.getElementsByName("checkbox"); 
								 for(var x=0; x<obj.length; x++){ 
								 	if(obj[x].value==n.pid){
								 		//$("#pid"+n.pid+"").attr("checked",'true');
								 		obj[x].checked=true;
								 		break;
								 	}
								 } 
								   
							   });
						   }
					   });
				   }
			}else{
				alert("抱歉！您没有查询权限！");
			}
		});
	   
	   
   }

   function updrolepri(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "rolepriupdate"
		},function(data1) {
			if(data1=="true"){
				var str=""; 
				   var str1="";
				   str+="<ul>";
				   str+="<table class='table1' >";
					   var chk_value =[]; 
					   $("input[name='checkbox']:checked").each(function(){ 
					   chk_value.push($(this).val()); 
					   }); 
					  if(chk_value.length==0){
						  str+="<tr><td style='text-align:center'><span >无权限！</span></td></tr>";
					  }else{
						  $.each(chk_value, function(i,n) {
							  str+="<tr><td style='text-align:left;padding-left:20%;'><span >"+$("#imf"+n+"").html()+"</span></td></tr>";
						  });
					  }
					  str+="</table1></ul>";
					   
					   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn(\""+chk_value.toString()+"\");'/>";
					   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
					   $("#winroleprit").html($("#rnamet").html()+"角色权限修改为有如下权限：");
					   $("#winupdrolepric").html(str);
					   $("#btn").html(str1);
					   //弹出文本性提示框
					   $("#winupdrolepri").fadeIn();
			}else{
				alert("抱歉！您没有修改权限！");
			}
		});
			   
   }
	function truebtn(chkval){
		 if(confirm("确认修改吗？")){
			 $.post("HosMan/admin/updrolepri",{
				pid:chkval,
				rname:$("#rnamet").html()
			 },function(data){
				 if(data=="true"){
					 alert("修改成功！");
					 selrolepriallbyrname();
				 }else{
					 alert("修改失败！");
					 selrolepriallbyrname();
				 }
				 $("#winupdrolepri").fadeOut();
			 });
		}else{
		}
	}
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认关闭吗？")){
			 selrolepriallbyrname();
			 $("#winupdrolepri").fadeOut();
			 }else{}	   
		 }
	 function KeyDown()
		{
		    if (event.keyCode == 13)
		    {
		        event.returnValue=false;
		        event.cancel = true;
		        selrolepriallbyrname();
		    }
		}
	   function setCookie(name,value)
		{
		  var Days = 30; //此 cookie 将被保存 30 天
		  var exp  = new Date();    //new Date("December 31, 9998");
		  exp.setTime(exp.getTime() + Days*24*60*60*1000);
		  document.cookie = name + "="+ escape(value) +";expires="+ exp.toGMTString();
		}
		function getCookie(name)
		{
		  var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
		  if(arr != null) return unescape(arr[2]); return null;
		}
	 
		
   </script>
  </body>
</html>
