<%@page import="java.util.ArrayList"%>
<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body><%
	int josbperpage = 10;
	String pagination = request.getParameter("p");
	if (pagination == null){
		pagination = "0";	
	}
	int pageNum = Integer.parseInt(pagination);
	ArrayList<PostStruct> ps = Post.getPostAll();
	
%>
THIS IS EMPLOYEE PAGE

<button type="button" onclick="location.href='validate/logout.jsp'">Log Out</button>

<ul><%
	for (int i = pageNum * josbperpage; i < pageNum * josbperpage + josbperpage && i < ps.size(); i++){%>
		<li><a href="employee/viewpost.jsp?key=<%=ps.get(i).key%>"><%=ps.get(i).title%> / <%=ps.get(i).finished ? "FINISHED" : "" %></a></li><%
	}%>
	
</ul>

<% 	int totpage = ps.size() / 10;
	for(int i = 0; i <= totpage; i++){%>
		<button type="button" onclick="location.href='home.jsp?p=<%=i%>'"><%=i %></button><%		
	}%>
</body>
</html>