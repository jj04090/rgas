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
	                            <p class="caption mb-0">기부단체 목록</p>
                            </div>
                            <form action="${pageContext.request.contextPath}/charity/form" method=get>
								<button class="btn cyan waves-effect waves-light right" type="submit">
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
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/layout/topheader.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>기부단체 목록</title>
<style>
	td:hover {
	  background-color: white;
	}
</style>
<jsp:include page="/WEB-INF/jsp/layout/topbody.jsp" />

<body class="stretched" style="background:#FFFFFF">
	<div id="wrapper" class="clearfix">
		<section id="page-title" class="page-title-mini" style="background:#2E2E2E;">
			<div class="container clearfix">
				<h1 style="font-size:25px;color:white;">CHARITY</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/home" style="color:white;">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page" style="color:white;">Charity</li>
				</ol>
			</div>
		</section>
		<section id="content" style="background:#FBF8EF">
			<div class="content-wrap" style="padding-bottom:400px;">
				<div class="container clearfix" style="width:60%;background:#FFFFFF;margin:0 auto;padding-top:20px;box-shadow: 5px 5px 5px 5px gray;">
					<div>
						<div>
								<div class="col-12 form-group">
							    	<a href="/charity/form" style="float:right;font-size:14px;" class="button button-large button-circle button-3d button-brown">기부단체 등록<i class="icon-circle-arrow-right"></i></a>
								</div>
							<table class="table table-bordered table-striped">
								<tr>
								<thread>
								  <th>기부단체 명</th>
								  <th>은행 명</th>
								  <th>계좌 번호</th>
								</thread>
								</tr>
							  <c:forEach var="charity" items="${charityList}">
								  <tbody>
									<tr onClick="location.href='/charity/${charity.no}'" style="cursor:pointer;">
							          	<td>${charity.name}</td>
									  	<td><c:out value="${bankList[charity.bank]}"/></td>
									 	<td>${charity.account}</td>
									</tr>
								  </tbody>
							  </c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
<jsp:include page="/WEB-INF/jsp/layout/bottom.jsp" /> --%>
