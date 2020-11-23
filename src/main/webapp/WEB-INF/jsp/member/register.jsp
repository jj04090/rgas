<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/register" method="post">
	<table border="2">
		<tr>
			<td>EMAIL</td>
			<td><input type="text" name="id" id="email" /></td>
		</tr>
		<tr>
			<td>PWD</td>
			<td><input type="text" name="pwd" id="password"/></td>
		</tr>
		<tr>
			<td>NAME</td>
			<td><input type="text" name="pwd" id="name"/></td>
		</tr>
		<tr>
			<td>NICKNAME</td>
			<td><input type="text" name="pwd" id="nickname"/></td>
		</tr>
		<tr>
			<td>BANK</td>
			<td><input type="text" name="pwd" id="bank"/></td>
		</tr>
		<tr>
			<td>ACCOUNT</td>
			<td><input type="text" name="pwd" id="account"/></td>
		</tr>
		<tr>
			<td><input type="submit" name="signup" value="가입"/></td>
		</tr>
	</table>
</form>
</body>
</html>