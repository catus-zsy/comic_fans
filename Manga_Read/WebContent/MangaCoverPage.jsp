<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Content"%>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="mgclass.Comment" %>
<%@ page import="sql.MGoperate"%>
<%@ page import="sql.Commentoperate" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/MangaCoverPageCSS.css" rel="stylesheet" type="text/css">
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
		if(Admin!=null){
	%>
		<div class="User">
			<a href="#" class="uname">管理员<%=Admin %></a>
		</div>
	<%	
		}
		else if("".equals(user)||"error".equals(user)){
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

	<%
		String msg = (String)session.getAttribute("msg");
		//错误代码列表
		if(msg == "0"){
			
		}
		else if(msg == "c_04"){
	%>
			<script>
				alert("收藏成功");
			</script>
	<%
		}
		else if(msg == "e_07"){
	%>
			<script>
				alert("您已收藏过此漫画");
			</script>
	<%
		}
		else if(msg == "e_08"){
	%>
			<script>
				alert("超过80字，评论失败");
			</script>
	<%
		}
		else if(msg == "e_09"){
	%>
			<script>
				alert("登录过期！");
			</script>
	<%
		}
		session.setAttribute("msg", "0");
	%>
		




<div class="size">
<%
		

	String mgname = request.getParameter("mgname");
	if(mgname==null){
		mgname=(String)session.getAttribute("MName");
	}
	MGoperate MG = new MGoperate();
	Manga_Cover mgn = MG.PreciseSearch(mgname);
	if(mgn!=null){
%>
	<a href="#"><img src="Upload/<%=mgn.mgname %>.jpg" width="240px"></a>
<%
	}
%>
	<br>
<%
	ArrayList cpt = MG.Showchapter(mgname);
	if(cpt==null){
	}
	if(cpt!=null){
		Iterator iter = cpt.iterator();
		while(iter.hasNext()){
			String c = (String)iter.next();
%>
	<form action="MangaContentPage.jsp" method="post">
		<input type="hidden" value="<%=mgname %>" name="mgname">
		<input type="hidden" value="<%=c %>" name="mgchpt">
		<input type="hidden" value="1" name="mgpage">
		<div class="MgChapter">
			<button type="submit">第<%=c %>话</button>
		</div>
	</form>
<%
		}
	}
%>

<br><br>
<%
	if(Admin==null){
%>
	<div class="Ct">
		<form action = "CollectMangaServlet" method="post">
			<input type="hidden" value="<%=mgname %>" name="MName">
			<input type="hidden" value="<%=user %>" name="UName">
			<button type="submit" class="CollectBt">收藏</button>
		</form>
	</div>
<%
	}
%>

</div>

<div class="introduce">
		<a href="#" class="title"><%=mgn.mgname %></a><br><br><br>
		<a href="#" class="clsf">分类&nbsp;|&nbsp;<%=mgn.mgclassify %></a><br>
		<a href="#" class="auth">作者&nbsp;|&nbsp;<%=mgn.mgauthor %></a><br><br><br>
		<a href="#" class="divide">- - - - - - - - - - - - - - - - - - - - - - - - - - - -</a><br><br>
		<a href="#" class="abstract"><%=mgn.mgintroduce %></a>
</div>


<div class="CommentArea">
		
	<%
		Commentoperate cop = new Commentoperate(); 
		ArrayList cmts = cop.FindMgComments(mgname);
		if(cmts!=null){
			Iterator iter = cmts.iterator();
			while(iter.hasNext()){
				Comment cmt = (Comment)iter.next();
	%>
	
	<div class="SingleComment">
			<button type="button" class="uname"><%=cmt.UName %></button>
			<button type="button" class="time"><%=cmt.time %></button>
			<div class="CommentContent">
				<a href="#" class="comment"><%=cmt.comment %></a>
			</div>
			<%
			if(Admin!=null||cmt.UName.equals(user)){
			%>
			<form action="DelCommentServlet" method="post">
				<input type="hidden" value="<%=cmt.MName %>" name="MName">
				<input type="hidden" value="<%=cmt.UName %>" name="UName">
				<input type="hidden" value="<%=cmt.time %>" name="time">
				<input type="hidden" value="<%=cmt.comment %>" name="comment">
				<button type="submit" class="DelCmtBt">删除评论</button>
			</form>
			<%
			}
			%>
	</div>

	<%
			}
		}
	%>
	
	<div class="MakeCommentArea">
		<form action="CommentServlet" method="post">
			<input type="hidden" value="<%=mgname %>" name="MName">
			<textarea rows="4" name="comment"></textarea><br>
			<button type="submit" class="commentBt">发表评论</button>
		</form>
	</div>
	
</div>

</body>
</html>