<html>
<head>
</head>

<body>

<% boolean accepted = true;
if (accepted){  %>
	<jsp:forward page="employee.jsp" />
<% } else { %>
	<jsp:forward page="login.html" />
<% } %>

</body>
</html>