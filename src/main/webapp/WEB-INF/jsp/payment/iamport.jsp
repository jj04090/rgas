<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form action="/mission" id="registerMission"method="post" enctype="multipart/form-data">
<input type="file" id="img" name="img" value="${img}">
${img}
<input type="hidden" id="iamportRequest" name="iamportRequest" value="${iamportRequest}">
</form>
<input type = "button" id = "btn" value = "click" />
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
	document.getElementById('btn').addEventListener('click', ajax_call);
	function ajax_call() {
		var merchantUid = '<c:out value="${iamportRequest.merchantUid}"/>';
		var paymentName = '<c:out value="${iamportRequest.paymentName}"/>';
		var amount = '<c:out value="${iamportRequest.amount}"/>';
		var buyerEmail = '<c:out value="${iamportRequest.buyerEmail}"/>';
		var buyerName = '<c:out value="${iamportRequest.buyerName}"/>';
		var IMP = window.IMP;
		IMP.init('imp99346121');
		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : merchantUid,
			name : paymentName,
			amount : amount,
			buyer_email : buyerEmail,
			buyer_name : buyerName,
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				msg += rsp;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}

			alert(msg);
			document.getElementById("registerMission").submit();
		});
	};
	</script>
</body>
</html>