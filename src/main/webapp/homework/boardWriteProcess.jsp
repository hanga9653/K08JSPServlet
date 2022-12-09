<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
//작성한 폼값을 받는다.(제목/내용)
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 DTO객체 저장한다.
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
//로그인후 작성페이지에 입장가능하기 때문에 세션에 저장된 회원아이디를 
//가져와서 DTO에 저장한다.
dto.setId(session.getAttribute("UserId").toString());

//DB연결 하기위해 DAO객체 생성
BoardDAO dao = new BoardDAO(application);
//입력값이 저장된 DTO객체를 전달해 쿼리문을 실행
int iResult = dao.insertWrite(dto);
dao.close();

if(iResult == 1){
	//입력되면 리스트로 이동하여 등록된 게시물 확인
	response.sendRedirect("boardList.jsp");
}
else{
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>