<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	/* DEFINE PAGE */
	String VIEWPOST = "../employerviewpost.jsp";

	String key = request.getParameter("key");
	Post.FinishPost(key);
	response.sendRedirect(VIEWPOST+"?key="+key);
%>
</body>
</html>