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
<link  rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/employer.css">
</head>
<body><%
	/* DEFINE PAGE */
	String LOGOUT = "validate/logout.jsp";
	String POSTPAGE = "employer/albapost.jsp";
	String SHOWPOST = "../employer/employer_piece/showPosts.jsp";
	String VIEWPOSTPAGE = "employer/employerviewpost.jsp";
	userStruct us = (userStruct)session.getAttribute("user");
	String userName = us.first_name;
	int writer_id = us.key;
	int jobsperpage = 10;
	int pageNum;
	if (request.getParameter("p") == null){
		pageNum = 0;
	} else {
		pageNum = Integer.parseInt(request.getParameter("p"));
	}
	ArrayList<PostStruct> ps = Post.getPost(writer_id);
	%>
	<div class="employer_wrapper">
		<div class="employer_header">
			<span>
			<div class="employer_welcome"> Welcome! <%=userName%> </div>
			<div class="employer_post_button"> <button type="button" onclick="location.href='employer/albapost.jsp'">POST</button> </div> 
			</span>
			<span class="employer_logout"> <button type="button" onclick="location.href='validate/logout.jsp'">Log Out</button> </span>
		</div>
		<div style="text-align: center; font-weight: bold;"> You've posted <span style="color: red;"><%=ps.size()%></span> jobs </div>
		<div class="employer_post_list">
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
						<div OnClick="location.href='<%=VIEWPOSTPAGE %>?key=<%=ps.get(i).key%>'" class="employer_post">
							<a href="<%=VIEWPOSTPAGE %>?key=<%=ps.get(i).key%>" style="font-weight: bold;"> <%=ps.get(i).title%> </a>
							<span style="color: <%=finish_color%>; font-weight: bold;"> <%=ps.get(i).finished ? "FINISHED" : "OPENING" %> </span>
						</div>
					</li><%
				}%>
			</ul>
		</div>
		<div class="employer_page_number">
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
		<div class="employer_contactme"> 
			<div> <button type="button" onclick="location.href='contactme.jsp'">Contact me</button> </div>
		</div>
	</div>
</body>
</html>