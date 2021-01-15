<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="sql.MGoperate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改漫画</title>
<script src="JS/jquery-3.5.1.js"></script>
</head>
<link href="CSS/ShowMgLink.css" type="text/css" rel="stylesheet">
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
	<ul  class="link">
		<li class="mg_name"><a href="#" target="_blank"><%=mg.getname() %></a></li>
		<li class="mg_clsf">|&nbsp;&nbsp;<a href="#"><%=mg.getclassify() %></a></li>
		<li class="del">
			<form id="delmg" action="UploadChapter.jsp" method="post">
				<input type="hidden" value="<%=mg.getname() %>" name="mgnm">
				<button type="submit" class="delbt">上传新章节</button>
			</form>
		</li>
		<li class="del">
			<form id="delmg" action="change_MangaData.jsp" method="post">
				<!-- input type="hidden" value="<%=mg.getname() %>" name="prenm"-->
				<input type="hidden" value="<%=mg.getintroduce() %>" name="prelk">
				<input type="hidden" value="<%=mg.getclassify() %>" name="precf">
				<button type="submit" class="delbt">修改</button>
			</form>
		</li>
		<li class="del">
			<form id="delmg" action="DelMGServlet" method="post">
				<input type="hidden" value="<%=mg.getname() %>" name="delnm">
				<button type="submit" class="delbt">删除</button>
			</form>
		</li>
	</ul>
<%
		}
	}
%>
</div>

<!-- script type="text/javascript">
	function Pressbt(){
		var x;
		x=confirm("确定删除吗");
		if(x==true){
			document.getElementById("delmg").submit();
		}
	}
	错误的Js代码，只会提交列表中的第一项，所以删除的话无论点哪个都是删除第一个
</script -->

</body>
</html>