<%@ page import="Login.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
</head>

<body>

<% 	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	userStruct accepted = HandleLogin.MatchLogin(username, password);

	System.out.println(accepted);
	if (accepted != null){
		response.sendRedirect("employee.jsp");
	} else {
		response.sendRedirect("home.jsp");
	}
%>

</body>
</html>