<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<h1 class="text-center display-4">매물 추가</h1>
		<form method="get" action="/insertResult">
			<div class="d-flex flex-column align-items-center mt-5">
				<div class="input-group w-50 mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">중개업자 ID</span>
					</div>
					<input type="text" class="form-control" id="realtorId" name="realtorId">
				</div>
				<div class="input-group w-50 mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">주소</span>
					</div>
				<input type="text" class="form-control" id="address" name="address">
				</div>
				<div class="input-group w-50 mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">매물 면적</span>
					</div>
				<input type="text" class="form-control" id="area" name="area">
				</div>
				<div class="input-group w-50 mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">매입 종류</span>
					</div>
				<select class="form-control" id="type" name="type">
					<option value="default">----- 선택 -----</option>
					<option value="전세">전세</option>
					<option value="월세">월세</option>
					<option value="매매">매매</option>
				</select>
				</div>
				<div class="input-group w-50 mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">매물 가격</span>
					</div>
				<input type="text" class="form-control" id="price" name="price">
				</div>
				<div class="input-group w-50 mb-3" id="rentPriceInput">
					<div class="input-group-prepend">
						<span class="input-group-text">월세 가격</span>
					</div>
				<input type="text" class="form-control w-50" id="rentPrice" name="rentPrice">
				</div>
				<input type="submit" class="btn btn-success" id="submitBtn" value="추가">
			</div>
			</form>
	</div>
	
	<script>
		$(document).ready(function() {
			$('#rentPriceInput').hide();
			$('#type').on('change', function() {
				if($('#type').val() == "월세") {
					$('#rentPriceInput').show();
				}
				else {
					$('#rentPriceInput').hide();
				}
			});
			$('#submitBtn').on('submit', function() {
				if($('#realtorId').val() == null ||
						$('#realtorId').val() == "") {
					alert("중개업자 ID를 입력하세요.");
					return false;
				}
				if($('#address').val() == null ||
						$('#address').val() == '') {
					alert("주소를 입력하세요.");
					return false;
				}
				if($('#area').val() == null ||
						$('#area').val() == '') {
					alert("매물 면적을 입력하세요.");
					return false;
				}
				if($('#type').val() == "default") {
					alert("매입 종류를 선택하세요.");
					return false;
				}
				if($('#price').val() == null ||
						$('#price').val() == '') {
					alert("매물 가격을 입력하세요.");
					return false;
				}
				if($('#type').val() == "월세") {
					if($('#rentPrice').val() == null ||
							$('#rentPrice').val() == '') {
						alert("월세 가격을 입력하세요.");
						return false;
					}					
				}
				return true;
			});
		});
	</script>
</body>
</html>