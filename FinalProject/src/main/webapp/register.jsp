<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Sign in</title>
<link  rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/register.css">
</head>
<body><%
	/* DEFINE PAGE */
	String VALIDATEREGISTERPAGE = "validate/validateRegister.jsp";
	
	String register = (String)session.getAttribute("register");
	if (register != null){
		session.removeAttribute("register");%>
		<p><%=register%></p><%	
	}%>
	<div class="signin_wrapper">
		<span class="signin_welcome">Join us to get a JOB!</span>
		<form method="post" action="<%=VALIDATEREGISTERPAGE%>" class="signin_form">
			<div> ID </div>
			<input type="text" name="id" value="" placeholder="ID">
			<div> PASSWORD </div>
			<input type="password" name="password" value="" placeholder="Password">
			<div> Confirm Password </div>
			<input type="password" name="val_password" value="" placeholder="Please re-enter your password to confirm">
			<div> First Name </div>
			<input type="text" name="first_name" value="" placeholder="First Name">
			<div> Last Name </div>
			<input type="text" name="last_name" value="" placeholder="Last Name">
			<div> Register As </div>
			<span class="signin_gubun">
				<div><input type="radio" name="gubun" value="EMPLOYER">EMPLOYER </div>
				<div><input type="radio" name="gubun" value="EMPLOYEE">EMPLOYEE </div>
			</span>
			<input type="submit" value="SIGN UP" class="signin_submit">
		</form>
	</div>
</body>
</html>