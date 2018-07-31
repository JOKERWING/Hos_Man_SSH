<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>HOTEL MANAGE</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

  </head>
  
  <body >
  <div id="body">
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">客房信息管理</h1>
  	<section>
  	<!-- <table class="table1">
  	<tr>
  	<td style="text-align: center;" height="60px;" ><span class="item_name" style="width:120px;">关键字查询: </span>
  	  <input type="text" class="textbox" placeholder="模糊查询" style=""/><a class="inner_btn" onclick="" >查询</a></td>
  	</tr>
  	</table> -->
  	<br><br><br><br>
  	<table class="table1"  >
  	<tr>
     <td> <span class="item_name" style="width:120px;">房号: </span>
     <input type="text" class="textbox" placeholder="" style="" id="hidf" onblur="selhotby();"/></td>
     
     <td> <span class="item_name" style="width:120px;">房名: </span>
     <input type="text" class="textbox" placeholder="" style="" id="hnamef" onblur="selhotby();"/></td>
     
     <td> <span class="item_name" style="width:120px;">面积/m2: </span>
      <input type="text" class="textbox" placeholder="" style="width:70px;"id="area1f" value="0" onblur="selhotby();"/>
      <span class="item_name" style="width:120px;">至</span>
      <input type="text" class="textbox" placeholder="" style="width:70px;"id="area2f" onblur="selhotby();"/></td>
      
      <td><span class="item_name" style="width:120px;">楼层/楼: </span>
      <input type="text" class="textbox" placeholder="" style="width:70px;"id="floor1f" value="0" onblur="selhotby();"/>
      <span class="item_name" style="width:120px;">至</span>
      <input type="text" class="textbox" placeholder="" style="width:70px;"id="floor2f" onblur="selhotby();"/></td>
      
      <td> <span class="item_name" style="width:120px;">房类编号: </span>
     <input type="text" class="textbox" placeholder="" style="" id="hiidf" onblur="selhotby();"/></td>
     <!--  <td><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl"><strong style="color:grey;">客房信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px; " onclick="addhot();">添加</a>
      </div>
      
      <table class="table" id="hoteltable" >
      </table>
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
     <section class="pop_bg" id="winupd">
      <div class="pop_cont" >
      <h3 style="font-size: 17;" id="hott">客房信息修改</h3>
      <div class='pop_cont_input' id="winupdc">
       
       </div>
     <!--以pop_cont_text分界-->
       <div class="pop_cont_text" style="text-align: center;">
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
					selhot();
				});
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selhot(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hotelselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlisthot",{},function(data){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>房号</th><th>房名</th><th>面积/m2</th><th>楼层/楼</th><th>房类编号</th>房类号<th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   str+="<tr><td>"+n.hId+"</td><td>"+n.hName+"</td>";
						   str+="<td>"+n.hArea+"</td><td>"+n.hFloor+"</td><td>"+n.hiId+"</td>";
						   str+="<td><a class='inner_btn' onclick='delhot("+n.hId+")'>删除</a>";
						   str+="<a class='inner_btn' id='hid"+n.hId+"' onclick='updhot("+n.hId+")'>修改</a></td></tr>";
						  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
					   });
					   $("#hoteltable").html(str);
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
			});
	   
   }
   function selhotby(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hotelselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlisthotby",{
					   hid:$("#hidf").val(),
					   hname:$("#hnamef").val(),
					   area1:$("#area1f").val(),
					   area2:$("#area2f").val(),
					   floor1:$("#floor1f").val(),
					   floor2:$("#floor2f").val(),
					   hiid:$("#hiidf").val()
				   },function(data){
					   if(data!="null"){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>房号</th><th>房名</th><th>面积/m2</th><th>楼层/楼</th><th>房类编号</th>房类号<th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   str+="<tr><td>"+n.hId+"</td><td>"+n.hName+"</td>";
						   str+="<td>"+n.hArea+"</td><td>"+n.hFloor+"</td><td>"+n.hiId+"</td>";
						   str+="<td><a class='inner_btn' onclick='delhot("+n.hId+")'>删除</a>";
						   str+="<a class='inner_btn' id='hid"+n.hId+"' onclick='updhot("+n.hId+")'>修改</a></td></tr>";
					   });
					   $("#hoteltable").html(str);
					   }else{
						   alert("查询为空！");
					   }
				   });
			}else{
				alert("抱歉！您没有查询权限！");
			}
			});
   }
   function delhot(hid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hoteldelete"
		},function(data1) {
			if(data1=="true"){
				if(confirm("确认删除吗？")){
					   $.post("HosMan/admin/delhot",{
						   hid:hid
						   },function(data){
							   if(data=="nohot"){
								   alert("无此客房！");
								   if($("#hidf").val()==""&&$("#hnamef").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
											  &&$("#floor2f").val()==""&&$("#hiidf").val()==""){
											selhot();
									   }else{
										   selhotby();
									   }
								}else if(data=="true"){
									alert("删除成功！");
									if($("#hidf").val()==""&&$("#hnamef").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
											  &&$("#floor2f").val()==""&&$("#hiidf").val()==""){
											selhot();
									   }else{
										   selhotby();
									   }
									}else{
										alert("删除失败！");
										if($("#hidf").val()==""&&$("#hnamef").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
												  &&$("#floor2f").val()==""&&$("#hiidf").val()==""){
												selhot();
										   }else{
											   selhotby();
										   }
										}
							   });
					   }
			}else{
				alert("抱歉！您没有删除权限！");
			}
			});
   }
   function updhot(hid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hotelupdate"
		},function(data1) {
			if(data1=="true"){
				 $.post("HosMan/selhotbyid",{
					   hid:hid
				   },function(data){
					   if(data!="null"){
						   var lst=$.parseJSON(data);
						   var str=""; 
						   var str1="";
						   str+="<ul>";
						   str+="<table class='table1' >";
						   $.each(lst,function(i,n){
							   str+="<li><tr><td style='text-align: right'><span >房号:</span></td>";
							   str+="<td><input type='text' id='hhid"+n.hId+"' value="+n.hId+" class='textbox' readonly='true'/></td></tr></li>";
							   str+="<li><tr><td style='text-align: right'><span >房名:</span></td>";
							   str+="<td><input type='text' id='name"+n.hId+"' value="+n.hName+" class='textbox' readonly='true'/></td></tr></li>";
							   str+="<li><tr><td style='text-align: right'><span>面积/m2:</span></td>";
							   str+="<td><input type='text' id='area"+n.hId+"' value="+n.hArea+" class='textbox'/></td></tr></li>";
							   str+="<li><tr><td style='text-align: right'><span>楼层/楼:</span></td>";
							   str+="<td><input type='text' id='floor"+n.hId+"' value="+n.hFloor+" class='textbox'/></td></tr></li>";
							   str+="<li><tr><td style='text-align: right'><span>房类编号:</span></td>";
							   str+="<td><input type='text' id='hiid"+n.hId+"' value="+n.hiId+" class='textbox' readonly='true'/></td></tr></li>";
							   str+="</table1></ul>";
							   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn("+n.hId+");'/>";
							   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
							   $("#hott").html("客房信息修改");
							   $("#winupdc").html(str);
							   $("#btn").html(str1);
							   //弹出文本性提示框
							   $("#winupd").fadeIn();
						   });
						   
					   }else{
						   alert("无法找到此项！");
						   window.location="HosMan/admin/index?url=HosMan/admin/hotman";
					   }
				   });
			}else{
				alert("抱歉！您没有修改权限！");
			}
			});
	  
   }
   function addhot(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hoteladd"
		},function(data1) {
			if(data1=="true"){
				 var str=""; 
				   var str1="";
				   str+="<ul>";
				   str+="<table class='table1' >";
				   str+="<li><tr><td style='text-align: right'><span >房号:</span></td>";
				   str+="<td><input type='text' id='addhid'  class='textbox'/></td></tr></li>";
				   str+="<li><tr><td style='text-align: right'><span >房名:</span></td>";
				   str+="<td><input type='text' id='addname'  class='textbox'/></td></tr></li>";
				   str+="<li><tr><td style='text-align: right'><span>面积/m2:</span></td>";
				   str+="<td><input type='text' id='addarea'  class='textbox'/></td></tr></li>";
				   str+="<li><tr><td style='text-align: right'><span>楼层/楼:</span></td>";
				   str+="<td><input type='text' id='addfloor'  class='textbox'/></td></tr></li>";
				   str+="<li><tr><td style='text-align: right'><span>房类编号:</span></td>";
				   str+="<td><input type='text' id='addhiid'  class='textbox'/></td></tr></li>";
				   str+="</table1></ul>";
				   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtnadd();'/>";
					str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtnadd();' style='margin: 0px 5%;'/>";
					$("#hott").html("客房信息添加");
					$("#winupdc").html(str);
					$("#btn").html(str1);
					$("#winupd").fadeIn();
			}else{
				alert("抱歉！您没有添加权限！");
			}
		});
	  
   }
   
	function truebtn(hid){
		 if(confirm("确认修改吗？")){
			 var hid1=$("#hhid"+hid+"").val();
			 var hname=$("#name"+hid+"").val();
			 /* var htype=$("#type"+hid+"").val();
			 var hbed=$("#bed"+hid+"").val();
			 var hprice=$("#price"+hid+"").val(); */
			 var harea=$("#area"+hid+"").val();
			 var hfloor=$("#floor"+hid+"").val();
			 var hiid1=$("#hiid"+hid+"").val();
			   $.post("HosMan/admin/updhot",{
				   hid:hid1,
				   hname:hname,
				   /* htype:htype,
				   hbed:hbed,
				   hprice:hprice, */
				   harea:harea,
				   hfloor:hfloor,
				   hiid:hiid1
				   },function(data){
					   if(data=="true"){
						   alert("更新成功！");
						   if($("#hidf").val()==""&&$("#hnamef").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
									  &&$("#floor2f").val()==""&&$("#hiidf").val()==""){
									selhot();
							   }else{
								   selhotby();
							   }
						}else{
							alert("更新失败！");
							if($("#hidf").val()==""&&$("#hnamef").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
									  &&$("#floor2f").val()==""&&$("#hiidf").val()==""){
									selhot();
							   }else{
								   selhotby();
							   }
						}
					   $("#winupd").fadeOut();
				});
			}
		 }
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selhot();
			 $("#winupd").fadeOut();
			 }else{}	   
		 }
	 function truebtnadd(){
		 if(confirm("确认添加吗？")){
			 var hid=$("#addhid").val();
			 var hname=$("#addname").val();
			 var harea=$("#addarea").val();
			 var hfloor=$("#addfloor").val();
			 var hiid=$("#addhiid").val();
			 if(hid==null||hid==""||hname==null||hname==""||harea==null||harea==""||hfloor==null||hfloor==""||hiid==null||hiid==""){
				 alert("某一项或多项未输入！");
			 }else{
				 $.post("HosMan/admin/addhot",{
				   hid:hid,
				   hname:hname,
				   harea:harea,
				   hfloor:hfloor,
				   hiid:hiid
				   },function(data){
					   if(data=="true"){
						   alert("添加成功！");
						   if($("#hidf").val()==""&&$("#hnamef").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
									  &&$("#floor2f").val()==""&&$("#hiidf").val()==""){
									selhot();
							   }else{
								   selhotby();
							   }
						   $("#winupd").fadeOut();
						}else if(data=="have"){
							   alert("房号以存在！请重新输入！");
							   $("#hhid"+hid+"").focus();
							}else{
								alert("添加失败！");
								if($("#hidf").val()==""&&$("#hnamef").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
										  &&$("#floor2f").val()==""&&$("#hiidf").val()==""){
										selhot();
								   }else{
									   selhotby();
								   }
								$("#winupd").fadeOut();
							}
				});
			 }
			   
			}
		 }
	 //弹出：取消或关闭按钮
	 function falsebtnadd(){
		 if(confirm("确认取消吗？")){
			 selhot();
			 $("#winupd").fadeOut();
			 }else{}	   
		 }
	 
		
   </script>
  </body>
</html>
