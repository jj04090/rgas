<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>내 미션 목록</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="font-size:25px;color:white;">MISSION</h1>
				<span>mission list</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Mission</li>
				</ol>
			</div>
		</section>
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
		<fmt:formatDate type="time" value="${now}" pattern="HH:mm:ss" var="nowTime"/>
		<fmt:parseDate var="certifiedStartTime" value="${mission.certifiedStartTime}"  pattern="HH:mm:ss"/>
	    <fmt:parseDate var="certifiedEndTime" value="${mission.certifiedEndTime}"  pattern="HH:mm:ss"/>
	            
	    <fmt:formatDate value="${certifiedStartTime}" pattern="HH:mm:ss" var="startTime"/>
	    <fmt:formatDate value="${certifiedEndTime}" pattern="HH:mm:ss" var="endTime"/>
       
		
		<section id="content" style="background:#FBF8EF">
		    <div class="col-6 form-group" style="height:40px;margin:0 auto;">
		    	<a href="/mission/form" style="float:right;font-size:12px;" class="button button-3d button-rounded button-brown">미션 등록 <i class="icon-circle-arrow-right"></i></a>
			</div>
			<div class="content-wrap" style="width:100%;">
				<div class="container clearfix" style="padding-bottom:200px;">
					<div class="row gutter-40 col-mb-80">					
						<div class="postcontent col-lg-9" style="margin:0 auto;">
							<div id="posts" class="row grid-container gutter-30">
					        <c:forEach var="mission" items="${missionList}">
									<c:if test="${mission.status eq 'N'}">
								<div class="entry col-12" style="background:#FFFFFF;padding-top:30px;box-shadow: 5px 5px 5px 5px gray; max-width: 90%;">
									<div class="grid-inner">
										<div class="entry-image">
											<a><img src="/mission/photo/${mission.no}" onerror="this.src='/images/17.jpg'"
											style="width:800px;height:400px;display:block;margin:0 auto;"></a>
										</div>
										<div class="entry-title">
											<h2 style="font-size:19px"><a href=/mission/${mission.no}>${mission.title}</a></h2>
										</div>
										<div class="entry-meta">
											<ul>
												<li style="font-size:13px"><i class="icon-calendar3"></i><tf:formatDateTime value="${mission.startDate}" pattern="yyyy-MM-dd"/></li>
												<li style="font-size:13px"><i class="icon-calendar3"></i><tf:formatDateTime value="${mission.endDate}" pattern="yyyy-MM-dd"/></li>
												<li style="font-size:13px"><i class="icon-money-bill-alt1"></i>${mission.entryFee} 원</a></li>
												<li style="font-size:13px"><i class="icon-user"></i>
													<c:forEach var="member" items="${memberList}">
	            										<c:if test="${mission.memberNo eq member.no}">
	            											${member.name}
	            										</c:if>
	            									</c:forEach></a>
	            								</li>
											</ul>
										</div>
										<div class="entry-content">
											<p>${mission.note}</p>
											<fmt:parseDate var="certifiedStartTime" value="${mission.certifiedStartTime}"  pattern="HH:mm:ss"/>
		   									<fmt:parseDate var="certifiedEndTime" value="${mission.certifiedEndTime}"  pattern="HH:mm:ss"/>
		            
		    								<fmt:formatDate value="${certifiedStartTime}" pattern="HH:mm:ss" var="startTime"/>
		    								<fmt:formatDate value="${certifiedEndTime}" pattern="HH:mm:ss" var="endTime"/>
										</div>
										<div class="entry-content">	
											<form method="get" action="/perform">
												<input type="hidden" name="no" id="no" value="${mission.no}" />
												<input class="button button-small button-circle button-3d button-brown" style="float:right;font-size:12px;" type="submit" value="피드보기" />
											</form>
											<c:if test="${nowTime >= startTime and nowTime <= endTime}">
			           							 <c:if test="${today >= mission.startDate and today <= mission.endDate}">
				            							<form method="get" action="/perform/form/${mission.no}">
															<input type="hidden" name="no" id="no" value="${mission.no}" />
															<input class="button button-small button-circle button-3d button-brown" style="float:left;font-size:12px;" type="submit" value="피드 등록" />
														</form>
									            </c:if>
								            </c:if>
										</div>
									</div>
								</div>
								</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				</div>
		</section>
	</div>

<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />