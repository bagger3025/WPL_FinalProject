<%@page import="Login.userStruct"%>
<%@ page import="Login.HandleLogin" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<html>
<head>
	<meta charset="EUC-KR">
	<title>HOME PAGE</title>
	<link  rel="stylesheet" type="text/css" href="./resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./resources/css/login.css">
</head>
<body><%
	/* DEFINE PAGE */
	String TOEMPLOYER = "piece/employer.jsp";
	String TOEMPLOYEE = "piece/employee.jsp";
	String LOGINPAGE = "piece/login.jsp";

	userStruct us = (userStruct)session.getAttribute("user");
	if(us != null){
		if (us.gubun.equals("EMPLOYER")){ %>
			<jsp:forward page="<%=TOEMPLOYER %>"></jsp:forward><%
		} else if (us.gubun.equals("EMPLOYEE")){%>
			<jsp:forward page="<%=TOEMPLOYEE %>"></jsp:forward><%
		} else {
			// gubun must be in [EMPLOYER, EMPLOYEE]
		}
	}
	String register = (String)session.getAttribute("register");
	if (register != null){
		session.removeAttribute("register");
	} else {
		register = "";
	}
	String errorMessage = (String)session.getAttribute("login-error");
	if (errorMessage != null){
		session.removeAttribute("login-error");
	} else {
		errorMessage = "";
	}%>
	
	<!-- Login Form -->
	<jsp:include page="<%=LOGINPAGE %>">
		<jsp:param name="register" value="<%=register%>"/>
		<jsp:param name="error" value="<%=errorMessage%>"/>
	</jsp:include>
</body>
</html>