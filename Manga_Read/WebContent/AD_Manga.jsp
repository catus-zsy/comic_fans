<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="servlet.AddMGServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加漫画</title>
</head>
<link href="CSS/InputContent.css" type="text/css" rel="stylesheet">
<style>
.addmg input{
	height:24px;
	width:200px;
	padding-left:5px;
	margin-bottom:10px;
	border:2px solid #bcc4e9;
	border-radius:10px;
	display:table;
}
</style>
<body>
<h3>请输入要添加的漫画名、链接和分类</h3>
<div class="addmg">
	<form action="UploadMGServlet" method="post" enctype="multipart/form-data">
		<input type="text" name="name" placeholder="漫画名">
		<input type="text" name="introduce" placeholder="简介">
		<input type="text" name="classify" placeholder="分类">
		<input type="text" name="author" placeholder="作者">
		<input type="text" name="state" placeholder="状态">
		<input type="text" name="grade" placeholder="分级">
		<input type="text" name="theme" placeholder="题材">
		<input type="text" name="area" placeholder="地区">
		<input type="file" name="photo"/>
		<button type="submit">上传</button>
	</form>	
</div>

<a href="Admin_start.jsp">返回管理员站点</a>
</body>
</html>