<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부단체 등록</title>
</head>
<body>
	<form action="/charity" method="post">
		<div>
			<label>기부단체 명</label>
			<div>
				<input type="text" id="name" name="name"/>
			</div>
		</div>
		<div>
			<label>은행 명</label>
			<div>
				<input type="text" id="bank" name="bank">
			</div>
		</div>
		<div>
			<label>계좌</label>
			<div>
				<input type="text" id="account" name="account">
			</div>
		</div>
		<div>
			<label></label>
			<div>
				<input value="등록" type="submit">
			</div>
		</div>
	</form>
	
</body>
</html>