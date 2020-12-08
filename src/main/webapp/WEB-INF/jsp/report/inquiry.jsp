<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<title>신고 정보</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="font-size:25px;color:white;">REPORT INFO</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Report</li>
				</ol>
			</div>
		</section>
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap" style="padding-bottom:200px;">
				<div class="container clearfix">
						<div class="row">
							<div class="col-lg-10" style="width:60%;background:#FFFFFF;margin:0 auto;padding-top:20px;box-shadow: 5px 5px 5px 5px gray;">
								<input type="hidden" name="no" id="no" value="${report.no}" />
								<div class="col-12 form-group">
										<c:if test="${report.status == 'P'}">
											<label style="font-size:20px;color:red;float:right;"><i class="i-rounded icon-check" style="background-color:red"></i></label>
										</c:if>
								</div>
								<div class="col-12 form-group">
									<div>
										<a href="/perform/${report.performNo}" class="button button-large button-circle button-border button-pink">확인하러 가기</a>
									</div>
								</div>
								<div class="col-12 form-group">
									<label style="font-size:20px;">신고자 이메일&nbsp;<label>
										<c:forEach var="member" items="${memberList}">
							        		<c:if test="${report.memberNo eq member.no}">
							        			<input type="text" value="${member.email}" name="email" id="email" 
							        			class="form-control required" disabled />
							        		</c:if>
							        	</c:forEach>
								</div>
								<div class="col-12 form-group">
									<label style="font-size:20px;">신고 일자&nbsp;<label>
							        <input type="text" value="${report.reportDate}" name="email" id="email" 
							        	class="form-control required" disabled />
								</div>
								<div class="col-12">
									<div class="form-group">
										<label style="font-size:20px;">내용&nbsp;</label>
										<textarea name="note" id="note" class="form-control required" cols="30" rows="5" disabled>${report.note}</textarea>
									</div>
								</div>
								
									
						<form method="post" action="/report">
							<input type="hidden" name="_method" value="PUT" /> 
							<input type="hidden" name="no" id="no" value="${report.no}" />
							<input type="hidden" name="performNo" id="performNo" value="${report.performNo}" />
							<input value="처리" type="submit" style="float:right;" class="button button-large button-circle button-3d button-brown">
						</form>
						<div>
						<form method="post" action="/report">
							<input type="hidden" name="_method" value="DELETE" /> 
							<input type="hidden" name="no" id="no" value="${report.no}" /> 
							<input type="submit" value="삭제" style="float:left;" class="button button-large button-circle button-3d button-red"/>
						</form>
						</div>
						
						</div>
					</div>
				</div>
				<div>
		</div>
	</div>
		</section>
		</div>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />
