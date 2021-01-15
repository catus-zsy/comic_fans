<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="sql.MGoperate"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/SearchResultCSS.css" rel="stylesheet" type="text/css">
<link href="CSS/iconfont.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
	Cookie[] cookies=request.getCookies();
	String user="";
	String Admin=null;
	if(cookies!=null){
		int i;
		for(i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("AdminCookie")){
				String cookieValue=cookies[i].getValue();
				String Admininfo[]=cookieValue.split("#");//拆分字符串
				Admin=URLDecoder.decode(Admininfo[0],"UTF-8");
			}
			else if(cookies[i].getName().equals("UserCookie")){//deal界面设置的cookie名为acCookie
				String cookieValue=cookies[i].getValue();
				String userinfo[]=cookieValue.split("#");//拆分字符串
				user=URLDecoder.decode(userinfo[0],"UTF-8");
			}
			
		}
	}
	
	if("".equals(user)&&Admin==null){
		session.setAttribute("msg", "e_06");
		response.sendRedirect("index.jsp");
	}
%>


<div class="v_menu">

	<%
		if("".equals(user)||"error".equals(user)){
	%>
		<div class="User">
			<a href="#" class="uname">未登录</a>
		</div>
	<%	
		}
		else{
	%>
		<div class="User">
			<a href="#" class="uname"><%=user %></a>
		</div>
	<%
		}
	%>

	<div class="firstblock">
		<img src="LOCAL/LOGO.png" width="200px">
	</div>
	
	<div class="secondblock">
		<ul class="firstul">
			<li class="firstli">
				<form action="index.jsp" method="post">
					<a href="#" onclick="ShowMoreOption()" class="abt">导&nbsp;航</a>
				</form>
				<ul class="secondul" id="MoreOption">
				<li class="secondli">
					<form action="index.jsp" method="post">
						<button type="submit" class="bt">&nbsp;&nbsp;&nbsp;首&nbsp;页</button>	
					</form>
				</li>
				<li class="secondli">
					<form action="UserCollections.jsp" method="post">
						<button type="submit" class="bt">&nbsp;&nbsp;&nbsp;收&nbsp;藏</button>	
					</form>
				</li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div class="thirdblock">
		<ul class="firstul">
			<li class="firstli">
				<br><br><br><br><br>
				<form action="LogOutServlet" method="post">
					<button type="submit" class="bt">退&nbsp;出&nbsp;登&nbsp;录</button>
				</form>
			</li>
		</ul>
	</div>

</div>
<!-- ----------控制左侧导航栏各个弹窗的js函数top---------- -->
<script>
	//首页展开更多选项
	var clc=1;
	function ShowMoreOption(){
		if(clc==1){
			document.getElementById("MoreOption").style.display="table";
			clc=-1;
		}
		else if(clc==-1){
			document.getElementById("MoreOption").style.display="none";
			clc=1;
		}
	}
</script>


<div class="title">
	<button type="button" class="TextBt">搜&nbsp;索&nbsp;结&nbsp;果</button>
</div>


<%
	

	ArrayList<Manga_Cover> mgs = (ArrayList<Manga_Cover>)session.getAttribute("mgs");
	if(mgs!=null){
		Iterator iter = mgs.iterator();
		while(iter.hasNext()){ 
			Manga_Cover mg = (Manga_Cover)iter.next();
%>
			<div class="MangaCover">
				<div class="img">
					<img src="Upload/<%=mg.mgname %>.jpg" class="cover" width="200px">
				</div>
				<div class="txt">
					<form action="MangaCoverPage.jsp">
						<input type="hidden" value="<%=user %>" name="UName">					
						<input type="hidden" value="<%=mg.mgname %>" name="mgname">
						<button type="submit" class="NameBt"><%=mg.mgname %></button>
					</form>
					<a href="#" class="author"><%=mg.mgauthor %>&nbsp;|&nbsp;</a><a href="#" class="classify"><%=mg.mgclassify %></a><br><br><br>
					<a href="#" class="abstract"><%=mg.mgintroduce %></a>
				</div>
				<br><br>
				
			</div>
<% 
				}
			}
%>


</body>
</html>