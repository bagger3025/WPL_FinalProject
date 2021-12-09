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
		System.out.println(us);
		int writer_key = us.key;
		
		boolean uploaded = Post.doPost(writer_key, title, post);
		System.out.println("uploaded: " + uploaded);
		if (uploaded){
			response.sendRedirect(HOMEPAGE);
		} else {
			session.setAttribute("error", "Couldn't upload the post");
			response.sendRedirect(ALBAPOST);
		}
	}%>