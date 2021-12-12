<%@page import="Login.userStruct"%>
<%@page import="applyalba.Alba"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String postkey = request.getParameter("key");
	userStruct us = (userStruct)session.getAttribute("user");
	if (us == null){
		response.sendRedirect("../../home.jsp");
	} else {
		String employeekey = Integer.toString(us.key);

		boolean successapply = Alba.applyAlba(postkey, employeekey);
		response.sendRedirect("../viewpost.jsp?key=" + postkey);
	}
%>