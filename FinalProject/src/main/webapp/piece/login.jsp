<%
	/* DEFINE PAGE */
	String TOVALIDATELOGIN = "validate/validateLogin.jsp";
	String REGISTERPAGE = "register.jsp";
%>

<section class="login_main">
	<span class=login_main_info>
	Job is <br>
	<span style="font-size: 80px; margin-bottom: 10px;">EVERYWHERE!</span>
	</span>
</section>


<aside class="login_aside">
	<form method="post" action="<%=TOVALIDATELOGIN %>">
		<div class="login_guide">
			ALBAUNIV
		</div>
		<!-- Login form by bootstrap Example https://getbootstrap.com/docs/5.1/examples/sign-in/ -->
		<div class="form-floating">
			<input type="text" name="username" placeholder="ID" id="floatingID" class="form-control" required>
			<label for="floatingID" class="form-label">ID</label>
		</div>
		<div class="form-floating">
			<input type="password" name="password" placeholder="Password" id="floatingPassword" class="form-control" required>
			<label for="floatingPassword" class="form-label">Password</label>
		</div>
		<div class="login-message"><%
			if(!request.getParameter("register").equals("")){%>
				<div class="register-success">
					<!-- Message from register -->
					<%=request.getParameter("register")%>
				</div><%
			}
			if(!request.getParameter("error").equals("")){%>
				<div class="error-message">
					<!-- Message from login, Login error message -->
					<%=request.getParameter("error")%>
				</div><%
			}%>
		</div>
		<input type="submit" value="SIGN IN" style="margin-top: 5px;">
	</form>
	<!-- Register Button -->
	<p class="signup-div">
		<span class="signup-new">Are you new to this site? </span>
		<a type="button" href='<%=REGISTERPAGE%>' class="signup-text">SIGN UP</a>
	</p>
</aside>

