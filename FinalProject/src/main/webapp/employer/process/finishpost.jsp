<%@page import="post.Post"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String key = request.getParameter("key");
	Post.FinishPost(key);
	response.sendRedirect("../employerviewpost.jsp?key="+key);
%>