<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="sql.MGoperate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マンガを読む</title>
</head>
<link href="CSS/INdex.css" rel="stylesheet" type="text/css">
<link href="CSS/ShowMgLink.css" type="text/css" rel="stylesheet">
<link href="CSS/IndexRcd.css" type="text/css" rel="stylesheet">
<link href="CSS/Admin.css" type="text/css" rel="stylesheet">
<link href="CSS/iconfont.css" type="text/css" rel="stylesheet">
<body background="" style="background-repeat:no-repeat ;background-size:cover;background-attachment: fixed;">

<!-- div class="index_top">
	<a href="#" class="name">マンガを読む</a>
	<ul class="members" onclick="showmbs()">
		<li class="mbs"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小组成员</a>
			<ul class="mb" id="mb">
				<li><a href="#">廖兴愿</a></li>
				<li><a href="#">韩彦宸</a></li>
				<li><a href="#">罗舒宁</a></li>
				<li><a href="#">马文静</a></li>
				<li><a href="#">张思源</a></li>
			</ul>
		</li>
	</ul>
</div>

<script>
	var clc=1;
	function showmbs(){
		if(clc==1){
			document.getElementById("mb").style.display="table";
			clc=-1;
		}
		else if(clc==-1){
			document.getElementById("mb").style.display="none";
			clc=1;
		}
	}
</script-->


<div class="v_menu">

	<div class="firstblock">
		<img src="LOCAL/LOGO.png" width="200px">
	</div>

	<div class="secondblock">
		<ul class="firstul">
			<li class="firstli">
				<form action="index.jsp" method="post">
					<a href="#" onclick="ShowMoreOption()" class="abt">首&nbsp;页</a>
				</form>
				<ul class="secondul" id="MoreOption">
				<li class="secondli">
					<form action="index.jsp" method="post">
						<input type="hidden" value="" name="index_clsf">
						<button type="submit" class="bt">&nbsp;&nbsp;&nbsp;注&nbsp;册</button>	
					</form>
				</li>
				<li class="secondli">
					<form action="index.jsp" method="post">
						<input type="hidden" value="" name="index_clsf">
						<button type="submit" class="bt">&nbsp;&nbsp;&nbsp;登&nbsp;录</button>
					</form>	
				</li>
				<li class="secondli">
					<form action="index.jsp" method="post">
						<input type="hidden" value="" name="index_clsf">
						<button type="submit" class="bt">&nbsp;&nbsp;&nbsp;搜&nbsp;索</button>	
					</form>
				</li>
				<li class="secondli">
					<form action="index.jsp" method="post">
						<input type="hidden" value="" name="index_clsf">
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
					<button type="submit" class="bt">个&nbsp;人&nbsp;信&nbsp;息</button>
				</form>
			</li>
			<li class="firstli">
				<form action="index.jsp" method="post">
					<input type="hidden" value="" name="index_clsf">
					<button type="submit" class="bt">充&nbsp;值</button>
				</form>
			</li>
			<li class="firstli">
				<form action="index.jsp" method="post">
					<input type="hidden" value="" name="index_clsf">
					<button type="submit" class="bt">设&nbsp;置</button>
				</form>
			</li>
			<li class="firstli">
				<form action="index.jsp" method="post">
					<input type="hidden" value="" name="index_clsf">
					<button type="submit" class="bt">客&nbsp;服</button>
				</form>
			</li>
			<li class="firstli">
				<form action="index.jsp" method="post">
					<input type="hidden" value="" name="index_clsf">
					<button type="submit" class="bt">关&nbsp;于&nbsp;我&nbsp;们</button>
				</form>
			</li>
		</ul>
	</div>

</div>
<script>
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


<div class="main">
	
	<div class="TopImage">
		<img src="LOCAL/TOP.jpg" width="100%">
	</div>

	<div class="">
	
	</div>

</div>


<!--form action="UserRegistServlet" method="post">
	<input type="text" placeholder="邮箱"  name="mail">
	<input type="text" placeholder="昵称" name="name">
	<input type="text" placeholder="密码" name="password">
	<button type="submit">注册</button>
</form>

<div class="shadow" id="indexblackshadow"></div>

<div class="adminlogin" id="adlog">
	<form action="AdminLoginServlet" method="post">
		<button class="shutlgbt" onclick="shutlog()">关闭</button><br><br>
		<input type="text" name="adminaccount" class="admlgipt" placeholder="管理员账号"><br><br>
		<input type="text" name="adminpassword" class="admlgipt" placeholder="管理员密码"><br><br>
		<button class="adminlgbt" type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
	</form>
</div>
<script type="text/javascript">
	function alog(){
		document.getElementById("adlog").style.display="table";
		document.getElementById("indexblackshadow").style.display="table";
	}
</script>
<script type="text/javascript">
	function shutlog(){
		document.getElementById("adlog").style.display="none";
		document.getElementById("indexblackshadow").style.display="none";
	}
</script>


<div class="mg_link">
<% 
	String index_clsf = request.getParameter("index_clsf");
	System.out.println(index_clsf);
	MGoperate MG = new MGoperate();
	if(index_clsf!=null&&index_clsf!=""){
		ArrayList mgn = MG.SearchMgclsf(index_clsf);
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
	}
	else{
		ArrayList mgn = MG.SearchMgtag("1");
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
	}
%>
</div-->

<div class="notice">
	<a href="#">本站素材仅于学习交流使用，请勿用于商业用途</a>
</div>

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