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
<link rel="stylesheet" type="text/css" href="../resources/css/viewpost.css">

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
		<!-- header, example from bootstrap -->
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
		String[] lines = ps.contents.split("\n");
		String employeekey = Integer.toString(user_session.key);
		if (ps != null){%>
			<div class="post_wrapper">
				<div class="post_header"> 	
					<h1 class="post_title"><%=ps.title%></h1>  
					<div class="post_wage"><span> Offered Wage </span> <span class="post_wage_value"> <%=ps.money%> </span></div>
				</div>
				<div class="post_content"><%
					for(int i = 0; i < lines.length; i++){%>
						<%=lines[i]%><%
						if(i == lines.length - 1){
							break;
						}%>
						<br/><%
					}%>
				</div><%
				boolean applied = Alba.isappliedAlba(key, employeekey);
				if (applied){%>
					<button type="button" class="userbutton_gray">Already Applied!</button><%
				} else if (ps.finished){%>
					<button type="button" class="userbutton_gray">Job apply finished</button><%
				} else {%>
					<button type="button" onclick="location.href='process/applyjob.jsp?key=<%=key%>'" class="userbutton">Apply</button><%
				}%>
			</div><%
		} else { %>
			<!-- Error -->
			<p>The key is wrong!</p><%
		}
	}%>
</body>
</html>