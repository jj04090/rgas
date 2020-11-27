<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/perform" method="post" enctype="multipart/form-data">
		<input type="hidden" name="paymentNo" id="paymentNo" value="${perform.paymentNo}" />
		<div>
			<label>인증사진</label>
			<img src="/perform/photo/${perform.no}" width="400" height="300" />
		</div>
		
		성공 실패 유무 : ${perform.status}
	</form>
</body>
</html>