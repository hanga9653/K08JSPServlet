<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL의 core태그를 사용하기 위한 선언 -->
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!-- 국제화태그 사용을 위한 선언 -->
<%@taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL-fmt3</title>
</head>
<body>
	<h4>로케일 설정</h4>
	<c:set var="today" value="<%=new java.util.Date() %>"></c:set>
	
	한글로 설정 : <fmt:setLocale value="ko_kr"/>
	<fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
	<fmt:formatDate value="${today }"/> <br />
	
	일어로 설정 : <fmt:setLocale value="ja_JP"/>
	<fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
	<fmt:formatDate value="${today }"/> <br />
	
	영어로 설정 : <fmt:setLocale value="en_US"/>
	<fmt:formatNumber value="10000" type="currency"></fmt:formatNumber>
	<fmt:formatDate value="${today }"/> <br />
</body>
</html>