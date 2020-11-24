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
	<a3>이메일 : ${member.email}</a3></br>
	<a3>이름 : ${member.name}</a3></br>
	<a3>닉네임 : ${member.nickname}</a3></br>
	<a3>은행 명 : ${member.bank} 은행</a3></br>
	<a3>계좌번호 : ${member.account}</a3>
	</br>
	<a3>등급 : 
		<c:if test="${member.grade == 'C'}">
        	일반
        </c:if> <c:if test="${member.grade == 'B'}">
        	브론즈
        </c:if> <c:if test="${member.grade == 'S'}">
        	실버
        </c:if> <c:if test="${member.grade == 'G'}">
        	골드
        </c:if> <c:if test="${member.grade == 'P'}">
        	프로
        </c:if> </a3>
	</br>
	<a3>권한 : 
		<c:if test="${member.auth == 'A'}">
        	관리자
        </c:if>
        <c:if test="${member.auth == 'C'}">
        	일반
        </c:if>
	</a3></br>
	<a3>상태 : 
		<c:if test="${member.status == 'A'}">
        	활성
        </c:if>
        <c:if test="${member.status == 'S'}">
        	정지
        </c:if>
        <c:if test="${member.status == 'D'}">
        	탈퇴
    	</c:if>
	</a3></br>
	<div>
		<form method="post" action="/member">
			<input type="hidden" name="_method" value="PUT" /> 
			<input type="hidden" name="no" id="no" value="${member.no}" /> 
			<input value="수정" type="submit">
		</form>
	</div>
	<br/><a href="/member">회원 목록</a>
</body>
</html>