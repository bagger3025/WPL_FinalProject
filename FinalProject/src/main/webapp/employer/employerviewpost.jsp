<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="employer_piece/uservalidate.jsp"></jsp:include>
	<jsp:include page="../piece/viewpost.jsp">
		<jsp:param name="key" value="<%=request.getParameter(\"key\")%>"/>
	</jsp:include>
	<form method="post" action="/home.jsp"><button>Go Back</button></form>
</body>
</html>