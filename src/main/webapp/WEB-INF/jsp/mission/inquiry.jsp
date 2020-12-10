<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/" %>
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
                                <p class="caption mb-0" style="font-size:20px;font-weight:bold;">미션 정보</p>
                            </div>
                        </div>
                           <!-- Form Advance -->
                           <div class="row">
                            <div class="col s12 m12 l12">
                                <div id="Form-advance" class="card card card-default scrollspy">
                                    <div class="card-content">
                                      <form class="row" id="event-registration" action="/mission" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="_method" value="PUT" />
											<input type="hidden" name="no" id="no" value="${mission.no}" />
											<input type="hidden" name="memberNo" id="memberNo" value="${mission.memberNo}" />
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
											<div id="id" style="display:none"><tf:formatDateTime value="${mission.startDate}" pattern="yyyy-MM-dd"/></div>
											
                                            <div class="row">
                                                <div class="input-field col m6 s12">
													<c:if test="${today < mission.startDate}">
														<select name="categoryNo" id="categoryNo">
															<c:forEach var="category" items="${categoryList}">
																<option value="${category.no}"
																	<c:if test="${mission.categoryNo eq category.no}"> selected</c:if>>
																	${category.title}</option>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${today >= mission.startDate }">
														<select name="categoryNo" id="categoryNo" disabled>
															<c:forEach var="category" items="${categoryList}">
																<option value="${category.no}"
																	<c:if test="${mission.categoryNo eq category.no}"> selected</c:if>>
																	${category.title}</option>
															</c:forEach>
														</select>
													</c:if>
												</div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col m6 s12">
													<c:if test="${today < mission.startDate}">
														<input type="text" name="title" id="title" value="${mission.title}" />
													</c:if>
													<c:if test="${today >= mission.startDate }">
														<input type="text" name="title" id="title" value="${mission.title}" class="validate" disabled />
													</c:if>
													 <label for="entryFee" style="font-weight:bold;font-size:20px;">미션 제목</label>
												</div>
                                                <div class="input-field col m6 s12">
                                                    <input type="text" id="entryFee" name="entryFee" value="${mission.entryFee} 원" disabled>
                                                    <label for="entryFee" style="font-weight:bold;font-size:20px;">참가비</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
													<c:if test="${today < mission.startDate }">
														<textarea class="materialize-textarea" name="note" id="note" cols="30" rows="5">${mission.note}</textarea>
													</c:if>
													<c:if test="${today >= mission.startDate }">
														<textarea class="materialize-textarea" name="note" id="note" cols="30" rows="5" disabled>${mission.note}</textarea>
													</c:if>
													<label for="note" style="font-weight:bold;font-size:20px;">내용</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                 <div class="input-field col m6 s12">
													<c:if test="${today < mission.startDate}">
														<input type="date" name="startDate" id="startDate" value="${mission.startDate}">
													</c:if>
													<c:if test="${today >= mission.startDate}">
														<input type="date" name="startDate" id="startDate" value="${mission.startDate}" disabled>
													</c:if>
													<label for="startDate">시작 일자</label>
                                                </div>
                                                <div class="input-field col m6 s12">
													<c:if test="${today < mission.startDate}">
														<input type="date" name="endDate" id="endDate"
																value="${mission.endDate}">
													</c:if>
													<c:if test="${today >= mission.startDate}">
														<input type="date" name="endDate" id="endDate"
																value="${mission.endDate}" disabled>
													</c:if>
													<label for="endDate">종료 일자</label>
                                            	</div>
                                            </div>
                                            <div class="row">
                                                 <div class="input-field col m6 s12">
													<c:if test="${today < mission.startDate}">
														<input type="time" name="certifiedStartTime"
															class="form-control required" id="certifiedStartTime"
															value="${mission.certifiedStartTime}">
													</c:if>
													<c:if test="${today >= mission.startDate}">
														<input type="time" name="certifiedStartTime"
															class="form-control required" id="certifiedStartTime"
															value="${mission.certifiedStartTime}" disabled>
													</c:if>
													<label>시작 시간</label>
                                                </div>
                                                <div class="input-field col m6 s12">
													<c:if test="${today < mission.startDate}">
														<input type="time" name="certifiedEndTime"
															class="form-control required" id="certifiedEndTime"
															value="${mission.certifiedEndTime}">
													</c:if>
													<c:if test="${today >= mission.startDate}">
														<input type="time" name="certifiedEndTime"
															class="form-control required" id="certifiedEndTime"
															value="${mission.certifiedEndTime}" disabled>
													</c:if>
													<label for="certifiedEndTime">종료 시간</label>
                                                </div>
                                            </div>
                                           
                                            <div class="row">
                                                <div class="col m6 s12 file-field input-field">
                                                    <div class="btn float-right">
                                                        <span>예시사진</span>
                                                        <input type="file"  name="img" id="img" data-show-preview="false">
                                                    </div>
                                                    <div class="file-path-wrapper">
                                                        <input class="file-path validate" type="text">
                                                    </div>
                                                     
                                                </div>
                                            </div>
												</form>
                                            <div class="row">
												<div class="input-field col m6 s12">
													
													<c:if test="${today < mission.startDate}">
														<form id="deleteForm" method="post" action="/mission">
															<input type="hidden" name="_method" value="DELETE" />
															<input type="hidden" name="no" id="no" value="${mission.no}" />
															<button class="btn red waves-effect waves-light left" form="deleteForm" type="submit" style="font-weight: bold;">
																<i class="material-icons right">delete</i>삭제 
															</button> 
														</form>
													</c:if>
												</div>
												<div class="input-field col m6 s12">
													<c:if test="${today < mission.startDate}">
														<button class="btn cyan waves-effect waves-light right"
															form="event-registration" type="submit" style="font-weight: bold;">
															수정 <i class="material-icons right">edit</i>
														</button>
													</c:if>
													<c:if test="${today > mission.endDate}">
														<input type="hidden" name="no" id="no"
															value="${mission.no}" />
														
															<button class="btn green waves-effect waves-light right" form="deleteForm" type="button" style="font-weight: bold;" onclick="ajax_call();">
																 환급<i class="material-icons right">attach_money</i> 
															</button> 
													</c:if>
												</div>
											</div>
										</div>
									</div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div><!-- START RIGHT SIDEBAR NAV -->
                   
                        
                    </div>
                </div>
                <div class="content-overlay"></div>
            </div>
        </div>
    </div>
    
   <script>
		function ajax_call() {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === xhr.DONE) {
					if (xhr.status === 200 || xhr.status === 201) {
						var msg = xhr.responseText;
						if(msg != "0") {
							alert("환급처리 되었습니다. (환급까지 기간은 카드사별로 상이할 수 있습니다.)\n환급금액 : " + msg);
							location.replace('/mission');
						} else {
							alert("환급처리에 실패했습니다.");
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
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />