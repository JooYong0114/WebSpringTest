<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가</h1>
		<div class="mb-3">
			<label>제목</label>
			<input type="text" id="inputName" class="form-control" name="name">
		</div>
		<div class="mb-3">
			<label>주소</label>
			<input type="text" id="inputUrl" class="form-control" name="url">
		</div>
		<button type="submit" id="addBtn" class="btn btn-success w-100">추가</button>
	</div>
	<script>
		$(document).ready(function() {
			$("#addBtn").on("click", function() {
				var name = $("#inputName").val().trim();
				var url = $("#inputUrl").val().trim();
				
				if(name == null || name == '') {
					alert("제목을 입력하세요.");
					return false;
				}
				if(url == null || url == '') {
					alert("주소를 입력하세요.");
					return false;
				}
				if(!url.startsWith("http://") 
						&& !url.startsWith("https://")) {
					alert("주소 형식이 올바르지 않습니다.");
					return false;
				}
				
				$.ajax({
					type:"POST",
					url:"/lesson06/test01/add",
					data:{"name":name, "url":url},
					success:function(data) {
						alert(data.result);
						location.href="/lesson06/test01/home";
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