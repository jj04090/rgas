<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*, java.util.*"%>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />
<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
	<div id="main">
        <div class="row">
            <div class="col s12">
                <div class="container">
                    <div class="section section-data-tables">
                        <div class="card">
                            <div class="card-content">
                                <p class="caption mb-0" style="font-size:20px;font-weight:bold;">기부 관리</p>
                            </div>
                        </div>	
                    <div class="card">   
	                    <div class="card-content" style="padding-bottom:50px;">
	                    	<div class="row">
								<c:set var="merchantUid" value="<%=UUID.randomUUID()%>" />
								<input type="hidden" id="merchantUid" name="merchantUid"
									value="${merchantUid}" />
								<form action="${pageContext.request.contextPath}/donation"
									id="register" method="post" style="padding-bottom:5px;">
									<select id="charityNo" name="no">
										<c:forEach items="${charityList}" var="charity">
											<option value="${charity.no}">${charity.name}</option>
										</c:forEach>
									</select>
								</form>
							</div>
							<div class="row">
								<div class="input-field col m6 s12">
									<form action="${pageContext.request.contextPath}/charity"
										method=get>
										
										<button class="btn blue waves-effect waves-light left" style="font-weight:bold;" type="submit">
												기부단체 <i class="material-icons right">search</i>
										</button>
									</form>
								</div>
								<div class="input-field col m6 s12">
									<button class="btn blue waves-effect waves-light right" style="font-weight:bold;"
										type="button" id="payment">
										기부<i class="material-icons right">payment</i>
									</button>
								</div>
							</div>
	                    </div>
                    </div>
                    
					<div class="row">
						<div class="col s12 m12 l12">
							<div id="button-trigger" class="card card card-default scrollspy">
								<div class="card-content">
										<p>기부금 이체 내역</p>
									<div class="row">
										<div class="col s12">
											<table id="data-table-simple" class="display">
												<thead>
													<tr>
														<th>번호</th>
														<th>이체 일자</th>
														<th>기부 단체</th>
														<th>기부 금액</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${donationList}" var="donation" varStatus="status">
														<tr>
															<td>${status.count}</td>
															<td>${donation.transferDate}</td>
															<c:forEach items="${charityList}" var="charityrow">
																<c:if test="${donation.charityNo eq charityrow.no}">
																	<td>${charityrow.name}</td>
																</c:if>
															</c:forEach>
															<td>${donation.amount}원</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
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
    	document.title = "기부 관리 페이지 | CHEERUP" ;
	</script>
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
								var msg = '결제에 실패하였습니다.\n';
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
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />