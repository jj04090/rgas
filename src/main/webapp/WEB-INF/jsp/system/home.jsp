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
<<<<<<< HEAD
										<ul class="slides mt-2" >
											<li><img src="/images/gallery/test1.jpg" alt="img-1">
												<!-- random image -->
=======
										<ul class="slides mt-2">
											<li><img src="/images/test2.jpg" alt="img-1">
>>>>>>> refs/remotes/origin/sh2
												<div class="caption center-align">
													<h3 class="black-text">This is our big Tagline!</h3>
													<h5 class="light black-text text-lighten-3">Here's our
														small slogan.</h5>
												</div></li>
											<li><img src="/images/test7.jpg" alt="img-2">
												<div class="caption left-align">
													<h3 class="black-text">Left Aligned Caption</h3>
													<h5 class="light black-text text-lighten-3">Here's our
														small slogan.</h5>
												</div></li>
											<li><img src="/images/test6.jpg" alt="img-3">
												<div class="caption right-align">
													<h3 class="black-text">Right Aligned Caption</h3>
													<h5 class="light black-text text-lighten-3">Here's our
														small slogan.</h5>
												</div></li>
											<li><img src="/images/test4.jpg" alt="img-4">
												<div class="caption right-align">
													<h3 class="black-text">This is our big Tagline!</h3>
													<h5 class="light black-text text-lighten-3">Here's our
														small slogan.</h5>
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
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />