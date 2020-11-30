<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>미션 등록</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#2E2E2E">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">미션 등록</h1>
				<span>mission register</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Mission</li>
				</ol>
			</div>
		</section>
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
						<div class="form-result"></div>
						<div class="row">
							<div class="col-lg-10">
								<c:set var="merchantUid" value="<%=UUID.randomUUID()%>" />
								<form class="row" id="register" action="/mission" method="post" enctype="multipart/form-data">
									<input type="hidden" id="merchantUid" name="merchantUid" value="${merchantUid}" />
									<div class="col-12 form-group">
										<label>미션 제목</label>
										<input type="text" name="title" id="title" class="form-control required" />
									</div>
									<div class="col-6 form-group">
										<label>카테고리</label>
										<select class="form-control required" name="categoryNo" id="categoryNo">
											<option value="1">건강</option>
											<option value="2">생활패턴</option>
											<option value="3">역량</option>
											<option value="4">취미</option>
											<option value="5">기타</option>
										</select>
									</div>
									<div class="col-6 form-group">
										<label>금액(원)</label>
										<input type="text" id="entryFee" name="entryFee" class="form-control required"
											placeholder="숫자만 입력해주세요" >
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>내용</label>
											<textarea name="note" id="note" class="form-control required" cols="30" rows="5"></textarea>
										</div>
									</div>
									<div class="col-6 form-group">
										<label>시작 일자</label>
										<div>
											<input type="date" name="startDate" id="startDate" class="form-control required" >
										</div>
									</div>
									<div class="col-6 form-group">
										<label>종료 일자</label>
										<div>
											<input type="date" name="endDate" id="endDate" class="form-control required">
										</div>
									</div>
									<div class="col-6 form-group">
										<label>인증 시작 시간</label>
										<div>
											<input type="time" name="certifiedStartTime" class="form-control required" 
												id="certifiedStartTime" value="${mission.certifiedStartTime}">
										</div>
									</div>
									<div class="col-6 form-group">
										<label>인증 종료 시간</label>
										<div>
											<input type="time" name="certifiedEndTime" class="form-control required"
												id="certifiedEndTime" value="${mission.certifiedEndTime}">
										</div>
									</div>
									<div class="col-6 form-group">
										<div class="form-group">
											<label>예시사진 업로드</label>
												<div>
													<input type="file" name="img" id="img" class="file-loading required"
													data-show-preview="false">
												</div>
										</div>
									</div>
									<div class="col-6 form-group">
										<input type="button" id="btn" value="미션 개설" 
											class="button button-border button-aqua" style="float:right;" disabled/>
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
				$('input[type="button"]').removeAttr('disabled');
			});
		});
	</script>
	<script>
		document.getElementById('btn').addEventListener('click', ajax_call);
		function ajax_call() {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === xhr.DONE) {
					if (xhr.status === 200 || xhr.status === 201) {
						var msg = JSON.parse(xhr.responseText);
						var IMP = window.IMP;
						IMP.init('imp99346121');
						IMP.request_pay({
							pg : 'html5_inicis',
							pay_method : 'card',
							merchant_uid : msg.merchantUid,
							name : msg.paymentName,
							amount : msg.amount,
							buyer_email : msg.buyerEmail,
							buyer_name : msg.buyerName
						}, function(rsp) {
							if (rsp.success) {
								var msg = '미션 개설이 완료되었습니다.\n';
								msg += '결제 금액 : ' + rsp.paid_amount;
								msg += '\n카드 승인번호 : ' + rsp.apply_num;
								document.getElementById("register").submit();
							} else {
								var msg = '미션 개설에 실패하였습니다.\n입력값을 확인해주세요';
								/* msg += '에러내용 : ' + rsp.error_msg; */
							}
							alert(msg);
						});
					}
				}
			}
			var mission = {
				title : document.getElementById("title").value,
				categoryNo : document.getElementById("categoryNo").value,
				entryFee : document.getElementById("entryFee").value,
				note : document.getElementById("note").value,
				startDate : document.getElementById("startDate").value,
				endDate : document.getElementById("endDate").value,
				certifiedStartTime : document
						.getElementById("certifiedStartTime").value,
				certifiedEndTime : document.getElementById("certifiedEndTime").value,
			};
			xhr.open("POST", "http://localhost:8080/payment/form/" + document.getElementById("merchantUid").value, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify(mission));
		};
	</script>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />

	