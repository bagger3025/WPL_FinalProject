<%@page import="Login.HandleLogin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="post.Post"%>
<%@page import="post.PostStruct"%>
<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Employee Page</title>
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/employee.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
</head>
<body><%
	/* DEFINE PAGE */
	String HOMEPAGE = "home.jsp";
	String CONTACTUS = "employee/contactus.jsp";

	int jobsperpage = 10;
	String pagination = request.getParameter("p");
	if (pagination == null){
		pagination = "0";	
	}
	int pageNum = Integer.parseInt(pagination);
	String hide = request.getParameter("hidefinished");
	boolean hide_finished = (hide != null && hide.equals("true")) ? true : false;
	ArrayList<PostStruct> ps;
	if (hide_finished){
		ps = Post.getUnfinished();
	} else {
		ps = Post.getPostAll();
	}
	userStruct us = (userStruct)session.getAttribute("user");%>
	<div class="container">
		<header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-4 border-bottom">
			<div class="col-md-5">
				<span class="albauniv"><a href="<%=HOMEPAGE %>" class="text-decoration-none">ALBAUNIV</a></span>
				<span class="employ_welcome"> Welcome! <span class="id_bold"><%=us.user_id%></span> </span>
			</div>
			<ul class="nav justify-content-center col-md-auto mb-md-0 top-menu">
				<li><a href="<%=HOMEPAGE %>" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="<%=CONTACTUS %>" class="nav-link px-2 link-dark">Contact us</a></li>
			</ul>
			<div class="text-end col-md-5">
				<button type="button" class="userbutton" onclick="location.href='validate/logout.jsp'" >Logout</button>
			</div>
		</header>
	</div><%
	if (ps.size() == 0){%>
		<div class="container">
			<div class="top-text">There are no jobs. Sorry!</div><% 
			if (hide_finished) {%>
				<div class="finishedjobs"><button onclick="location.href='home.jsp?hidefinished=false'" class="pagebutton">Show finished jobs</button></div><%
			} else {%>
				<div class="finishedjobs"><button onclick="location.href='home.jsp?hidefinished=true'" class="pagebutton">Hide finished jobs</button></div><%
			}%>	
		</div><%
	} else {%>
		<div class="container">
			<div class="top-text"> There <%=(ps.size() == 1) ? "is" : "are" %> <span style="color: red;"><%=ps.size()%></span> job<%= (ps.size() == 1) ? "" : "s" %> looking for you </div><% 
			if (hide_finished) {%>
				<div class="finishedjobs"><button onclick="location.href='home.jsp?hidefinished=false'" class="pagebutton">Show finished jobs</button></div><%
			} else {%>
				<div class="finishedjobs"><button onclick="location.href='home.jsp?hidefinished=true'" class="pagebutton">Hide finished jobs</button></div><%
			}%>
			<table class="table table-hover align-middle">
				<colgroup>
					<col width="100px"/>
					<col width="*"/>
					<col width="150px"/>
					<col width="150px"/>
					<col width="100px"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Title</th>
						<th scope="col">Employer</th>
						<th scope="col">Hourly pay</th>
						<th scope="col">State</th>
					</tr>
				</thead>
				<tbody><%
					for (int i = pageNum * jobsperpage; i < pageNum * jobsperpage + jobsperpage && i < ps.size(); i++){
						String finish_color = ps.get(i).finished ? "gray" : "red";
						userStruct employer = HandleLogin.MatchKey(Integer.toString(ps.get(i).writer_key)); %>
						<tr>
							<td><%=i + 1%></td>
							<td class="job-title"><a href="employee/viewpost.jsp?key=<%=ps.get(i).key%>" class="job-title"> <%=ps.get(i).title%> </a></td>
							<td><%=employer.user_id%></td>
							<td><%=ps.get(i).money %></td>
							<td style="color: <%=finish_color%>; font-weight: bold;"><%=ps.get(i).finished ? "FINISHED" : "HIRING" %></td>
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
						<button type="button" class="pagebutton" onclick="location.href='home.jsp?p=<%=prevpage%>&hidefinished=<%=hide_finished%>'">Previous Page</button><%
					}%>
				</div>
				<span class="cd-md-auto display-page"><%= pageNum + 1 %>/<%=maxPage + 1 %></span>
				<div class="text-end col-md-3"><%
					if(nextpage <= maxPage){%>
						<button type="button" class="pagebutton" onclick="location.href='home.jsp?p=<%=nextpage%>&hidefinished=<%=hide_finished%>'">Next Page</button><%
					}%>
				</div>
			</div>
		</div><%	
	}%>
</body>
</html>