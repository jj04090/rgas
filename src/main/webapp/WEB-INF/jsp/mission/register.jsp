<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />
<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
  <!-- BEGIN: Page Main-->
	<div id="main">
		<div class="row">
			<div class="col s12">
				<div class="container">
					<div id="contact-us" class="seaction">
						<div class="app-wrapper">
							<div class="card">
								<div class="card-content">
									<p class="caption mb-0">미션 등록_ 도전할 미션을 등록해주세요.</p>
								</div>
							</div>
							<!-- Form Advance -->
							<div id="sidebar-list" class="row contact-sidenav">
								<div class="contact-form margin-top-contact">

									<div class="row">
										<div class="col s12 m12 l12">
											<div id="Form-advance"
												class="card card card-default scrollspy">
												<div class="card-content">
													<h4 class="card-title">미션 등록</h4>
													<c:set var="merchantUid" value="<%=UUID.randomUUID()%>" />
													<form class="row" id="register" action="/mission"
														method="post" enctype="multipart/form-data">
														<input type="hidden" id="merchantUid" name="merchantUid"
															value="${merchantUid}" />
														<div class="row">
															<div class="input-field col s12">
																<select class="form-control required" name="categoryNo"
																	id="categoryNo">
																	<c:forEach var="category" items="${categoryList}">
																		<option value="${category.no}">${category.title}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
														<div class="row">
															<div class="input-field col m6 s12">
																<input type="text" name="title" id="title" /> <label
																	for="title">미션 제목</label>
															</div>
															<div class="input-field col m6 s12">
																<input type="number" id="entryFee" name="entryFee">
																<label for="entryFee">참가비</label>
															</div>
														</div>
														<div class="row">
															<div class="input-field col s12">
																<textarea class="materialize-textarea" name="note"
																	id="note" class="form-control required" cols="30"
																	rows="20"></textarea>
																<label for="note">내용</label>
															</div>
														</div>
														<div class="row">
															<div class="input-field col m6 s12">
																<input type="date" name="startDate" id="startDate"
																	class="form-control required"> <label
																	for="startDate">시작일자</label>
															</div>
															<div class="input-field col m6 s12">
																<input type="date" name="endDate" id="endDate"
																	class="form-control required"> <label
																	for="endDate">종료일자</label>
															</div>
														</div>
														<div class="row">
															<div class="input-field col m6 s12">
																<input type="time" name="certifiedStartTime"
																	id="certifiedStartTime"> <label
																	for="certifiedStartTime">시작시간</label>
															</div>
															<div class="input-field col m6 s12">
																<input type="time" name="certifiedEndTime"
																	id="certifiedEndTime"> <label
																	for="certifiedEndTime">종료시간</label>
															</div>
														</div>

														<div class="row">
															<div class="col m6 s12 file-field input-field">
																<div class="btn float-right">
																	<span>예시사진 파일</span> <input type="file" name="img"
																		id="img" data-show-preview="false">
																</div>
																<div class="file-path-wrapper">
																	<input class="file-path validate" type="text">
																</div>

															</div>
															<div class="input-field col s12">
																<button class="btn cyan waves-effect waves-light right"
																	id="btn" type="button" name="btn" disabled>
																	등록 <i class="material-icons right">payment</i>
																</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script>
		$(function() {
			$("#img").change(function(e){
				$('button[type="button"]').removeAttr('disabled');
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
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />