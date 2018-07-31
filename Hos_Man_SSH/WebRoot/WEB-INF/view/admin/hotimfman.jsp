<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>HOTEL IMFORMATION MANAGE</title>
    
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
  
  <body>
  <div id="body">
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">客房分类管理</h1>
  	<section>
  	<!-- <table class="table1">
  	<tr>
  	<td style="text-align: center;" height="60px;" ><span class="item_name" style="width:120px;">关键字查询: </span>
  	  <input type="text" class="textbox" placeholder="模糊查询" style=""/><a class="inner_btn" onclick="" >查询</a></td>
  	</tr>
  	</table> -->
  	<br><br><br><br>
  	<table class="table1"  >
  	<tr class="">
     <td class="" style="width: 7%;"> <span class="item_name " style="width:120px;">编号: </span>
     <input type="text" class="textbox" placeholder="" style="width: 50%;" id="hiidf" onblur="selhotimfby();"/></td>
     
     <td class="" style="width: 11%;"> <span class="item_name" style="width:120px;">类名: </span>
     <input type="text" class="textbox" placeholder="" style="width: 70%;" id="hnamef" onblur="selhotimfby();"/></td>
     
     <td class="" style="width: 8%;"> <span class="item_name" style="width:120px;">类型/级:
      <input type="text" class="textbox" placeholder="" style="width: 40%;" id="typef" onblur="selhotimfby();"/></td>
      
      <td class=""	><span class="item_name" style="width:120px;">床型:</span>
      <select class="select" id="bedf" style="width: 60%;" onchange="selhotimfby();">
      <option value="全部">全</option>
       <option value="大床">大床</option>
       <option value="双床">双床</option>
      </select></td>
      
      <td class=""><span class="item_name" style="width:120px;">早餐:</span>
      <select class="select" id="breakff" style="width: 50%;" onchange="selhotimfby();">
      <option value="全部">全</option>
       <option value="有">有</option>
       <option value="无">无</option>
      </select></td>
      
      <td class="" style="width: 7%;"> <span class="item_name " style="width:120px;">积分: </span>
     <input type="text" class="textbox" placeholder="" style="width: 50%;" id="addlevscof" onblur="selhotimfby();"/></td>
      
      <td class="" style="width: 14%;"> <span class="item_name" style="width:120px;">价格: </span>
      <input type="text" class="textbox" placeholder="" style="width:70px;" id="pri1f" value="0" onblur="selhotimfby();"/>
      <span class="item_name" style="width:120px;">至</span>
      <input type="text" class="textbox" placeholder="" style="width:70px;" id="pri2f" onblur="selhotimfby();"/></td>
      
      <td class="" style="width: 11%;"><span class="item_name" style="width:120px;">楼层: </span>
      <input type="text" class="textbox" placeholder="" style="width:50px;"id="floor1f" value="0" onblur="selhotimfby();"/>
      <span class="item_name" style="width:120px;">至</span>
      <input type="text" class="textbox" placeholder="" style="width:50px;"id="floor2f" onblur="selhotimfby();"/></td>
      
      <td class="" style="width: 14%;"> <span class="item_name" style="width:120px;">面积: </span>
      <input type="text" class="textbox" placeholder="" style="width:70px;" id="area1f" value="0" onblur="selhotimfby();"/>
      <span class="item_name" style="width:120px;">至</span>
      <input type="text" class="textbox" placeholder="" style="width:70px;" id="area2f" onblur="selhotimfby();"/></td>
      
      <td class=""><span class="item_name" style="width:120px;">客房详细信息: </span>
      <input type="text" class="textbox" placeholder="模糊查询" style="width:130px;"id="hotimff" onblur="selhotimfby();"/></td>
      
     <!--  <td class=""><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl"><strong style="color:grey;">客房分类信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px; " onclick="addhotimf();">添加</a>
      </div>
      
      <table class="table" id="hotimftable" >
      </table>
     <!--  <aside class="paging">
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
     <section class="pop_bg" id="winupdimf">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;" id="hotimft">客房分类信息修改</h3>
      <div class='pop_cont_input' id="winupdimfc" >
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
     
     <!-- 弹出提示框 -->
     <section class="pop_bg" id="imf">
      <div class="pop_cont" style="width: 18%;">
      <h3>客房详细信息</h3>
      <div class='pop_cont_input' id="imfc" >
       </div>
     <!--以pop_cont_text分界-->
       <div class="pop_cont_text" style="text-align: center; ">
        	该客房的完整信息如上显示！
       </div>
      <!--  bottom:operate->button -->
       <div class="btm_btn" id="btnimf">
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
				selhotimf();
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selhotimf(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hotelselect"
		},function(data1) {
			if(data1=="true"){
				 $.post("HosMan/getlisthotimf",{},function(data){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>编号</th><th>类名</th><th>类型/级</th><th>床型</th>";
					   str+="<th>WIFI</th><th>空调</th><th>早餐</th><th>积分</th><th>价格/￥</th><th>楼层/楼</th><th>面积/m2</th><th>详细信息</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   str+="<tr><td>"+n.hiId+"</td><td>"+n.hiName+"</td><td>"+n.hiType+"</td>";
						   str+="<td>"+n.hiBed+"</td><td>"+n.hiWifi+"</td><td>"+n.hiAirt+"</td><td>"+n.hiBreakf+"</td><td>"+n.hiAddlevsco+"</td>";
						   str+="<td>"+n.hiPrice+"</td><td>"+n.hiFloor+"</td><td>"+n.hiArea+"</td><td style='text-align: left;'><div class='cut_title ellipsis' onclick='alehiimfor("+n.hiId+");' style='cursor: pointer;'>"+n.hiImfor+"</div></td>";
						   str+="<td><a class='inner_btn' onclick='delhotimf("+n.hiId+")'>删除</a>";
						   str+="<a class='inner_btn' id='hiid"+n.hiId+"' onclick='updhotimf("+n.hiId+")'>修改</a></td></tr>";
						  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
					   });
					   $("#hotimftable").html(str);
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
		});
	  
   }
   
   function selhotimfby(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hotelselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlisthotimfby",{
					   hiid:$("#hiidf").val(),
					   hname:$("#hnamef").val(),
					   type:$("#typef").val(),
					   bed:$("#bedf").val(),
					   breakf:$("#breakff").val(),
					   addlevsco:$("#addlevscof").val(),
					   pri1:$("#pri1f").val(),
					   pri2:$("#pri2f").val(),
					   floor1:$("#floor1f").val(),
					   floor2:$("#floor2f").val(),
					   area1:$("#area1f").val(),
					   area2:$("#area2f").val(),
					   hotimf:$("#hotimff").val()
				   },function(data){
					   if(data=="null"){
						   alert("查询为空！");
					   }else{
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>编号</th><th>类名</th><th>类型/级</th><th>床型</th>";
					   str+="<th>WIFI</th><th>空调</th><th>早餐</th><th>积分</th><th>价格/￥</th><th>楼层/楼</th><th>面积/m2</th><th>详细信息</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   str+="<tr><td>"+n.hiId+"</td><td>"+n.hiName+"</td><td>"+n.hiType+"</td>";
						   str+="<td>"+n.hiBed+"</td><td>"+n.hiWifi+"</td><td>"+n.hiAirt+"</td><td>"+n.hiBreakf+"</td><td>"+n.hiAddlevsco+"</td>";
						   str+="<td>"+n.hiPrice+"</td><td>"+n.hiFloor+"</td><td>"+n.hiArea+"</td><td style='text-align: left;'><div class='cut_title ellipsis' onclick='alehiimfor("+n.hiId+");' style='cursor: pointer;'>"+n.hiImfor+"</div></td>";
						   str+="<td><a class='inner_btn' onclick='delhotimf("+n.hiId+")'>删除</a>";
						   str+="<a class='inner_btn' id='hiid"+n.hiId+"' onclick='updhotimf("+n.hiId+")'>修改</a></td></tr>";
						  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
					   });
					   $("#hotimftable").html(str);
					   }
				   });
			}else{
				alert("抱歉！您没有查询权限！");
			}
		});
	   
   }
   function delhotimf(hiid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hoteldelete"
		},function(data1) {
			if(data1=="true"){
				if(confirm("确认删除吗？")){
					   $.post("HosMan/admin/delhotimf",{
						   hiid:hiid
						   },function(data){
							   if(data=="nohotimf"){
								   alert("无此客房分类！");
								   if($("#hiidf").val()==""&&$("#hnamef").val()==""&&$("#typef").val()==""&&$("#bedf").val()=="全部"&&$("#breakff").val()=="全部"&&$("#addlevscof").val()==""&&($("#pri1f").val()=="0"||$("#pri1f").val()=="")&&$("#pri2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
											  &&$("#floor2f").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&$("#hotimff").val()==""){
											selhotimf();
									   }else{
										   selhotimfby();
									   }
								}else if(data=="true"){
									alert("删除成功！");
									if($("#hiidf").val()==""&&$("#hnamef").val()==""&&$("#typef").val()==""&&$("#bedf").val()=="全部"&&$("#breakff").val()=="全部"&&$("#addlevscof").val()==""&&($("#pri1f").val()=="0"||$("#pri1f").val()=="")&&$("#pri2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
										  &&$("#floor2f").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&$("#hotimff").val()==""){
										selhotimf();
								   }else{
									   selhotimfby();
								   }
									}else{
										alert("删除失败！");
										if($("#hiidf").val()==""&&$("#hnamef").val()==""&&$("#typef").val()==""&&$("#bedf").val()=="全部"&&$("#breakff").val()=="全部"&&$("#addlevscof").val()==""&&($("#pri1f").val()=="0"||$("#pri1f").val()=="")&&$("#pri2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
												  &&$("#floor2f").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&$("#hotimff").val()==""){
												selhotimf();
										   }else{
											   selhotimfby();
										   }
										}
							   });
					   }
			}else{
				alert("抱歉！您没有删除权限！");
			}
		});
	   
   }
   function updhotimf(hiid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "hotelupdate"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/selhotimfbyid",{
					   hiid:hiid
				   },function(data){
					   if(data!="null"){
						   var lst=$.parseJSON(data);
						   var str=""; 
						   var str1="";
						   str+="<ul>";
						   str+="<table class='table1' >";
						   $.each(lst,function(i,n){
							   str+="<tr><td style='text-align: right'><span >编号:</span></td>";
							   str+="<td><input type='text' id='iid"+n.hiId+"' value="+n.hiId+" class='textbox' style='width:100%;' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >类名:</span></td>";
							   str+="<td><input type='text' id='iname"+n.hiId+"' value="+n.hiName+" class='textbox' style='width:100%;' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >类型/级:</span></td>";
							   str+="<td><input type='text' id='itype"+n.hiId+"' value="+n.hiType+" class='textbox' style='width:100%;'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>床型:</span></td>";
							   str+="<td><input type='text' id='ibed"+n.hiId+"' value="+n.hiBed+" class='textbox' style='width:100%;'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>WIFI:</span></td>";
							   str+="<td><input type='text' id='iwifi"+n.hiId+"' value="+n.hiWifi+" class='textbox' style='width:100%;'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>空调:</span></td>";
							   str+="<td><input type='text' id='iairt"+n.hiId+"' value="+n.hiAirt+" class='textbox' style='width:100%;'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>早餐:</span></td>";
							   str+="<td><input type='text' id='ibreakf"+n.hiId+"' value="+n.hiBreakf+" class='textbox' style='width:100%;'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>积分:</span></td>";
							   str+="<td><input type='text' id='iaddlevsco"+n.hiId+"' value="+n.hiAddlevsco+" class='textbox' style='width:100%;'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>价格/￥:</span></td>";
							   str+="<td><input type='text' id='iprice"+n.hiId+"' value="+n.hiPrice+" class='textbox' style='width:100%;'/></td></tr>";
							   str+="<li><tr><td style='text-align: right'><span>面积/m2:</span></td>";
							   str+="<td><input type='text' id='iarea"+n.hiId+"' value="+n.hiArea+" class='textbox' style='width:100%;'/></td></tr></li>";
							   str+="<tr><td style='text-align: right'><span>楼层/楼:</span></td>";
							   str+="<td><input type='text' id='ifloor"+n.hiId+"' value="+n.hiFloor+" class='textbox' style='width:100%;'/></td></tr>"; 
							   str+="<tr><td style='text-align: right'><span>详细信息:</span></td>";
							   str+="<td><textarea  class='textarea' style='width:100%;height:100px; font-size: 4px;' id='iimfor"+n.hiId+"' wrap='virtual' >"+n.hiImfor+"</textarea></td><td></td></tr>";
							   str+="</table1></ul>";
							   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn("+n.hiId+");'/>";
							   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
							   $("#hotimft").html("客房分类信息修改");
							   $("#winupdimfc").html(str);
							   $("#btn").html(str1);
							   //弹出文本性提示框
							   $("#winupdimf").fadeIn();
						   });
						   
					   }else{
						   alert("无法找到此项！");
						   window.location="HosMan/admin/index?url=HosMan/admin/hotimfman";
					   }
				   });
			}else{
				alert("抱歉！您没有修改权限！");
			}
		});
	   
   }
	function truebtn(hiid){
		 if(confirm("确认修改吗？")){
			 var hiid1=$("#iid"+hiid+"").val();
			 var hiname=$("#iname"+hiid+"").val();
			 var hitype=$("#itype"+hiid+"").val();
			 var hibed=$("#ibed"+hiid+"").val();
			 var hiwifi=$("#iwifi"+hiid+"").val();
			 var hiairt=$("#iairt"+hiid+"").val();
			 var hibreakf=$("#ibreakf"+hiid+"").val();
			 var hiaddlevsco=$("#iaddlevsco"+hiid+"").val();
			 var hiprice=$("#iprice"+hiid+"").val();
			 var hifloor=$("#ifloor"+hiid+"").val();
			 var hiarea=$("#iarea"+hiid+"").val();
			 var hiimfor=$("#iimfor"+hiid+"").val();
			   $.post("HosMan/admin/updhotimf",{
				   hiid:hiid1,
				   hiname:hiname,
				   hitype:hitype,
				   hibed:hibed,
				   hiwifi:hiwifi,
				   hiairt:hiairt,
				   hibreakf:hibreakf,
				   hiaddlevsco:hiaddlevsco,
				   hiprice:hiprice,
				   hifloor:hifloor,
				   hiarea:hiarea,
				   hiimfor:hiimfor
				   },function(data){
					   if(data=="true"){
						   alert("更新成功！");
						   if($("#hiidf").val()==""&&$("#hnamef").val()==""&&$("#typef").val()==""&&$("#bedf").val()=="全部"&&$("#breakff").val()=="全部"&&$("#addlevscof").val()==""&&($("#pri1f").val()=="0"||$("#pri1f").val()=="")&&$("#pri2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
									  &&$("#floor2f").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&$("#hotimff").val()==""){
									selhotimf();
							   }else{
								   selhotimfby();
							   }
						}else{
							alert("更新失败！");
							if($("#hiidf").val()==""&&$("#hnamef").val()==""&&$("#typef").val()==""&&$("#bedf").val()=="全部"&&$("#breakff").val()=="全部"&&$("#addlevscof").val()==""&&($("#pri1f").val()=="0"||$("#pri1f").val()=="")&&$("#pri2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
									  &&$("#floor2f").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&$("#hotimff").val()==""){
									selhotimf();
							   }else{
								   selhotimfby();
							   }
						}
					   $("#winupdimf").fadeOut();
				});
			}
		 }
	 //关闭按钮按下
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selhotimf();
			 $("#winupdimf").fadeOut();
			 }else{}	   
		 }
	 function addhotimf(){
		 $.post("HosMan/checkrolepriall", {
				slogid : $("#slogid").html(),
				flag : "hoteladd"
			},function(data1) {
				if(data1=="true"){
					var str=""; 
					   var str1="";
					   str+="<ul>";
					   str+="<table class='table1' >";
					   str+="<tr><td style='text-align: right'><span >类名:</span></td>";
					   str+="<td><input type='text' id='addiname'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >类型/级:</span></td>";
					   str+="<td><input type='text' id='additype'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>床型:</span></td>";
					   str+="<td><input type='text' id='addibed'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>WIFI:</span></td>";
					   str+="<td><input type='text' id='addiwifi'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>空调:</span></td>";
					   str+="<td><input type='text' id='addiairt'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>早餐:</span></td>";
					   str+="<td><input type='text' id='addibreakf'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>积分:</span></td>";
					   str+="<td><input type='text' id='addiaddlevsco'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>价格/￥:</span></td>";
					   str+="<td><input type='text' id='addiprice'  class='textbox' style='width:100%;'/></td></tr>";
					   str+="<li><tr><td style='text-align: right'><span>面积/m2:</span></td>";
					   str+="<td><input type='text' id='addiarea'  class='textbox' style='width:100%;'/></td></tr></li>";
					   str+="<tr><td style='text-align: right'><span>楼层/楼:</span></td>";
					   str+="<td><input type='text' id='addifloor'  class='textbox' style='width:100%;'/></td></tr>"; 
					   str+="<tr><td style='text-align: right'><span>详细信息:</span></td>";
					   str+="<td><textarea  class='textarea' style='width:100%;height:100px; font-size: 4px;' id='addiimfor' wrap='virtual' ></textarea></td><td></td></tr>";
					   str+="</table1></ul>";
					   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtnadd();'/>";
					   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtnadd();' style='margin: 0px 5%;'/>";
					   $("#hotimft").html("客房分类信息添加");
					   $("#winupdimfc").html(str);
					   $("#btn").html(str1);
					   $("#winupdimf").fadeIn();
				}else{
					alert("抱歉！您没有添加权限！");
				}
			});
		 
	   }
		function truebtnadd(){
			 if(confirm("确认添加吗？")){
				 var hiname=$("#addiname").val();
				 var hitype=$("#additype").val();
				 var hibed=$("#addibed").val();
				 var hiwifi=$("#addiwifi").val();
				 var hiairt=$("#addiairt").val();
				 var hibreakf=$("#addibreakf").val();
				 var hiaddlevsco=$("#addiaddlevsco").val();
				 var hiprice=$("#addiprice").val();
				 var hifloor=$("#addifloor").val();
				 var hiarea=$("#addiarea").val();
				 var hiimfor=$("#addiimfor").val();
				 if(hiname==null||hiname==""||hitype==null||hitype==""||hibed==null||hibed==""||hiwifi==null||hiwifi==""||hiairt==null||hiairt==""||hibreakf==null||hibreakf==""||hiaddlevsco==null||hiaddlevsco==""||hiprice==null||hiprice==""||hifloor==null||hifloor==""||hiarea==null||hiarea==""||hiimfor==null||hiimfor==""){
					 alert("某一项或多项未输入！");
				 }else{
					 $.post("HosMan/admin/addhotimf",{
						   hiname:hiname,
						   hitype:hitype,
						   hibed:hibed,
						   hiwifi:hiwifi,
						   hiairt:hiairt,
						   hibreakf:hibreakf,
						   hiaddlevsco:hiaddlevsco,
						   hiprice:hiprice,
						   hifloor:hifloor,
						   hiarea:hiarea,
						   hiimfor:hiimfor
						   },function(data){
							   if(data=="true"){
								   alert("添加成功！");
								   if($("#hiidf").val()==""&&$("#hnamef").val()==""&&$("#typef").val()==""&&$("#bedf").val()=="全部"&&$("#breakff").val()=="全部"&&$("#addlevscof").val()==""&&($("#pri1f").val()=="0"||$("#pri1f").val()=="")&&$("#pri2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
											  &&$("#floor2f").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&$("#hotimff").val()==""){
											selhotimf();
									   }else{
										   selhotimfby();
									   }
								}else{
									alert("添加失败！");
									if($("#hiidf").val()==""&&$("#hnamef").val()==""&&$("#typef").val()==""&&$("#bedf").val()=="全部"&&$("#breakff").val()=="全部"&&$("#addlevscof").val()==""&&($("#pri1f").val()=="0"||$("#pri1f").val()=="")&&$("#pri2f").val()==""&&($("#floor1f").val()=="0"||$("#floor1f").val()=="")
											  &&$("#floor2f").val()==""&&($("#area1f").val()=="0"||$("#area1f").val()=="")&&$("#area2f").val()==""&&$("#hotimff").val()==""){
											selhotimf();
									   }else{
										   selhotimfby();
									   }
								}
							   $("#winupdimf").fadeOut();
						});
				 }
				  
				}
			 }
		 function falsebtnadd(){
			 if(confirm("确认取消吗？")){
				 selhotimf();
				 $("#winupdimf").fadeOut();
				 }else{}	   
			 }
	 
	 
		
		function alehiimfor(hiid){
			$.post("HosMan/selhotimfbyid", {
				hiid:hiid
			}, function(data) {
				if (data != "null") {
					var lst = $.parseJSON(data);
					$.each(lst, function(i, n) {
						var str=""; 
						var str1="";
						str+="<ul ><textarea  class='textarea' style='width:100%;height:100px; font-size: 4px;' id='imf"+n.hiId+"' wrap='virtual' >"+n.hiImfor+"</textarea></ul>";
						str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtni();'/>";
						$("#imfc").html(str);
						   $("#btnimf").html(str1);
						   //弹出文本性提示框
						   $("#imf").fadeIn();
					});
				}else{
					alert("无法显示！");
				}
			});
		}
		function truebtni(){
				 $("#imf").fadeOut();	   
			 }
   </script>
  </body>
</html>
