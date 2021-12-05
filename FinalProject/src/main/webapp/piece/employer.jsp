<%@page import="Login.userStruct"%>
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
	String USERVALIDATE = "../employer/employer_piece/uservalidate.jsp";
	String LOGOUT = "validate/logout.jsp";
	String POSTPAGE = "employer/albapost.jsp";
	String SHOWPOST = "../employer/employer_piece/showPosts.jsp";
	%>
	<jsp:include page="<%=USERVALIDATE %>"></jsp:include><%
	int key = ((userStruct)session.getAttribute("user")).key;%>
THIS IS EMPLOYER PAGE
	<form method="post" action="<%=LOGOUT%>">
		<button>Log Out</button>
	</form>
	<form method="post" action="<%=POSTPAGE%>">
		<button>Post</button>
	</form>
	<jsp:include page="<%=SHOWPOST %>">
		<jsp:param name="writer_id" value="<%=key %>"/>
	</jsp:include>
</body>
</html>