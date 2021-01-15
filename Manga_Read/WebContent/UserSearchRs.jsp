<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="sql.MGoperate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索结果</title>
</head>
<link href="CSS/ShowMgLink.css" type="text/css" rel="stylesheet">
<style>
.index_img{														/*修改div到左边的距离而不是修改图片的margin-left*/
	margin-left:-45px;
}

.index_img .img_list .mg_cover{									/*1.所有一级菜单*/
	list-style:none;
	position:relative;						
	float:left;	
	padding-right:4px;
	padding-right:50px;
}

.index_img .img_list .mg_cover .mg_name{
	font-size:16px;
	padding-left:5px;
	padding-right:50px;
	padding-bottom:2px;
	background:#ffff80;
	color:#ff8040;
	text-decoration:none;
	border:1px double #ff8040;
}

.MgCover{
	border:1px double #ff8040;
	background:#ffff80;
	color:#ff8040;
}
</style>
<body background="Upload/DRAGON.jpg" style="background-repeat:no-repeat ;background-size:cover;background-attachment: fixed;">
<a href="index.jsp">返回首页</a>
<div class="mg_link">
<% 
	String usm = request.getParameter("usm");
	MGoperate MG = new MGoperate();
	ArrayList mgn = MG.SearchMgname(usm);
	if(mgn!=null){
		Iterator iter = mgn.iterator();
		while(iter.hasNext()){
			Manga_Cover mg = (Manga_Cover)iter.next();
%>
	<div class="index_img">
		<ul class="img_list">
		<li class="mg_cover">
			<a href="#"><img src="Upload/<%=mg.getname() %>.jpg" height="240px">
			</a>
			<form action="MangaCoverPage.jsp" method="post">
				<input type="hidden" value="<%=mg.getname() %>" name="mgname">
				<button class="MgCover" type="submit"><%=mg.getname() %>&nbsp;|&nbsp;<%=mg.getclassify() %></button>
			</form>
		</li>
	</ul>
	</div>
<%
		}
	}
%>
</div>
</body>
</html>