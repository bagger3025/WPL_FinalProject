<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="employer_piece/uservalidate.jsp"></jsp:include><%
	String error = (String)session.getAttribute("error");
	if (error != null){
		session.removeAttribute("error");
	} else {
		error = "";
	}%>
	
	<div class="error-message"><%=error%></div>
	<form method="post" action="process/uploadpost.jsp">
		<input type="text" name="title" value="">
		<textarea name="post"></textarea>
		<input type="submit" value="submit">
	</form>
</body>
</html>