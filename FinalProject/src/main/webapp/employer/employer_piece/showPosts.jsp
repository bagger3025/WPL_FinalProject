<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/* DEFINE PAGE */
	String VIEWPOSTPAGE = "employer/employerviewpost.jsp";
	
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
		<li><a href="<%=VIEWPOSTPAGE %>?key=<%=ps.get(i).key%>"><%=ps.get(i).title%> / <%=ps.get(i).finished ? "FINISHED" : "" %></a></li><%
	}%>
</ul>