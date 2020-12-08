<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*, java.util.*"%>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>기부금 이체 목록</title>
<style>
	td:hover {
	  background-color: white;
	}
</style>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF;">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="font-size:25px;color:white;">DONATION</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Donation</li>
				</ol>
			</div>
		</section>
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap" style="padding-bottom:200px;">
				<div class="container clearfix" style="width:60%;background:#FFFFFF;margin:0 auto;padding-top:20px;box-shadow: 5px 5px 5px 5px gray;">
					<form action="${pageContext.request.contextPath}/charity"
						method=get>
						<input type="submit" value="기부단체"
							class="button button-xlarge button-circle button-3d button-brown" />
					</form>

					<c:set var="merchantUid" value="<%=UUID.randomUUID()%>" />
					<input type="hidden" id="merchantUid" name="merchantUid"
						value="${merchantUid}" />
					<form action="${pageContext.request.contextPath}/donation"
						id="register" method="post">
						<select id="charityNo" name="no" class="select-1 form-control">
							<c:forEach items="${charityList}" var="row">
								<option value="${row.no}">${row.name}</option>
							</c:forEach>
						</select>
					</form>

					<input type="button" id="payment" value="기부금 이체"
						style="float: right; font-size: 12px;"
						class="button button-large button-circle button-3d button-leaf" />
					<div class="line"></div>
					<h4 style="font-size: 20px; font-family: '맑은 고딕'; font-weight: bold;">
						기부이체 내역
					</h4>
					<table class="table table-bordered table-striped">
						<tr>
							<thread>
							<th>이체 일자</th>
							<th>기부 단체</th>
							<th>기부 금액</th>
							</thread>
						</tr>
						<c:forEach items="${donationList}" var="row">
							<tbody>
								<tr>
									<td>${row.transferDate}</td>
									<c:forEach items="${charityList}" var="charityrow">
										<c:if test="${row.charityNo eq charityrow.no}">
											<td>${charityrow.name}</td>
										</c:if>
									</c:forEach>
									<td>${row.amount}원</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</section>
		</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
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
								var msg = '기부금이 이체되었습니다.\n';
								msg += '금액 : ' + rsp.paid_amount;
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
				no : document.getElementById("charityNo").value
			};
			
			xhr.open("POST", "http://localhost:8080/donation/form/"+document.getElementById("merchantUid").value, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify(charity));
		};
	</script>

<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />