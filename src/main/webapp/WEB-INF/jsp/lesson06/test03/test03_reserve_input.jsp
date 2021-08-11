<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션: 예약하기</title>
<link rel="stylesheet" href="/css/test03_home.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="test03_header.jsp" />
		<section>
			<h2 class="text-center m-4"><b>예약 하기</b></h2>
			<div class="d-flex flex-column align-items-center">
			<div class="mb-3 w-50">
				<label>이름</label>
				<input type="text" id="nameInput" class="form-control" name="name">
			</div>
			<div class="mb-3 w-50">
				<label>예약날짜</label>
				<input type="text" id="dateInput" class="form-control" name="date">
			</div>
			<div class="mb-3 w-50">
				<label>숙박일수</label>
				<input type="text" id="dayInput" class="form-control" name="day">
			</div>
			<div class="mb-3 w-50">
				<label>숙박인원</label>
				<input type="text" id="headcountInput" class="form-control" name="headcount">
			</div>
			<div class="mb-3 w-50">
				<label>전화번호</label>
				<input type="text" id="phoneNumberInput" class="form-control" name="phoneNumber">
			</div>
			<button type="submit" id="reserveBtn" class="btn btn-warning w-50">예약하기</button>
			</div>
		</section>
		<jsp:include page="test03_footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#dateInput").datepicker();
			$("#reserveBtn").on("click", function() {
				var name = $("#nameInput").val().trim();
				var date = $("#dateInput").val();
				var day = $("#dayInput").val();
				var headcount = $("#headcountInput").val();
				var phoneNumber = $("#phoneNumberInput").val().trim();
				
				if(name == null || name == '') {
					alert("이름을 입력하세요.");
					return;
				}
				if(date == null || date == '') {
					alert("예약날짜를 입력하세요.");
					return;
				}
				if(day == null || day == '') {
					alert("숙박일수를 입력하세요.");
					return;
				}
				// 숫자인지 검사
				if(isNaN(day)) {
					alert("숫자만 입력 가능합니다.");
					return;
				}
				if(headcount == null || headcount == '') {
					alert("숙박인원을 입력하세요.");
					return;
				}
				// 숫자인지 검사
				if(isNaN(headcount)) {
					alert("숫자만 입력 가능합니다.");
					return;
				}
				if(phoneNumber == null || phoneNumber == '') {
					alert("전화번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/lesson06/test03/add",
					data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber},
					success:function(data) {
						alert(data.result);
					},
					error:function(e) {
						alert("error" + e);
					}
				});
			});
		});
	</script>
</body>
</html>