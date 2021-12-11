<%@page import="Login.userStruct"%>
<%@page import="post.PostContactme"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String title = request.getParameter("title");
	String mes = request.getParameter("message");
	String userkey = Integer.toString(((userStruct)session.getAttribute("user")).key);
	boolean success = PostContactme.post(title, mes, userkey);
		
	response.sendRedirect("../contactus.jsp");
%>