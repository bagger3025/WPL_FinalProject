<%@page import="post.Post"%>
<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/* DEFINE PAGE */
	String HOMEPAGE = "../../home.jsp";
	String ALBAPOST = "../albapost.jsp";
	
	userStruct us = (userStruct)session.getAttribute("user");
	
	if (us == null || !us.gubun.equals("EMPLOYER")){
		response.sendRedirect(HOMEPAGE);
	} else {
		String title = request.getParameter("title");
		String post = request.getParameter("post");
		String money = request.getParameter("money");
		
		boolean uploaded = Post.doPost(us.key, title, post, money);
		if (uploaded){
			response.sendRedirect(HOMEPAGE);
		} else {
			response.sendRedirect(ALBAPOST);
		}
	}%>