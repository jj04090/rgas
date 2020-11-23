<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원 목록</title>
</head>
<body>
    <h3>회원 목록</h3>
   <!--  <button onclick="location.href='/mission/form'">작성</button> -->
    <table border='2'>
        <tr>
            <th>이메일</th>
            <th>이름</th>
            <th>닉네임</th>
            <th>등급</th>
        </tr>
        <c:forEach var="member" items="${list}">
        <tr>
            <td>${member.email}</td>
            <td>${member.name}</td>
            <td>${member.nickname}</td>
            <td>
            	<c:if test="${member.grade == 'C'}">
            		일반
            	</c:if>
            	<c:if test="${member.grade == 'B'}">
            		브론즈
            	</c:if>
            	<c:if test="${member.grade == 'S'}">
            		실버
            	</c:if>
            	<c:if test="${member.grade == 'G'}">
            		골드
            	</c:if>
            	<c:if test="${member.grade == 'P'}">
            		프로
            	</c:if>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>