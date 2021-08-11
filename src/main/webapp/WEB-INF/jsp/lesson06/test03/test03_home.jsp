<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션: 메인</title>
<link rel="stylesheet" href="/css/test03_home.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="test03_header.jsp" />
		<section class="d-flex flex-column">
			<img width=100% alt="banner1" src="/images/test06_banner1.jpg">
		</section>
		<section class="d-flex">
			<article class="left-article d-flex justify-content-center align-items-center">
                    <div class="display-4 text-white">
                        실시간 <br>
                        예약 하기 
                    </div>
                </article>
                <article class="center-article">
                    <div class="m-4">
                        <div class="d-flex align-items-end text-white">
                            <h3 class="mr-4">예약 확인</h3>
                        </div>
                        <div class="member-input mt-3 text-white" id="member">
                            <div class="input-gorup form-inline">
                                <label class="input-label">이름</label>
                                <input type="text" class="form-control text-input" name="name" id="nameInput">
                            </div>
                            <div class="input-gorup form-inline mt-3">
                                <label class="input-label">전화번호</label>
                                <input type="text" class="form-control text-input" name="phoneNumber" id="phoneNumberInput">
                            </div>

                        </div>
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-success mt-3 mr-5" id="lookupBtn">조회 하기</button>
                        </div>
                    </div>
                </article>
                <article class="right-article d-flex justify-content-center align-items-center">
                    <div class="text-white">
                        <h3>예약문의 : </h3>
                        <h1>010-</h1>
                        <h1>000-1111</h1>
                    </div>
                </article>
            </section>
		<jsp:include page="test03_footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#lookupBtn").on("click", function() {
				var name = $("#nameInput").val().trim();
				var phoneNumber = $("#phoneNumberInput").val().trim();
				
				if(name == null || name == '') {
					alert("이름을 입력하세요.");
					return;
				}
				if(phoneNumber == null || phoneNumber == '') {
					alert("전화번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"POST",
					url:"/lesson06/test03/lookUp",
					data:{"name":name, "phoneNumber":phoneNumber},
					success:function(data) {
						alert("이름 : " + data.name + "\n"
							+ "날짜 : " + data.date + "\n"
							+ "일수 : " + data.day + "\n"
							+ "인원 : " + data.headcount + "\n"
							+ "상태 : " + data.state + "\n");
					},
					error:function(e) {
						alert("조회 결과가 없습니다.");
					}
				});
			});
		})
	</script>
</body>
</html>