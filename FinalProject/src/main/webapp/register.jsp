<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Sign in</title>
<link  rel="stylesheet" type="text/css" href="./resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./resources/css/register.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body><%
	/* DEFINE PAGE */
	String VALIDATEREGISTERPAGE = "validate/validateRegister.jsp";
	String register = (String)session.getAttribute("register");
	%>
	<div class="signin_wrapper">
		<form method="post" action="<%=VALIDATEREGISTERPAGE%>" class="signin_form">
			<span class="signin_welcome">Join us to get a JOB!</span>
			<div class="inputlabel"> ID </div>
			<div class="inputfield" id="id_inputfield">
				<input type="text" name="id" value="" placeholder="ID" id="userid">
				<button id="id_valid_button"> Validate ID </button>
				<%-- <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#d63031" class="bi bi-exclamation-lg wrongalarm" viewBox="0 0 16 16">
					<path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#00b894" class="bi bi-check-lg validalarm" viewBox="0 0 16 16">
					<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
				</svg> --%>
				
			</div>
			<div class="inputlabel"> PASSWORD </div>
			<div class="inputfield" id="pw_inputfield">
				<input type="password" name="password" value="" placeholder="Password" id="userpassword">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#d63031" class="bi bi-exclamation-lg wrongalarm" viewBox="0 0 16 16">
					<path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#00b894" class="bi bi-check-lg validalarm" viewBox="0 0 16 16">
					<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
				</svg>
			</div>
			<div class="inputlabel"> Confirm Password </div>
			<div class="inputfield" id="pwconfirm_inputfield">
				<input type="password" name="val_password" value="" placeholder="Please re-enter your password to confirm" id="uservalpassword">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#d63031" class="bi bi-exclamation-lg wrongalarm" viewBox="0 0 16 16">
					<path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#00b894" class="bi bi-check-lg validalarm" viewBox="0 0 16 16">
					<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
				</svg>
			</div>
			<div class="inputlabel"> First Name </div>
			<div class="inputfield" id="firstname_inputfield">
				<input type="text" name="first_name" value="" placeholder="First Name" id="userfirstname">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#d63031" class="bi bi-exclamation-lg wrongalarm" viewBox="0 0 16 16">
					<path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#00b894" class="bi bi-check-lg validalarm" viewBox="0 0 16 16">
					<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
				</svg>
			</div>
			<div class="inputlabel"> Last Name </div>
			<div class="inputfield" id="lastname_inputfield">
				<input type="text" name="last_name" value="" placeholder="Last Name" id="userlastname">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#d63031" class="bi bi-exclamation-lg wrongalarm" viewBox="0 0 16 16">
					<path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#00b894" class="bi bi-check-lg validalarm" viewBox="0 0 16 16">
					<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
				</svg>
			</div>
			<div class="inputlabel"> Register As </div>
			<div class="inputfield" id="registeras_inputfield">
				<span class="signin_gubun" id="usergubun">
					<span class="signin_gubun_span"><input type="radio" name="gubun" value="EMPLOYER">EMPLOYER</span>
					<span class="signin_gubun_span"><input type="radio" name="gubun" value="EMPLOYEE">EMPLOYEE</span>
				</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#d63031" class="bi bi-exclamation-lg wrongalarm" viewBox="0 0 16 16">
					<path d="M7.005 3.1a1 1 0 1 1 1.99 0l-.388 6.35a.61.61 0 0 1-1.214 0L7.005 3.1ZM7 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0Z"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="#00b894" class="bi bi-check-lg validalarm" viewBox="0 0 16 16">
					<path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"/>
				</svg>
			</div>
			<%
			if (register != null){
				session.removeAttribute("register");%>
				<div class="signin_err_msg"><%=register%></div><%	
			} else {
				register = "";
			}
			%>
			<input type="submit" value="SIGN UP" class="signin_submit">
		</form>
	</div>
	<script src="resources/js/registervalidate.js"></script>
</body>
</html>