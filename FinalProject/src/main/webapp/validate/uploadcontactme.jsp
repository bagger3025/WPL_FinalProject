<%@page import="post.PostContactme"%>
<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	userStruct us = (userStruct)session.getAttribute("user");
	if (us == null){
		response.sendRedirect("../home.jsp");
	} else {
		String title = request.getParameter("title");
		String mes = request.getParameter("message");
		String userkey = Integer.toString(us.key);
		boolean success = PostContactme.post(title, mes, userkey);
		if (success){
			session.setAttribute("contactme_success", "Successfully send the message");
		} else {
			session.setAttribute("contactme_fail", "couldn't send the message");
		}
		response.sendRedirect("../contactme.jsp");
	}
%>