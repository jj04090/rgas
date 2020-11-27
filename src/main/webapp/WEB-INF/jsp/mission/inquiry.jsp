<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/mission" method="post" enctype="multipart/form-data">
		<input type="hidden" name="_method" value="PUT" />
		<input type="hidden" name="no" id="no" value="${mission.no}" />
		<input type="hidden" name="memberNo" id="memberNo" value="${mission.memberNo}" />
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
		<div id="id" style="display:none"><tf:formatDateTime value="${mission.startDate}" pattern="yyyy-MM-dd"/></div>
		<div>
			<label>제목</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<input type="text" id="title" name="title" value="${mission.title}" >
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate }">
				<div>
					<input type="text" id="title" name="title" value="${mission.title}" disabled>
				</div>
			</c:if>
		</div>
		<div>
			<div>
			<label>카테고리</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<select id="categoryNo" name="categoryNo" value="${mission.categoryNo}">
					<option value="1">건강</option>
					<option value="2">생활패턴</option>
					<option value="3">역량</option>
					<option value="4">취미</option>
					<option value="5">기타</option>
				</select>
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate }">
				<div>
					<select id="categoryNo" name="categoryNo" value="${mission.categoryNo}" disabled>
					<option value="1">건강</option>
					<option value="2">생활패턴</option>
					<option value="3">역량</option>
					<option value="4">취미</option>
					<option value="5">기타</option>
					</select>
				</div>
			</c:if>
			</div>
		</div>
		<div>
			<label>참가비</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<input type="text" id="entryFee" name="entryFee"
					placeholder="숫자만 입력해주세요" value="${mission.entryFee}">
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate}">
				<div>
					<input type="text" id="entryFee" name="entryFee"
					placeholder="숫자만 입력해주세요" value="${mission.entryFee}" disabled>
				</div>
			</c:if>
		</div>
		<div>
			<label>내용</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<textarea id="note" name="note"
						style="resize: none; height: 200px">${mission.note}</textarea>
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate}">
				<div>
					<textarea id="note" name="note"
						style="resize: none; height: 200px" disabled>${mission.note}</textarea>
				</div>
			</c:if>
		</div>
		 <div>
			<label>시작 일자</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<input type="date" name="startDate" id="startDate" value="${mission.startDate}">
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate}">
				<div>
					<input type="date" name="startDate" id="startDate" value="${mission.startDate}" disabled>
				</div>
			</c:if>
		</div>
		<div>
			<label>종료 일자</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<input type="date" name="endDate" id="endDate" value="${mission.endDate}">
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate}">
				<div>
					<input type="date" name="endDate" id="endDate" value="${mission.endDate}" disabled>
				</div>
			</c:if>
		</div>
		<div>
			<label>인증 시작 시간</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<input type="time" name="certifiedStartTime" 
					id="certifiedStartTime" value="${mission.certifiedStartTime}">
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate}">
				<div>
					<input type="time" name="certifiedStartTime" 
					id="certifiedStartTime" value="${mission.certifiedStartTime}" disabled>
				</div>
			</c:if>
		</div>
		<div>
			<label>인증 종료 시간</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<input type="time" name="certifiedEndTime" 
					id="certifiedEndTime" value="${mission.certifiedEndTime}">
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate}">
				<div>
					<input type="time" name="certifiedEndTime" 
					id="certifiedEndTime" value="${mission.certifiedEndTime}" disabled>
				</div>
			</c:if>
		</div> 
		<div>
			<label>예시사진 업로드</label>
			<c:if test="${today < mission.startDate}">
				<div>
					<input type="file" name="img" id="img">
				</div>
			</c:if>
			<c:if test="${today >= mission.startDate}">
				<div>
					<input type="file" name="img" id="img" disabled>
				</div>
			</c:if>
		</div>
		<c:if test="${today < mission.startDate}">
			<div>
				<input value="수정" type="submit">
			</div>
		</c:if>
	</form>
	<c:if test="${today < mission.startDate}">
		<div>
			<div>
				<form method="post" action="/mission">
				<input type="hidden" name="_method" value="DELETE" />
				<input type="hidden" name="no" id="no" value="${mission.no}" />
				<input type="submit" value="삭제"/>
				</form>
			</div>
		</div>
	</c:if>
	<c:if test="${today > mission.endDate}">
		<input type="hidden" name="no" id="no" value="${mission.no}" />
		<input type="button" value="환급" id="refunds" onclick="ajax_call()"/>
    </c:if>
      <script>
		function ajax_call() {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === xhr.DONE) {
					if (xhr.status === 200 || xhr.status === 201) {
						var msg = xhr.responseText;
						if(msg != "0") {
							alert("환급금액 : " + msg);
						} else {
							alert("실패");
						}
					}
				}
			}
			var mission = {
				no : document.getElementById("no").value
				
			};
			xhr.open("POST", "http://localhost:8080/refunds", true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify(mission));
		};
	</script>
</body>
</html>