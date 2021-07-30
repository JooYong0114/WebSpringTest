<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL CORE 라이브러리 1</title>
</head>
<body>
	<h1>1. JSTL CORE 변수</h1>
	<c:set var="number1" value="41" />
	<c:set var="number2">17</c:set>
	
	<div>첫번째 숫자 : ${number1 }</div>
	<div>두번째 숫자 : ${number2 }</div>
	
	<h1>2. JSTL CORE 연산</h1>
	<div>더하기 : ${number1 + number2 }</div>
	<div>빼기 : ${number1 - number2 }</div>
	<div><c:out value="곱하기 : ${number1 * number2 }" /></div>
	<div><c:out value="나누기 : ${number1 / number2 }" /></div>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>" />
	
	<h1>4. JSTL core if</h1>
	<c:set var="avg" value="${(number1 + number2) / 2}" />
	<c:if test="${avg >= 10}">
		<h1>${avg }</h1>
	</c:if>
	
	<c:if test="${avg < 10}">
		<h3>${avg }</h3>
	</c:if>
	
	<c:if test="${number1 * number2 > 100 }">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false" />
	</c:if>
	
	
</body>
</html>