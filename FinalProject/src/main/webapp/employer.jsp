<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="employer/employer_piece/uservalidate.jsp"></jsp:include><%
	int key = ((userStruct)session.getAttribute("user")).key;%>
THIS IS EMPLOYER PAGE
	<form method="post" action="logout.jsp">
		<button>Log Out</button>
	</form>
	<form method="post" action="albapost.jsp">
		<button>Post</button>
	</form>
	<jsp:include page="employer/employer_piece/showPosts.jsp">
		<jsp:param name="writer_id" value="<%=key %>"/>
	</jsp:include>
</body>
</html>