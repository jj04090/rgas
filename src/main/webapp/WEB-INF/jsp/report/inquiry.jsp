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
                    <div class="seaction">
                        <div class="card">
                            <div class="card-content">
                                <p class="caption mb-0">신고 정보_신고당한 수행내역을 확인 후 실패처리 가능합니다.</p>
                            </div>
                        </div>
                           <!-- Form Advance -->
                            <div class="col s12 m12 l12">
                                <div id="Form-advance" class="card card card-default scrollspy">
                                    <div class="card-content">
                                      <h4 class="card-title">신고 상세 정보</h4>
                                      <input type="hidden" name="no" id="no" value="${report.no}" />
                                      
                                            <div class="row">
												<c:if test="${report.status == 'W'}">
													<form action="/perform/${report.performNo}" method="get">
														<button class="btn cyan waves-effect waves-light right" type="submit" >
	                                                         확인<i class="material-icons right" style="font-size: 20px; ">error_outline</i>
	                                                     </button>
													</form>
												</c:if>
												<c:if test="${report.status == 'P'}">
													<label style="font-size:20px; font-weight:bold; color:green;float:right;">
														완료<i class="material-icons right" >check_circle</i>
													</label>
												</c:if>
											</div>
                                           
                                            <div class="row">
                                                 <div class="input-field col s12">
													<c:forEach var="member" items="${memberList}">
														<c:if test="${report.memberNo eq member.no}">
															<input type="text" value="${member.email}" name="email"
																id="email"  disabled />
														</c:if>
													</c:forEach>
													<label for="email">신고자 이메일</label>
                                                </div>
                                            </div>
                                             <div class="row">
                                                 <div class="input-field col s12">
													<input type="text" value="${report.reportDate}" name="date" id="date" disabled />
													<label for="date">신고자 이메일</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                 <div class="input-field col s12">
													<textarea class="materialize-textarea" name="note" id="note" class="form-control required" cols="30" rows="5" disabled>${report.note}</textarea>
													
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col m6 s12">
                                                     <form method="post" action="/report">
														<input type="hidden" name="_method" value="DELETE" /> 
														<input type="hidden" name="no" id="no" value="${report.no}" /> 
														<button class="btn red waves-effect waves-light left" type="submit">삭제
	                                                        	 <i class="material-icons right">delete</i>
	                                                  	</button>
													</form>
                                                </div>
                                                <c:if test="${report.status == 'W'}">
	                                                <div class="input-field col m6 s12">
														<form method="post" action="/report">
															<input type="hidden" name="_method" value="PUT" />
															<input type="hidden" name="no" id="no" value="${report.no}" />
															<input type="hidden" name="performNo" id="performNo" value="${report.performNo}" />
															<button class="btn cyan waves-effect waves-light right" type="submit">처리완료
		                                                       <i class="material-icons right">done</i>
		                                                  	</button>
														</form>
													</div>
												</c:if>
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