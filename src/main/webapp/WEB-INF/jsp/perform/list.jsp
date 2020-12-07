<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>피드</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="color:white;font-size:25px;">FEED</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Perform</li>
				</ol>
			</div>
		</section>	
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap pb-0" style="padding-bottom:100px;">
				<div class="container clearfix">
					<div id="portfolio" class="portfolio portfolio-reveal row grid-container no-gutters" data-layout="fitRows">
					<c:forEach var="perform" items="${performList}">

					<article class="portfolio-item col-lg-3 col-md-4 col-sm-6 col-12 pf-media pf-icons">
						<div class="grid-inner">
							<div class="portfolio-image">
								<img src="/perform/photo/${perform.no}" onerror="this.src='/images/17.jpg'" style="width:300px;height:300px;">
								<div class="bg-overlay">
									<div class="bg-overlay-content dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item">
										<c:if test="${missionList != null}">
											<a href="/report/form/${perform.no}"
												class="btn btn-secondary d-none d-sm-inline-block"
												data-hover-animate="fadeInDownSmall" data-hover-animate-out="fadeOutUpSmall" data-hover-speed="350" 
												data-hover-parent=".portfolio-item" data-lightbox="report" title="report">
											<i class="icon-warning-sign"></i><span class="sr-only">Details</span></a>
										</c:if>
									</div>
									<div class="bg-overlay-bg dark" data-hover-animate="fadeIn" data-hover-parent=".portfolio-item"></div>
								</div>
							</div>
							<div class="portfolio-desc">
								<h3>
								</h3>
								<span><ul class="iconlist d-none d-md-block">
										<li>
										<c:if test="${mission.title != null}" >
						            		<strong style="font-size:20px;">${mission.title}</strong>
						            	</c:if>
										<c:if test="${missionList != null}">
								        	<c:forEach var="paymentList" items="${paymentList}">
								            		<c:if test="${perform.paymentNo eq paymentList.no}">
								            			<c:forEach var="missionList" items="${missionList}">
								            				<c:if test="${paymentList.missionNo eq missionList.no}">
										            			<strong style="font-size:20px;">${missionList.title}</strong>
								            				</c:if>
								            			</c:forEach>
								            		</c:if>
								            </c:forEach>
						            	</c:if>
						            	</li>
										<li>
										<table style="text-align:center;margin:0px;padding:0px;">
											<tr>
												<th><i class="icon-calendar3"></i> 
													<strong style="font-size:13px;">수행 날짜</strong></th>
												<th>&nbsp;&nbsp;&nbsp;</th>
												<th><li><i class="icon-star-half-full"></i> 
													<strong style="font-size:13px;">
														<c:if test="${perform.status == 'Y'}">성공</c:if>
						        						<c:if test="${perform.status == 'N'}">실패</c:if>
						        					</strong>
						        				</th>
						        				<th>&nbsp;&nbsp;&nbsp;</th>
						        				<c:if test="${memberList != null}">
						        				<th><i class="icon-user"></i> 
													<strong style="font-size:13px;">
														<c:forEach var="paymentList" items="${paymentList}">
											            		<c:if test="${perform.paymentNo eq paymentList.no}">
											            			<c:forEach var="missionList" items="${missionList}">
											            				<c:if test="${paymentList.missionNo eq missionList.no}">
											            					<c:forEach var="memberList" items="${memberList}">
											            						<c:if test="${missionList.memberNo eq memberList.no}">
															            			<strong style="font-size:13px;">${memberList.nickname}</strong>
											            						</c:if>
											            					</c:forEach>
											            				</c:if>
											            			</c:forEach>
											            		</c:if>
											            </c:forEach>
													</strong></th>
													</c:if>
												</tr>
											<tr>
											<td><p style="font-size:13px;">${perform.registerDate}</p></td>
											</tr>
										</table>
									</ul></span>
							</div>
						</div>
					</article>
				</c:forEach>
				</div>
				</div>
			</div>
		</section>
	</div>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />