<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页面</title>
<style type="text/css">
	.black{
		display: none;
		position: fixed;
		z-index: 2;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,0.5);
	}
	.dialog{
		display: none;
		position: fixed;
		z-index: 3;
		top: 20%;
		left: 30%;
		width: 300px;
		height: 400px;
		margin: 20px;
		padding: 30px;
		border: 5px;
		background: burlywood;
	}
	#checkdiv{
		position:absolute;
		top: 5%;
		left:0;
		width: 33%;
		height: 10%;
		background: cadetblue;
	}
	#adddiv{
		position:absolute;
		top: 5%;
		left: 33%;
		width: 66%;
		height: 10%;
		background: aquamarine;
	}
	#buttondiv{
		position: absolute;
		top: 0;
		left: 0;
		width: 50%;
		height: 100%;
		background: aliceblue;
	}
	#msgspan{
		position: absolute;
		top: 0;
		left: 50%;
		height: 100%;
		width: 25%;
		background: darkgrey;
		font-size: 20px;
		color: crimson;
		text-align: center;
	}
	#stockPage{
		position: absolute;
		top: 0;
		left: 75%;
		height: 100%;
		width: 25%;
		background: aliceblue;
		text-align: center;
	}
	#dform{
		display: none;
		z-index: 4;
		position: fixed;
		top: 30%;
		left: 40%;
		width: 250px;
		height: 400px;
		margin: 20px;
		padding: 30px;
		border: 5px;
		background: beige;
	}
	#result{
		position: fixed;
		top: 18%;
		left: 0;
		width: 100%;
		background: antiquewhite;
	}
	#line{
		position: fixed;
		top: 16%;
		left: 0;
		width: 100%;
	}
	
	li{
		display: inline;
	}
</style>
</head>
<body>
	<script type="text/javascript">
		window.onload=function(){
			// 局部刷新实现函数
			function callBackForTable(param){
				window.eval("var backparam ="+param);
				var pagenum = 1;
				var pagenums = Math.ceil(backparam.length/10);
				function inserttable(pagenum,backparam){
					document.getElementById("result").innerHTML="<table border=\'1px\' id=\'alltable"+pagenum+"\'>\
																</table>\
																<div id=\"page\" align=\"center\">\
																	<ul>\
																		查询到<span id=\'itemnums\'></span>条记录，共<span id=\'pagenums\'></span>页，第<span id=\'pagenum\'></span>页\
																		<li><a href=\'javascript:void(0)\' id=\'firstpage\'>首页</a></li>\
																		<li><a href=\'javascript:void(0)\' id=\'prevpage\'>上一页</a></li>\
																		<li><a href=\'javascript:void(0)\' id=\'nextpage\'>下一页</a></li>\
																		<li><a href=\'javascript:void(0)\' id=\'lastpage\'>尾页</a></li>\
																		跳转到<input type=\'text\' id=\'pagetext\' style=\'width: 20px;\'/><input type=\'button\' id=\'pageturn\' value=\'跳转\'/>\
																	</ul>\
																</div>";
					var firstrow = document.getElementById("alltable"+pagenum).insertRow(0);
					firstrow.insertCell(0).innerHTML="学号";
					firstrow.insertCell(1).innerHTML="姓名";
					firstrow.insertCell(2).innerHTML="年龄"; 
					firstrow.insertCell(3).innerHTML="性别";
					firstrow.insertCell(4).innerHTML="班级";
					firstrow.insertCell(5).innerHTML="联系电话";
					firstrow.insertCell(6).innerHTML="家庭住址";
					firstrow.insertCell(7).innerHTML="<input type='button' value='修改' id='modify'/>";
					firstrow.insertCell(8).innerHTML="<input type='button' value='删除' id='delete'/>";
					for(var i=(pagenum-1)*10;i<(backparam.length/10-pagenum>=0?10*pagenum:10*(pagenum-1)+backparam.length%10);i++){
						var row=document.getElementById("alltable"+pagenum).insertRow(i%10+1);
							row.insertCell(0).innerHTML=backparam[i].snum;
							row.insertCell(1).innerHTML=backparam[i].name;
							row.insertCell(2).innerHTML=backparam[i].age;
							if(backparam[i].sex=="1"){
								row.insertCell(3).innerHTML="男";
							}else{
								row.insertCell(3).innerHTML="女";
							}
							if(backparam[i].classroom=="1-1"){
								row.insertCell(4).innerHTML="初一一班";
							}else if(backparam[i].classroom=="1-2"){
								row.insertCell(4).innerHTML="初一二班";
							}else if(backparam[i].classroom=="1-3"){
								row.insertCell(4).innerHTML="初一三班";
							}else if(backparam[i].classroom=="2-1"){
								row.insertCell(4).innerHTML="初二一班";
							}else if(backparam[i].classroom=="2-2"){
								row.insertCell(4).innerHTML="初二二班";
							}else if(backparam[i].classroom=="2-3"){
								row.insertCell(4).innerHTML="初二三班";
							}else if(backparam[i].classroom=="3-1"){
								row.insertCell(4).innerHTML="初三一班";
							}else if(backparam[i].classroom=="3-2"){
								row.insertCell(4).innerHTML="初三二班";
							}else if(backparam[i].classroom=="3-3"){
								row.insertCell(4).innerHTML="初三三班";
							}
							row.insertCell(5).innerHTML=backparam[i].phone;
							row.insertCell(6).innerHTML=backparam[i].address;
							row.insertCell(7).innerHTML="<input type=\'radio\' name=\'modifyradio\'"+"id=\'"+"tradio"+i+"\'"+">";
							row.insertCell(8).innerHTML="<input type=\'checkbox\' name=\'delete\'"+"id=\'"+"tcheckbox"+i+"\'"+">"
								
					}	
					
				}
				inserttable(pagenum,backparam);
				modifyfun=function(){
					for(var i=(pagenum-1)*10;i<(pagenum==pagenums?backparam.length:pagenum*10);i++){
						if(document.getElementById("tradio"+i).checked){
							document.getElementById("background").style.display="block";
							document.getElementById("modifydialog").style.display="block";
							document.getElementById("modifysnum").value=backparam[i].snum;
							document.getElementById("modifyname").value=backparam[i].name;
							document.getElementById("modifyage").value=backparam[i].age;
							if(backparam[i].sex=="0"){
								document.getElementById("modifysex2").checked="checked";
							}else if(backparam[i].sex=="1"){
								document.getElementById("modifysex1").checked="checked";
							}
							if(backparam[i].classroom=="1-1"){
								document.getElementById("modclass01").selected="true";
							}else if(backparam[i].classroom=="1-2"){
								document.getElementById("modclass02").selected="true";
							}else if(backparam[i].classroom=="1-3"){
								document.getElementById("modclass03").selected="true";
							}else if(backparam[i].classroom=="2-1"){
								document.getElementById("modclass04").selected="true";
							}else if(backparam[i].classroom=="2-2"){
								document.getElementById("modclass05").selected="true";
							}else if(backparam[i].classroom=="2-3"){
								document.getElementById("modclass06").selected="true";
							}else if(backparam[i].classroom=="3-1"){
								document.getElementById("modclass07").selected="true";
							}else if(backparam[i].classroom=="3-2"){
								document.getElementById("modclass08").selected="true";
							}else if(backparam[i].classroom=="3-3"){
								document.getElementById("modclass09").selected="true";
							}
							
							// 这里没搞懂为什么非得将backparam[i].id赋值给一个变量才能
							// 传入document.getElementById("modifybutton").onclick函数中？？？
							// ::大概想通了。。由于click事件当循环进来时只是绑定在了按钮上，当真正执行
							// click事件的时候，循环已经跑完，i最后的值是跑完了的值，因此backparam[i]
							// 这个位置的值是空的。因此必须在刚执行if语句时将此时的i值对应的backparam[i]
							// 存放到变量中。
							var idstring = backparam[i].id;
							document.getElementById("modifyphone").value=backparam[i].phone;
							document.getElementById("modifyaddress").value=backparam[i].address;
							document.getElementById("cancelbutton").onclick=function(){
								
								document.getElementById("background").style.display="none";
								document.getElementById("modifydialog").style.display="none";
							}
							document.getElementById("modifybutton").onclick=function(){
								// 1、创建异步请求对象
								var modifyHttp =new XMLHttpRequest;
								// 2、为异步请求对象绑定监听器
								modifyHttp.onreadystatechange=function(){
									var modifydata = modifyHttp.responseText;
									modifyback(modifydata);
								}
								//局部刷新函数
								function modifyback(modparam){
									document.getElementById("result").innerHTML=modparam;
								}
								var dataString ="";
								dataString += "id="
								dataString += idstring;
								dataString += "&";
								dataString += document.getElementById("modifysnum").name;
								dataString += "=";
								dataString += document.getElementById("modifysnum").value;
								dataString += "&";
								dataString += document.getElementById("modifyname").name;
								dataString += "=";
								dataString += document.getElementById("modifyname").value;
								dataString += "&";
								dataString += document.getElementById("modifyage").name;
								dataString += "=";
								dataString += document.getElementById("modifyage").value;
								dataString += "&";
								if(document.getElementById("modifysex1").checked){
									dataString += document.getElementById("modifysex1").name;
									dataString += "=";
									dataString += document.getElementById("modifysex1").value;
									dataString += "&";
								}else if(document.getElementById("modifysex2").checked){
									dataString += document.getElementById("modifysex2").name;
									dataString += "=";
									dataString += document.getElementById("modifysex2").value;
									dataString += "&";
								}
								dataString += document.getElementById("modifyclassroom").name;
								dataString += "=";
								dataString += document.getElementById("modifyclassroom").value;
								dataString += "&";
								dataString += document.getElementById("modifyphone").name;
								dataString += "=";
								dataString += document.getElementById("modifyphone").value;
								dataString += "&";
								dataString += document.getElementById("modifyaddress").name;
								dataString += "=";
								dataString += document.getElementById("modifyaddress").value;
								// 3、初始化异步请求对象
								modifyHttp.open("POST","${pageContext.request.contextPath}/modify.do?"+dataString,true);
								// 4、命令异步请求对象代替浏览器发送请求
								modifyHttp.send();
								document.getElementById("background").style.display="none";
								document.getElementById("modifydialog").style.display="none";
							}
						}
					}
				}	
				deletefun=function(){
					var ok= window.confirm("确认删除选中学生信息？");
					if(ok){
						var arrdata=[];
						for(var i=(pagenum-1)*10;i<(pagenum==pagenums?backparam.length:pagenum*10);i++){
							if(document.getElementById("tcheckbox"+i).checked){
								arrdata.push(backparam[i].snum);
							}
						}
						var requestdata = arrdata.join("-")
						//1、创建异步请求对象
						var delxmlHttp = new XMLHttpRequest();
						//2、为异步请求对象绑定状态监听器
						delxmlHttp.onreadystatechange=function(){
							if(delxmlHttp.readyState==4&&delxmlHttp.status==200){
								var data = delxmlHttp.responseText;
								deleteBack(data);
							}
						}
						//声明局部刷新函数
						function deleteBack(delparam){
							if(delparam=="false"){
								document.getElementById("result").innerHTML="删除失败！"
								return
							}
							document.getElementById("result").innerHTML="删除成功！"
						}
						//3、初始化异步请求对象
						delxmlHttp.open("POST","${pageContext.request.contextPath}/delete.do?requestdata="+requestdata,true);
						//4、命令异步请求对象代替浏览器发送请求
						delxmlHttp.send();
					}
				}
				// alert(backparam.name+backparam.age+backparam.address);
				turnnext=function(){
					if(pagenum<pagenums){
						pagenum++;
						inserttable(pagenum,backparam);
						document.getElementById("itemnums").innerText=backparam.length;
						document.getElementById("pagenums").innerText=pagenums;
						document.getElementById("pagenum").innerText= pagenum;
						document.getElementById("nextpage").onclick= turnnext;
						document.getElementById("prevpage").onclick= turnback;
						document.getElementById("firstpage").onclick= turnfirst;
						document.getElementById("lastpage").onclick= turnlast;
						document.getElementById("modify").onclick=modifyfun;
						document.getElementById("delete").onclick=deletefun;
						document.getElementById("pageturn").onclick=turntopage;
					}else{
						alert("已经是最后一页了！")
					}
				}
				turnback=function(){
					if(pagenum>1){
						pagenum--;
						inserttable(pagenum,backparam);
						document.getElementById("itemnums").innerText=backparam.length;
						document.getElementById("pagenums").innerText=pagenums;
						document.getElementById("pagenum").innerText= pagenum;
						document.getElementById("nextpage").onclick= turnnext;
						document.getElementById("prevpage").onclick= turnback;
						document.getElementById("firstpage").onclick= turnfirst;
						document.getElementById("lastpage").onclick= turnlast;
						document.getElementById("modify").onclick=modifyfun;
						document.getElementById("delete").onclick=deletefun;
						document.getElementById("pageturn").onclick=turntopage;
					}else{
						alert("已经是第一页了！")
					}
				}
				turnfirst=function(){
					if(pagenum>1){
						pagenum=1;
						inserttable(pagenum,backparam);
						document.getElementById("itemnums").innerText=backparam.length;
						document.getElementById("pagenums").innerText=pagenums;
						document.getElementById("pagenum").innerText= pagenum;
						document.getElementById("nextpage").onclick= turnnext;
						document.getElementById("prevpage").onclick= turnback;
						document.getElementById("firstpage").onclick= turnfirst;
						document.getElementById("lastpage").onclick= turnlast;
						document.getElementById("modify").onclick=modifyfun;
						document.getElementById("delete").onclick=deletefun;
						document.getElementById("pageturn").onclick=turntopage;
					}else{
						alert("已经是第一页了！")
					}
				}
				turnlast=function(){
					if(pagenum<pagenums){
						pagenum = pagenums;
						inserttable(pagenum,backparam);
						document.getElementById("itemnums").innerText=backparam.length;
						document.getElementById("pagenums").innerText=pagenums;
						document.getElementById("pagenum").innerText= pagenum;
						document.getElementById("nextpage").onclick= turnnext;
						document.getElementById("prevpage").onclick= turnback;
						document.getElementById("firstpage").onclick= turnfirst;
						document.getElementById("lastpage").onclick= turnlast;
						document.getElementById("modify").onclick=modifyfun;
						document.getElementById("delete").onclick=deletefun;
						document.getElementById("pageturn").onclick=turntopage;
					}else{
						alert("已经是最后一页了！")
						
					}
				}
				turntopage=function(){
					pagenum = document.getElementById("pagetext").value;
					if(pagenum>0&&pagenum<=pagenums){
						inserttable(pagenum,backparam);
						document.getElementById("itemnums").innerText=backparam.length;
						document.getElementById("pagenums").innerText=pagenums;
						document.getElementById("pagenum").innerText= pagenum;
						document.getElementById("nextpage").onclick= turnnext;
						document.getElementById("prevpage").onclick= turnback;
						document.getElementById("firstpage").onclick= turnfirst;
						document.getElementById("lastpage").onclick= turnlast;
						document.getElementById("modify").onclick=modifyfun;
						document.getElementById("delete").onclick=deletefun;
						document.getElementById("pageturn").onclick=turntopage;
					}else{
						alert("输入的页码不在范围内！");
					}
				}
				document.getElementById("itemnums").innerText=backparam.length;
				document.getElementById("pagenums").innerText=pagenums;
				document.getElementById("pagenum").innerText= pagenum;
				document.getElementById("nextpage").onclick= turnnext;
				document.getElementById("prevpage").onclick= turnback;
				document.getElementById("firstpage").onclick= turnfirst;
				document.getElementById("lastpage").onclick= turnlast;
				document.getElementById("pageturn").onclick=turntopage;
				document.getElementById("modify").onclick=modifyfun;
				document.getElementById("delete").onclick=deletefun;
				
			}
			document.getElementById("sl01").onchange=function(){
				if(document.getElementById("sl01").value=="all"){
					document.getElementById("span01").innerHTML="";
					document.getElementById("check").onclick=function(){
						// 1、创建异步请求对象
						var xmlHttp = new XMLHttpRequest();
						// 2、为异步请求对象绑定工作状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data = xmlHttp.responseText;
								callBackForTable(data);
							}
							
						};
						// 3、初始化异步请求对象
						xmlHttp.open("POST","${pageContext.request.contextPath}/checkall.do",true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}
				}
				
				if(document.getElementById("sl01").value=="classroom"){
					document.getElementById("span01").innerHTML="<select id='sclass' name='classroom'>\
																	<option value='1-1'>初一一班</option>\
																	<option value='1-2'>初一二班</option>\
																	<option value='1-3'>初一三班</option>\
																	<option value='2-1'>初二一班</option>\
																	<option value='2-2'>初二二班</option>\
																	<option value='2-3'>初二三班</option>\
																	<option value='3-1'>初三一班</option>\
																	<option value='3-2'>初三二班</option>\
																	<option value='3-3'>初三三班</option>\
																 </select>";
					document.getElementById("check").onclick=function(){
						// ajax实现异步请求
						// 1、创建异步请求对象
						var xmlHttp =new XMLHttpRequest;
						// 2、为异步请求对象绑定状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data=xmlHttp.responseText;
								callBackForTable(data);
							}
						};
						
						// 3、初始化异步请求对象
						xmlHttp.open("POST","${pageContext.request.contextPath}/checkclassroom.do?"+document.getElementById("sclass").name+"="+document.getElementById("sclass").value,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}
				}
				if(document.getElementById("sl01").value=="sex"){
					document.getElementById("span01").innerHTML="<input type='radio' name='rsex' value='1' id='r01'/>男\
																 <input type='radio' name='rsex' value='0' id='r02' checked='checked'/>女"
					document.getElementById("check").onclick=function(){
						
						// ajax实现异步请求
						// 1、创建异步请求对象
						var xmlHttp =new XMLHttpRequest;
						// 2、为异步请求对象绑定状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data=xmlHttp.responseText;
								callBackForTable(data);
							}
						};
						var requestparam = "";
						if(document.getElementById("r01").checked){
							requestparam = "sex="+document.getElementById("r01").value;
						}else if(document.getElementById("r02").checked){
							requestparam = "sex="+document.getElementById("r02").value;
						}
						// 3、初始化异步请求对象
						xmlHttp.open("POST","${pageContext.request.contextPath}/checksex.do?"+requestparam,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}
				}
				if(document.getElementById("sl01").value=="age"){
					document.getElementById("span01").innerHTML="<input type='text' name='age' id='agetext'/>"
					document.getElementById("check").onclick=function(){
						
						// ajax实现异步请求
						// 1、创建异步请求对象
						var xmlHttp =new XMLHttpRequest;
						// 2、为异步请求对象绑定状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data=xmlHttp.responseText;
								callBackForTable(data);
							}
						};
						
						// 3、初始化异步请求对象
						xmlHttp.open("POST","${pageContext.request.contextPath}/checkage.do?age="+document.getElementById("agetext").value,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}
				}
				if(document.getElementById("sl01").value=="name"){
					document.getElementById("span01").innerHTML="<input type='text' name='name' id='nametext'/>"
					document.getElementById("check").onclick=function(){
						
						// ajax实现异步请求
						// 1、创建异步请求对象
						var xmlHttp =new XMLHttpRequest;
						// 2、为异步请求对象绑定状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data=xmlHttp.responseText;
								callBackForTable(data);
							}
						};
						
						// 3、初始化异步请求对象
						xmlHttp.open("POST","${pageContext.request.contextPath}/checkname.do?name="+document.getElementById("nametext").value,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}
				}
				if(document.getElementById("sl01").value=="phone"){
					document.getElementById("span01").innerHTML="<input type='text' name='phone' id='phonetext'/>"
					document.getElementById("check").onclick=function(){
						
						// ajax实现异步请求
						// 1、创建异步请求对象
						var xmlHttp =new XMLHttpRequest;
						// 2、为异步请求对象绑定状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data=xmlHttp.responseText;
								callBackForTable(data);
							}
						};
						
						// 3、初始化异步请求对象
						xmlHttp.open("POST","${pageContext.request.contextPath}/checkphone.do?phone="+document.getElementById("phonetext").value,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}
				}
				if(document.getElementById("sl01").value=="snum"){
					document.getElementById("span01").innerHTML="<input type='text' name='snum' id='snumtext'/>"
					document.getElementById("check").onclick=function(){
						
						// ajax实现异步请求
						// 1、创建异步请求对象
						var xmlHttp =new XMLHttpRequest;
						// 2、为异步请求对象绑定状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data=xmlHttp.responseText;
								callBackForTable(data);
							}
						};
						
						// 3、初始化异步请求对象
						xmlHttp.open("POST","${pageContext.request.contextPath}/checksnum.do?snum="+document.getElementById("snumtext").value,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}
				}
			}
			document.getElementById("add").onclick=function(){
				document.getElementById("background").style.display="block";
				document.getElementById("dform").style.display="block";
				document.getElementById("dform").innerHTML="<table>\
																	<tr>\
																		<td>学号：</td>\
																		<td><input type='text' name='snum' id='ajaxsnum'/></td>\
																	</tr>\
																	<tr>\
																		<td>姓名：</td>\
																		<td><input type='text' name='name' id='ajaxname'/></td>\
																	</tr>\
																	<tr>\
																		<td>年龄：</td>\
																		<td><input type='text' name='age' id='ajaxage'/></td>\
																	</tr>\
																	<tr>\
																		<td>性别：</td>\
																		<td>\
																			<input type='radio' name='sex' value='1' id='ajaxsex1'/>男\
																			<input type='radio' name='sex' value='0' id='ajaxsex2'/>女\
																		</td>\
																	</tr>\
																	<tr>\
																		<td>班级：</td>\
																		<td>\
																			<select name='classroom' id='ajaxclassroom'>\
																				<option value='1-1'>初一一班</option>\
																				<option value='1-2'>初一二班</option>\
																				<option value='1-3'>初一三班</option>\
																				<option value='2-1'>初二一班</option>\
																				<option value='2-2'>初二二班</option>\
																				<option value='2-3'>初二三班</option>\
																				<option value='3-1'>初三一班</option>\
																				<option value='3-2'>初三二班</option>\
																				<option value='3-3'>初三三班</option>\
																			</select>\
																		</td>\
																	</tr>\
																	<tr>\
																		<td>联系电话：</td>\
																		<td><input type='text' name='phone' id='ajaxphone'/></td>\
																	</tr>\
																	<tr>\
																		<td>住址：</td>\
																		<td><input type='text' name='address' id='ajaxaddress'/></td>\
																	</tr>\
																	<tr>\
																		<td align='center'><input type='button' value='添加' id='addbutton'/></td>\
																		<td align='center'><input type='button' value='取消' id='cancellbutton'/></td>\
																	</tr>\
																</table>"
				document.getElementById("cancellbutton").onclick=function(){
					document.getElementById("background").style.display="none";
					document.getElementById("dform").style.display="none";
				}
				document.getElementById("addbutton").onclick=function(){
					
					// 局部刷新实现函数
					function callBack(param){
						document.getElementById("msgspan").innerHTML=param;
						document.getElementById("background").style.display="none";
						document.getElementById("dform").style.display="none";
					}
					// 3、初始化异步请求对象
					if(document.getElementById("ajaxsex1").checked){
						// 1、创建异步请求对象
						var xmlHttp = new XMLHttpRequest();
						// 2、为异步请求对象绑定工作状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data = xmlHttp.responseText;
								callBack(data);
							}
						}
						xmlHttp.open("POST","${pageContext.request.contextPath}/add.do?"+document.getElementById("ajaxsnum").name+"="+document.getElementById("ajaxsnum").value+"&"+document.getElementById("ajaxname").name+"="+document.getElementById("ajaxname").value+"&"+document.getElementById("ajaxage").name+"="+document.getElementById("ajaxage").value+"&"+document.getElementById("ajaxsex1").name+"="+document.getElementById("ajaxsex1").value+"&"+document.getElementById("ajaxclassroom").name+"="+document.getElementById("ajaxclassroom").value+"&"+document.getElementById("ajaxphone").name+"="+document.getElementById("ajaxphone").value+"&"+document.getElementById("ajaxaddress").name+"="+document.getElementById("ajaxaddress").value,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}else if(document.getElementById("ajaxsex2").checked){
						// 1、创建异步请求对象
						var xmlHttp = new XMLHttpRequest();
						// 2、为异步请求对象绑定工作状态监听器
						xmlHttp.onreadystatechange=function(){
							if(xmlHttp.readyState==4&&xmlHttp.status==200){
								var data = xmlHttp.responseText;
								callBack(data);
							}
						}
						xmlHttp.open("POST","${pageContext.request.contextPath}/add.do?"+document.getElementById("ajaxsnum").name+"="+document.getElementById("ajaxsnum").value+"&"+document.getElementById("ajaxname").name+"="+document.getElementById("ajaxname").value+"&"+document.getElementById("ajaxage").name+"="+document.getElementById("ajaxage").value+"&"+document.getElementById("ajaxsex2").name+"="+document.getElementById("ajaxsex2").value+"&"+document.getElementById("ajaxclassroom").name+"="+document.getElementById("ajaxclassroom").value+"&"+document.getElementById("ajaxphone").name+"="+document.getElementById("ajaxphone").value+"&"+document.getElementById("ajaxaddress").name+"="+document.getElementById("ajaxaddress").value,true);
						// 4、命令异步请求对象代替浏览器发送请求
						xmlHttp.send();
					}else{
						alert("请选择性别！");
					}
					
				}
			}
		}
	</script>
	<!-- 遮蔽层 -->
	<div class="black" id="background"></div>
	<!-- 弹出表单框盒子 -->
	<div class="dialog" id="modifydialog">
		<center>
			<table>
				<tr>
					<td colspan="2" align="center">填写修改信息</td>
				</tr>
				<tr>
					<td>学号：</td>
					<td><input type='text' name='snum' id='modifysnum'/></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type='text' name='name' id='modifyname'/></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td><input type='text' name='age' id='modifyage'/></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<input type='radio' name='sex' value='1' id='modifysex1'/>男
						<input type='radio' name='sex' value='0' id='modifysex2'/>女
					</td>
				</tr>
				<tr>
					<td>班级：</td>
					<td>
						<select name='classroom' id='modifyclassroom'>
							<option value='1-1' id="modclass01">初一一班</option>
							<option value='1-2' id="modclass02">初一二班</option>
							<option value='1-3' id="modclass03">初一三班</option>
							<option value='2-1' id="modclass04">初二一班</option>
							<option value='2-2' id="modclass05">初二二班</option>
							<option value='2-3' id="modclass06">初二三班</option>
							<option value='3-1' id="modclass07">初三一班</option>
							<option value='3-2' id="modclass08">初三二班</option>
							<option value='3-3' id="modclass09">初三三班</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type='text' name='phone' id='modifyphone'/></td>
				</tr>
				<tr>
					<td>住址：</td>
					<td><input type='text' name='address' id='modifyaddress'/></td>
				</tr>
				<tr>
					<td align="center"><input type='button' value='保存' id='modifybutton'/></td>
					<td align="center"><input type='button' value='取消' id='cancelbutton'/></td>
				</tr>
			</table>
		</center>
	</div>
	<span><h4>欢迎您，管理员${user.username }</h4></span>
	<div id="checkdiv" align="center">
		<h5>查询方式:</h5>
		<select id="sl01">
			<option value="choose01" id="op01">请选择</option>
			<option value="all" id="op02">全部查询</option>
			<option value="classroom" id="op03">按班级查询</option>
			<option value="sex" id="op04">按性别查询</option>
			<option value="age" id="op05">按年龄查询</option>
			<option value="name" id="op06">按姓名查询</option>
			<option value="phone" id="op07">按联系电话查询</option>
			<option value="snum" id="op08">按学号查询</option>
		</select>
		<span id="span01"></span>
		<input type="button" value="查询" id="check"/>
	</div>
	<div id="adddiv">
		<div id="buttondiv">
			<input type="button" id="add" value="添加学生" style="position: absolute; width: 50%;height: 50%;top: 25%;left: 25%;font-family: '仿宋';background: beige;font-size: 30px;"/>
		</div>
		<span id="msgspan" ></span>
		<span id="stockPage"><a href="${pageContext.request.contextPath}/stock.do">跳转至股票页面</a></span>
	</div>
	<div id="dform" align="center"></div>
	<div id="line">
		<hr color="crimson"/>
	</div>
	<div id="result" align="center">
		
	</div>
	
</body>
</html>