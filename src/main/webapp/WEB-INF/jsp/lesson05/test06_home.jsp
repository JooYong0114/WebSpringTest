<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족: 우리동네 가게</title>
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
		<section class="d-flex flex-column">
			<div class="display-4 mb-3">우리동네 가게</div>
			<c:forEach var="store" items="${storeList }">
			<article class="d-flex flex-column border border-info rounded mb-3">
				<div class="p-3" style="cursor: pointer;" onclick="location.href='/lesson05/test06/reviews?storeId=${store.id }&storeName=${store.name}'">
				<h3><b>${store.name }</b></h3>
				<h5>${store.phoneNumber }</h5>
				<h5>${store.address }</h5>
				</div>
			</article>
			</c:forEach>
		</section>
		<hr>
		<footer>
			<h4><b>(주)우와한형제</b></h4>
			<h5 class="text-secondary">고객센터 : 1500 - 1500</h5>
		</footer>
	</div>
</body>
</html>