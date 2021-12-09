<link  rel="stylesheet" type="text/css" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">

<%
	/* DEFINE PAGE */
	String TOVALIDATELOGIN = "validate/validateLogin.jsp";
	String REGISTERPAGE = "register.jsp";
%>

<section class="login_main">
	<span class=login_main_info>
	Job is <br>
	<span style="font-size: 80px;">EVERYWHERE!</span>
	</span>
</section>


<aside class="login_aside">
	<!-- Login Form -->
	<div class="login_guide">
	Sign in to get a job!
	</div>
	<!-- Message from register -->
	<div class="register-success">
		<%=request.getParameter("register")%>
	</div>

	<!-- Message from login, Login error message -->
	<div class="error-message">
		<%=request.getParameter("error")%>
	</div>
	<form method="post" action="<%=TOVALIDATELOGIN %>">
		<input type="text" name="username" placeholder="ID"> <br>
		<input type="password" name="password" placeholder="Password"> <br>
		<input type="submit" value="SIGN IN" style="margin-top: 5px;">
	</form>
	<!-- Register Button -->
	<div>
	<button type="button" onclick="location.href='<%=REGISTERPAGE%>'">SIGN UP</button>
	<div>
	<%-- <a href="<%=REGISTERPAGE%>">Register</a> --%>
</aside>

