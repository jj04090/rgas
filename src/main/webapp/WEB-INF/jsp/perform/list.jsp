<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />

<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
    <!-- BEGIN: Page Main-->
    <div id="main">
        <div class="row">         
            <div class="col s12">
                <div class="container">
                	<div class="card">
                    	<div class="card-content">
                            <p class="caption mb-0" style="font-size:20px;font-weight:bold;">피드 목록</p>
                        </div>
                    </div>
                    <!--Card Reveal-->
                    <div id="card-reveal" class="section">
                        <div class="row">
                        	<c:forEach var="perform" items="${performList}">
                            <div class="col s12 m6 l4">
                                <div class="card">
                                    <div class="card-image waves-effect waves-block waves-light">
                                        <img class="activator" src="/perform/photo/${perform.no}" 
											onerror="this.src='/images/gallery/1.png'" style="width:100%;height:400px;"/>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4">
                                        	<c:if test="${mission.title != null}" >
							            		<p style="font-size:20px;font-weight:bold;">${mission.title}</p>
							            	</c:if>
											<c:if test="${missionList != null}">
									        	<c:forEach var="paymentList" items="${paymentList}">
									            		<c:if test="${perform.paymentNo eq paymentList.no}">
									            			<c:forEach var="missionList" items="${missionList}">
									            				<c:if test="${paymentList.missionNo eq missionList.no}">
											            			<p style="font-size:20px;font-weight:bold;">${missionList.title}</p>
									            				</c:if>
									            			</c:forEach>
									            		</c:if>
									            </c:forEach>
							            	</c:if>
                                        <c:if test="${missionList != null}">
											<a class="right" href="/report/form/${perform.no}" style="font-size:15px;">신고하기</a>
										</c:if>
                                        </span>
                                        <table style="text-align:center;margin:0px;padding:0px;">
											<tr>
												<th><span class="material-icons">date_range</span>
													수행 날짜</th>
												<th>&nbsp;&nbsp;&nbsp;</th>
												<th><span class="material-icons">check_circle</span>
														<c:if test="${perform.status == 'Y'}">성공</c:if>
						        						<c:if test="${perform.status == 'N'}">실패</c:if>
						        				</th>
						        				<th>&nbsp;&nbsp;&nbsp;</th>
						        				<c:if test="${memberList != null}">
						        				<th><span class="material-icons dp48">account_circle</span>
														<c:forEach var="paymentList" items="${paymentList}">
											            		<c:if test="${perform.paymentNo eq paymentList.no}">
											            			<c:forEach var="missionList" items="${missionList}">
											            				<c:if test="${paymentList.missionNo eq missionList.no}">
											            					<c:forEach var="memberList" items="${memberList}">
											            						<c:if test="${missionList.memberNo eq memberList.no}">
															            			${memberList.nickname}
											            						</c:if>
											            					</c:forEach>
											            				</c:if>
											            			</c:forEach>
											            		</c:if>
											            </c:forEach>
													</th>
													</c:if>
												</tr>
											<tr>
											<td><p>${perform.registerDate}</p></td>
											</tr>
										</table>
                                    </div>
                                </div>
                            </div>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />