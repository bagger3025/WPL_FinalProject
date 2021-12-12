<%@page import="Login.userStruct"%>
<%@page import="post.PostContactme"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String title = request.getParameter("title");
	String mes = request.getParameter("message");
	userStruct us = (userStruct)session.getAttribute("user");
	if (us == null){
		response.sendRedirect("../../home.jsp");
	} else {
		String userkey = Integer.toString(us.key);
		boolean success = PostContactme.post(title, mes, userkey);
			
		response.sendRedirect("../contactus.jsp");
	}
%>