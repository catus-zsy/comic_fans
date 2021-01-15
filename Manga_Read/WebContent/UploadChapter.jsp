<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="UploadChapterServlet" method="post" enctype="multipart/form-data">
			<input type="text" name="mgname" value="<%=request.getParameter("mgnm")%>">
			<input type="text" name="chapter" placeholder="章节数">
			<input type="file" name="photo"  multiple="multiple"/>
			<input type="submit" value="Upload"/>
		</form>
	</div>
	<div>
		<ul class="img_list">
		</ul>
	</div>
</body>
</html>