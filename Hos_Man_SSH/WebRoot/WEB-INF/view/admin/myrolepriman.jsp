<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MY ROLE PRIVILEGE MANAGE</title>
    
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
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">个人角色权限信息</h1>
  	<section>
  	
  	<table class="table1  " >
  	<tr>
  	
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">角色编号: </span></td>
     <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="ridf" readonly='true'/></td>
     
     <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">角色名: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rnamef" readonly='true'/></td>
      
      <td style="width: ;" class="  "> <span class="item_name" style="width:100px;">角色名称: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rnamecf" readonly='true'/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">角色信息: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rimformationf" readonly='true'/></td>
      
      <td style="width: ;" class="  "><span class="item_name" style="width:100px;">角色最大人数: </span></td>
      <td style="width: ;" class="  "><input type="text" class="textbox" placeholder="" style="width: 90%;" id="rmaxnumf" readonly='true'/></td>
      
     <!--  <td><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
      <a class="fl top_rt_btn" style="padding-right: 20px;" id="slogidt"></a>
       <a class="fl " style="padding-left: 10px;font-size: 20px;" ><strong style="color:grey;">所拥有的权限：</strong></a>
      </div>
      
      <table class="table" id="myrolepritable" ></table>
      
     </section>
   <!-- 弹出提示框 -->
     <section class="pop_bg" id="winupdrolepri">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;">个人角色权限信息修该</h3>
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
					$.post("HosMan/selrolebyname",{
						   rname:n.rname
					   },function(data){
						   var lst=$.parseJSON(data);
						   $.each(lst,function(i,n){
							   $("#ridf").val(n.rid);
							   $("#rnamef").val(n.rname);
							   $("#rnamecf").val(n.rnamec);
							   $("#rimformationf").val(n.rimformation);
							   $("#rmaxnumf").val(n.rmaxnum);
							   selrolepri();
						   });
					   });
				});
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selrolepri(){
	   $.post("HosMan/selrolepriallbyrid",{
		   rid:$("#ridf").val()
	   },function(data){
		   if(data!="null"){
			   var lst=$.parseJSON(data);
			   var str="";
			   str+="<tr><th>编号</th><th>权限名</th><th>权限信息</th></tr>";
			   $.each(lst,function(i,n){
				   str+="<tr><td>"+(++i)+"</td><td>"+n.pfunction+"</td><td>"+n.pimformation+"</td></tr>"; 
			   });
			   $("#myrolepritable").html(str); 
		   }
	   });
   };
   
  
	 
   </script>
  </body>
</html>
