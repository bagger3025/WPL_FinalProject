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
<body>
<%
String key = request.getParameter("key");
PostStruct ps = Post.getPostFromKey(key);
if (ps != null){%>
	<h1><%=ps.title%></h1>
	<p><%=ps.contents%></p>
	<button type="button" onclick="location.href='process/applyjob.jsp?key=<%=key%>'">Apply</button><%
} else {%>
	<p>The key is wrong!</p><%
}%>
</body>
</html>