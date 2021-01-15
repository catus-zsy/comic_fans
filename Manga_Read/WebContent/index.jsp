<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="sql.MGoperate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マンガを読む</title>
<script src="JS/jquery-3.5.1.js"></script>
</head>
<link href="CSS/NewIndex.css" rel="stylesheet" type="text/css">
<link href="CSS/iconfont.css" type="text/css" rel="stylesheet">
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




<!-- ----------控制提示信息的JSTL弹窗top---------- -->

<!-- ----------控制提示信息的JSTL弹窗bottom---------- -->



<div class="main">
	
	<div class="TopImage">
		<img src="LOCAL/TOP.jpg" class="topimage">
	</div>

	<div class="SearchMethod">
		<ul class="firstul" id="SelectManga">
			<li class="firstli">
				<button onclick="ChangaToSearchManga()" class="SelectBt" id="SM">漫画</button>
			</li>
		</ul>
		<ul class="firstul" id="SelectAuthor">
			<li class="firstli">
				<button onclick="ChangaToSearchAuthor()" class="SelectBt" id="SA">作者</button>
			</li>
		</ul>
		
		<br>
		
		<div class="SearchBox" id="Manga">
			<form action="SearchMgServlet" method="post">
				<input type="search" name="manga" placeholder="漫&nbsp;画" class="SearchInput" id="SearchMangaInput">
				<button type="submit" class="SearchBt" id="SearchMangaBt">搜</button>
			</form>
		</div>
		<div class="SearchBox" id="Author">
			<form action="SearchMgServlet" method="post">
				<input type="search" name="author" placeholder="作&nbsp;者" class="SearchInput" id="SearchAuthorInput">
				<button type="submit" class="SearchBt" id="SearchAuthorBt">搜</button>
			</form>
		</div>
	</div>
	
	<div class="diviler">
	</div>
	
	<div class="VariousClassify">
		<form action="SearchMgServlet" method="post">
			<ul class="firstul">
				<li class="firstli">
					<ul class="secondul">
						<li class="secondli">
							<button class="ClsfBt" id="state0" type="button">状态&emsp;&emsp;</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="state1" onclick="pstate1()" type="button">已完结</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="state2" onclick="pstate2()" type="button">连载中</button>
						</li>
					</ul>
				</li>
			
				<li class="firstli">
					<ul class="secondul">
						<li class="secondli">
							<button class="ClsfBt" id="classify0" type="button">分类&emsp;&emsp;</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="classify1" onclick="pclassify1()" type="button">热血</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="classify2" onclick="pclassify2()" type="button">少女</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="classify3" onclick="pclassify3()" type="button">轻松</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="classify4" onclick="pclassify4()" type="button">音乐</button>
						</li>
					</ul>
				</li>	
			
				<li class="firstli">
					<ul class="secondul">
						<li class="secondli">
							<button class="ClsfBt" id="grade0" type="button">分级&emsp;&emsp;</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="grade1" onclick="pgrade1()" type="button">全年龄</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="grade2" onclick="pgrade2()" type="button">R18</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="grade3" onclick="pgrade3()" type="button">R15</button>
						</li>
					</ul>
				</li>
			
				<li class="firstli">
					<ul class="secondul">
						<li class="secondli">
							<button class="ClsfBt" id="theme0" type="button">题材&emsp;&emsp;</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="theme1" onclick="ptheme1()" type="button">游戏改</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="theme2" onclick="ptheme2()" type="button">轻小说改</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="theme3" onclick="ptheme3()" type="button">写实向</button>
						</li>
					</ul>
				</li>
			
				<li class="firstli">
					<ul class="secondul">
						<li class="secondli">
							<button class="ClsfBt" id="area0" type="button">地区&emsp;&emsp;</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="area1" onclick="parea1()" type="button">欧美</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="area2" onclick="parea2()" type="button">国漫</button>
						</li>
						<li class="secondli">
							<button class="ClsfBt" id="area3" onclick="parea3()" type="button">日漫</button>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="firstul">
				<li class="firstli">
					<ul class="secondul">
						<li class="secondli">
							<input type="hidden" id="STATE" value="" name="state">
							<input type="hidden" id="CLASSIFY" value="" name="classify">
							<input type="hidden" id="GRADE" value="" name="grade">
							<input type="hidden" id="THEME" value="" name="theme">
							<input type="hidden" id="AREA" value="" name="area">
							<button type="submit" class="AdvanceSearch">高级搜索</button>
						</li>
					</ul>
				</li>
			</ul>
		</form>
	</div>
	
	<div class="MangaRecommend">
			
		<div class="h_divider"></div>
		
		<button class="label1">漫</button>
		<button class="label2">画</button>
		<button class="label3">推</button>
		<button class="label4">荐</button>
		<button class="label5">区</button>

		
		<%
			MGoperate op = new MGoperate();
			ArrayList mgs = op.SearchMgtag("1");
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
					<form action = "MangaCoverPage.jsp">
						<input type="hidden" value="<%=user %>" name="UName">					
						<input type="hidden" value="<%=mg.mgname %>" name="mgname">
						<button type="submit" class="NameBt"><%=mg.mgname %></button>
					</form>
					<br><br>
					<a href="#" class="author"><%=mg.mgauthor %>&nbsp;|&nbsp;</a><a href="#" class="classify"><%=mg.mgclassify %></a><br><br><br>
					<a href="#" class="abstract"><%=mg.mgintroduce %></a>
				</div>
			</div>
		<% 
				}
			}
		%>
	</div>
	
	<!--div class="notice">
		<a href="#">本站素材仅于学习交流使用，请勿用于商业用途</a>
	</div>
	
	<div id="index_time">
	</div>
	<br><br>
	<div class="num">
		<a href="#">本站已被浏览&nbsp;<!--%=application.getAttribute("count") %>次</a>
	</div-->

	
</div>
<script>


	/*----------改变分类区按钮颜色top----------*/
	
	/*---state状态top---*/
	function pstate1(){
		document.getElementById("state1").style.color="#fab4bf";
		document.getElementById("state2").style.color="#bcc4e9";
		document.getElementById("STATE").value="已完结";
	}
	function pstate2(){
		document.getElementById("state2").style.color="#fab4bf";
		document.getElementById("state1").style.color="#bcc4e9";
		document.getElementById("STATE").value="连载中";
	}
	/*---state状态bottom---*/
	
	/*---classify分类top---*/
	function pclassify1(){
		document.getElementById("classify1").style.color="#fab4bf";
		document.getElementById("classify2").style.color="#bcc4e9";
		document.getElementById("classify3").style.color="#bcc4e9";
		document.getElementById("classify4").style.color="#bcc4e9";
		document.getElementById("CLASSIFY").value="热血";
	}
	function pclassify2(){
		document.getElementById("classify2").style.color="#fab4bf";
		document.getElementById("classify1").style.color="#bcc4e9";
		document.getElementById("classify3").style.color="#bcc4e9";
		document.getElementById("classify4").style.color="#bcc4e9";
		document.getElementById("CLASSIFY").value="少女";
	}
	function pclassify3(){
		document.getElementById("classify3").style.color="#fab4bf";
		document.getElementById("classify1").style.color="#bcc4e9";
		document.getElementById("classify2").style.color="#bcc4e9";
		document.getElementById("classify4").style.color="#bcc4e9";
		document.getElementById("CLASSIFY").value="轻松";
	}
	function pclassify4(){
		document.getElementById("classify4").style.color="#fab4bf";
		document.getElementById("classify1").style.color="#bcc4e9";
		document.getElementById("classify2").style.color="#bcc4e9";
		document.getElementById("classify3").style.color="#bcc4e9";
		document.getElementById("CLASSIFY").value="音乐";
	}
	/*---classify分类bottom---*/
	
	/*---grade分级top---*/
	function pgrade1(){
		document.getElementById("grade1").style.color="#fab4bf";
		document.getElementById("grade2").style.color="#bcc4e9";
		document.getElementById("grade3").style.color="#bcc4e9";
		document.getElementById("GRADE").value="全年龄";
	}
	function pgrade2(){
		document.getElementById("grade2").style.color="#fab4bf";
		document.getElementById("grade1").style.color="#bcc4e9";
		document.getElementById("grade3").style.color="#bcc4e9";
		document.getElementById("GRADE").value="R18";
	}
	function pgrade3(){
		document.getElementById("grade3").style.color="#fab4bf";
		document.getElementById("grade1").style.color="#bcc4e9";
		document.getElementById("grade2").style.color="#bcc4e9";
		document.getElementById("GRADE").value="R15";
	}
	/*---grade分级bottom---*/
	
	/*---theme主题top---*/
	function ptheme1(){
		document.getElementById("theme1").style.color="#fab4bf";
		document.getElementById("theme2").style.color="#bcc4e9";
		document.getElementById("theme3").style.color="#bcc4e9";
		document.getElementById("THEME").value="游戏改";
	}
	function ptheme2(){
		document.getElementById("theme2").style.color="#fab4bf";
		document.getElementById("theme1").style.color="#bcc4e9";
		document.getElementById("theme3").style.color="#bcc4e9";
		document.getElementById("THEME").value="轻小说改";
	}
	function ptheme3(){
		document.getElementById("theme3").style.color="#fab4bf";
		document.getElementById("theme1").style.color="#bcc4e9";
		document.getElementById("theme2").style.color="#bcc4e9";
		document.getElementById("THEME").value="写实向";
	}
	/*---theme主题bottom---*/
	
	/*---area地区top---*/
	function parea1(){
		document.getElementById("area1").style.color="#fab4bf";
		document.getElementById("area2").style.color="#bcc4e9";
		document.getElementById("area3").style.color="#bcc4e9";
		document.getElementById("AREA").value="欧美";
	}
	function parea2(){
		document.getElementById("area2").style.color="#fab4bf";
		document.getElementById("area1").style.color="#bcc4e9";
		document.getElementById("area3").style.color="#bcc4e9";
		document.getElementById("AREA").value="国漫";
	}
	function parea3(){
		document.getElementById("area3").style.color="#fab4bf";
		document.getElementById("area1").style.color="#bcc4e9";
		document.getElementById("area2").style.color="#bcc4e9";
		document.getElementById("AREA").value="日漫";
	}
	/*---area地区bottom---*/
	
	/*----------改变分类区按钮颜色top----------*/



	/*----------选择漫画or作者的按钮top----------*/
	function ChangaToSearchManga(){
		document.getElementById("SearchMangaInput").style.display="inline";
		document.getElementById("SearchMangaBt").style.display="inline";
		document.getElementById("SM").style.borderColor="#bcc4e9";

		document.getElementById("SearchAuthorInput").style.display="none";
		document.getElementById("SearchAuthorBt").style.display="none";
		document.getElementById("SA").style.borderColor="white";
	}
	function ChangaToSearchAuthor(){
		document.getElementById("SearchAuthorInput").style.display="inline";
		document.getElementById("SearchAuthorBt").style.display="inline";
		document.getElementById("SA").style.borderColor="#bcc4e9";
		
		document.getElementById("SearchMangaInput").style.display="none";
		document.getElementById("SearchMangaBt").style.display="none";
		document.getElementById("SM").style.borderColor="white";
	}
	/*----------选择漫画or作者的按钮bottom----------*/
	
</script>





<div class="index_bottom">
	<div class="num"><a href="#">本站已被浏览&nbsp;<%=application.getAttribute("count") %>次</a></div>
	<div id="index_time"></div>
</div>
<script type="text/javascript">
	setInterval(function()
	{
	var d=new Date();
	var t=d.toLocaleTimeString();
	document.getElementById("index_time").innerHTML=t;
	},1000)
</script>

</body>
</html>