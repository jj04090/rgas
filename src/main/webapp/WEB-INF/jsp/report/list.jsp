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
    <h3>신고 내역 관리</h3>
    <!-- <button onclick="location.href='/mission/form'">작성</button> -->
    <table border='2'>
        <tr>
            <th>이메일</th>
            <th>신고일자</th>
            <th>상태</th>
        </tr>
        <c:forEach var="report" items="${list}">
        <tr>
        	<td>
        		<a href=/report/${report.no}>
        			<c:forEach var="member" items="${memberList}">
            			<c:if test="${report.memberNo eq member.no}">
            				${member.email}
            			</c:if>
            		</c:forEach>
        		</a>
        	</td>
            <td>${report.reportDate}</td>
            <td>
            	<c:if test="${report.status == 'W'}">
            		대기
            	</c:if>
            	<c:if test="${report.status == 'P'}">
            		처리
            	</c:if>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>