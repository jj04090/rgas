<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>내 미션 목록</title>
</head>
<body>
	<%-- <jsp:include page="/WEB-INF/jsp/layout/commonTop.jsp"> --%>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
    <h3>내 미션 목록</h3>
    <button onclick="location.href='/mission/form'">작성</button>
    <table border='2'>
        <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>참가비</th>
            <th>시작 날짜</th>
            <th>종료 날짜</th>
            <th>이미지</th>
        </tr>
        <c:forEach var="mission" items="${missionList}">
        <tr>
        	<td><a href=/mission/${mission.no}>${mission.title}</a></td>
            <td>
            	<c:forEach var="member" items="${memberList}">
            		<c:if test="${mission.memberNo eq member.no}">
            			${member.name}
            		</c:if>
            	</c:forEach>
            </td>
            <td>${mission.entryFee}</td>
            <td><tf:formatDateTime value="${mission.startDate}" pattern="yyyy-MM-dd"/></td>
            <td><tf:formatDateTime value="${mission.endDate}" pattern="yyyy-MM-dd"/></td>
            <td><img src="/mission/photo/${mission.no}" width="400" height="400" /></td>
            <td>
            	<form method="get" action="/perform">
					<input type="hidden" name="no" id="no" value="${mission.no}" />
					<input type="submit" value="수행내역 조회"/>
				</form>
			</td>
            <td>
            	<c:if test="${today >= mission.startDate and today <= mission.endDate}">
	            	<form method="get" action="/perform/form/${mission.no}">
						<input type="hidden" name="no" id="no" value="${mission.no}" />
						<input type="submit" value="수행내역 등록"/>
					</form>
            	</c:if>
			</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>