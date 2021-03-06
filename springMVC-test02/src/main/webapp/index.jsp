<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("regist").onclick=function(){
			window.open("${pageContext.request.contextPath }/regist.do","_blank");
		}
		
	}
</script>
</head>
<body>
	<center>
		<h1>学生信息管理系统</h1>
	</center>
	<hr />
	<center>
		<h4>${msg }</h4>
		<form action="${pageContext.request.contextPath }/some.do" method="get">
				<table>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="username" id="uname"></td>
					</tr>
					<tr>
						<td>登录密码：</td>
						<td><input type="text" name="password" id="pw"></td>
					</tr>
				
					<tr align="center">
						<td colspan="2"><input type="submit" value="登录" id="sm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="注册" id="regist"></td>
					</tr>
				</table>
			</form>
	</center>
</body>
</html>