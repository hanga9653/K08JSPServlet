<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

/* session영역에 저장된 회원정보를 얻어온 후 String으로 변환한다.
영역에는 모든 값(객체)를 저장할 수 있도록 Object타입을 사용하므로
사용시 기존의 값으로 형변환해야한다.*/
String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;

if(sessionId.equals(dto.getId())){
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	if(delResult == 1){
		JSFunction.alertLocation("삭제되었습니다.", "boardList.jsp", out);
	}
	else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
}
else{
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}
%>