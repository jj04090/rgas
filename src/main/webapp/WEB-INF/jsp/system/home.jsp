<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/jsp/layout/top.jsp"/>
<body
	class="horizontal-layout page-header-light horizontal-menu preload-transitions 1-column  bg-full-screen-image  blank-page blank-page"
	data-open="click" data-menu="horizontal-menu" data-col="1-column">
	<!--media slider-->
	<div class="row">
		<div class="col s12">
			<div id="media-slider" class="card card-tabs">
				<div class="card-content">
					<div class="card-title">
						<div id="view-media-slider">
							<div class="row">
								<div class="col s12">
									<div class="slider">
										<ul class="slides mt-2">
											<li><img src="/images/test2.jpg" alt="img-1">
												<div class="caption center-align">
													<h4 class="white-text" style="text-shadow: 2px 2px 2px gray;font-weight:bold;">작은 습관이 인생을 바꿉니다.</h4>
													<h5 class="light black-text text-lighten-3"></h5>
												</div></li>
											<li><img src="/images/test7.jpg" alt="img-2">
												<div class="caption left-align">
													<h3 class="white-text" style="text-shadow: 2px 2px 2px gray;font-weight: bold;">의지가 부족하다면</h3>
													<h5 class="light white-text text-lighten-3" style="text-shadow: 2px 2px 2px gray;font-weight: bold;">돈을 걸면 의지가 달라집니다.</h5>
												</div></li>
											<li><img src="/images/test6.jpg" alt="img-3">
												<div class="caption right-align">
													<h3 class="white-text" style="text-shadow: 2px 2px 2px gray;font-weight: bold;">인생을 바꾸는 습관</h3>
													<h5 class="light white-text text-lighten-3" style="text-shadow: 2px 2px 2px gray;font-weight: bold;">습관이 사람을 만든다</h5>
												</div></li>
											<li><img src="/images/test4.jpg" alt="img-4">
												<div class="caption center-align">
													<h3 class="black-text" style="text-shadow: 2px 2px 2px gray;font-weight: bold;">환급형 목표 달성 서비스</h3>
													<h2 class="light black-text text-lighten-3" style="text-shadow: 2px 2px 2px gray;font-weight: bold;">CHEERUP</h2>
												</div></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div id="cards-extended">
			<div id="image-card" class="section">
				<div class="row">
					<div class="col s12 m4">
						<div class="card grey lighten-4">
							<div class="card-content white-text center">
								<h3 class="card-title red-text" style="font-weight:bold;">첫번째!</h3>
								<h4 class="card-title" style="font-weight:bold;">달성하고 싶은 자신의 목표를 미션으로 등록하세요</h4>
								<img src="/images/home_card_1.png" alt="images" class="responsive-img" style="width:200px;height:auto;"/>
								<p class="black-text lighten-4" style="font-weight:bold;">
									아침 일찍 일어나기, 매일 운동하기, 자기개발 등등<br/>
									자신의 목표 달성을 위한 미션을 등록하세요.
								</p>
							</div>
						</div>
					</div>
					<div class="col s12 m4">
						<div class="card grey lighten-4">
							<div class="card-content white-text center">
								<h3 class="card-title green-text" style="font-weight:bold;">두번째!</h3>
								<h4 class="card-title" style="font-weight:bold;">그리고 목표에 돈을 걸어두세요</h4> 
									<img src="/images/home_card_2.png" alt="images"
									class="responsive-img" style="width:200px;height:auto;"/>
								<p class="black-text lighten-4" style="font-weight:bold;">
									<br/>돈을 걸면 의지가 달라집니다.<br/>
									예치금은 반드시 해야만 하는 환경을 만들어 줍니다.<br/>
									 
								</p>
							</div>
						</div>
					</div>
					<div class="col s12 m4">
						<div class="card grey lighten-4">
							<div class="card-content white-text center">
								<h3 class="card-title blue-text" style="font-weight:bold;">세번째!</h3>
								<h6 class="card-title " style="font-weight:bold;">성공하면 환급! 못 지키면 기부!</h6>
								<img src="/images/home_card_3.png"
									alt="images" class="responsive-img" style="width:200px;height:auto;"/>
								<p class="black-text lighten-4" style="font-weight:bold;">
									모두 성공시 전액 환급되고,<br/>
									실패 시 일수마다 7%씩 차감되어 기부단체에 기부됩니다.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
    		document.title = "홈 | CHEERUP" ;
		</script>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />