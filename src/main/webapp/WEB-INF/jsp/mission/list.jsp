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
<title>내 미션 목록</title>
</head>
<body>
    <h3>내 미션 목록</h3>
    <button onclick="location.href='/mission/form'">작성</button>
    <table border='2'>
        <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>참가비</th>
            <th>시작 날짜</th>
            <th>이미지</th>
        </tr>
        <c:forEach var="mission" items="${list}">
        <tr>
        	<td><a href=/mission/${mission.no}>${mission.title}</a></td>
            <td>${mission.memberNo}</td>
            <td>${mission.entryFee}</td>
            <td>${mission.startDate}</td>
            <td><img src="C:\workspace\rgas\src\main\resources\img\3a33b6ff_미션 목록 조회.jpg"></td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>