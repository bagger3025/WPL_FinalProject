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
<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
</head>
<body><%
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";
	String CONTACTUS = "contactus.jsp";

	/* USER VALIDATE */
	userStruct user_session = (userStruct)session.getAttribute("user");
	if (user_session == null || !user_session.gubun.equals("EMPLOYEE")){
		response.sendRedirect(HOMEPAGE);
	} else {%>
		<div class="container">
			<header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-4 border-bottom">
				<div class="col-md-5">
					<span class="albauniv"><a href="<%=HOMEPAGE %>" class="text-decoration-none">ALBAUNIV</a></span>
					<span class="employ_welcome"> Welcome! <span class="id_bold"><%=user_session.user_id%></span> </span>
				</div>
				<ul class="nav justify-content-center col-md-auto mb-md-0 top-menu">
					<li><a href="<%=HOMEPAGE %>" class="nav-link px-2 link-secondary">Home</a></li>
					<li><a href="<%=CONTACTUS %>" class="nav-link px-2 link-dark">Contact us</a></li>
				</ul>
				<div class="text-end col-md-5">
					<button type="button" class="userbutton" onclick="location.href='../validate/logout.jsp'" >Logout</button>
				</div>
			</header>
		</div><%
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