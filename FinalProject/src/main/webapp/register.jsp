<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body><%	
	String register = (String)session.getAttribute("register");
	if (register != null){
		session.removeAttribute("register");%>
		<p><%=register%></p><%	
	}%>
	<form method="post" action="validateRegister.jsp">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" name="id" value=""></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" name="password" value=""></td>
			</tr>
			<tr>
				<td>re-enter password</td>
				<td><input type="password" name="val_password" value=""></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="first_name" value=""></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="last_name" value=""></td>
			</tr>
			<tr>
				<td>Register as:</td>
				<td>
					<input type="radio" name="gubun" value="EMPLOYER">EMPLOYER
					<input type="radio" name="gubun" value="EMPLOYEE">EMPLOYEE
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>