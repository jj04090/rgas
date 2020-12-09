<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/top.jsp" />
<body class="horizontal-layout page-header-light horizontal-menu preload-transitions 2-columns   " data-open="click" data-menu="horizontal-menu" data-col="2-columns">
<div id="main">
        <div class="row">  
            <div class="col s12">
                <div class="container">
                	<div class="card">
                            <div class="card-content">
                                <p class="caption mb-0">피드 정보</p>
                            </div>
                        </div>
                    <div id="image-card" class="section">
                        <div class="row">
                            <div class="col s12 m6 l6">
                                <div class="card">
                                    <div class="card-image">
                                        <img src="/perform/photo/${perform.no}" alt="no image" style="width:713px;height:350px;"/> <span class="card-title">Card
                                            Title</span>
                                    </div>
                                    <div class="card-content">
                                        <p style="font-size:16px;font-weight:bold;">피드 번호 : ${perform.no}</p>
                                        <p style="font-size:16px;font-weight:bold;">등록 일자 : ${perform.registerDate}</p>
                                        <p style="font-size:16px;font-weight:bold;">성공/실패 유무 : 
                                        	<c:if test="${perform.status == 'Y'}">성공</c:if>
						        			<c:if test="${perform.status == 'N'}">실패</c:if>
                                        </p>
                                    </div>
                                    <div class="card-action"><a href="javascript:history.back(-1)" style="float:right;">확인</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="divider mt-2"></div>
                </div>
                <div class="content-overlay"></div>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
