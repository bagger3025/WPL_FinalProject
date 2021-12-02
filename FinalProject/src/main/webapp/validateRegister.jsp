<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Login.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body><%
	// password should be complex -> js
	// password and val_password should be same -> js
	// ID should be different in DB
	String username = request.getParameter("id");
	String password = request.getParameter("password");
	userStruct us;
	
	if (username.equals("")){
		us = null;
	} else {
		us = HandleLogin.MatchID(username);
	}
	
	if (us != null){
		// already id exists
		session.setAttribute("register", "ID already exists");
		response.sendRedirect("register.jsp");
	} else {
		session.setAttribute("register", "Register was done successfully");
		response.sendRedirect("home.jsp");
	}%>
</body>
</html>