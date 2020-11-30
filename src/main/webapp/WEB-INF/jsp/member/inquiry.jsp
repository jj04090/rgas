<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<title>회원 정보</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#2E2E2E">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">회원 정보</h1>
				<span>member info</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Member</li>
				</ol>
			</div>
		</section>
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div class="row">
							<div class="col-lg-10">
									<div class="col-12 form-group">
										<label style="font-size:20px;">이메일</label>
										<input type="text" name="email" id="email" class="form-control required" value="${member.email}" disabled/>
									</div>
									<div class="col-12 form-group">
										<label style="font-size:20px;">이름</label>
										<input type="text" name="name" id="name" class="form-control required" value="${member.name}" disabled/>
									</div>
									<div class="col-12 form-group">
										<label style="font-size:20px;">닉네임</label>
										<input type="text" name="nickname" id="nickname" class="form-control required" value="${member.nickname}" disabled/>
									</div>
									<div class="col-12 form-group">
										<label style="font-size:20px;">은행 명</label>
										<input type="text" name="bank" id="bank" class="form-control required" value="${member.bank}" disabled/>
									</div>
									<div class="col-12 form-group">
										<label style="font-size:20px;">계좌 번호</label>
										<input type="text" name="account" id="account" class="form-control required" value="${member.account}" disabled/>
									</div>
									<div class="col-4 form-group">
										<label style="font-size:20px;">등급</label>
										<c:if test="${member.grade == 'C'}">
								        	일반
								        </c:if> <c:if test="${member.grade == 'B'}">
								        	브론즈
								        </c:if> <c:if test="${member.grade == 'S'}">
								        	실버
								        </c:if> <c:if test="${member.grade == 'G'}">
								        	골드
								        </c:if> <c:if test="${member.grade == 'P'}">
								        	프로
								        </c:if>
									</div>
									<div class="col-4 form-group">
										<label style="font-size:20px;">권한</label>
										<c:if test="${member.auth == 'A'}">
								        	관리자
								        </c:if>
								        <c:if test="${member.auth == 'C'}">
								        	일반
								        </c:if>
									</div>
									<div class="col-4 form-group">
										<label style="font-size:20px;">상태</label>
										<c:if test="${member.status == 'A'}">
								        	활성
								        </c:if>
								        <c:if test="${member.status == 'S'}">
								        	정지
								        </c:if>
								        <c:if test="${member.status == 'D'}">
								        	탈퇴
								    	</c:if>
									</div>
									<div class="col-12 form-group">
										<form method="post" action="/member">
											<input type="hidden" name="_method" value="PUT" /> 
											<input type="hidden" name="no" id="no" value="${member.no}" /> 
											<input value="정지" type="submit" style="float:right;" 
											class="button button-border button-rounded button-red">
										</form>
									</div>
							</div>
									
					</div>
				</div>
			</div>
		</section>
		</div>
	
      
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />

