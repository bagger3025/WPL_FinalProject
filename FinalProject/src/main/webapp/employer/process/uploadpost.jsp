<%@page import="post.Post"%>
<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/employer/employer_piece/uservalidate.jsp"></jsp:include><%
	String title = request.getParameter("title");
	String post = request.getParameter("post");
	userStruct us = (userStruct)session.getAttribute("user");
	System.out.println(us);
	int writer_key = us.key;
	
	boolean uploaded = Post.doPost(writer_key, title, post);
	System.out.println("uploaded: " + uploaded);
	if (uploaded){
		response.sendRedirect("../../home.jsp");
	} else {
		session.setAttribute("error", "Couldn't upload the post");
		response.sendRedirect("../albapost.jsp");
	}%>
</body>
</html>