<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션: 예약 목록</title>
<link rel="stylesheet" href="/css/test03_home.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="test03_header.jsp" />
		<section>
			<h2 class="text-center m-4"><b>예약 목록 보기</b></h2>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="booking" items="${bookingList }">
					<tr>
						<td>${booking.name }</td>
						<td><fmt:formatDate value="${booking.date }" pattern="yyyy년 M월 d일" /></td>
						<td>${booking.day }</td>
						<td>${booking.headcount }</td>
						<td>${booking.phoneNumber }</td>
						<c:choose>
							<c:when test="${booking.state eq '대기중'}">
								<td class="text-info">${booking.state }</td>
							</c:when>
							<c:when test="${booking.state eq '확정' }">
								<td class="text-success">${booking.state }</td>
							</c:when>
							<c:when test="${booking.state eq '취소' }">
								<td class="text-danger">${booking.state }</td>
							</c:when>
						</c:choose>
						<td><button type="submit" class="btn btn-danger deleteBtn" data-id="${booking.id }">삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		<jsp:include page="test03_footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$(".deleteBtn").on("click", function() {
				var id = $(this).data("id");
				
				$.ajax({
					type:"GET",
					url:"/lesson06/test03/delete",
					data:{"id":id},
					success:function(data) {
						alert(data.message);
						location.reload();
					},
					error:function(e) {
						alert("error");
					}
				});
			});
		});
	</script>
</body>
</html>