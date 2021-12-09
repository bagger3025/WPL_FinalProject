<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>CONTACT ME!</h1>
	<div><%
		String successString = (String)session.getAttribute("contactme_success");
		if (successString != null){%>
			<%=successString %><%
			session.removeAttribute("contactme_success");
		}%>
	</div>
	<div><%
		String failString = (String)session.getAttribute("contactme_fail");
		if (failString != null){%>
			<%=failString %><%
			session.removeAttribute("contactme_fail");
		} %>
	</div>
	<form method="post" action="validate/uploadcontactme.jsp">
		<textarea name="message" rows="5" cols="30"></textarea>
		<input type="submit" value="submit">
	</form>
</body>
</html>