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
	String USERVALIDATE = "employer_piece/uservalidate.jsp";
	String POSTTODB = "process/uploadpost.jsp";
	
	/* USER VALIDATE */
	userStruct user_session = (userStruct)session.getAttribute("user");
	if (user_session == null || !user_session.gubun.equals("EMPLOYER")){
		response.sendRedirect("../home.jsp");
	} else {
		String error = (String)session.getAttribute("error");
		if (error != null){
			session.removeAttribute("error");
		} else {
			error = "";
		}%>
		
		<div class="error-message"><%=error%></div>
		<form method="post" action="<%=POSTTODB%>">
			<input type="text" name="title" value="">
			<textarea name="post"></textarea>
			<input type="number" name="money">
			<input type="submit" value="submit">
		</form><%
	}%>
</body>
</html>