<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Alba Posting Page</title>
<link  rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/albapost.css">
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
		<div class="albapost_wrapper">
			<div style="text-align: center;">Post ALBA to ALBA Univ </div>
			<form method="post" action="<%=POSTTODB%>" class="albapost_form">
				<span> Posting Title </span>
				<input type="text" name="title" value="">
				<span> Introduce your Alba</span>
				<textarea name="post"></textarea>
				<span> Wage </span>
				<input type="number" name="money">
				<input type="submit" value="submit">
			</form>
		</div>
		<%
	}%>
</body>
</html>