<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
/* 수정할 게시물의 일련번호를 파라미터로 받아온다. */
String num = request.getParameter("num");
//DAO 객체 생성
BoardDAO dao = new BoardDAO(application);
//기존 게시물의 내용을 읽어온다.
BoardDTO dto = dao.selectView(num);
//세션영역에 저장된 회원 아이디를 가져와서 문자열로 변환한다.
String sessionId = session.getAttribute("UserId").toString();
//로그인한 회원이 작성자인지 판단한다.
if(!sessionId.equals(dto.getId())){
	//작성자가 아니라면 진입할 수 없도록 뒤로 이동한다.
	JSFunction.alertBack("작성자 보인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
	function validateForm(form){
		if(form.title.value==""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(form.content.value==""){
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<%@ include file="./inc/top.jsp" %>
		</div>
		<div class="row">
			<%@ include file="./inc/left.jsp" %>
			<div class="col-9 pt-3">
				<h3>
					수정하기
				</h3>

				<form name="writeFrm" action="boardEditProcess.jsp" method="post" onsubmit="return validateForm(this);">
					<input type="hidden" name="num" value="<%= dto.getNum() %>" />
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center" style="vertical-align: middle;">제목</th>
								<td><input type="text" name="title" class="form-control"value="<%= dto.getTitle()%>"/></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">내용</th>
								<td><textarea rows="5" name="content" class="form-control"><%=dto.getContent() %></textarea></td>
							</tr>
						</tbody>
					</table>

					<div class="row">
						<div class="col d-flex justify-content-end" >
							<!-- 각종 버튼 부분 -->
							<button type="submit" class="btn btn-danger">작성 완료</button>
							<button type="button" class="btn btn-warning"onclick="location.href='boardList.jsp';">목록보기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<br />
		<br />
		<br />
		
		<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<div class="row mb-5 mt-3">
			<%@ include file="./inc/copyright.jsp" %>
		</div>
	</div>
</body>
</html>