<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원 목록</title>
</head>
<body>
	<table border='3'>
		<tr>
			<td><input type="text" name="name" /> </td>
			<td><input id="button_search" type="button" value="검색" /></td>
		</tr>
	</table>
	<hr size="5px;">
    <h3>회원 목록</h3>
	<div id="table"></div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		drawTable();
		
		$("#button_search").click(function() {
			drawTable();
		});
	});
	
	function drawTable() {
		$.ajax({
	        url: "${pageContext.request.contextPath}/member",
	        type: "get",
	        data: { name : $("input[name=name]").val() },
	        headers: { "Content-Type" : "application/json;charset=UTF-8" },
	        success: function(rows) {
	        	var script = "";

	        	script += "<table border='1' style='width: 100%;'>";
	        	script += "    <tr>";
	        	script += "        <td>이름</td>";
	        	script += "        <td>이메일</td>";
	        	script += "        <td>닉네임</td>";
	        	script += "        <td>등급</td>";
	        	script += "        <td>상태</td>";
	        	script += "    </tr>";
                for (var i = 0; i < rows.length; i++) {
		        	script += "    <tr>";
		        	script += "        <td><a href='${pageContext.request.contextPath}/member/" + rows[i].no + "'>" + rows[i].name + "</a></td>";
		        	script += "        <td>" + rows[i].email 	+ "</td>";
		        	script += "        <td>" + rows[i].nickname + "</td>";
		        	
		        	if (rows[i].grade == 'C'){
		        		script += "    <td>일반</td>";
		        	} else if (rows[i].grade == 'B'){
		        		script += "    <td>브론드</td>";
		        	} else if (rows[i].grade == 'S'){
		        		script += "    <td>실버</td>";
		        	} else if (rows[i].grade == 'G'){
		        		script += "    <td>골드</td>";
		        	} else if (rows[i].grade == 'P'){
		        		script += "    <td>프로</td>";
		        	}
		        	
		        	if (rows[i].status == 'A'){
		        		script += "    <td>활성</td>";
		        	} else if (rows[i].status == 'S'){
		        		script += "    <td>정지</td>";
		        	} else if (rows[i].status == 'D'){
		        		script += "    <td>탈퇴</td>";
		        	}
		        	
		        	script += "    </tr>";
	        	} 

                script += "</table>";
	            
	           $("#table").html(script);
	        }
	    })
	};
</script>
</body>
</html>