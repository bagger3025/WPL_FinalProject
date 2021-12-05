<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body><%
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";

	session.invalidate();
	response.sendRedirect(HOMEPAGE);%>
</body>
</html>