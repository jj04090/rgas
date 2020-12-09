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
                            <p class="caption mb-0">미션 목록</p>
                        </div>
                    </div>
                    <div id="cards-extended">                       
                        <div id="card-panel-type" class="section">
                            <div class="row mt-1">
		    					<a href="/mission/form" style="float:right;font-size:12px;"
		    					class="waves-effect waves-light  btn gradient-45deg-light-blue-cyan box-shadow-2 border-round mr-1 mb-1">미션 등록</a>
							</div>
                            <div class="row mt-1">
                            	<c:forEach var="mission" items="${missionList}">
								<c:if test="${mission.status eq 'N'}">
                                <div class="col s12 m6 l6 card-width">
                                    <div class="card-panel border-radius-6 mt-10 card-animation-1">
                                        <a href="/mission/${mission.no}"><img class="responsive-img border-radius-8 z-depth-4 image-n-margin" src="mission/photo/${mission.no}" 
                                        onerror="this.src='/images/gallery/1.png'" style="width:700px;height:400px;"
                                        ></a>
                                        <h6><a href="/mission/${mission.no}" class="mt-5">${mission.title}</a></h6>
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
		                                   		<form method="get" action="/perform">
														<input type="hidden" name="no" id="no" value="${mission.no}" />
														<input class="waves-effect waves-light btn gradient-45deg-light-blue-cyan mr-1 mb-2" 
															style="float:right;font-size:12px;" type="submit" value="피드보기" />
												</form>
												<c:if test="${nowTime >= startTime and nowTime <= endTime}">
					           				        <c:if test="${today >= mission.startDate and today <= mission.endDate}">
						            					<form method="get" action="/perform/form/${mission.no}">
															<input type="hidden" name="no" id="no" value="${mission.no}" />
															<input class="waves-effect waves-light btn gradient-45deg-light-blue-cyan mr-1 mb-2" 
															style="float:left;font-size:12px;" type="submit" value="피드 등록" />
														</form>
											        </c:if>
										        </c:if>
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
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
