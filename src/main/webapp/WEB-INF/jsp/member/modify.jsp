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
						<form method="post" action="/member" id="memberModify">
							<input type="hidden" name="_method" value="PUT" />
							<input type="hidden" name="no" id="no" value="${member.no}" /> 
							<div class="col-lg-12">
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
										<input type="text" name="nickname" id="nickname" class="form-control required" value="${member.nickname}"/>
									</div>
									<div class="col-12 form-group">
												<label style="font-size:20px;">은행</label>
													<select id="bank" name="bank" class="select-1 form-control" style="width:100%;">
													    <option value="${member.bank}" selected>${member.bank}</option>
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
										<input type="text" name="account" id="account" class="form-control required" value="${member.account}"/>
									</div>
									<div class="col-4 form-group">
										<label style="font-size:20px;">등급&nbsp;&nbsp;&nbsp;&nbsp;</label>
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
										<label style="font-size:20px;">권한&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<c:if test="${member.auth == 'A'}">
								        	관리자
								        </c:if>
								        <c:if test="${member.auth == 'C'}">
								        	일반
								        </c:if>
									</div>
									<div class="col-4 form-group">
										<label style="font-size:20px;">상태&nbsp;&nbsp;&nbsp;&nbsp;</label>
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
							</div>
							</form>
							<div>
								<input value="수정" form="memberModify" type="submit" style="float:right;" class="button button-border">
							</div>
							<div>
								<form method="post" action="/member">
									<input type="hidden" name="_method" value="PUT" /> 
									<input type="hidden" name="no" id="no" value="${member.no}" /> 
									<input value="탈퇴" type="submit" style="float:left;" class="button button-border">
								</form>
							</div>
					</div>
			</div>
		</section>
		</div>
	
      
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />