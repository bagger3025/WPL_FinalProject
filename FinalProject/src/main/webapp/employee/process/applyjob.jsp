<%@page import="Login.userStruct"%>
<%@page import="applyalba.Alba"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String postkey = request.getParameter("key");
	String employeekey = Integer.toString(((userStruct)(session.getAttribute("user"))).key);

	boolean successapply = Alba.applyAlba(postkey, employeekey);
	if (successapply){
		session.setAttribute("success", "send apply to the job");
	} else {
		session.setAttribute("error", "couldn't apply to the job");
	}
	response.sendRedirect("../viewpost.jsp?key=" + postkey);
%>
</body>
</html>