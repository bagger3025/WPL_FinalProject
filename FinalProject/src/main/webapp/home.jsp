<%@ page import="Login.HandleLogin" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*" %>
	<form method="post" action="validate.jsp">
		<input type="text" name="username">
		<input type="password" name="password">
		<a href="register.jsp">Register</a>
		<input type="submit" value="Submit">
	</form>
</body>
</html>