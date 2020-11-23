<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/donation/form"
		method=get>
		<select name="no">
			<option value="">기부단체 선택</option>
			
			<c:forEach items="${charityList}" var="row">
			<option value="${row.no}">${row.name}</option>
		</c:forEach>
		</select>
		 <input type="submit" value="기부금 이체" />
	</form>

	<h4>기부이체 내역</h4>
	<table border="1">
		<tr>
			<td>이체일자</td>
			<td>기부단체</td>
			<td>금액</td>
		</tr>
		<c:forEach items="${donationList}" var="row">
			<tr>
				<td>${row.transferDate}</td>
				<td>${row.charityNo}</td>
				<td>${row.amount}</td>
			</tr>
		</c:forEach>
	</table>
	<form action="${pageContext.request.contextPath}/charity"
		method=get>
		<input type="submit" value="기부단체" />
	</form>
</body>
</html>