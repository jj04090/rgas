
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<input type="hidden" name="no" id="no" value="${report.no}" />
	<div>
		<label>해당 수행내역</label>
		<div>
			<a href=/perform/${perform.perFormNo}>${report.performNo}</a>
		</div>
	</div>
	<div>
		<label>신고자 번호</label>
		<div>
			<input type="text" id="memberNo" name="memberNo" value="${report.memberNo}">
		</div>
	</div>
	<div>
		<label>신고 일자</label>
		<div>
			<input type="text" id="reportDate" name="reportDate" value="${report.reportDate}">
		</div>
	</div>
	<div>
		<label>내용</label>
		<div>
			<textarea id="note" name="note" style="resize: none; height: 200px">${report.note}</textarea>
		</div>
	</div>
	<div>
		<label>처리 상태</label>
		<div>
			<input type="text" id="reportDate" name="reportDate" value="${report.reportDate}">
		</div>
	</div>
	<div>
		<form method="post" action="/report">
			<input type="hidden" name="_method" value="PUT" /> 
			<input type="hidden" name="no" id="no" value="${report.no}" /> 
			<input value="수정" type="submit">
		</form>
	</div>
	<div>
		<form method="post" action="/report">
			<input type="hidden" name="_method" value="DELETE" /> 
			<input type="hidden" name="no" id="no" value="${report.no}" /> 
			<input type="submit" value="삭제" />
		</form>
	</div>
</body>
</html>