<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>수행내역 등록</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="color:white;font-size:25px;">FEED REGISTER</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Perform</li>
				</ol>
			</div>
		</section>
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap" style="padding-bottom:100px;">
				<div class="container clearfix">
						<div class="form-result"></div>
						<div class="row" style="padding-top:150px;padding-bottom:200px;">
							<div class="col-lg-8" style="background:#FFFFFF;margin:0 auto;padding-top:40px;box-shadow: 5px 5px 5px 5px gray;">
							 	<form class="row" id="register" action="/perform" method="post" enctype="multipart/form-data">
									<input type="hidden" name="paymentNo" id="paymentNo" value="${paymentNo}" />
									<div class="col-12 form-group" style="padding-bottom:50px;">
										<label style="font-size:20px;">미션 제목</label>
										<input type="text" name="title" id="title" class="form-control required" 
										value="${mission.title}" disabled/>
									</div>
									<div class="col-6 form-group">
										<div class="form-group">
										<label style="font-size:20px;">인증사진 업로드</label>
										<div>
											<input type="file" name="img" id="img" class="file-loading required"
												data-show-preview="false">
										</div>
										</div>
									</div>
									<div class="col-6 form-group">
										<input type="submit" id="submit" value="등록" style="float:right;font-size:15px;"
											class="button button-small button-circle button-3d button-brown" disabled/>
									</div>
								</form>
							    </div>
							</div>
					</div>
				</div>
		</section>
			</div>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script>
		$(function() {
			$("#img").change(function(e){
				$('input[type="submit"]').removeAttr('disabled');
			});
		});
	</script>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />