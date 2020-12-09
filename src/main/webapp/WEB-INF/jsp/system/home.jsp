<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/jsp/layout/top.jsp"/>

					<div id="pagetitle" class="clearfix"><h1 class="left">미션 등록</h1></div>
				</div>
			</header>

			<div class="container_16 clearfix" id="actualbody">
				<div class="grid_16 widget first">
					<div class="widget_title clearfix" style="padding-top: 3px;"></div>
					<div class="widget_body" style="padding-bottom: 1px;">
						<form id="form_add" action="${pageContext.request.contextPath}/base/colleges" method="post">
							<table>
								<tbody>
									<tr>
										<td style="width: 5px;"></td>
										<td class="align-left" style="width: 200px;"><label for="id">아이디</label></td>
										<td class="align-left">
											<input type="hidden" name="_method" />
											<input type="text" name="id" maxlength="5" class="medium">
										</td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">카테고리</label></td>
										<td class="align-left"><input type="text" name="category" class="medium"></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">미션 제목</label></td>
										<td class="align-left"><input type="text" name="title" class="medium"></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">금액</label></td>
										<td class="align-left"><input type="text" name="entryFee" class="medium"></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">내용</label></td>
										<td class="align-left"><textarea name="note" cols="30" rows="5"></textarea></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">시작 일자</label></td>
										<td class="align-left"><input type="date" name="startDate" class="medium"></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">종료 일자</label></td>
										<td class="align-left"><input type="date" name="endDate" class="medium"></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">인증 시작 시간</label></td>
										<td class="align-left"><input type="time" name="certifiedStartTime" class="medium"></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">인증 종료 시간</label></td>
										<td class="align-left"><input type="time" name="certifiedEndTime" class="medium"></td>
									</tr>
									<tr>
										<td></td>
										<td class="align-left"><label for="name">예시사진 업로드</label></td>
										<td class="align-left"><input type="file" name="img" id="img" 
													data-show-preview="false"></td>
									</tr>
								</tbody>
							</table>
						</form>
						<div class="clear"></div>
					</div>
				</div>

				<div class="grid_16">
					<c:if test="${msg ne null}"><span style="color: red;">※ <c:out value="${msg}" /></span></c:if>
					<a id="function_list" class="btn right medium"><span>목록</span></a>
					<a id="function_add" class="btn right medium"><span>등록</span></a>
				</div>
			</div>
    		<div class="clear"></div>
    	</div>
	</div>

<script>
	$(document).ready(function() {
		$("#function_list").click(function() {
			$(location).attr("href", "${pageContext.request.contextPath}/base/colleges");
		});

		$("#function_add").click(function() {
			$("input[name=_method]").val('post');
			$('#form_add').submit();
		});
	});
</script>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"></jsp:include>