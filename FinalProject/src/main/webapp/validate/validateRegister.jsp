<%@page import="post.Post"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Login.*" %>
<%
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";
	String REGISTERPAGE = "../register.jsp";

	// password should be complex -> js
	// password and val_password should be same -> js
	// ID should be different in DB
	String username = request.getParameter("id");
	String password = request.getParameter("password");
	String FirstName = request.getParameter("first_name");
	String LastName = request.getParameter("last_name");
	String gubun = request.getParameter("gubun");

	HandleLogin.Register(username, password, FirstName, LastName, gubun);
	session.setAttribute("register", "Register was done successfully");
	response.sendRedirect(HOMEPAGE);
%>