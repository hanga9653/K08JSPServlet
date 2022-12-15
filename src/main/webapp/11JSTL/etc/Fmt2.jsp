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
<title>JSTL-fmt2</title>
</head>
<body>
	<!-- Date클래스를 통해 날짜를 설정한다. -->
	<c:set var="today" value="<%=new java.util.Date() %>"></c:set>
	
	<!-- 
	날짜만 출력할때 사용한다.
	type="date"
	dateStyle속성에 따라 아래와 같이 표현된다.
		full:0000년 0월 0일 0요일
		short:00.0.0
		long:0000년 0월 0일
		default:0000.0.0
	 -->
	<h4>날짜 포맷</h4>
	full : <fmt:formatDate value="${today }" type="date" dateStyle="full"></fmt:formatDate>
	<br />
	short : <fmt:formatDate value="${today }" type="date" dateStyle="short"></fmt:formatDate>
	<br />
	long : <fmt:formatDate value="${today }" type="date" dateStyle="long"></fmt:formatDate>
	<br />
	default : <fmt:formatDate value="${today }" type="date" dateStyle="default"></fmt:formatDate>
		
	<!-- 
	시간만 출력할때 사용한다.
	type="time"
	timeStyle의 값에 따라
		full:오후 00시 00분 00초 대한민국 표준시
		short:오후 00:00
		long:오후 00시 00분 00초 KST
		default:오후 00:00:00
	 -->
	<h4>시간 포맷</h4>
	full : <fmt:formatDate value="${today }" type="time" timeStyle="full"></fmt:formatDate>
	<br />
	short : <fmt:formatDate value="${today }" type="time" timeStyle="short"></fmt:formatDate>
	<br />
	long : <fmt:formatDate value="${today }" type="time" timeStyle="long"></fmt:formatDate>
	<br />
	default : <fmt:formatDate value="${today }" type="time" timeStyle="default"></fmt:formatDate>
		
	<!-- 
	날짜와 시간을 둘다 표시하므로 포맷도 각각 지정할 수 있다.
	앞에서 사용한 속성값들을 조합해서 테스트 해보자.
	 -->
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${today }" type="both" dateStyle="full"
		timeStyle="full"></fmt:formatDate>
	<br />
	<fmt:formatDate value="${today }" type="both"
		pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
		
	<h4>타입존 설정</h4>
	<!-- GMT:세계 표준시로 영국의 그리니치 천문대를 기준으로 한다. -->
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
			timeStyle="full"></fmt:formatDate>
		<br />
	</fmt:timeZone>
	<!-- 타입존을 미중부로 설정 -->
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
			timeStyle="full"></fmt:formatDate>
		<br />
	</fmt:timeZone>
	
	<!-- 표준시에 9를 더하면 KST(대한민국표준시)가 된다. -->
	<fmt:timeZone value="GMT+9">
		<fmt:formatDate value="${today }" type="both" dateStyle="full"
			timeStyle="full"></fmt:formatDate>
	</fmt:timeZone>
	
	<h4>timezone에 사용할 수 있는 문자열 구하기</h4>
	<c:forEach var="ids" items="<%=java.util.TimeZone.getAvailableIDs() %>">
		${ids } <br />
	</c:forEach>
</body>
</html>