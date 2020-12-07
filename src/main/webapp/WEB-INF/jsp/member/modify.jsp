<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<title>회원 정보</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="font-size:25px;color:white;">MEMBER INFO</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Member</li>
				</ol>
			</div>
		</section>
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap" style="padding-bottom:100px;">
				<div class="container clearfix" style="width:60%;background:#FFFFFF;margin:0 auto;padding-top:20px;box-shadow: 5px 5px 5px 5px gray;">
						<form method="post" action="/member" id="memberModify">
							<input type="hidden" name="_method" value="PUT" />
							<input type="hidden" name="no" id="no" value="${member.no}" /> 
							<div class="col-lg-12" >
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
													    <option value="${member.bank}" selected>${bankName}</option>
														<option value="004">KB국민은행</option>
														<option value="023">SC제일은행</option>
														<option value="003">기업은행</option>
														<option value="011">농협</option>
														<option value="002">산업은행</option>
														<option value="045">새마을금고</option>
														<option value="007">수협</option>
														<option value="088">신한은행</option>
														<option value="048">신협</option>
														<option value="005">외환은행</option>
														<option value="020">우리은행</option>
														<option value="071">우체국</option>
														<option value="090">카카오뱅크</option>
														<option value="089">케이뱅크</option>
														<option value="081">하나은행</option>
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
								<input value="수정" form="memberModify" type="submit" style="float:right;" class="button button-large button-circle button-3d button-brown">
							</div>
							<div>
								<form method="post" action="/member">
									<input type="hidden" name="_method" value="PUT" /> 
									<input type="hidden" name="no" id="no" value="${member.no}" /> 
									<input value="탈퇴" type="submit" style="float:left;" class="button button-large button-circle button-3d button-red">
								</form>
							</div>
					</div>
			</div>
		</section>
		</div>
	
      
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />