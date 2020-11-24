<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 등록</title>
</head>
<body>
	<form action="/report" method="post" enctype="multipart/form-data">
		<div>
			<label>수행내역번호</label>
			<div>
				${performNo}
			</div>
		</div>
		<div>
			<label>신고자 이메일</label>
			<div>
				${memberNo}
			</div>
		</div>
		<div>
			<label>내용</label>
			<div>
				<textarea id="note" name="note"
					style="resize: none; height: 200px"></textarea>
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