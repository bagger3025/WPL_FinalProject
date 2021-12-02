<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
userStruct us = (userStruct)session.getAttribute("user");
if (us == null){
	response.sendRedirect("home.jsp");
} else if (us.gubun != "EMPLOYER"){
	response.sendRedirect("home.jsp");
}
%>