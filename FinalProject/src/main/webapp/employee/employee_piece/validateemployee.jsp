<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
/* DEFINE PAGE */
String HOMEPAGE = "../../home.jsp";
userStruct us = (userStruct)session.getAttribute("user");
System.out.println("in validateemployee, userstruct: " + us);
if (us == null){
	response.sendRedirect(HOMEPAGE);
} else if (us.gubun != "EMPLOYEE"){
	response.sendRedirect(HOMEPAGE);
}
%>