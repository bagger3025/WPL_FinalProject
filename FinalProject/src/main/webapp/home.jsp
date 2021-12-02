<%@page import="Login.userStruct"%>
<%@ page import="Login.HandleLogin" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="EUC-KR">
<title>HOME PAGE</title>
</head>
<body><%
	userStruct us = (userStruct)session.getAttribute("user");
	if(us != null){
		if (us.gubun.equals("EMPLOYER")){ %>
			<jsp:forward page="employer.jsp"></jsp:forward><%
		} else if (us.gubun.equals("EMPLOYEE")){%>
			<jsp:forward page="employee.jsp"></jsp:forward><%
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
	String errorMessage = (String)session.getAttribute("error");
	if (errorMessage != null){
		session.removeAttribute("error");
	} else {
		errorMessage = "";
	}%>
	
	<!-- Login Form -->
	<jsp:include page="login.jsp">
		<jsp:param name="register" value="<%=register%>"/>
		<jsp:param name="error" value="<%=errorMessage%>"/>
	</jsp:include>
</body>
</html>