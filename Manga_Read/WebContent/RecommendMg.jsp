<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="sql.MGoperate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>推荐漫画</title>
</head>
<link href="CSS/ShowMgLink.css" type="text/css" rel="stylesheet">
<link href="CSS/RcdMg.css" type="text/css" rel="stylesheet">
<body>
<a href="Admin_start.jsp">返回管理员站点</a>

<div class="mg_link">
<% 
	MGoperate MG = new MGoperate();
	ArrayList mgs = MG.findmg();
	if(mgs!=null){
		Iterator iter = mgs.iterator();
		while(iter.hasNext()){
			Manga_Cover mg = (Manga_Cover)iter.next();
%>
	<ul class="link">
		<li class="mg_name"><a href="<%=mg.getintroduce() %>" target="_blank"><%=mg.getname() %></a></li>
		<li class="mg_clsf">|&nbsp;&nbsp;<a href="#"><%=mg.getclassify() %></a></li>
		<li class="rcd">
			<form action="RcdMGServlet" method="post">
				<input type="hidden" value="<%=mg.getname() %>" name="rcdnm">
				<input type="hidden" value="CR" name="situation">
				<button type="submit" class="clrcdbt">取消推荐</button>
			</form>
		</li>
		<li class="rcd">
			<form action="RcdMGServlet" method="post">
				<input type="hidden" value="<%=mg.getname() %>" name="rcdnm">
				<input type="hidden" value="R" name="situation">
				<button type="submit" class="rcdbt">推荐</button>
			</form>
		</li>
	</ul>
<%
		}
	}
%>
</div>

</body>
</html>