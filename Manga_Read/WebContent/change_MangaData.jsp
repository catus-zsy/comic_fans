<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改漫画信息</title>
<link href="CSS/ShowMgLink.css" type="text/css" rel="stylesheet">
</head>
<body>

<div class="mg_link">
	<ul class="link">
		<li class="mg_name"><a href="<%=request.getParameter("prelk") %>" target="_blank"><%=request.getParameter("prenm") %></a></li>
		<li class="mg_clsf">|&nbsp;&nbsp;<a href="#"><%=request.getParameter("precf") %></a></li>
	</ul>
</div>
<div>
	<form action="AltMGServlet" method="post">
			<input type="hidden" value="<%=request.getParameter("prenm") %>" name="prenm">
			<input type="text" name="chgnm" placeholder="漫画名">
			<button type="submit">修改</button>
	</form>
</div>
<div>
	<form action="AltMGServlet" method="post">
			<input type="hidden" value="<%=request.getParameter("prenm") %>" name="prenm">
			<input type="text" name="chglk" placeholder="链接">
			<button type="submit">修改</button>
	</form>
</div>
<div>
	<form action="AltMGServlet" method="post">
			<input type="hidden" value="<%=request.getParameter("prenm") %>" name="prenm">
			<input type="text" name="chgcf" placeholder="分类">
			<button type="submit">修改</button>
	</form>
</div>
<a href="Alter_Manga.jsp">返回上一界面</a>
</body>
</html>