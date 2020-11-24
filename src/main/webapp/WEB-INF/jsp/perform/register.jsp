<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수행내역 등록</title>
</head>
<body>
	<form action="/perform" method="post" enctype="multipart/form-data">
		<input type="hidden" name="paymentNo" id="paymentNo" value="${paymentNo}" />
		<div>
			<label>미션 제목</label>
			<div>
				<input type="text" id="title" name="title" value="${mission.title}">
			</div>
		</div>
		<div>
			<label>인증사진 업로드</label>
			<div>
				<input type="file" name="img" id="img">
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