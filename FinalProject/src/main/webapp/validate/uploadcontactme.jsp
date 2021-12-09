<%@page import="post.PostContactme"%>
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
<%
	String title = request.getParameter("title");
	String mes = request.getParameter("message");
	String userkey = Integer.toString(((userStruct)session.getAttribute("user")).key);
	boolean success = PostContactme.post(title, mes, userkey);
	if (success){
		session.setAttribute("contactme_success", "Successfully send the message");
	} else {
		session.setAttribute("contactme_fail", "couldn't send the message");
	}
		
	response.sendRedirect("../contactme.jsp");
%>
</body>
</html>