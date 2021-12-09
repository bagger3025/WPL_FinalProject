<%@page import="Login.userStruct"%>
<%@page import="applyalba.Alba"%>
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
	/* USER VALIDATE */
	userStruct user_session = (userStruct)session.getAttribute("user");
	if (user_session == null || !user_session.gubun.equals("EMPLOYEE")){
		response.sendRedirect("../home.jsp");
	} else {
		String key = request.getParameter("key");
		PostStruct ps = Post.getPostFromKey(key);
		String employeekey = Integer.toString(((userStruct)session.getAttribute("user")).key);
		if (ps != null){%>
			<h1><%=ps.title%></h1>
			<p><%=ps.contents%></p><%
			boolean applied = Alba.isappliedAlba(key, employeekey);
			boolean jobFinished = ps.finished == true;
			if (applied){%>
				<p>Already Applied!</p> <%
			} else if (jobFinished){%>
				<p>Job apply finished</p><%
			} else {%>
				<button type="button" onclick="location.href='process/applyjob.jsp?key=<%=key%>'">Apply</button><%
			}
		} else {%>
			<p>The key is wrong!</p><%
		}

	}%>
</body>
</html>