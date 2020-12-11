<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google.">
    <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template, eCommerce dashboard, analytic dashboard">
    <meta name="author" content="ThemeSelect">
    <title>User Register | Materialize - Material Design Admin Template</title>
    <link rel="apple-touch-icon" href="/images/favicon/favicon_1.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon/favicon_1.ico">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- BEGIN: VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="/vendors/vendors.min.css">
    <link rel="stylesheet" href="/vendors/select2/select2.min.css" type="text/css">
    <link rel="stylesheet" href="/vendors/select2/select2-materialize.css" type="text/css">
    <!-- END: VENDOR CSS-->
    <!-- BEGIN: Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="/css/themes/horizontal-menu-template/materialize.css">
    <link rel="stylesheet" type="text/css" href="/css/themes/horizontal-menu-template/style.css">
    <link rel="stylesheet" type="text/css" href="/css/layouts/style-horizontal.css">
    <link rel="stylesheet" type="text/css" href="/css/pages/register.css">
    <link rel="stylesheet" type="text/css" href="/css/pages/form-select2.css">
     <link rel="stylesheet" type="text/css" href="/css/pages/component-navbar.css">
    <!-- END: Page Level CSS-->
    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/css/custom/custom.css">
    <!-- END: Custom CSS-->
</head>
<!-- END: Head-->

<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 1-column register-bg   blank-page blank-page" data-open="click" data-menu="horizontal-menu" data-col="1-column">
    <div class="row">
        <div class="col s12">
            <div class="container">
                <div id="register-page" class="row">
                
                    <div class="col s12 m6 l4 z-depth-4 card-panel border-radius-6 register-card bg-opacity-8">
                        <form class="login-form" id="register" action="/member" method="post">
                       		<c:set var="code" value="<%=UUID.randomUUID().toString().toUpperCase().substring(0, 6)%>" />
							<input type="hidden" id="code" name="code" value="${code}" />
                            <div class="row">
                                <div class="input-field col s12">
                                    <h5 class="ml-4">회원가입</h5>
                                    <p class="ml-4">이메일 인증 후 회원가입 해주세요.</p>
                                </div>
                            </div>
                           
                            <div class="row margin">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix pt-2">mail_outline</i>
                                    <input type="email" name="email" id="email" onchange="checkEmail()" required>
                                    <label for="email">이메일</label>
                                    <button type="button" id="send" style="float: right; font-size: 12px;" class="btn waves-effect waves-light border-round gradient-45deg-purple-light-blue">전송</button>
                                </div>
                            </div>
                            <div class="row margin">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix pt-2">lock_outline</i>
                                    <input type="text" name="authCode" id="authCode" value="">
                                    <label for="authCode">인증코드</label>
                                  <button type="button" id="auth" style="float: right; font-size: 12px;" class="btn waves-effect waves-light border-round gradient-45deg-purple-light-blue">인증</button>
                                </div>
                            </div>
                            <div class="row margin">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix pt-2">lock_outline</i>
                                    <input type="password" name="password" id="password" value="" maxlength="20" required>
                                    <label for="password">비밀번호</label>
                                </div>
                            </div>
                            <div class="row margin">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix pt-2">person_outline</i>
                                   <input type="text" name="name" id="name"value="" maxlength="40" required>
                                    <label for="name" class="center-align">사용자 이름</label>
                                </div>
                            </div>
                            <div class="row margin">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix pt-2">person_outline</i>
                                   <input type="text" name="nickname" id="nickname" value="" required>
                                    <label for="nickname" class="center-align">닉네임</label>
                                </div>
                            </div>
                            <div class="row margin">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix pt-2">person_outline</i>
                                    <select id="bank" name="bank">
												<option value="" disabled selected>은행 선택</option>
												<option value="004">KB국민은행</option>
												<option value="023">SC제일은행</option>
												<option value="003">기업은행</option>
												<option value="011">농협</option>
												<option value="002">산업은행</option>
												<option value="045">새마을금고</option>
												<option value="007">수협</option>
												<option value="088">신한은행</option>
												<option value="048">신협</option>
												<option value="005">외환은행</option>
												<option value="020">우리은행</option>
												<option value="071">우체국</option>
												<option value="090">카카오뱅크</option>
												<option value="089">케이뱅크</option>
												<option value="081">하나은행</option>
									</select>
                                    
                                </div>
                            </div>
                            <div class="row margin">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix pt-2">lock_outline</i>
                                   <input type="number" name="account" id="account" class="form-control form-control-lg required" maxlength="14" required>
                                    <label for="account">계좌번호</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                               		<button type="submit" class="btn waves-effect waves-light border-round gradient-45deg-purple-light-blue col s12">회원가입</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <p class="margin medium-small"><a href="/login">계정이 있으신가요? 로그인</a></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="content-overlay"></div>
        </div>
    </div>
    
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
				
				$('button[type="submit"]').removeAttr('disabled');
				
			}  else {
				alert("인증코드가 잘못되었습니다.");
			}
		}
		
		function checkEmail() {    
			var email = document.getElementById("email").value;
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		   if (regex.test(email)) {
			   
		   } else {
			   document.getElementById("email").value ='';
			   alert("이메일 형식에 맞게 입력해주세요")
		   }
		}			
		
	</script>

    <!-- BEGIN VENDOR JS-->
    <script src="/js/vendors.min.js"></script>
    <!-- BEGIN VENDOR JS-->
    <!-- BEGIN PAGE VENDOR JS-->
    <script src="/vendors/select2/select2.full.min.js"></script>
    <!-- END PAGE VENDOR JS-->
    <!-- BEGIN THEME  JS-->
    <script src="/js/plugins.js"></script>
    <script src="/js/search.js"></script>
    <script src="/js/custom/custom-script.js"></script>
    <!-- END THEME  JS-->
    <!-- BEGIN PAGE LEVEL JS-->
    <script src="/js/scripts/form-select2.js"></script>
    <!-- END PAGE LEVEL JS-->
    
</body>

</html>