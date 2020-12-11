<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />
<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
	<div id="main">
		<div class="row">
			<div class="col s12">
				<div class="container">
					<div id="contact-us" class="seaction">
						<div class="app-wrapper">
							<div class="card">
								<div class="card-content">
									<p class="caption mb-0" style="font-size:20px;font-weight:bold;">피드 등록</p>
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
													<form class="row" id="register" action="/perform"
														method="post" enctype="multipart/form-data">
														<input type="hidden" name="paymentNo" id="paymentNo"
															value="${paymentNo}" />
														<div class="row">
															<div class="input-field col s12">
																<!-- <i class="material-icons prefix">email</i> -->
																<input type="text" id="email" name="email"
																	value="${mission.title}"
																	style="color: black; font-weight: bold;" disabled>
																<label style="font-weight: bold;">미션
																	제목</label>
															</div>
														</div>
														<div class="row">
															<div class="col m6 s12 file-field input-field">
																<div id="file-upload" class="section">
																	<!--Default version-->
																	<div class="row section">
																		<div class="col s12 m4 l3">
																			<p style="font-weight:bold;">인증사진 업로드</p>
																		</div>
																		<div class="col s12 m8 l9">
																			<input type="file" id="img" name="img"
																				class="dropify" data-default-file="" />
																		</div>
																	</div>
																	<!-- <div class="btn float-right">
                                                        <span>File</span>
                                                        <input type="file">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div> -->
																</div>
															</div>
														</div>
														<div class="row">
															<button class="btn blue waves-effect waves-light right"
																id="submit" type="submit" style="font-weight:bold;" disabled>
																등록 <i class="material-icons right">send</i>
															</button>
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
	<script>
    	document.title = "피드 등록 | CHEERUP" ;
	</script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script>
    	document.title = "피드 등록" ;
	</script>
	<script>
		$(function() {
			$("#img").change(function(e){
				$('button[type="submit"]').removeAttr('disabled');
			});
		});
	</script>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />