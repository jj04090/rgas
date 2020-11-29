<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원 목록</title>

<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#2E2E2E">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">회원 목록</h1>
				<span>member list</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Member</li>
				</ol>
			</div>
		</section>
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div class="row gutter-40 col-mb-80">
						<div class="postcontent col-lg-9">
							<table style="padding-right:0;" class="table table-bordered table-striped">
								<tr>
									<td>
										<input type="text" name="name" />
										<input id="button_search" type="button" value="검색" class="button button-border"/>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		</div>
	<div id="table"></div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		drawTable();
		
		$("#button_search").click(function() {
			drawTable();
		});
	});
	
	function drawTable() {
		$.ajax({
	        url: "${pageContext.request.contextPath}/member",
	        type: "get",
	        data: { name : $("input[name=name]").val() },
	        headers: { "Content-Type" : "application/json;charset=UTF-8" },
	        success: function(rows) {
	        	var script = "";

	        	script += "<section id='content'>";
	        	script += "<div class='content-wrap'>";
	        	script += "<div class='container clearfix'>";
	        	script += "<div class='row gutter-40 col-mb-80'>";
	        	script += "<div class='postcontent col-lg-9'>";
	        	script += "<table class='table table-bordered table-striped'>";
	        	script += "    <tr><thread>";
	        	script += "        <th>이름</th>";
	        	script += "        <th>이메일</th>";
	        	script += "        <th>닉네임</th>";
	        	script += "        <th>등급</th>";
	        	script += "        <th>상태</th></thread>";
	        	script += "    </tr>";
                for (var i = 0; i < rows.length; i++) {
		        	script += "    <tbody><tr>";
		        	script += "        <td><a href='${pageContext.request.contextPath}/member/" + rows[i].no + "'>" + rows[i].name + "</a></td>";
		        	script += "        <td>" + rows[i].email 	+ "</td>";
		        	script += "        <td>" + rows[i].nickname + "</td>";
		        	
		        	if (rows[i].grade == 'C'){
		        		script += "    <td>일반</td>";
		        	} else if (rows[i].grade == 'B'){
		        		script += "    <td>브론드</td>";
		        	} else if (rows[i].grade == 'S'){
		        		script += "    <td>실버</td>";
		        	} else if (rows[i].grade == 'G'){
		        		script += "    <td>골드</td>";
		        	} else if (rows[i].grade == 'P'){
		        		script += "    <td>프로</td>";
		        	}
		        	
		        	if (rows[i].status == 'A'){
		        		script += "    <td>활성</td>";
		        	} else if (rows[i].status == 'S'){
		        		script += "    <td>정지</td>";
		        	} else if (rows[i].status == 'D'){
		        		script += "    <td>탈퇴</td>";
		        	}
		        	
		        	script += "    </tr></tbody>";
	        	} 

                script += "</table>";
                script += "</div></div></div></div></section>";
	            
	           $("#table").html(script);
	        }
	    })
	};
</script>

<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />