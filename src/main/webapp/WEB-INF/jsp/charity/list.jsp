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
    <h3>기부단체 관리</h3>
    <table border='2'>
        <tr>
            <th>이름</th>
            <th>은행</th>
            <th>계좌</th>
        </tr>
        <c:forEach var="rows" items="${charityList}">
        <tr>
        	<td><a href="/charity/${rows.no}">${rows.name}</a></td>
            <td>${rows.bank}</td>
            <td>${rows.account}</td>
        </tr>
        </c:forEach>
    </table>
    <form method="GET" action="/charity/form">
    	<input value="등록" type="submit">
    </form>
</body>
</html>