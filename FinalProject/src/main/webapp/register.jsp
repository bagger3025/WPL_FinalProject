<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="validateRegister.jsp">
		<input type="text" name="id" value="">
		<input type="password" name="password" value="">
		<input type="password" name="val_password" value="">
		<input type="text" name="first_name" value="">
		<input type="text" name="last_name" value="">
		<input type="radio" name="gubun" value="EMPLOYER">EMPLOYER
		<input type="radio" name="gubun" value="EMPLOYEE">EMPLOYEE
		<input type="submit" value="submit">
	</form>
</body>
</html>