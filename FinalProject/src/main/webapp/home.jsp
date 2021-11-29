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
<%! enum Gubun {EMPLOYEE, EMPLOYER} %>
<% 	
	HandleLogin hl = new HandleLogin();
	
	
	boolean validated = false;
	Gubun g = Gubun.EMPLOYEE;
	if (!validated){ %>
		<jsp:include page="login.html"></jsp:include>
	<% } else if (g == Gubun.EMPLOYEE){ %>
		<jsp:include page="employee.jsp"></jsp:include>
	<%} else { %>
		<jsp:include page="employer.jsp"></jsp:include>
	<%}%>
</body>
</html>