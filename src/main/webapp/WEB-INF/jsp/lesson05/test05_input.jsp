<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<div class="d-flex">
		<jsp:include page="test05_header.jsp" />
		<form method="post" action="/lesson05/test05/add">
		<section class="w-100 ml-5">
			<h2 class="mt-3">날씨 입력</h2>
			<div class="d-flex mt-5 w-75 justify-content-between">
			<label>날짜</label>
			<input type="text" class="form-control w-25" name="date" id="datepicker">
			<label>날씨</label>
			<select class="form-control" style="width:100px" name="weather">
			<!-- Set에 들어있는 값 하나씩 꺼내기 -->
			<c:forEach var="weather" items="${weather }">
				<option value="${weather }">${weather}</option>
			</c:forEach>
			</select>
			<label>미세먼지</label>
			<select class="form-control" style="width:100px" name="microDust">
			<c:forEach var="microDust" items="${microDust }">
				<option value="${microDust }">${microDust}</option>
			</c:forEach>
			</select>
			</div>
			<div class="d-flex mt-5 w-75 justify-content-between">
			<label>기온</label>
			<div class="input-group w-25">
			<input type="text" class="form-control " name="temperatures">
			<div class="input-group-append">
				<span class="input-group-text">°C</span>
			</div>
			</div>
			<label>강수량</label>
			<div class="input-group w-25">
			<input type="text" class="form-control w-25" name="precipitation">
			<div class="input-group-append">
				<span class="input-group-text">mm</span>
			</div>
			</div>
			<label>풍속</label>
			<div class="input-group w-25">
			<input type="text" class="form-control w-25" name="windSpeed">
			<div class="input-group-append">
				<span class="input-group-text">km/h</span>
			</div>
			</div>
			</div>
			<div class="w-75 d-flex justify-content-end">
			<button type="submit" class="btn btn-success mt-4">저장</button>
			</div>
		</section>
		</form>
		</div>
		<jsp:include page="test05_footer.jsp" />
	</div>
	<script>
	$(function() {
	    $("#datepicker").datepicker();
	  });
	</script>
</body>
</html>