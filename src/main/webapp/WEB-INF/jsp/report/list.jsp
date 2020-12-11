<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />
<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
	<div id="main">
        <div class="row">
            <div class="col s12">
                <div class="container">
                    <div class="section section-data-tables">
                        <div class="card">
                            <div class="card-content">
                                <p class="caption mb-0" style="font-size:20px;font-weight:bold;">신고 목록</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m12 l12">
                                <div id="button-trigger" class="card card card-default scrollspy">
                                    <div class="card-content">
                                        <div class="row">
                                            <div class="col s12">
                                                <table id="data-table-simple" class="display">
                                                    <thead>
                                                        <tr>
                                                            <th>번호</th>
                                                            <th>신고자 이메일</th>
                                                            <th>신고일자</th>
                                                            <th>처리상태</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="report" items="${list}" varStatus="status">
                                                        <tr onClick="location.href='/report/${report.no}'" style="cursor:pointer;hover:gray;">
                                                            <td>${status.count}</td>
                                                            <td>
	                                                            <c:forEach var="member" items="${memberList}">
													            	<c:if test="${report.memberNo eq member.no}">
													            		${member.email}
													            	</c:if>
													            </c:forEach>
												            </td>
                                                            <td>${report.reportDate}</td>
                                                            <td>
                                                            	<c:if test="${report.status == 'W'}">
	                                                            	<span class="chip red lighten-5">
			                                                            <span class="red-text">대기</span>
			                                                        </span>
												            	</c:if>
												            	<c:if test="${report.status == 'P'}">
	                                                            	<span class="chip green lighten-5">
			                                                            <span class="green-text">처리</span>
			                                                        </span>
												            	</c:if>
												            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
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
    	document.title = "신고 목록 | CHEERUP" ;
	</script>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />