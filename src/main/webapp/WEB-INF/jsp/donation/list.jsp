<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 내역</title>
</head>
<body>
<c:set var="merchantUid" value="<%=UUID.randomUUID()%>"/>
		<input type="hidden" id="merchantUid" name="merchantUid" value="${merchantUid}"/>
	<form action="${pageContext.request.contextPath}/donation" id="register" method="post">
			<select id="charityNo" name="no">
				<option value="">기부단체 선택</option>
				<c:forEach items="${charityList}" var="row">
				<option value="${row.no}">${row.name}</option>
				</c:forEach>
			</select>
	</form>
		<input type="button" id="payment" value="기부금 이체" />
	<h4>기부이체 내역</h4>
	<table border="2">
		<tr>
			<td>이체일자</td>
			<td>기부단체</td>
			<td>금액</td>
		</tr>
		<c:forEach items="${donationList}" var="row">
			<tr>
				<td>${row.transferDate}</td>
					<c:forEach items="${charityList}" var="charityrow">
						<c:if test="${row.charityNo eq charityrow.no}">
							<td>${charityrow.name}</td>
						</c:if>
					</c:forEach>
				<td>${row.amount}</td>
			</tr>
		</c:forEach>
	</table>
	<form action="${pageContext.request.contextPath}/charity" method=get>
		<input type="submit" value="기부단체" />
	</form>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script>
		document.getElementById('payment').addEventListener('click', ajax_call);
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
								var msg = '결제가 완료되었습니다.';
								msg += '고유ID : ' + rsp.imp_uid;
								msg += '상점 거래ID : ' + rsp.merchant_uid;
								msg += '결제 금액 : ' + rsp.paid_amount;
								msg += '카드 승인번호 : ' + rsp.apply_num;
								msg += rsp;
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
			var charity = {
				no : document.getElementById("charityNo").value,
			};
			
			xhr.open("POST", "http://localhost:8080/donation/form/"+document.getElementById("merchantUid").value, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify(charity));
		};
	</script>
</body>
</html>