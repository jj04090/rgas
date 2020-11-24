<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 단체</title>
</head>
<body>
<body>
	<form method="post" action="/charity">
	<input type="hidden" name="_method" value="PUT" /> 
		<input type="hidden" name="no" id="no" value="${charity.no}" />
		<div>
			<label>기부 단체 이름</label>
			<div>
				<input type="text" id="name" name="name" value="${charity.name}">
			</div>
		</div>
		<div>
			<label>은행 명</label>
			<div>
				<input type="text" id="bank" name="bank" value="${charity.bank}">
			</div>
		</div>
		<div>
			<label>계좌</label>
			<div>
				<input type="text" id="account" name="account" value="${charity.account}">
			</div>
		</div>
		<div>
			<input value="수정" type="submit">
	</form>
	</div>
	<div>
		<form method="post" action="/charity">
			<input type="hidden" name="_method" value="DELETE" />
			<input type="hidden" name="no" id="no" value="${charity.no}" />
			<input type="submit" value="삭제" />
		</form>
	</div>
</body>
</html>