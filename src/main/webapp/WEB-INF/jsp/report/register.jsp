<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 등록</title>
</head>
<body>
	<form action="/report" method="post">
		<div>
			<label>수행내역번호 : ${performNo}</label>
			<div>
				<input type="hidden" name="performNo" id="performNo" value="${performNo}" />
			</div>
		</div>
		<div>
			<div>
				<input type="hidden" name="memberNo" id="memberNo" value="${memberNo}" />
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
			<div>
				<input value="등록" type="submit" />
			</div>
		</div>
	</form>
</body>
</html>