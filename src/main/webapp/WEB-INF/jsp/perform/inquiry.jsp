<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>수행내역 정보</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#2E2E2E">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">수행내역 정보</h1>
				<span>perform info</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Perform</li>
				</ol>
			</div>
		</section>	
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
									<ul class="iconlist d-none d-md-block">
										<li style="font-size:20px;"><i class="icon-star-half-full"></i> 
										<strong>성공/실패 유무</strong><p style="font-size:20px;">
										<c:if test="${perform.status == 'Y'}">성공</c:if>
						        		<c:if test="${perform.status == 'N'}">실패</c:if></p></li>
									</ul>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</section>
	</div>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />
