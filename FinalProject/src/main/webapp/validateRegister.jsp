<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Login.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	// password should be complex -> js
	// password and val_password should be same -> js
	// ID should be different in DB
	String username = request.getParameter("id");
	String password = request.getParameter("password");
	userStruct us = HandleLogin.MatchLogin(username, password);
	
	if (us != null){
		// already id exists
		response.sendRedirect("register.jsp");
	} else {
		response.sendRedirect("home.jsp");
	}
%>
</body>
</html>