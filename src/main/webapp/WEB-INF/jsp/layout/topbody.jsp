<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body class="stretched">
	
	<!-- Document Wrapper
	============================================= -->
	<div class="clearfix">
		<!-- Header
		============================================= -->
		<header id="header" class="transparent-header dark">
			<div id="header-wrap">
				<div class="container"  >
					<c:if test="${auth eq 'C'}">
						<div class="header-row justify-content-lg-between">
							<!-- Logo
							============================================= -->
							<div id="logo" class="order-lg-2 col-auto px-0 mr-lg-0">
								<a href="/home" class="standard-logo" data-dark-logo="/images/logo-rgas-dark.png"><img src="/images/logo-rgas.png" alt="Logo"></a>
								<a href="/home" class="retina-logo" data-dark-logo="/images/logo-rgas-dark.png"><img src="/images/logo-rgas.png" alt="Logo"></a>
							</div><!-- #logo end -->
	
							<div id="primary-menu-trigger">
								<svg class="svg-trigger" viewBox="0 0 100 100"><path d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20"></path><path d="m 30,50 h 40"></path><path d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20"></path></svg>
							</div>
	
							<!-- Primary Navigation
							============================================= -->
							<nav class="primary-menu order-lg-1 col-lg-5 px-0" style="position:inherit;">
									
								<ul class="menu-container">
									<li class="menu-item sub-menu">
										<a class="menu-link" href="/mission" style="font-size:19px"><div>내 미션<i class="icon-angle-down"></i></div></a>
									<li class="menu-item sub-menu">
										<a class="menu-link" style="font-size:30px"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-angle-down"></i></div></a>
										
									<button class="sub-menu-trigger icon-chevron-right"></button></li>
									<li class="menu-item mega-menu sub-menu">
										<a class="menu-link" href="/perform" style="font-size:19px"><div>전체 수행내역<i class="icon-angle-down"></i></div></a>
										
								</ul>
							</nav>
							<nav class="primary-menu order-lg-3 col-lg-5 px-0" style="position:inherit;">
								<div class="menu-container justify-content-lg-end">
									<li class="menu-item mega-menu sub-menu">
										<a class="menu-link" href="/member/${memberValue.no}" style="font-size:19px"><div>내 정보<i class="icon-angle-down"></i></div></a>
									
									<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<a class="menu-link" style="font-size:15px"><div> ${memberValue.name} 님 &nbsp; 환영합니다 <i class="icon-angle-down"></i></div></a>
										<li class="menu-item mega-menu sub-menu">
										<a class="menu-link" href="logout" style="font-size:9px"><div>로그아웃<i class="icon-angle-down"></i></div></a></li>
							</div></nav><!-- #primary-menu end -->
						</div>
					</c:if>
					<c:if test="${auth eq 'A'}">
						<div class="header-row justify-content-lg-between">
							<!-- Logo
							============================================= -->
							<div id="logo" class="order-lg-2 col-auto px-0 mr-lg-0">
								<a href="/home" class="standard-logo" data-dark-logo="/images/logo.png"><img src="/images/logo.png" alt="Canvas Logo" style="height: 100px;"></a>
								<a href="/home" class="retina-logo" data-dark-logo="/images/logo.png"><img src="/images/logo.png" alt="Canvas Logo" style="height: 100px;"></a>
							</div><!-- #logo end -->
	
							<div id="primary-menu-trigger">
								<svg class="svg-trigger" viewBox="0 0 100 100"><path d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20"></path><path d="m 30,50 h 40"></path><path d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20"></path></svg>
							</div>
	
							<!-- Primary Navigation
							============================================= -->
							<nav class="primary-menu order-lg-1 col-lg-5 px-0" style="position:inherit;">
									
								<ul class="menu-container">
									<li class="menu-item sub-menu">
										<a class="menu-link" href="/member" style="font-size:19px"><div>회원 관리<i class="icon-angle-down"></i></div></a>
									<li class="menu-item sub-menu">
										<a class="menu-link" style="font-size:30px"><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-angle-down"></i></div></a>
										
									<button class="sub-menu-trigger icon-chevron-right"></button></li>
									<li class="menu-item mega-menu sub-menu">
										<a class="menu-link" href="/report" style="font-size:19px"><div>신고 관리<i class="icon-angle-down"></i></div></a>
										
								</ul>
							</nav>
							<nav class="primary-menu order-lg-3 col-lg-5 px-0" style="position:inherit;">
								<div class="menu-container justify-content-lg-end">
									<li class="menu-item mega-menu sub-menu">
										<a class="menu-link" href="/donation" style="font-size:19px"><div>기부 관리<i class="icon-angle-down"></i></div></a>
									
									<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<a class="menu-link" style="font-size:15px"><div> 관리자계정 입니다. <i class="icon-angle-down"></i></div></a>
										<li class="menu-item mega-menu sub-menu">
										<a class="menu-link" href="/logout" style="font-size:9px"><div>로그아웃<i class="icon-angle-down"></i></div></a></li>
							</div></nav><!-- #primary-menu end -->
						</div>
					</c:if>
				</div>
			</div>
		</header><!-- #header end -->
	</div><!-- #wrapper end -->
	</body>
