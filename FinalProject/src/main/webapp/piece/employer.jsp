<%@page import="Login.userStruct"%>
<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Employer Page</title>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/employer.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common.css">
</head>
<body><%
	/* DEFINE PAGE */
	String LOGOUT = "validate/logout.jsp";
	String POSTPAGE = "employer/albapost.jsp";
	String VIEWPOSTPAGE = "employer/employerviewpost.jsp";
	String HOMEPAGE = "home.jsp";
	String CONTACTUS = "employer/contactus.jsp";
	
	userStruct us = (userStruct)session.getAttribute("user");
	int jobsperpage = 10;
	int pageNum;
	if (request.getParameter("p") == null){
		pageNum = 0;
	} else {
		pageNum = Integer.parseInt(request.getParameter("p"));
	}
	ArrayList<PostStruct> ps = Post.getPost(us.key);%>
	<div class="container">
		<header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-4 border-bottom">
			<div class="col-md-4">
				<span class="albauniv"><a href="<%=HOMEPAGE %>" class="text-decoration-none">ALBAUNIV</a></span>
				<span class="employ_welcome"> Welcome! <span class="id_bold"><%=us.user_id%></span> </span>
			</div>
			<ul class="nav justify-content-center col-md-auto mb-md-0 top-menu">
				<li><a href="<%=HOMEPAGE %>" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="<%=POSTPAGE %>" class="nav-link px-2 link-dark">Post</a></li>
				<li><a href="<%=CONTACTUS %>" class="nav-link px-2 link-dark">Contact us</a></li>
			</ul>
			<div class="text-end col-md-4">
				<button type="button" class="userbutton" onclick="location.href='validate/logout.jsp'" >Logout</button>
			</div>
		</header>
	</div><%
	if (ps.size() == 0){%>
		<div class="top-text">You haven't write a post. Post your job to get people! </div><%
	} else {%>
		<div class="container">
			<div class="top-text"> You've posted <span style="color: red;"><%=ps.size()%></span> job <%= ps.size() == 1 ? "" : "s"%> </div>
			<table class="table table-hover align-middle">
				<colgroup>
					<col width="100px"/>
					<col width="*"/>
					<col width="150px"/>
					<col width="100px"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Title</th>
						<th scope="col">Hourly pay</th>
						<th scope="col">State</th>
					</tr>
				</thead>
				<tbody><%
					for (int i = pageNum * jobsperpage; i < pageNum * jobsperpage + jobsperpage && i < ps.size(); i++){
						String finish_color = ps.get(i).finished ? "gray" : "red";%>
						<tr>
							<td><%=i + 1 %></td>
							<td class="job-title"><a href="<%=VIEWPOSTPAGE %>?key=<%=ps.get(i).key%>"> <%=ps.get(i).title%> </a></td>
							<td><%=ps.get(i).money %></td>
							<td style="color: <%=finish_color%>; font-weight: bold;"><%=ps.get(i).finished ? "FINISHED" : "OPENING" %></td>
						</tr><%
					}%>
				</tbody>
			</table>
			<div class="employ_page_number justify-content-md-between align-items-center flex-wrap py-3">
				<div class="col-md-3"><%
					int maxPage = (ps.size() - 1) / jobsperpage;
					int nextpage = pageNum + 1;
					int prevpage = pageNum - 1;
					if(prevpage >= 0){%>
						<button type="button" class="pagebutton" onclick="location.href='home.jsp?p=<%=prevpage%>'">Previous Page</button><%
					}%>
				</div>
				<span class="cd-md-auto display-page"><%= pageNum + 1 %>/<%=maxPage + 1 %></span>
				<div class="text-end col-md-3"><%
					if(nextpage <= maxPage){
						%>
						<button type="button" class="pagebutton" onclick="location.href='home.jsp?p=<%=nextpage%>'">Next Page</button><%
					}%>
				</div>
			</div>
		</div><%
	}%>
</body>
</html>