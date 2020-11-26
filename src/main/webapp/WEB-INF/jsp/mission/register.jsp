<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:set var="merchantUid" value="<%=UUID.randomUUID()%>" />
	<form action="/mission" method="post" id="register" enctype="multipart/form-data">
		<input type="hidden" id="merchantUid" name="merchantUid" value="${merchantUid}" />
		<div>
			<label>제목</label>
			<div>
				<input type="text" id="title" name="title">
			</div>
		</div>
		<div>
			<label>카테고리</label>
			<div>
				<select id="categoryNo" name="categoryNo">
					<option value="1">건강</option>
					<option value="2">생활패턴</option>
					<option value="3">역량</option>
					<option value="4">취미</option>
					<option value="5">기타</option>
				</select>
			</div>
		</div>
		<div>
			<label>참가비</label>
			<div>
				<input type="text" id="entryFee" name="entryFee"
					placeholder="숫자만 입력해주세요">
			</div>
		</div>
		<div>
			<label>내용</label>
			<div>
				<textarea id="note" name="note" style="resize: none; height: 200px"></textarea>
			</div>
		</div>
		<div>
			<label>시작 일자</label>
			<div>
				<input type="date" name="startDate" id="startDate">
			</div>
		</div>
		<div>
			<label>종료 일자</label>
			<div>
				<input type="date" name="endDate" id="endDate">
			</div>
		</div>
		<div>
			<label>인증 시작 시간</label>
			<div>
				<input type="time" name="certifiedStartTime" id="certifiedStartTime">
			</div>
		</div>
		<div>
			<label>인증 종료 시간</label>
			<div>
				<input type="time" name="certifiedEndTime" id="certifiedEndTime">
			</div>
		</div>
		<div>
			<label>예시사진 업로드</label>
			<div>
				<input type="file" name="img" id="img">
			</div>
		</div>
	</form>
	<input type="button" id="btn" value="결제하기" />
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
							buyer_name : msg.buyerName,
						}, function(rsp) {
							if (rsp.success) {
								var msg = '결제가 완료되었습니다.\n';
								msg += '결제 금액 : ' + rsp.paid_amount;
								msg += '\n카드 승인번호 : ' + rsp.apply_num;
								document.getElementById("register").submit();
							} else {
								var msg = '결제에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;
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
</body>
</html>