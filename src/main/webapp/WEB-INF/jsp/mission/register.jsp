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

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="font-size:25px;color:white;">MISSION REGISTER</h1>
				<span>mission register</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Mission</li>
				</ol>
			</div>
		</section>
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap" style="padding-bottom:100px;">
				<div class="container clearfix">
						<div class="form-result"></div>
						<div class="row">
							<div class="col-lg-10" style="background:#FFFFFF;margin:0 auto;padding-top:20px;box-shadow: 5px 5px 5px 5px gray;">
								<c:set var="merchantUid" value="<%=UUID.randomUUID()%>" />
								<form class="row" id="register" action="/mission" method="post" enctype="multipart/form-data">
									<input type="hidden" id="merchantUid" name="merchantUid" value="${merchantUid}" />
									<div class="col-12 form-group">
										<label style="font-size:20px;">카테고리</label>
										<select class="form-control required" name="categoryNo" id="categoryNo">
											<c:forEach var="category" items="${categoryList}">
												 <option value="${category.no}">${category.title}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-6 form-group">
										<label style="font-size:20px;">미션 제목</label>
										<input type="text" name="title" id="title" class="form-control required" />
									</div>
									<div class="col-6 form-group">
										<label style="font-size:20px;">금액(원)</label>
										<input type="number" id="entryFee" name="entryFee" class="form-control required"
											placeholder="숫자만 입력해주세요" >
									</div>
									<div class="col-12">
										<div class="form-group">
											<label style="font-size:20px;">내용</label>
											<textarea name="note" id="note" class="form-control required" cols="30" rows="5"></textarea>
										</div>
									</div>
									<div class="col-6 form-group">
										<label style="font-size:20px;">시작 일자</label>
										<div>
											<input type="date" name="startDate" id="startDate" class="form-control required" >
										</div>
									</div>
									<div class="col-6 form-group">
										<label style="font-size:20px;">종료 일자</label>
										<div>
											<input type="date" name="endDate" id="endDate" class="form-control required">
										</div>
									</div>
									<div class="col-6 form-group">
										<label style="font-size:20px;">인증 시작 시간</label>
										<div>
											<input type="time" name="certifiedStartTime" class="form-control required" 
												id="certifiedStartTime" value="${mission.certifiedStartTime}">
										</div>
									</div>
									<div class="col-6 form-group">
										<label style="font-size:20px;">인증 종료 시간</label>
										<div>
											<input type="time" name="certifiedEndTime" class="form-control required"
												id="certifiedEndTime" value="${mission.certifiedEndTime}">
										</div>
									</div>
									<div class="col-6 form-group">
										<div class="form-group">
											<label style="font-size:20px;">예시사진 업로드</label>
												<div>
													<input type="file" name="img" id="img" class="file-loading required"
													data-show-preview="false">
												</div>
										</div>
									</div>
									<div class="col-6 form-group">
										<input type="button" id="btn" value="미션 개설" 
											class="button button-small button-circle button-3d button-brown" style="float:right;font-size:15px;" disabled/>
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
								document.getElementById("register").submit();
							} else {
								var msg = '미션 개설에 실패하였습니다.';
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

	