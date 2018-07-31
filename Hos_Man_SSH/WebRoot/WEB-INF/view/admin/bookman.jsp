<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>BOOK MANAGE</title>
    
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
		$("#bindatef").datepicker({
			/* minDate : new Date(),
			maxDate : 90 */
		});
		$("#boutdatef").datepicker({
			/* minDate : 1,
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
  <h1 style="font-size:25px;font-weight:bold;text-align:center;">订单信息管理</h1>
  	<section>
  	<!-- <table class="table1">
  	<tr>
  	<td style="text-align: center;" height="60px;" ><span class="item_name" style="width:120px;">关键字查询: </span>
  	  <input type="text" class="textbox" placeholder="模糊查询" style=""/><a class="inner_btn" onclick="" >查询</a></td>
  	</tr>
  	</table> -->
  	<br><br><br><br>
  	<table class="table1  "  >
  	<tr>
  	<td style="width: 8%;" class="  "> <span class="item_name" style="width:100px;">编号: </span>
     <input type="text" class="textbox" placeholder="" style="width: 50%;" id="bidf" onblur="selbookby();"/></td>
  	
     <td style="width: 8%;" class="  "> <span class="item_name" style="width:100px;">房号: </span>
     <input type="text" class="textbox" placeholder="" style="width: 50%;" id="hidf" onblur="selbookby();"/></td>
     
     <td style="width: 10%;" class="  "> <span class="item_name" style="width:100px;">房名: </span>
     <input type="text" class="textbox" placeholder="" style="width: 70%;" id="hnamef" onblur="selbookby();"/></td>
     
     <td style="width: 14%;" class="  "> <span class="item_name" style="width:100px;">入住日期: </span>
      <input type="text" class="textbox" placeholder="" style="width: 60%;" id="bindatef" onchange="selbookby();"/></td>
      
      <td style="width: 14%;" class="  "><span class="item_name" style="width:100px;">退房日期: </span>
      <input type="text" class="textbox" placeholder="" style="width: 60%;" id="boutdatef" onchange="selbookby();"/></td>
      
      <td style="width: 6%;" class="  "> <span class="item_name" style="width:100px;">人数: </span>
      <input type="text" class="textbox" placeholder="" style="width: 40%;" id="bpnumf" onblur="selbookby();"/></td>
      
      <!-- <td style="width: 13%;" class="  "> <span class="item_name" style="width:100px;">预付订金: </span>
      <input type="text" class="textbox" placeholder="" style="width: 60%;" id="bprepayf"/></td> -->
      
      
      <td style="width: 12%;" class="  "><span class="item_name" style="width:100px;">用户名: </span>
      <input type="text" class="textbox" placeholder="" style="width: 60%;" id="clogidf" onblur="selbookby();"/></td>
      
     <td class="  "> <span class="item_name" style="width:70px;">价格: </span>
      <input type="text" class="textbox" placeholder="" style="width:70px;"id="bprice1f" value="0" onblur="selbookby();"/>
      <span class="item_name" style="width:70px;">至</span>
      <input type="text" class="textbox" placeholder="" style="width:70px;"id="bprice2f" onblur="selbookby();"/></td>
      
      <td style="width: 13%;" class="  "><span class="item_name" style="width:100px;">预付订金:</span>
      <select class="select" id="bprepayf" style="width: 60%;" onchange="selbookby();" >
      <option value="全部">全</option>
       <option value="预全">预全</option>
       <option value="预分">预分</option>
      </select></td>
      
      
     <!--  <td><a class="inner_btn" onclick="" >查询</a></td> -->
      </tr>
  	</table>
    </section>
     </br></br>
  	
    <section>
      <div class="page_title">
       <h1 class="fl"><strong style="color:grey;">客房信息表</strong></h1>
       <a class="fr top_rt_btn" style="padding-right: 20px; " onclick="addbook();">添加</a>
      </div>
      
      <table class="table" id="booktable" >
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
     <section class="pop_bg" id="winupdbook">
      <div class="pop_cont" style="width: 18%;">
      <h3 style="font-size: 17;" id="bookt">订单信息修改</h3>
      <div class='pop_cont_input' id="winupdbookc" >
       
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
					selbook();
				});
			}else{
				alert("请先登录！");
				window.location="HosMan/admin/login";
			}
		});
	}
   function selbook(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "financeselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlistbook",{},function(data){
					   var lst=$.parseJSON(data);
					   var str="";
					   str+="<tr><th>编号</th><th>房号</th><th>房名</th><th>入住日期</th><th>退房日期</th><th>人数</th><th>用户名</th><th>价格/￥</th><th>预付订金/￥</th><th>操作</th></tr>";
					   $.each(lst,function(i,n){
						   var ind=moment(n.bIndate).format('YYYY-MM-DD');
						   var outd=moment(n.bOutdate).format('YYYY-MM-DD');
						   str+="<tr><td>"+n.bId+"</td><td>"+n.hId+"</td><td>"+n.hName+"</td><td>"+ind+"</td>";
						   str+="<td>"+outd+"</td><td>"+n.bPnum+"</td><td>"+n.cLogid+"</td><td>"+n.bPrice+"</td><td>"+n.bPrepay+"</td>";
						   str+="<td><a class='inner_btn' onclick='delbook("+n.bId+")'>删除</a>";
						   str+="<a class='inner_btn' id='bid"+n.bId+"' onclick='updbook("+n.bId+")'>修改</a></td></tr>";
						  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
					   });
					   $("#booktable").html(str);
				   });
			}else{
				$("#body").html("<h1 style='font-size:25px;font-weight:bold;text-align:center;'>您无权限浏览此页！</h1>");
			}
		});
	   
   };
   
   function selbookby(){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "financeselect"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/getlistbookby",{
					   bid:$("#bidf").val(),
					   hid:$("#hidf").val(),
					   hname:$("#hnamef").val(),
					   bindate:$("#bindatef").val(),
					   boutdate:$("#boutdatef").val(),
					   bpnum:$("#bpnumf").val(),
					   clogid:$("#clogidf").val(),
					   bprice1:$("#bprice1f").val(),
					   bprice2:$("#bprice2f").val(),
					   bprepay:$("#bprepayf").val()
				   },function(data){
					   if(data=="null"){
						   alert("查询为空！");
					   }else{
						   var lst=$.parseJSON(data);
						   var str="";
						   str+="<tr><th>编号</th><th>房号</th><th>房名</th><th>入住日期</th><th>退房日期</th><th>人数</th><th>用户名</th><th>价格/￥</th><th>预付订金/￥</th><th>操作</th></tr>";
						   $.each(lst,function(i,n){
							   var ind=moment(n.bIndate).format('YYYY-MM-DD');
							   var outd=moment(n.bOutdate).format('YYYY-MM-DD');
							   str+="<tr><td>"+n.bId+"</td><td>"+n.hId+"</td><td>"+n.hName+"</td><td>"+ind+"</td>";
							   str+="<td>"+outd+"</td><td>"+n.bPnum+"</td><td>"+n.cLogid+"</td><td>"+n.bPrice+"</td><td>"+n.bPrepay+"</td>";
							   str+="<td><a class='inner_btn' onclick='delbook("+n.bId+")'>删除</a>";
							   str+="<a class='inner_btn' id='bid"+n.bId+"' onclick='updbook("+n.bId+")'>修改</a></td></tr>";
							  /*  str+="<tr><td><input type='text' class='hottextbox'  id='hid"+n.hId+"' value='"+n.hId+"' /></td></tr>"; */
						   });
						   $("#booktable").html(str);
					   }
				   });
			}else{
				alert("抱歉！您没有查询权限！");
			}
		});
	   
   };
   function delbook(bid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "financedelete"
		},function(data1) {
			if(data1=="true"){
				if(confirm("确认删除吗？")){
					   $.post("HosMan/admin/delbook",{
						   bid:bid
						   },function(data){
							   if(data=="nobook"){
								   alert("无此订单！");
								   if($("#bidf").val()==""&&$("#hidf").val()==""&&$("#hnamef").val()==""&&$("#bindatef").val()==""&&$("#boutdatef").val()==""&&$("#bpnumf").val()==""&&$("#clogidf").val()==""
										  &&($("#bprice1f").val()==""||$("#bprice1f").val()=="0")&&$("#bprice2f").val()==""&&$("#bprepayf").val()==""){
									   selbook();
								   }else{
									   selbookby();
								   }
								}else if(data=="true"){
									alert("删除成功！");
									if($("#bidf").val()==""&&$("#hidf").val()==""&&$("#hnamef").val()==""&&$("#bindatef").val()==""&&$("#boutdatef").val()==""&&$("#bpnumf").val()==""&&$("#clogidf").val()==""
										  &&($("#bprice1f").val()==""||$("#bprice1f").val()=="0")&&$("#bprice2f").val()==""&&$("#bprepayf").val()==""){
									   selbook();
								   }else{
									   selbookby();
								   }
									}else{
										alert("删除失败！");
										if($("#bidf").val()==""&&$("#hidf").val()==""&&$("#hnamef").val()==""&&$("#bindatef").val()==""&&$("#boutdatef").val()==""&&$("#bpnumf").val()==""&&$("#clogidf").val()==""
											  &&($("#bprice1f").val()==""||$("#bprice1f").val()=="0")&&$("#bprice2f").val()==""&&$("#bprepayf").val()==""){
										   selbook();
									   }else{
										   selbookby();
									   }
										}
							   });
					   }
			}else{
				alert("抱歉！您没有删除权限！");
			}
		});
	   
   }
   function updbook(bid){
	   $.post("HosMan/checkrolepriall", {
			slogid : $("#slogid").html(),
			flag : "financeupdate"
		},function(data1) {
			if(data1=="true"){
				$.post("HosMan/selbookbyid",{
					   bid:bid
				   },function(data){
					   if(data!="null"){
						   var lst=$.parseJSON(data);
						   var str=""; 
						   var str1="";
						   str+="<ul>";
						   str+="<table class='table1' >";
						   $.each(lst,function(i,n){
							   var ind=moment(n.bIndate).format('YYYY-MM-DD');
							   var outd=moment(n.bOutdate).format('YYYY-MM-DD');
							   str+="<tr><td style='text-align: right'><span >编号:</span></td>";
							   str+="<td><input type='text' id='bbid"+n.bId+"' value="+n.bId+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >房号:</span></td>";
							   str+="<td><input type='text' id='hid"+n.bId+"' value="+n.hId+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >房名:</span></td>";
							   str+="<td><input type='text' id='name"+n.bId+"' value="+n.hName+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span >入住日期:</span></td>";
							   str+="<td><input type='text' id='indate"+n.bId+"' value="+ind+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>退房日期:</span></td>";
							   str+="<td><input type='text' id='outdate"+n.bId+"' value="+outd+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>入住人数:</span></td>";
							   str+="<td><input type='text' id='pnum"+n.bId+"' value="+n.bPnum+" class='textbox'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>用户名:</span></td>";
							   str+="<td><input type='text' id='logid"+n.bId+"' value="+n.cLogid+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>价格/￥:</span></td>";
							   str+="<td><input type='text' id='price"+n.bId+"' value="+n.bPrice+" class='textbox' readonly='true'/></td></tr>";
							   str+="<tr><td style='text-align: right'><span>预付订金/￥:</span></td>";
							   str+="<td><input type='text' id='prepay"+n.bId+"' value="+n.bPrepay+" class='textbox'/></td></tr>";
							   str+="</table1></ul>";
							   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtn("+n.bId+");'/>";
							   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtn();' style='margin: 0px 5%;'/>";
							   $("#bookt").html("订单信息修改");
							   $("#winupdbookc").html(str);
							   $("#btn").html(str1);
							   $("#indate"+n.bId+"").datepicker({});
								$("#outdate"+n.bId+"").datepicker({
									/* minDate : 1,
									maxDate : 90 */
								});
							   //弹出文本性提示框
							   $("#winupdbook").fadeIn();
						   });
						   
					   }else{
						   alert("无法找到此项！");
						   window.location="HosMan/admin/index?url=HosMan/admin/bookman";
					   }
				   });
			}else{
				alert("抱歉！您没有更新权限！");
			}
		});
	   
   }
	function truebtn(bid){
		 if(confirm("确认修改吗？")){
			 var bidv=$("#bbid"+bid+"").val();
			 var hid=$("#hid"+bid+"").val();
			 var hname=$("#name"+bid+"").val();
			 var indate=$("#indate"+bid+"").val();
			 var outdate=$("#outdate"+bid+"").val();
			 var pnum=$("#pnum"+bid+"").val();
			 var logid=$("#logid"+bid+"").val();
			 var price=$("#price"+bid+"").val();
			 var prepay=$("#prepay"+bid+"").val();
			   $.post("HosMan/admin/updbook",{
				   bid:bidv,
				   hid:hid,
				   hname:hname,
				   bindate:indate,
				   boutdate:outdate,
				   bpnum:pnum,
				   clogid:logid,
				   bprice:price,
				   bprepay:prepay
				   },function(data){
					   if(data=="true"){
						   alert("更新成功！");
						   if($("#bidf").val()==""&&$("#hidf").val()==""&&$("#hnamef").val()==""&&$("#bindatef").val()==""&&$("#boutdatef").val()==""&&$("#bpnumf").val()==""&&$("#clogidf").val()==""
								  &&($("#bprice1f").val()==""||$("#bprice1f").val()=="0")&&$("#bprice2f").val()==""&&$("#bprepayf").val()==""){
							   selbook();
						   }else{
							   selbookby();
						   }
						   
						}else{
							alert("更新失败！");
							if($("#bidf").val()==""&&$("#hidf").val()==""&&$("#hnamef").val()==""&&$("#bindatef").val()==""&&$("#boutdatef").val()==""&&$("#bpnumf").val()==""&&$("#clogidf").val()==""
								  &&($("#bprice1f").val()==""||$("#bprice1f").val()=="0")&&$("#bprice2f").val()==""&&$("#bprepayf").val()==""){
							   selbook();
						   }else{
							   selbookby();
						   }
						}
					   $("#winupdbook").fadeOut();
				});
			}
		 }
	 //弹出：取消或关闭按钮
	 function falsebtn(){
		 if(confirm("确认取消吗？")){
			 selbook();
			 $("#winupdbook").fadeOut();
			 }else{}	   
		 }
	 function addbook(){
		 $.post("HosMan/checkrolepriall", {
				slogid : $("#slogid").html(),
				flag : "financeadd"
			},function(data1) {
				if(data1=="true"){
					var str=""; 
					   var str1="";
					   str+="<ul>";
					   str+="<table class='table1' >";
					   str+="<tr><td style='text-align: right'><span >房号:</span></td>";
					   str+="<td><input type='text' id='addhid'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >房名:</span></td>";
					   str+="<td><input type='text' id='addname'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span >入住日期:</span></td>";
					   str+="<td><input type='text' id='addindate'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>退房日期:</span></td>";
					   str+="<td><input type='text' id='addoutdate'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>入住人数:</span></td>";
					   str+="<td><input type='text' id='addpnum'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>用户名:</span></td>";
					   str+="<td><input type='text' id='addlogid'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>价格/￥:</span></td>";
					   str+="<td><input type='text' id='addprice'  class='textbox'/></td></tr>";
					   str+="<tr><td style='text-align: right'><span>预付订金/￥:</span></td>";
					   str+="<td><input type='text' id='addprepay'  class='textbox'/></td></tr>";
					   str+="</table1></ul>";
					   str1+="<input type='button' value='确认' class='input_btn trueBtn' onclick='truebtnadd();'/>";
					   str1+="<input type='button' value='关闭' class='input_btn falseBtn' onclick='falsebtnadd();' style='margin: 0px 5%;'/>";
					   $("#bookt").html("订单信息添加");
					   $("#winupdbookc").html(str);
					   $("#btn").html(str1);
					   $("#addindate").datepicker({});
						$("#addoutdate").datepicker({
							minDate : 1,
							maxDate : 90
						});
					   $("#winupdbook").fadeIn();
				}else{
					alert("抱歉！您没有添加权限！");
				}
			});
		 
	   }
		function truebtnadd(){
			 if(confirm("确认添加吗？")){
				 var hid=$("#addhid").val();
				 var hname=$("#addname").val();
				 var indate=$("#addindate").val();
				 var outdate=$("#addoutdate").val();
				 var pnum=$("#addpnum").val();
				 var logid=$("#addlogid").val();
				 var price=$("#addprice").val();
				 var prepay=$("#addprepay").val();
				 if(hid==null||hid==""||hname==null||hname==""||indate==null||indate==""||outdate==null||outdate==""||pnum==null||pnum==""||logid==null||logid==""||price==null||price==""||prepay==null||prepay==""){
					 alert("某一项或多项未输入！");
				 }else{
					 $.post("HosMan/admin/addbook",{
						   hid:hid,
						   hname:hname,
						   bindate:indate,
						   boutdate:outdate,
						   bpnum:pnum,
						   clogid:logid,
						   bprice:price,
						   bprepay:prepay
						   },function(data){
							   if(data=="true"){
								   alert("添加成功！");
								   if($("#bidf").val()==""&&$("#hidf").val()==""&&$("#hnamef").val()==""&&$("#bindatef").val()==""&&$("#boutdatef").val()==""&&$("#bpnumf").val()==""&&$("#clogidf").val()==""
										  &&($("#bprice1f").val()==""||$("#bprice1f").val()=="0")&&$("#bprice2f").val()==""&&$("#bprepayf").val()==""){
									   selbook();
								   }else{
									   selbookby();
								   }
								   $("#winupdbook").fadeOut();
								}else if(data=="more"){
									alert("以超出该用户最大预订数！");
									}else{
										alert("添加失败！");
										if($("#bidf").val()==""&&$("#hidf").val()==""&&$("#hnamef").val()==""&&$("#bindatef").val()==""&&$("#boutdatef").val()==""&&$("#bpnumf").val()==""&&$("#clogidf").val()==""
											  &&($("#bprice1f").val()==""||$("#bprice1f").val()=="0")&&$("#bprice2f").val()==""&&$("#bprepayf").val()==""){
										   selbook();
									   }else{
										   selbookby();
									   }
										$("#winupdbook").fadeOut();
									}
						});
				 }
				   
				}
			 }
		 //弹出：取消或关闭按钮
		 function falsebtnadd(){
			 if(confirm("确认取消吗？")){
				 selbook();
				 $("#winupdbook").fadeOut();
				 }else{}	   
			 }
	 
		
   </script>
  </body>
</html>
