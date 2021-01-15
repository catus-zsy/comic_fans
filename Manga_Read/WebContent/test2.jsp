<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mgclass.Manga_Content"%>
<%@ page import="mgclass.Manga_Cover"%>
<%@ page import="sql.MGoperate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MGoperate MG = new MGoperate();
	ArrayList mgn = MG.SearchMgcontent("X");
	if(mgn!=null){
		Iterator iter = mgn.iterator();
		while(iter.hasNext()){
			Manga_Content mgc = (Manga_Content)iter.next();
%>
	<img src="Upload/<%=mgc.mcimgid %>" height="120px">
<%
		}
	}
%>
</body>
</html>