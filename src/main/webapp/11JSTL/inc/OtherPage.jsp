<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4>OtherPage.jsp</h4>
<ul>
	<!-- request영역에 저장된 변수값 출력 -->
	<li>저장된 값:${requestVar }</li>
	<!-- 파라미터로 전달된값 출력.
	해당 파라미터는 <param>태그를 통해 전달된다. -->
	<li>매개변수1:${param.user_param1 }</li>
	<li>매개변수2:${param.user_param2 }</li>
</ul>