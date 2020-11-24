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
        <c:forEach var="mission" items="${list}">
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
            <td>${mission.startDate}</td>
            <td><tf:formatDateTime value="${mission.endDate}" pattern="yyyy-MM-dd"/></td>
            <td><img src="/mission/loadImage?photo=${mission.physical}&no=${mission.no}"/></td>
            <td>
            	<form method="get" action="/perform">
					<input type="hidden" name="no" id="no" value="${mission.no}" />
					<input type="submit" value="수행내역 조회"/>
				</form>
			</td>
            <td>
            	<c:if test="${today < mission.endDate}">
	            	<form method="get" action="/perform/form/${mission.no}">
						<input type="hidden" name="no" id="no" value="${mission.no}" />
						<input type="submit" value="수행내역 등록"/>
					</form>
            	</c:if>
            	<c:if test="${today >= mission.endDate}">
					<input type="hidden" name="no" id="no" value="${mission.no}" />
					<input type="button" value="환급" id="refunds"/>
            	</c:if>
			</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>