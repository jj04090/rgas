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
                    <!-- users list start -->
                    <section class="users-list-wrapper section">
                    	<div class="card">
                            <div class="card-content">
                                <p class="caption mb-0">회원 목록</p>
                            </div>
                        </div>
                        <div class="users-list-table">
                            <div class="card">
                                <div class="card-content">
                                    <!-- datatable start -->
                                    <div class="responsive-table">
                                        <table id="users-list-datatable" class="table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>이름</th>
                                                    <th>이메일</th>
                                                    <th>닉네임</th>
                                                    <th>등급</th>
                                                    <th>권한</th>
                                                    <th>상태</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="member" items="${list}">
                                                <tr>
                                                    <td></td>
                                                    <td>${member.name}</td>
                                                    <td><a href="/member/${member.no}">${member.email}</a></td>
                                                    <td>${member.nickname}</td>
                                                    <td>
                                                    	<c:if test="${member.grade eq 'C'}">일반</c:if>
	                                                    <c:if test="${member.grade eq 'B'}">브론즈</c:if>
	                                                    <c:if test="${member.grade eq 'S'}">실버</c:if>
	                                                    <c:if test="${member.grade eq 'G'}">골드</c:if>
	                                                    <c:if test="${member.grade eq 'P'}">프로</c:if>
	                                                </td>
                                                    <td>
	                                                    <c:if test="${member.auth eq 'A'}">관리자</c:if>
	                                                    <c:if test="${member.auth eq 'C'}">회원</c:if>
                                                    </td>
                                                    <td><c:if test="${member.status eq 'A'}">
	                                                    	<span class="chip green lighten-5">
	                                                            <span class="green-text">활성</span>
	                                                        </span>
	                                                    </c:if>
	                                                    <c:if test="${member.status eq 'D'}">
	                                                    	<span class="chip red lighten-5">
	                                                            <span class="red-text">탈퇴</span>
	                                                        </span>
	                                                    </c:if>
	                                                    <c:if test="${member.status eq 'S'}">
	                                                    	<span class="chip red lighten-5">
	                                                            <span class="red-text">정지</span>
	                                                        </span>
	                                                    </c:if></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />