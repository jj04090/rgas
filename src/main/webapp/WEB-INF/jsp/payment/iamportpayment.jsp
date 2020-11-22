<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var IMP = window.IMP;
IMP.init('imp75743767');
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'vbank',
    merchant_uid : 'merchant_' + new \Date().getTime(),
    name : '아이폰 12 : 512G',
    amount : 100,
    buyer_email : 'jj04090@naver.com',
    buyer_name : '유상진',
}, function(rsp) {
    if ( rsp.success ) {
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
    location.replace("/charity/list");
    
});
</script>
</body>
</html>