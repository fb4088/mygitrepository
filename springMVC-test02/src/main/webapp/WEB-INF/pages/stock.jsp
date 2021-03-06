<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>股票分析首页</title>
</head>
<body>
<script type="text/javascript" src="http://hq.sinajs.cn/list=sh601006"></script>
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("getdata").onclick=function(){
		alert(hq_str_sh601006);
	
		}
	}
</script>

<h3>股票分析首页</h3>
<input type="button" value="获取股票数据" id="getdata"/>
</body>
</html>