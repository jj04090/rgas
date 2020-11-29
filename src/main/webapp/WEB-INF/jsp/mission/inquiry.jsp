<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<title>내 미션 목록</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched">
	<div id="wrapper" class="clearfix">
		<section id="page-title">
			<div class="container clearfix">
				<h1 style="font-size:40px">미션 정보</h1>
				<span>mission info</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Mission</li>
				</ol>
			</div>
		</section>
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
						<div class="row">
							<div class="col-lg-10">
								<form class="row" id="event-registration" action="/mission" method="post" enctype="multipart/form-data">
									<input type="hidden" name="_method" value="PUT" />
									<input type="hidden" name="no" id="no" value="${mission.no}" />
									<input type="hidden" name="memberNo" id="memberNo" value="${mission.memberNo}" />
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
									<div id="id" style="display:none"><tf:formatDateTime value="${mission.startDate}" pattern="yyyy-MM-dd"/></div>
									<div class="col-12 form-group">
										<label>미션 제목</label>
										<c:if test="${today < mission.startDate}">
											<input type="text" name="title" id="title" class="form-control required" value="${mission.title}" />
										</c:if>
										<c:if test="${today >= mission.startDate }">
											<input type="text" name="title" id="title" class="form-control required" value="${mission.title}" disabled/>
										</c:if>
									</div>
									<div class="col-6 form-group">
										<label>카테고리</label>
										<c:if test="${today < mission.startDate}">
											<select class="form-control required" name="categoryNo" id="categoryNo">
												<option value="1">건강</option>
												<option value="2">생활패턴</option>
												<option value="3">역량</option>
												<option value="4">취미</option>
												<option value="5">기타</option>
											</select>
										</c:if>
										<c:if test="${today >= mission.startDate }">
											<select class="form-control required" name="categoryNo" id="categoryNo" disabled>
												<option value="1">건강</option>
												<option value="2">생활패턴</option>
												<option value="3">역량</option>
												<option value="4">취미</option>
												<option value="5">기타</option>
											</select>
										</c:if>
									</div>
									<div class="col-6 form-group">
										<label>금액(원)</label>
										<c:if test="${today < mission.startDate}">
											<input type="text" id="entryFee" name="entryFee" class="form-control required"
												placeholder="숫자만 입력해주세요" value="${mission.entryFee}">
										</c:if>
										<c:if test="${today >= mission.startDate }">
											<input type="text" id="entryFee" name="entryFee" class="form-control required"
												placeholder="숫자만 입력해주세요" value="${mission.entryFee}" disabled>
										</c:if>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label>내용</label>
											<c:if test="${today < mission.startDate }">
												<textarea name="note" id="note" class="form-control required" cols="30" rows="5">${mission.note}</textarea>
											</c:if>
											<c:if test="${today >= mission.startDate }">
												<textarea name="note" id="note" class="form-control required" cols="30" rows="5" disabled>${mission.note}</textarea>
											</c:if>
										</div>
									</div>
									<div class="col-6 form-group">
										<label>시작 일자</label>
										<c:if test="${today < mission.startDate}">
											<div>
												<input type="date" name="startDate" id="startDate" class="form-control required" value="${mission.startDate}">
											</div>
										</c:if>
										<c:if test="${today >= mission.startDate}">
											<div>
												<input type="date" name="startDate" id="startDate" class="form-control required" value="${mission.startDate}" disabled>
											</div>
										</c:if>
									</div>
									<div class="col-6 form-group">
										<label>종료 일자</label>
										<c:if test="${today < mission.startDate}">
											<div>
												<input type="date" name="endDate" id="endDate" class="form-control required" value="${mission.endDate}">
											</div>
										</c:if>
										<c:if test="${today >= mission.startDate}">
											<div>
												<input type="date" name="endDate" id="endDate" class="form-control required" value="${mission.endDate}" disabled>
											</div>
										</c:if>
									</div>
									<div class="col-6 form-group">
										<label>인증 시작 시간</label>
										<c:if test="${today < mission.startDate}">
											<div>
												<input type="time" name="certifiedStartTime" class="form-control required" 
												id="certifiedStartTime" value="${mission.certifiedStartTime}">
											</div>
										</c:if>
										<c:if test="${today >= mission.startDate}">
											<div>
												<input type="time" name="certifiedStartTime" class="form-control required" 
												id="certifiedStartTime" value="${mission.certifiedStartTime}" disabled>
											</div>
										</c:if>
									</div>
									<div class="col-6 form-group">
										<label>인증 종료 시간</label>
										<c:if test="${today < mission.startDate}">
											<div>
												<input type="time" name="certifiedEndTime" class="form-control required"
												id="certifiedEndTime" value="${mission.certifiedEndTime}">
											</div>
										</c:if>
										<c:if test="${today >= mission.startDate}">
											<div>
												<input type="time" name="certifiedEndTime" class="form-control required" 
												id="certifiedEndTime" value="${mission.certifiedEndTime}" disabled>
											</div>
										</c:if>
									</div>
									<div class="col-6 form-group">
										<div class="form-group">
											<label>예시사진 업로드</label>
												<div>
													<input type="file" name="img" id="img" class="file-loading required"
													data-show-preview="false" disabled>
												</div>
										</div>
									</div>
									<div class="col-12 form-group">
									<c:if test="${today < mission.startDate}">
										<input class="button button-border button-aqua"
											type="submit" form="event-registration" value="수정" />
									</c:if>
									</div>
								</form>
							    </div>
							</div>
									
							<c:if test="${today > mission.endDate}">
								<input type="hidden" name="no" id="no" value="${mission.no}" />
								<input type="button" value="환급" id="refunds" 
									class="button button-border button-aqua" onclick="ajax_call()"/>
							</c:if>
						
							<c:if test="${today < mission.startDate}">
								<form id="deleteForm"method="post" action="/mission">
									<input type="hidden" name="_method" value="DELETE" />
									<input type="hidden" name="no" id="no" value="${mission.no}" />
									<input class="button button-border button-aqua"
										type="submit" form="deleteForm" value="삭제"/>
								</form>
							</c:if>
					</div>
				</div>
		</section>
		</div>
	
      <script>
		function ajax_call() {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === xhr.DONE) {
					if (xhr.status === 200 || xhr.status === 201) {
						var msg = xhr.responseText;
						if(msg != "0") {
							alert("환급금액 : " + msg);
						} else {
							alert("실패");
						}
					}
				}
			}
			var mission = {
				no : document.getElementById("no").value
				
			};
			xhr.open("POST", "http://localhost:8080/refunds", true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify(mission));
		};
	</script>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />