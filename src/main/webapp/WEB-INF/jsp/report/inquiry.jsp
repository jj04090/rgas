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
<body>
	<input type="hidden" name="no" id="no" value="${report.no}" />
	<div>
		<label>수행내역</label>
		<div>
			<a href="/perform/${report.performNo}">확인하러 가기</a>
		</div>
	</div>
	<div>
		<label>신고자 이메일<label>
			<c:forEach var="member" items="${memberList}">
        		<c:if test="${report.memberNo eq member.no}">
        			${member.email}
        		</c:if>
        	</c:forEach>
	</div>
	<div>
		<label>신고 일자</label>
			${report.reportDate}
	</div>
	<div>
		<label>내용</label>
		<div>
			<textarea id="note" name="note" style="resize: none; height: 200px">${report.note}</textarea>
		</div>
	</div>
	<div>
		<label>처리 상태 : </label>
			<c:if test="${report.status == 'P'}">
				처리
			</c:if>
			<c:if test="${report.status == 'W'}">
				대기
			</c:if>
	</div>
	<div>
		<form method="post" action="/report">
			<input type="hidden" name="_method" value="PUT" /> 
			<input type="hidden" name="no" id="no" value="${report.no}" />
			<input type="hidden" name="performNo" id="performNo" value="${report.performNo}" />
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