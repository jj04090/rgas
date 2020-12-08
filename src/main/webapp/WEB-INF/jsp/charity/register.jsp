<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<title>기부단체 등록</title>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="font-size:25px;color:white;">CHARITY REGISTER</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Charity</li>
				</ol>
			</div>
		</section>
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap" style="padding-bottom:400px;">
				<div class="container clearfix">
					<div class="row">
							<div class="col-lg-10" style="width:60%;background:#FFFFFF;margin:0 auto;padding-top:20px;box-shadow: 5px 5px 5px 5px gray;">
								<form method="post" action="/charity" id="charityForm">
									<div class="col-12 form-group">
										<label style="font-size:20px;">기부단체 명</label>
										<input type="text" name="name" id="name" class="form-control required" required/>
									</div>
									<div class="col-12 form-group">
										<label style="font-size:20px;">은행</label>
										<select id="bank" name="bank" class="select-1 form-control" style="width:100%;" required>
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
									<div class="col-12 form-group">
										<label style="font-size:20px;">계좌 번호</label>
										<input type="number" name="account" id="account" class="form-control required" required/>
									</div>
									<div class="col-12 form-group">
										<input value="등록" type="submit" form="charityForm" style="float:right;" class="button button-small button-circle button-3d button-brown">
									</div>	
								</form>
							</div>
					</div>
				</div>
			</div>
		</section>
		</div>
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" />