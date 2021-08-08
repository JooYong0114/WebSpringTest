<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족: 리뷰내용 보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<header class="bg-info">
			<h1 class="text-white p-3">배탈의 민족</h1>
		</header>
		<section>
			<div class="display-4 mb-3">${storeName } - 리뷰</div>
			<c:forEach var="review" items="${reviewList }" varStatus="status">
			<c:if test="${storeId eq review.storeId }">
			<article class="d-flex flex-column border border-info rounded mb-3">
				<div class="p-3">
				<div class="d-flex">
					<h4><b>${review.userName }</b></h4>
					<!-- 별 찍기 반복 -->
					<c:forEach var="i" begin="1" end="5" step="1">
					<c:choose>
						<c:when test="${i < review.point + 0.5 }">
						<img class="ml-2" width=25px height=25px src="/images/star_fill.png" alt="fill">
						</c:when>
						<c:when test="${i eq review.point + 0.5 }">						
						<img class="ml-2" width=25px height=25px src="/images/star_half.png" alt="half">
						</c:when>
						<c:otherwise>
						<img class="ml-2" width=25px height=25px src="/images/star_empty.png" alt="empty">
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</div>
				<h6 class="text-secondary"><fmt:formatDate value="${review.updatedAt }" pattern="yyyy년 M월 d일" /></h6>
				<h5>${review.review }</h5>
				<button type="button" class="btn btn-secondary">${review.menu }</button>
				</div>
			</article>
			</c:if>
			</c:forEach>
			<!-- List 안에 파라미터로 받은 storeId가 포함 안되어 있을 때 출력 -->
			<c:if test="${not fn:contains(storeIdList, storeId) }">
				<h1 class="p-5"><b>작성된 리뷰가 없습니다.</b></h1>	
			</c:if>
		</section>
		<hr>
		<footer>
			<h4><b>(주)우와한형제</b></h4>
			<h5 class="text-secondary">고객센터 : 1500 - 1500</h5>
		</footer>
	</div>
</body>
</html>