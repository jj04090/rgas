<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />
<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
  <!-- BEGIN: Page Main-->
	<div id="main">
		<div class="row">
			<div class="col s12">
				<div class="container">
					<div id="contact-us" class="seaction">
						<div class="app-wrapper">
							<div class="card">
								<div class="card-content">
									<p class="caption mb-0">신고_ 타당한 신고 사유를 입력해주세요.</p>
								</div>
							</div>
							<!-- Form Advance -->
							<div id="sidebar-list" class="row contact-sidenav">
								<div class="contact-form margin-top-contact">
									<div class="row">
										<div class="col s12 m12 l12">
											<div id="Form-advance"
												class="card card card-default scrollspy">
												<div class="card-content">
													<h4 class="card-title">신고 등록</h4>
													<form class="row" id="register" action="/report"
														method="post" enctype="multipart/form-data">
														<input type="hidden" name="performNo" id="performNo"
															value="${performNo}" /> <input type="hidden"
															name="memberNo" id="memberNo" value="${memberNo}" />
														<div class="row">
															<div class="input-field col s12">
																<textarea class="materialize-textarea" name="note"
																	id="note" class="form-control required" cols="30"
																	rows="5"></textarea>
																<label for="note">내용</label>
															</div>
														</div>

														<div class="row">
															<div class="input-field col s12">
																<button class="btn cyan waves-effect waves-light right"
																	id="btn" type="submit" name="btn">
																	등록 <i class="material-icons right">send</i>
																</button>
															</div>
														</div>
													</form>
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
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />