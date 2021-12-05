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
	%>
	<jsp:include page="<%=USERVALIDATE %>"></jsp:include><%
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
		<input type="submit" value="submit">
	</form>
</body>
</html>