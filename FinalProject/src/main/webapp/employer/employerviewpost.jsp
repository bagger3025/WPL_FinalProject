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
	<title>View Post</title>
	<link rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/viewpost.css">
</head>
<body><%
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";
	String POSTPAGE = "albapost.jsp";
	String CONTACTUS = "contactus.jsp";
	String FINISHPOST = "process/finishpost.jsp";

	/* VALIDATE USER */
	userStruct user_session = (userStruct)session.getAttribute("user");
	if (user_session == null || !user_session.gubun.equals("EMPLOYER")){
		response.sendRedirect("../home.jsp");
	} else {%>
		<div class="container">
			<header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-4 border-bottom">
				<div class="col-md-4">
					<span class="albauniv"><a href="<%=HOMEPAGE %>" class="text-decoration-none">ALBAUNIV</a></span>
					<span class="employ_welcome"> Welcome! <span class="id_bold"><%=user_session.user_id%></span> </span>
				</div>
				<ul class="nav justify-content-center col-md-auto mb-md-0 top-menu">
					<li><a href="<%=HOMEPAGE %>" class="nav-link px-2 link-dark">Home</a></li>
					<li><a href="<%=POSTPAGE %>" class="nav-link px-2 link-dark">Post</a></li>
					<li><a href="<%=CONTACTUS %>" class="nav-link px-2 link-dark">Contact us</a></li>
				</ul>
				<div class="text-end col-md-4">
					<button type="button" class="userbutton" onclick="location.href='../validate/logout.jsp'" >Logout</button>
				</div>
			</header>
		</div><%
		String key = request.getParameter("key");
		PostStruct ps = Post.getPostFromKey(key);
		String[] lines = ps.contents.split("\n");
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
				</div>
				<hr><% 
				ArrayList<userStruct> us = Alba.getapplyList(key);
				if(us.size() == 0){%>
					<div class="post_list"> No-one has applied to this job. </div><%
				} else {%>
					<div class="post_list"><%
						if(us.size() == 1){%>
							<p><span style="color: red;"><%=us.size()%> </span> person has applied to this job. </p><%
						} else {%>
							<p><span style="color: red;"><%=us.size()%> </span> people have applied to this job. </p><%
						}%>
						<ul class="apply_list"><%
							for(int i = 0; i < us.size(); i++){%>
								<li><%=us.get(i).key %> - <%=us.get(i).user_id %></li><%
							}%>
						</ul>
					</div><%
				}
				if (ps.finished){%>
					<button type="button" class="userbutton_gray">This alba is finished</button><%	
				} else {%>
					<button type="button" onclick="location.href='<%=FINISHPOST%>?key=<%=key%>'" class="userbutton">Mark as finished</button><%	
				}%>
			</div><%
		} else {%>
			<p>The key is wrong!</p><%
		}
	}%>
</body>
</html>