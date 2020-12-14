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
	                            <p class="caption mb-0" style="font-size:20px;font-weight:bold;">기부단체 목록</p>
                            </div>
                            <form action="${pageContext.request.contextPath}/charity/form" method=get>
								<button class="btn gradient-45deg-blue-indigo waves-effect waves-light right" type="submit" style="font-weight:bold;">
										등록 <i class="material-icons right">add_circle</i>
								</button>
							</form>
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
                                                            <th>기부단체 명</th>
                                                            <th>은행 명</th>
                                                            <th>계좌 번호</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="charity" items="${charityList}">
                                                        <tr onClick="location.href='/charity/${charity.no}'" style="cursor:pointer;hover:gray;">
															<td>${charity.name}</td>
															<td><c:out value="${bankList[charity.bank]}" /></td>
															<td>${charity.account}</td>
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
    	document.title = "기부 단체 목록 | CHEERUP" ;
	</script>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />