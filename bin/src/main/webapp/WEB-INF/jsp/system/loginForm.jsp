<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/login" method="post">
	<table border="2">
		<tr>
			<td>ID</td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td>PWD</td>
			<td><input type="text" name="password" /></td>
		</tr>
		<tr>
			<td><input type="submit" name="login" value="로그인"/></td>
		</tr>
	</table>
</form>
</body>
</html>