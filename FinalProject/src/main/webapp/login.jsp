<!-- Message from register -->
<div class="register-success"><%=
	request.getParameter("register")%>
</div>

<!-- Message from login, Login error message -->
<div class="error-message"><%=
	request.getParameter("error")%>
</div>

<!-- Login Form -->
<form method="post" action="validateLogin.jsp">
	<input type="text" name="username">
	<input type="password" name="password">
	<input type="submit" value="Submit">
</form>

<!-- Register Button -->
<a href="register.jsp">Register</a>