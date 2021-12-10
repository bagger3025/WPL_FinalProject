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
<link  rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/employee.css">
</head>
<body><%
	int jobsperpage = 10;
	String pagination = request.getParameter("p");
	if (pagination == null){
		pagination = "0";	
	}
	int pageNum = Integer.parseInt(pagination);
	ArrayList<PostStruct> ps = Post.getPostAll();
	userStruct us = (userStruct)session.getAttribute("user");
	String userName = us.first_name;
	%>
	<div class="employee_wrapper">
		<div class="employee_header">
			<span class="employee_welcome"> Welcome! <%=userName%> </span>
			<span class="employee_logout"> <button type="button" onclick="location.href='validate/logout.jsp'">Log Out</button> </span>
		</div>
		<div style="text-align: center; font-weight: bold;"> There are <span style="color: red;"><%=ps.size()%></span> jobs looking for you </div>
		<div class="employee_post_list">
			<ul><%
				for (int i = pageNum * jobsperpage; i < pageNum * jobsperpage + jobsperpage && i < ps.size(); i++){
					String finish_color;
					if(ps.get(i).finished){
						finish_color = "gray";
					}
					else{
						finish_color = "red";
					}
					%>
					<li>
						<div OnClick="location.href='employee/viewpost.jsp?key=<%=ps.get(i).key%>'" class="employee_post">
							<a href="employee/viewpost.jsp?key=<%=ps.get(i).key%>" style="font-weight: bold;"> <%=ps.get(i).title%> </a>
							<span style="color: <%=finish_color%>; font-weight: bold;"> <%=ps.get(i).finished ? "FINISHED" : "OPENING" %> </span>
						</div>
					</li><%
				}%>
			</ul>
		</div>
		<div class="employee_page_number">
			<%
			int nextpage = pageNum + 1;
			int prevpage = pageNum - 1;
			if(prevpage >= 0){
				%>
				<button type="button" onclick="location.href='home.jsp?p=<%=prevpage%>'">Previous Page</button><%
			}
			if(nextpage < ps.size()){
				%>
				<button type="button" onclick="location.href='home.jsp?p=<%=nextpage%>'">Next Page</button><%
			}
			%>
		</div>
		<div class="employee_contactme"> 
			<div> <button type="button" onclick="location.href='contactme.jsp'">Contact me</button> </div>
		</div>
	</div>
</body>
</html>