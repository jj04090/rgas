<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
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
			<td>EMAIL</td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td>PWD</td>
			<td><input type="text" name="password" /></td>
		</tr>
		<tr>
			<td><a href=/member/form>회원가입</a></td>
			<td><input type="submit" name="login" value="로그인"/></td>
		</tr>
		
	</table>
</form>
</body>
</html>