<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";
	session.invalidate();
	response.sendRedirect(HOMEPAGE);%>