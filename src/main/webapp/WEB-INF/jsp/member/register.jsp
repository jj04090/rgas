<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="signupForm" action="/member" method="post">
	<c:set var="code" value="<%=UUID.randomUUID().toString().toUpperCase().substring(0,6)%>" />
		<input type="hidden" id="code" name="code" value="${code}" />
	<table border="2">
		<tr>
			<td>EMAIL</td>
			<td><input type="text" name="email" id="email" /></td>
			<td><input type="button" id="send" value="전송" /></td>
		</tr>
		<tr>
			<td>CODE</td>
			<td><input type="text" name="authCode" id="authCode" /></td>
			<td><input type="button" id="auth" value="인증" /></td>
		</tr>
		<tr>
			<td>PWD</td>
			<td><input type="text" name="password" id="password"/></td>
		</tr>
		<tr>
			<td>NAME</td>
			<td><input type="text" name="name" id="name"/></td>
		</tr>
		<tr>
			<td>NICKNAME</td>
			<td><input type="text" name="nickname" id="nickname"/></td>
		</tr>
		<tr>
			<td>BANK</td>
			<td><input type="text" name="bank" id="bank"/></td>
		</tr>
		<tr>
			<td>ACCOUNT</td>
			<td><input type="text" name="account" id="account"/></td>
		</tr>
		<!-- <tr>
			<div id="id" style="display:none"><td><input type="submit" name="signup" value="가입"/></td></div>
		</tr> -->
	</table>
</form>
<script>
		document.getElementById('send').addEventListener('click', send_code);
		function send_code() {
			var xhr = new XMLHttpRequest();
			var formData = new FormData();
			formData.append('email', document.getElementById("email").value);
			formData.append('code', document.getElementById("code").value);
			xhr.onload = function() {
				alert("해당 이메일로 인증코드가 발송되었습니다!");
				//document.getElementById("responseCode").innerHTML = xhr.responseText;
			}
			
			xhr.open("POST", "http://localhost:8080/email");
			xhr.send(formData);
		};
		
		document.getElementById('auth').addEventListener('click', auth_code);
		function auth_code(){
			if(document.getElementById("authCode").value
					== document.getElementById("code").value){
				alert("인증에 성공했습니다.");
				var btn = document.createElement("BUTTON");
				btn.addEventListener('click', singup);   // Create a <button> element
				btn.innerHTML = "가입";   // Insert text
				btn.id = 'signup';
				document.body.appendChild(btn); 
			}  else {
				alert("인증코드가 잘못되었습니다.");
			}
		}
		
		function singup(){
			document.getElementById('signupForm').submit();
		}
	</script>
</body>
</html>