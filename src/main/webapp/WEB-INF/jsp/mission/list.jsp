<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags/" %>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />
<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
<div id="main">
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
		<fmt:formatDate type="time" value="${now}" pattern="HH:mm:ss" var="nowTime"/>
		<fmt:parseDate var="certifiedStartTime" value="${mission.certifiedStartTime}"  pattern="HH:mm:ss"/>
	    <fmt:parseDate var="certifiedEndTime" value="${mission.certifiedEndTime}"  pattern="HH:mm:ss"/>
	            
	    <fmt:formatDate value="${certifiedStartTime}" pattern="HH:mm:ss" var="startTime"/>
	    <fmt:formatDate value="${certifiedEndTime}" pattern="HH:mm:ss" var="endTime"/>
        <div class="row">       
            <div class="col s12">
                <div class="container">
                	<div class="card">
                    	<div class="card-content">
                            <p class="caption mb-0" style="font-size:20px;font-weight:bold;">미션 목록</p>
                        </div>
                        <form method="get" action="/mission/form">
								<button class="btn gradient-45deg-blue-indigo darken-4 waves-effect waves-light right"
									type="submit" style="font-weight:bold;">
									미션등록 <i class="material-icons right">add_circle</i>
								</button>
						</form>
                    </div>
                    <div id="cards-extended">                       
                        <div id="card-panel-type" class="section">
							
                            <div class="row mt-1">
                            	<c:forEach var="mission" items="${missionList}">
								<c:if test="${mission.status eq 'N'}">
                                <div class="col s12 m6 l6 card-width">
                                    <div class="card-panel border-radius-6 mt-10 card-animation-1">
                                        <a href="/mission/${mission.no}"><img class="responsive-img border-radius-8 z-depth-4 image-n-margin " src="mission/photo/${mission.no}" 
                                        onerror="this.src='/images/gallery/1.png'" style="width:100%;height:500px;"
                                        ></a>
                                        <h6><a href="/mission/${mission.no}" class="mt-5" style="font-weight:bold;">${mission.title}</a></h6>
                                        <p>${mission.note}</p>
                                        <div class="row mt-4">
                                            <a>
                                                <div class="col s3 p-0 mt-1">
                                                <i class="material-icons dp48">account_circle</i>
                                                <span class="ml-3 vertical-align-top">
                                                	<c:forEach var="member" items="${memberList}">
	            										<c:if test="${mission.memberNo eq member.no}">
	            											${member.name}
	            										</c:if>
	            									</c:forEach></a>
                                                </span>
                                                </div>
                                            </a>
                                            <div class="col s9 mt-1 right-align">
                                                <a><span class="material-icons">date_range</span></a>
                                                <span class="ml-3 vertical-align-top"><tf:formatDateTime value="${mission.startDate}" pattern="yyyy-MM-dd"/></span>
                                                <a><span class="material-icons ml-5">date_range</span></a>
                                                <span class="ml-3 vertical-align-top"><tf:formatDateTime value="${mission.endDate}" pattern="yyyy-MM-dd"/></span>
                                                <a><span class="material-icons ml-5">local_atm</span></a>
                                                <span class="ml-3 vertical-align-top">${mission.entryFee} 원</span>
                                            </div>
	                                    	<fmt:parseDate var="certifiedStartTime" value="${mission.certifiedStartTime}"  pattern="HH:mm:ss"/>
			   								<fmt:parseDate var="certifiedEndTime" value="${mission.certifiedEndTime}"  pattern="HH:mm:ss"/>
			            
			    							<fmt:formatDate value="${certifiedStartTime}" pattern="HH:mm:ss" var="startTime"/>
			    							<fmt:formatDate value="${certifiedEndTime}" pattern="HH:mm:ss" var="endTime"/>
	                                   		
	                                   		<div class="row mt-4">
	                                   			<div class="input-field col m6 s12">
													<c:if test="${nowTime >= startTime and nowTime <= endTime}">
						           				        <c:if test="${today >= mission.startDate and today <= mission.endDate}">
							            					<form method="get" action="/perform/form/${mission.no}">
																<input type="hidden" name="no" id="no" value="${mission.no}" />
																	<button class="btn blue waves-effect waves-light left" 
																	style="font-weight:bold;" type="submit">
																		등록 <i class="material-icons right">add_a_photo</i>
																	</button>
															</form>
												        </c:if>
											        </c:if>
										        </div>
										        <form method="get" action="/perform">
													<div class="input-field col m6 s12">
													<input type="hidden" name="no" id="no" value="${mission.no}" />
														<button class="btn blue waves-effect waves-light right" 
														style="font-weight:bold;" type="submit">
															피드<i class="material-icons right">camera_alt</i>
														</button>
													</div>
												</form>
										    </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                </c:forEach>
                                
                                
                            </div>
                        </div>
                </div>
                <div class="content-overlay"></div>
            </div>
        </div>
    </div>
 </div>
 <script>
    	document.title = "미션 목록 | CHEERUP" ;
	</script>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
