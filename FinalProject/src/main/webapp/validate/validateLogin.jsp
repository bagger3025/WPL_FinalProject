<%@ page import="Login.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
</head>

<body><%
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	System.out.println(username + " " + password);
	userStruct us = HandleLogin.MatchLogin(username, password);

	if (us != null){
		// login successful, because info matches with db
		session.setAttribute("user", us);
		response.sendRedirect(HOMEPAGE);
	} else {
		// login failed
		session.setAttribute("error", "Please check your id and password");
		response.sendRedirect(HOMEPAGE);
	}%>
</body>
</html>