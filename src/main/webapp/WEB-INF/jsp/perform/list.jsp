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
    <h3>수행내역 목록</h3>
    <table border='2'>
        <tr>
            <th>제목</th>
            <th>수행 날짜</th>
            <th>성공/실패 유무</th>
            <th>이미지</th>
        </tr>
        <c:forEach var="perform" items="${performList}">
        <tr>
            <td>
            	<c:if test="${mission.title != null}" >
            		${mission.title}
            	</c:if>
            	<c:if test="${missionList != null}">
		        	<c:forEach var="paymentList" items="${paymentList}">
		            		<c:if test="${perform.paymentNo eq paymentList.no}">
		            			<c:forEach var="missionList" items="${missionList}">
		            				<c:if test="${paymentList.missionNo eq missionList.no}">
				            			${missionList.title}
		            				</c:if>
		            			</c:forEach>
		            		</c:if>
		            </c:forEach>
            	</c:if>
            </td>
            <td>${perform.registerDate}</td>
            <td>
            	<c:if test="${perform.status == 'Y'}">
        			성공
       			</c:if>
        		<c:if test="${perform.status == 'N'}">
        			실패
        		</c:if>
            </td>
            <td><img src="/perform/photo/${perform.no}" width="400" height="300"/></td>
            <c:if test="${missionList != null}">
            	<td><a href="/report/form/${perform.no}">신고</a></button></td>
            </c:if>
        </tr>
        </c:forEach>
    </table>
</body>
</html>