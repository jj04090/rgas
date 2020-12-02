<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>신고 목록</title>
<style>
td:hover {
  background-color: white;
}
</style>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">신고 목록</h1>
				<span>report list</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Report</li>
				</ol>
			</div>
		</section>
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div>
						<div>
							<table class="table table-bordered table-striped">
							  <thead >
								<tr>
								  <th>신고자 이메일</th>
								  <th>신고일자</th>
								  <th>처리상태</th>
								</tr>
							  </thead>
							  <c:forEach var="report" items="${list}">
								  <tbody>
									<tr onClick="location.href='/report/${report.no}'" style="cursor:pointer;">
									  <td>
										<c:forEach var="member" items="${memberList}">
							            	<c:if test="${report.memberNo eq member.no}">
							            		${member.email}
							            	</c:if>
							            </c:forEach>
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
								  </tbody>
							  </c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="line"></div>
		</section>
		</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />
