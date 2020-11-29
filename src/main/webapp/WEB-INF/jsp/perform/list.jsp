<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>수행내역</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">수행내역</h1>
				<span>perform list</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Perform</li>
				</ol>
			</div>
		</section>	
		<c:forEach var="perform" items="${performList}">
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">				
					<div id="portfolio" class="portfolio row grid-container gutter-20 gutter-sm-50" data-layout="fitRows">
						<article class="portfolio-item col-12 pf-media pf-icons">
							<div class="grid-inner row no-gutters">
								<div class="portfolio-image col-lg-8">
									<div class="grid-inner">
										<a><img src="/perform/photo/${perform.no}" alt="Image"></a>
									</div>
								</div>
								<div class="portfolio-desc col-lg-4 p-4 px-lg-5">
									<h2 style="font-family:'맑은 고딕';text-shadow:1px 1px black;font-weight:bold;">
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
									</h2>
									
									<ul class="iconlist d-none d-md-block">
										<li><i class="icon-calendar3"></i> 
										<strong>수행 날짜</strong><p style="font-size:15px;">${perform.registerDate}</p></li>
										<li><i class="icon-star-half-full"></i> 
										<strong>성공/실패 유무</strong><p style="font-size:15px;">
										<c:if test="${perform.status == 'Y'}">성공</c:if>
						        		<c:if test="${perform.status == 'N'}">실패</c:if></p></li>
									</ul>
									<c:if test="${missionList != null}">
										<a href="/report/form/${perform.no}" class="btn btn-secondary d-none d-sm-inline-block"><i class="icon-warning-sign"></i><span class="sr-only">Details</span>&nbsp;신고</a>
									</c:if>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</section>
		</c:forEach>
	</div>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />