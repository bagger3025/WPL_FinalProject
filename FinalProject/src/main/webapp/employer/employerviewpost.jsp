<%@page import="applyalba.Alba"%>
<%@page import="Login.userStruct"%>
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
	/* DEFINE PAGE */
	String USERVALIDATE = "employer_piece/uservalidate.jsp";
	String VIEWPOST = "employer_piece/viewpost.jsp";
	String HOMEPAGE = "../home.jsp";
	String FINISHPOST = "process/finishpost.jsp";

	/* VALIDATE USER */
	userStruct user_session = (userStruct)session.getAttribute("user");
	if (user_session == null || !user_session.gubun.equals("EMPLOYER")){
		response.sendRedirect("../home.jsp");
	} else {
		String key = request.getParameter("key");
		PostStruct ps = Post.getPostFromKey(key);
		if (ps != null){%>
			<h1><%=ps.title%></h1>
			<p><%=ps.contents%></p>
			<form method="post" action="<%=HOMEPAGE%>"><button>Go Back</button></form>
			<p>Apply List</p>
			<ul class="apply-list"><%
				ArrayList<userStruct> us = Alba.getapplyList(key);
				for(int i = 0; i < us.size(); i++){%>
					<li><%=us.get(i).key %> - <%=us.get(i).last_name %>(<%=us.get(i).user_id %>)</li><%
				}%>
			</ul><%
			if (ps.finished){%>
				<div>This alba is finished</div><%
			} else {%>
				<button type="button" onclick="location.href='<%=FINISHPOST%>?key=<%=key%>'">Mark as finished</button><%	
			}
		} else {%>
			<p>The key is wrong!</p><%
		}
	}%>
</body>
</html>