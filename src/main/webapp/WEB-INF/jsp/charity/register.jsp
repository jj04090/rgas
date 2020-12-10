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
                    <div class="seaction section-data-tables">
                        <div class="card">
                            <div class="card-content">
                                <p class="caption mb-0" style="font-size:20px;font-weight:bold;">기부단체 등록</p>
                            </div>
                        </div>
                           <!-- Form Advance -->
                           <div class="row">
	                            <div class="col s12 m12 l12">
	                                <div id="Form-advance" class="card card card-default scrollspy">
	                                    <div class="card-content">
	                                        <h4 class="card-title">기부 단체 등록</h4>
	                                       <form method="post" action="/charity" id="charityForm">
	                                            <div class="row">
	                                                <div class="input-field col s12">
	                                                   <input type="text" name="name" id="name" required/>
	                                                    <label for="name" style="font-weight:bold;">기부단체 명</label>
	                                                </div>
	                                            </div>
	                                            <div class="row">
	                                                <div class="input-field col s12">
													<select id="bank" name="bank" class="select-1 form-control"
														style="width: 100%;" required>
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
													<label for="bank" style="font-weight:bold;">은행 명</label>
	                                                </div>
	                                            </div>
	                                            <div class="row">
	                                                 <div class="input-field col s12">
	                                                   <input type="number" name="account" id="account" required/>
	                                                    <label for="account" style="font-weight:bold;">계좌 번호</label>
	                                                </div>
	                                            </div>
	                                            <div class="row">
	                                                <div class="input-field col s12">
	                                                     <button class="btn cyan waves-effect waves-light right" id="btn" type="submit" name="btn">등록
	                                                         <i class="material-icons right">send</i>
	                                                     </button>
	                                                </div>
	                                            </div>
	                                        </form>
	                                    </div>
	                                </div>
	                            </div>
                            </div>
                        </div>
                    </div><!-- START RIGHT SIDEBAR NAV -->
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />