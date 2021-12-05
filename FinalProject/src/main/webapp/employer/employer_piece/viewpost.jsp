<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String key = request.getParameter("key");
PostStruct ps = Post.getPostFromKey(key);
if (ps != null){%>
	<h1><%=ps.title%></h1>
	<p><%=ps.contents%></p><%
} else {%>
	<p>The key is wrong!</p><%
}%>