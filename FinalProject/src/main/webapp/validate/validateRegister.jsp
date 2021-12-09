<%@page import="post.Post"%>
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
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";
	String REGISTERPAGE = "../register.jsp";

	// password should be complex -> js
	// password and val_password should be same -> js
	// ID should be different in DB
	String username = request.getParameter("id");
	String password = request.getParameter("password");
	String FirstName = request.getParameter("first_name");
	String LastName = request.getParameter("last_name");
	String gubun = request.getParameter("gubun");
	userStruct us;
	
	if (username.equals("")){
		// TODO shouldn't success
		us = null;
	} else {
		us = HandleLogin.MatchID(username);
	}
	
	if (us != null){
		// already id exists
		session.setAttribute("register", "ID already exists");
		response.sendRedirect(REGISTERPAGE);
	} else {
		HandleLogin.Register(username, password, FirstName, LastName, gubun);
		session.setAttribute("register", "Register was done successfully");
		response.sendRedirect(HOMEPAGE);
	}%>
</body>
</html>