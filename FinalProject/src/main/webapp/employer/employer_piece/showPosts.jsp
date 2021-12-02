<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int writer_id = Integer.parseInt(request.getParameter("writer_id"));
	int postpage;
	if (request.getParameter("page") == null){
		postpage = 0;
	} else {
		postpage = Integer.parseInt(request.getParameter("page"));
	}
	ArrayList<PostStruct> ps = Post.getPost(writer_id);%>
<ul><%
	for (int i = 0; i < ps.size(); i++){%>
		<li><a href="employer/employerviewpost.jsp?key=<%=ps.get(i).key%>" target="_blank"><%=ps.get(i).title%></a></li><%
	}%>
</ul>