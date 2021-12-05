<%@page import="post.Post"%>
<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body><%
	/* DEFINE PAGE */
	String USERVALIDATE = "../employer_piece/uservalidate.jsp";
	String HOMEPAGE = "../../home.jsp";
	String ALBAPOST = "../albapost.jsp";%>
	<jsp:include page="<%=USERVALIDATE %>"></jsp:include><%
	String title = request.getParameter("title");
	String post = request.getParameter("post");
	userStruct us = (userStruct)session.getAttribute("user");
	System.out.println(us);
	int writer_key = us.key;
	
	boolean uploaded = Post.doPost(writer_key, title, post);
	System.out.println("uploaded: " + uploaded);
	if (uploaded){
		response.sendRedirect(HOMEPAGE);
	} else {
		session.setAttribute("error", "Couldn't upload the post");
		response.sendRedirect(ALBAPOST);
	}%>
</body>
</html>