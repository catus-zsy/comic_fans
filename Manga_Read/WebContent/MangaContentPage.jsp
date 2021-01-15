<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Content"%>
<%@ page import="sql.MGoperate"%>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="CSS/NewIndex.css" rel="stylesheet" type="text/css">
<link href="CSS/iconfont.css" type="text/css" rel="stylesheet">
<style>

body{
	padding:0px;
	margin:0px;
}

.bkgd{
	position:absolute;
	width:100%;
	padding-left:520px;
	padding-top:60px;
	padding-bottom:38px;
	background:grey;
	z-index:-1;
}

.return{
	font-size:14px;
	opacity:0.55;
	border:none;
	background:#b9d0f4;
	color:blue;
}


.pagebtn{
	margin-right:10px;
	float:left;
	font-size:14px;
	opacity:0.55;
	border:1px solid blue;
	background:#b9d0f4;
	color:blue;
}
.pagebtn_1{
	margin-right:10px;
	float:left;
	font-size:16px;
	opacity:0.55;
	border:none;
	background:#d6e1fe;
	color:blue;
}
.pagebtn_2{
	margin-right:10px;
	float:left;
	font-size:16px;
	opacity:0.55;
	border:none;
	background:#c1ffff;
	color:blue;
}


.pageend{
	text-decoration:none;
}
</style>
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
					<button type="button" class="bt" onclick="URegist()">&nbsp;&nbsp;&nbsp;注&nbsp;册</button>	
				</li>
				<li class="secondli">
					<button type="button" class="bt" onclick="ULog()">&nbsp;&nbsp;&nbsp;登&nbsp;录</button>
				</li>
				<li class="secondli">
					<button type="button" class="bt">&nbsp;&nbsp;&nbsp;首&nbsp;页</button>
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
				<form action="index.jsp" method="post">
					<input type="hidden" value="" name="index_clsf">
					<button type="button" class="bt">个&nbsp;人&nbsp;信&nbsp;息</button>
				</form>
			</li>
			<li class="firstli">
				<form action="index.jsp" method="post">
					<input type="hidden" value="" name="index_clsf">
					<button type="button" class="bt">充&nbsp;值</button>
				</form>
			</li>
			<li class="firstli">
				<form action="index.jsp" method="post">
					<input type="hidden" value="" name="index_clsf">
					<button type="button" class="bt">设&nbsp;置</button>
				</form>
			</li>
			<li class="firstli">
			<%
				if(Admin==null){
			%>
					<button type="button" class="bt" onclick="ALog()">管&nbsp;理&nbsp;员&nbsp;登&nbsp;录</button>
			<%
				}
				else{
			%>
					<form action="Admin_start.jsp">
						<button type="submit" class="bt">管&nbsp;理&nbsp;员&nbsp;空&nbsp;间</button>
					</form>
			<%
				}
			%>
			</li>
			<li class="firstli">
				<form action="LogOutServlet" method="post">
					<button type="submit" class="bt">退&nbsp;出&nbsp;登&nbsp;录</button>
				</form>
			</li>
		</ul>
	</div>

</div>



<div class="shadow" id="indexblackshadow"></div>



<div class="UserRegistWindow" id="UserRe">
	<form action="UserRegistServlet" method="post">
		<button class="ShutWindowBt_URe" onclick="ShutWindow_URe()" type="button">关闭</button><br><br>
		<input type="text" name="ReName" placeholder="昵称"><br><br>
		<input type="text" name="ReMail" placeholder="邮箱"><br><br>
		<input type="text" name="RePassword" placeholder="密码"><br><br>
		<button type="submit" class="URegistBt">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</button>
	</form>
</div>

<div class="UserLoginWindow" id="UserLog">
	<form action="UserLoginServlet" method="post">
		<button class="ShutWindowBt_ULog" onclick="ShutWindow_ULog()" type="button">关闭</button><br><br>
		<input type="text" name="UName" placeholder="昵称"><br><br>
		<input type="password" name="UPassword" placeholder="密码"><br><br>
		<button type="submit" class="ULoginBt">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
	</form>
</div>

<div class="AdminLoginWindow" id="AdLog">
	<form action="AdminLoginServlet" method="post">
		<button class="ShutWindowBt_ALog" onclick="ShutWindow_ALog()" type="button">关闭</button><br><br>
		<input type="text" name="adminaccount" class="admlgipt" placeholder="管理员账号"><br><br>
		<input type="password" name="adminpassword" class="admlgipt" placeholder="管理员密码"><br><br>
		<button class="ALoginBt" type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
	</form>
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

<script type="text/javascript">

	/*-----用户注册弹窗top-----*/
		function URegist(){
		document.getElementById("UserRe").style.display="table";
		document.getElementById("indexblackshadow").style.display="table";		
	}
	/*-----用户注册弹窗bottom-----*/
		
	/*-----用户登录弹窗top-----*/
		function ULog(){
		document.getElementById("UserLog").style.display="table";	
		document.getElementById("indexblackshadow").style.display="table";
	}
	/*-----用户登录弹窗bottom-----*/
	
	/*-----管理员登录弹窗top-----*/
	function ALog(){
		document.getElementById("AdLog").style.display="table";
		document.getElementById("indexblackshadow").style.display="table";
	}
	/*-----管理员登录弹窗bottom-----*/
	
	/*-----关闭管理员登录弹窗top-----*/
	function ShutWindow_ALog(){
		document.getElementById("AdLog").style.display="none";
		document.getElementById("indexblackshadow").style.display="none";
	}
	/*-----关闭管理员登录弹窗bottom-----*/
	
	/*-----关闭用户注册弹窗top-----*/
	function ShutWindow_URe(){
		document.getElementById("UserRe").style.display="none";
		document.getElementById("indexblackshadow").style.display="none";
	}
	/*-----关闭用户注册弹窗bottom-----*/
	
	/*-----关闭用户登录弹窗top-----*/
	function ShutWindow_ULog(){
		document.getElementById("UserLog").style.display="none";
		document.getElementById("indexblackshadow").style.display="none";
	}
	/*-----关闭用户登录弹窗bottom-----*/
	
</script>

<!-- ----------登录及注册返回信息top---------- -->
	<%
		String msg = (String)session.getAttribute("msg");
		//错误代码列表
		if(msg == "0"){
			
		}
		else if(msg == "e_01"){
		%>
			<script>
				alert("该邮箱或用户名已存在");
			</script>
		<%
		}
		else if(msg == "e_02"){
		%>
			<script>
				alert("用户名太短，请输入4-20个字符");
			</script>
		<%
		}
		else if(msg == "e_03"){
			%>
				<script>
					alert("用户名不存在");
				</script>
			<%	
		}
		else if(msg == "e_04"){
			%>
				<script>
					alert("密码错误");
				</script>
			<%	
		}
		else if(msg == "e_05"){
			%>
				<script>
					alert("不能注册的用户名");
				</script>
			<%	
		}
		else if(msg == "e_06"){
			%>
				<script>
					alert("请先登录!");
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
		//正确代码列表
		if(msg == "c_01"){
		%>
			<script>
				alert("注册成功");
			</script>
		<%	
		}
		else if(msg == "c_02"){
			%>
				<script>
					alert("登录成功");
				</script>
			<%	
		}
		else if(msg == "c_03"){
			%>
				<script>
					alert("已退出登录");
				</script>
			<%	
		}
		else if(msg == "c_04"){
			%>
				<script>
					alert("收藏成功");
				</script>
			<%	
		}
		else if(msg == "c_05"){
			%>
				<script>
					alert("管理员上线");
				</script>
			<%	
		}
		else if(msg == "c_06"){
			%>
				<script>
					alert("管理员退出");
				</script>
			<%	
		}
		session.setAttribute("msg", "0");
	%>
<!-- ----------登录及注册返回信息bottom---------- -->

<!-- ----------控制弹窗的js函数bottom---------- -->

<div class="bkgd">


	<div>
<% 
	String mgname = request.getParameter("mgname");
	String mgchpt = request.getParameter("mgchpt");
	String mgpage = request.getParameter("mgpage");
	if(mgname==null){
		mgname = (String)session.getAttribute("mgname");
		mgchpt = (String)session.getAttribute("mgchpt");
		mgpage = (String)session.getAttribute("mgpage");
	}
	MGoperate MG = new MGoperate();
	Manga_Content mg = MG.SelectPage(mgname, mgchpt, mgpage);
	if(mg.mctotal_pages!=null){
%>
		<div>
			<img src="Upload/<%=mg.mcimgid%>" height="540px">
		</div>
		
		<div class="turnpagediv">
			<form action="TurnPageServlet" method="post">
				<input type="hidden" value="previous" name="porn">
				<input type="hidden" value="<%=mgname %>" name="mgname">
				<input type="hidden" value="<%=mgchpt %>" name="mgchpt">
				<input type="hidden" value="<%=mgpage %>" name="mgpage">
				<input type="hidden" value="<%=mg.mctotal_pages %>" name="mgtopg">
				<button class="pagebtn" type="submit">上一页</button>
			</form>
			
			<button class="pagebtn_1">第<%=mg.mcpage %>/<%=mg.mctotal_pages %>页</button>
			
			<form action="TurnPageServlet" method="post">
				<input type="hidden" value="next" name="porn">
				<input type="hidden" value="<%=mgname %>" name="mgname">
				<input type="hidden" value="<%=mgchpt %>" name="mgchpt">
				<input type="hidden" value="<%=mgpage %>" name="mgpage">
				<input type="hidden" value="<%=mg.mctotal_pages %>" name="mgtopg">
				<button class="pagebtn" type="submit">下一页</button>
			</form>
			
			<button class="pagebtn_2">第<%=mg.mcchapter %>话</button>
		</div>
<%
	}
	else{
%>
	<a class="pageend" href="#">当前漫画已浏览完毕</a>
<%
	}
%>

<br><br>
<div>
<form action="MangaCoverPage.jsp" method="post">
	<input type="hidden" value="<%=mgname %>" name="mgname">
	<button class="return" type="submit">return to chapter</button>
</form>
</div>

</div>

</div>
</body>
</html>