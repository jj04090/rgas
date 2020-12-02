<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>기부단체 목록</title>
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
				<h1 style="font-size:40px">기부단체 목록</h1>
				<span>charity list</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Charity</li>
				</ol>
			</div>
		</section>
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div>
						<div>
								<div class="col-12 form-group">
							    	<a href="/charity/form" style="float:right;" class="button button-xlarge button-dark button-rounded text-right">기부단체 등록<i class="icon-circle-arrow-right"></i></a>
								</div>
							<table class="table table-bordered table-striped">
							  <thead >
								<tr>
								  <th>기부단체 명</th>
								  <th>은행 명</th>
								  <th>계좌 번호</th>
								</tr>
							  </thead>
							  <c:forEach var="rows" items="${charityList}">
								  <tbody>
									<tr onClick="location.href='/charity/${rows.no}'" style="cursor:pointer;">
							          	<td>${rows.name}</td>
									  	<td><c:out value="${bankList[rows.bank]}"/></td>
									 	<td>${rows.account}</td>
									</tr>
								  </tbody>
							  </c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />
