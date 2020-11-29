<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<title>기부단체 정보</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#2E2E2E">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">기부단체 정보</h1>
				<span>charity info</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Charity</li>
				</ol>
			</div>
		</section>
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div class="row">
							<div class="col-lg-10">
								<form method="post" action="/charity" id="charityForm">
									<input type="hidden" name="_method" value="PUT" /> 
									<input type="hidden" name="no" id="no" value="${charity.no}" />
									<div class="col-12 form-group">
										<label style="font-size:20px;">기부단체 명</label>
										<input type="text" name="name" id="name" class="form-control required" value="${charity.name}"/>
									</div>
									<div class="col-12 form-group">
												<label for="">은행:</label>
													<select id="bank" name="bank" class="select-1 form-control" style="width:100%;">
													${charity.bank}??
													    <option value="${charity.bank}" selected>${charity.bank}</option>
													    <option value="KB국민은행">KB국민은행</option>
													    <option value="SC제일은행">SC제일은행</option>
													    <option value="기업은행">기업은행</option>
													    <option value="농협">농협</option>
													    <option value="산업은행">산업은행</option>
													    <option value="새마을금고">새마을금고</option>
													    <option value="수협">수협</option>
													    <option value="신한은행">신한은행</option>
													    <option value="신협">신협</option>
													    <option value="외환은행">외환은행</option>
													    <option value="우리은행">우리은행</option>
													    <option value="우체국">우체국</option>
													    <option value="카카오뱅크">카카오뱅크</option>
													    <option value="케이뱅크">케이뱅크</option>
													    <option value="하나은행">하나은행</option>
													</select>
											</div>
									<div class="col-12 form-group">
										<label style="font-size:20px;">계좌 번호</label>
										<input type="text" name="account" id="account" class="form-control required" value="${charity.account}"/>
									</div>
								</form>
									<div class="col-12 form-group">
										<input value="수정" type="submit" form="charityForm" style="float:right;" class="button button-border">
									</div>	
									<div class="col-12 form-group">
										<form method="post" action="/charity">
											<input type="hidden" name="_method" value="DELETE" />
											<input type="hidden" name="no" id="no" value="${charity.no}" />
											<input type="submit" value="삭제" style="float:right;" class="button button-border"/>
										</form>
									</div>
							</div>
					</div>
				</div>
			</div>
		</section>
		</div>
	
      
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />

