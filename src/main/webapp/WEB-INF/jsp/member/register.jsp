<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />

<title>signUp | RGAS</title>
</head>
<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap py-0">
				<div class="section p-0 m-0 h-100 position-absolute" style="background: url('/images/5.jpg') center center no-repeat; background-size: cover;"></div>
				<div class="section bg-transparent min-vh-100 p-0 m-0 d-flex">
					<div class="vertical-middle">
						<div class="container py-5">
							<div class="text-center">
								<a href="/login"><img src="/images/logo-rgas.png" alt="Rgas Logo" style="height: 200px;"></a>
							</div>
							<div class="card mx-auto rounded-0 border-0" style="max-width: 400px;">
								<div class="card-body" style="padding: 40px;">
									<form id="signupForm" name="login-form" class="mb-0" action="/member" method="post">
										<c:set var="code" value="<%=UUID.randomUUID().toString().toUpperCase().substring(0,6)%>" />
										<input type="hidden" id="code" name="code" value="${code}" />
										<h2>회원가입</h2>
										<div class="row">
											<div class="col-12 form-group">
												<label for="login-form-username">이메일:</label>
												<input type="text" id="email" name="email" value="" class="form-control not-dark" />
												<input class="button button-3d button-black m-30" type="button" id="send" value="전송" style="float:right;" />
											</div>
											<div class="col-12 form-group">
												<label for="login-form-username">인증코드:</label>
												<input type="text" id="authCode" name="authCode" value="" class="form-control not-dark" />
												<input class="button button-3d button-black m-30" type="button" id="auth" value="인증" style="float:right;"/>
											</div>
											<div class="col-12 form-group">
												<label for="login-form-password">비밀번호:</label>
												<input type="password" id="password" name="password" value="" class="form-control not-dark" />
											</div>
											<div class="col-12 form-group">
												<label for="login-form-username">이름:</label>
												<input type="text" id="name" name="name" value="" class="form-control not-dark" />
											</div>
											<div class="col-12 form-group">
												<label for="login-form-username">닉네임:</label>
												<input type="text" id="nickname" name="nickname" value="" class="form-control not-dark" />
											</div>
											<div class="col-12 form-group">
												<label for="">은행:</label>
													<select id="bank" name="bank" class="select-1 form-control" style="width:100%;">
													    <option value="" disabled selected>은행 선택</option>
													    <option value="KB국민은행">KB국민은행</option>
													    <option value="SC제일은행">SC제일은행</option>
													    <option value="기업은행">기업은행</option>
													    <option value="농협">농협</option>
													    <option value="산업은행">산업은행</option>
													    <option value="새마을금고">새마을금고</option>
													    <option value="수협">수협</option>
													    <option value="신한은행">신한은행</option>
													    <option value="신협">신협</option>
													    <option value="외환은행">외환은행</option>
													    <option value="우리은행">우리은행</option>
													    <option value="우체국">우체국</option>
													    <option value="카카오뱅크">카카오뱅크</option>
													    <option value="케이뱅크">케이뱅크</option>
													    <option value="하나은행">하나은행</option>
													</select>
											</div>
											<div class="col-12 form-group">
												<label for="login-form-username">계좌번호:</label>
												<input type="text" id="account" name="account" value="" class="form-control not-dark" />
											</div>
											<div class="col-12 form-group">
												<input class="button button-3d" type="submit" id="signup" value="가입" style="float:right;" disabled/>
											</div>
										</div>
									</form>
									<div class="line line-sm"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section><!-- #content end -->

	</div><!-- #wrapper end -->
	<script>
			document.getElementById('send').addEventListener('click', send_code);
			function send_code() {
				var xhr = new XMLHttpRequest();
				var formData = new FormData();
				formData.append('email', document.getElementById("email").value);
				formData.append('code', document.getElementById("code").value);
				xhr.onload = function() {
					alert("해당 이메일로 인증코드가 발송되었습니다!");
				}
				
				xhr.open("POST", "http://localhost:8080/email");
				xhr.send(formData);
			};
			
			document.getElementById('auth').addEventListener('click', auth_code);
			function auth_code(){
				if(document.getElementById("authCode").value
						== document.getElementById("code").value){
					alert("인증에 성공했습니다.");
					
					$('input[type="submit"]').removeAttr('disabled');
					
				}  else {
					alert("인증코드가 잘못되었습니다.");
				}
			}
	</script>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />
