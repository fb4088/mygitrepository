<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
	<style type="text/css">
		span{
			color: crimson;
			
		}
		div{
			position: relative;
			left: 40%; 
			
		}
	</style>
</head>
<body>
	<script type="text/javascript"> 
		window.onload=function(){
			document.getElementById("text01").onblur=function(){
				// 1、创建一个异步请求对象
				var xmlHttp = new XMLHttpRequest();
				// 2、为异步请求对象绑定工作状态监听器
				xmlHttp.onreadystatechange=function(){
					if(xmlHttp.readyState == 4&&xmlHttp.status==200){
						var data=xmlHttp.responseText;
						callBack(data);
					}
				}
				
				// 3、初始化异步请求对象
				xmlHttp.open("get","/springMVC-test02/usernameCheck.do?username="+document.getElementById("text01").value,true);
				// 4、命令异步请求对象代替浏览器发送请求
				xmlHttp.send();
				// 局部刷新实现函数
				function callBack(param){
					if(param=="用户名已经存在！"){
						document.getElementById("span01").innerText = param;
					}else{
						document.getElementById("span01").innerText = "√";
					}
					
					
				}
			}
			document.getElementById("text02").onblur=function(){
				var regExp = /^[A-Za-z—_$]{1}[A-Za-z0-9]{5,15}$/;
				if(regExp.test(document.getElementById("text02").value)){
					document.getElementById("span02").innerText = "√";
				}else{
					document.getElementById("span02").innerText = "密码必须以字母开头，长度不少于6位不大于16位！";
				}
			}
			document.getElementById("text03").onblur=function(){
				if(document.getElementById("text02").value.trim() != document.getElementById("text03").value.trim()){
					document.getElementById("span03").innerText = "两次输入的密码不相同";
				}else if(document.getElementById("text02").value.length>0&&document.getElementById("text03").value.length>0){
					document.getElementById("span03").innerText = "√";
				}
			}
			document.getElementById("text02").onfocus=function(){
				if(document.getElementById("span03").innerText.length > 1 ){
					document.getElementById("span03").innerText = "";
					document.getElementById("text02").value="";
					document.getElementById("text03").value="";
					document.getElementById("span02").innerText="*";
				}
			}
			document.getElementById("text03").onfocus=function(){
				if(document.getElementById("span03").innerText.length > 1 ){
					document.getElementById("span03").innerText = "";
					document.getElementById("text02").value="";
					document.getElementById("text03").value="";
					document.getElementById("span02").innerText="*";
				}
			}
			document.getElementById("text04").onblur=function(){
				if(document.getElementById("text04").value.length>0){
					document.getElementById("span04").innerText="只有正确的管理员口令才能注册成功";
				}else{
					document.getElementById("span04").innerText="*";
				}
			}
			document.getElementById("sm").onclick=function(){
				if(document.getElementById("span01").innerText=="√"&&document.getElementById("span02").innerText=="√"&&document.getElementById("span03").innerText=="√"&&document.getElementById("span04").innerText=="只有正确的管理员口令才能注册成功"){
					document.getElementById("sm").type="submit";
				}else{
					alert("请确保表单信息填写正确！");
				}
			}
			var textId = ["text01","text02","text03","text04"];
			for(var i=0;i<textId.length;i++){
				var text = textId[i];
				document.getElementById(text).onkeydown=function(event){
					if(event.keyCode == 13){
						document.getElementById("sm").click();
					}
				}
			}
			
			
		}
		
	</script>
	
	<div>
		<h3>欢迎注册学生信息管理网管理员账号</h3><br>
	</div>
	<hr/>
	<div>
		<h4>${msg}</h4>
		<table>
			<form action="${pageContext.request.contextPath}/registSubmit.do" method="post">
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="username" id="text01"></td>
					<td><span id="span01">*</span></td>
				</tr>
				<tr>
					<td>登录密码：</td>
					<td><input type="text" name="password" id="text02"></td>
					<td><span id="span02">*</span></td>
				</tr>
				<tr>
					<td>重复密码：</td>
					<td><input type="text" id="text03"></td>
					<td><span id="span03">*</span></td>
				</tr>
				<tr>
					<td>管理员口令：</td>
					<td><input type="text" name="kouling" id="text04"></td>
					<td><span id="span04">*</span></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="button" value="提交" id="sm"></td>
					<td></td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>