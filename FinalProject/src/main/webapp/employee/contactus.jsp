<%@page import="Login.userStruct"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Alba Posting Page</title>
<link  rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/poststyle.css">
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body><%
	/* DEFINE PAGE */
	String HOMEPAGE = "../home.jsp";
	String CONTACTUS = "contactus.jsp";
	String UPLOADCONTACTUS = "process/uploadcontactus.jsp";

	/* USER VALIDATE */
	userStruct user_session = (userStruct)session.getAttribute("user");
	if (user_session == null || !user_session.gubun.equals("EMPLOYEE")){
		response.sendRedirect(HOMEPAGE);
	} else {%>
		<div class="container">
			<header class="d-flex flex-wrap align-items-center justify-content-md-between py-3 mb-4 border-bottom">
				<div class="col-md-5">
					<span class="albauniv"><a href="/home" class="text-decoration-none">ALBAUNIV</a></span>
					<span class="employ_welcome"> Welcome! <span class="id_bold"><%=user_session.user_id%></span></span>
				</div>
				<ul class="nav justify-content-center col-md-auto mb-md-0 top-menu">
					<li><a href="<%=HOMEPAGE %>" class="nav-link px-2 link-dark">Home</a></li>
					<li><a href="<%=CONTACTUS %>" class="nav-link px-2 link-secondary">Contact us</a></li>
				</ul>
				<div class="text-end col-md-5">
					<button type="button" class="userbutton" onclick="location.href='../validate/logout.jsp'" >Logout</button>
				</div>
			</header>
		</div>
		<div class="container">
			<div class="top-text">
				Please contact us by leaving message
			</div>
			<form method="post" action="<%=UPLOADCONTACTUS%>" class="albapost_form">
				<div class="mb-3">
				    <label for="postingTitle" class="form-label">Message Title</label>
				    <input type="text" class="textform" id="postingTitle" placeholder="" name="title" required>
				</div>
				<div class="mb-3">
				    <label for="postingContent" class="form-label">Message</label>
			    	<textarea class="textform" id="postingContent" rows="10" name="message" required></textarea>
				</div>
				<input type="submit" value="submit" class="userbutton">
			</form>
		</div>
		<%
	}%>
</body>
</html>