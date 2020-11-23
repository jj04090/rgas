<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div>
			<label>제목</label>
			<div>
				<input type="text" id="title" name="title" value="${mission.title}" >
			</div>
		</div>
		<div>
			<label>카테고리</label>
			<div>
				<select id="categoryNo" name="categoryNo" value="${mission.categoryNo}">
					<option value="1">건강</option>
					<option value="2">생활패턴</option>
					<option value="3">역량</option>
					<option value="4">취미</option>
					<option value="5">기타</option>
				</select>
			</div>
		</div>
		<div>
			<label>참가비</label>
			<div>
				<input type="text" id="entryFee" name="entryFee"
					placeholder="숫자만 입력해주세요" value="${mission.entryFee}">
			</div>
		</div>
		<div>
			<label>내용</label>
			<div>
				<textarea id="note" name="note"
					style="resize: none; height: 200px">${mission.note}</textarea>
			</div>
		</div>
		 <div>
			<label>시작 일자</label>
			<div>
				<input type="date" name="startDate" id="startDate" value="${mission.startDate}">
			</div>
		</div>
		<div>
			<label>종료 일자</label>
			<div>
				<input type="date" name="endDate" id="endDate" value="${mission.endDate}">
			</div>
		</div>
		<div>
			<label>인증 시작 시간</label>
			<div>
				<input type="time" name="certifiedStartTime" 
				id="certifiedStartTime" value="${mission.certifiedStartTime}">
			</div>
		</div>
		<div>
			<label>인증 종료 시간</label>
			<div>
				<input type="time" name="certifiedEndTime" 
				id="certifiedEndTime" value="${mission.certifiedEndTime}">
			</div>
		</div> 
		<div>
			<label>예시사진 업로드</label>
			<div>
				<input type="file" name="img" id="img">
			</div>
		</div>
		<div>
			<input value="수정" type="submit">
		</div>
	</form>
	<div>
		<form method="post" action="/mission">
			<input type="hidden" name="_method" value="DELETE" />
			<input type="hidden" name="no" id="no" value="${mission.no}" />
			<input type="submit" value="삭제"/>
		</form>
	</div>
</body>
</html>