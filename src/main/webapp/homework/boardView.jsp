<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* 목록에서 제목을 클릭하면 게시물의 일련번호를 ?num=99 와 같이
받아온다. 따라서 내용보기를 위해 해당 파라미터를 받아온다. */
String num = request.getParameter("num");
//DAO 객체 생성을 통해 오라클에 연결한다.
BoardDAO dao = new BoardDAO(application);
//게시물의 조회수 증가
dao.updateVisitCount(num);
//게시물의 내용을 인출하여 DTO로 반환받는다.
BoardDTO dto = dao.selectView(num);
//자원해제
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script> 
function deletePost() {
	//comfirm() 함수는 대화창에서 "예"를 누를때 true가 반환된다.
	var confirmed = confirm("정말로 삭제할거얌?");
	if(confirmed){
		var form = document.writeFrm;
		//전송방식과 폼값을 전송할 URL을 설정한다.
		form.method = "post";
		form.action = "boardDeleteProcess.jsp";
		form.submit();
	}
}
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
<form name="writeFrm">
<input type="hidden" name="num" value="<%= dto.getNum()  %>" />
	<div class="container">
		<div class="row">
			<%@ include file="./inc/top.jsp" %>
		</div>
		<div class="row">
			<%@ include file="./inc/left.jsp" %>
			<div class="col-9 pt-3">
				<h3>
					게시판 내용보기 - <small>자유게시판</small>
				</h3>

				<form>
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="30%" />
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center" style="vertical-align: middle;">작성자</th>
								<td><%= dto.getName() %></td>
								<th class="text-center" style="vertical-align: middle;">작성일</th>
								<td><%= dto.getPostdate() %></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">이메일</th>
								<td><%= dto.getEmail() %></td>
								<th class="text-center" style="vertical-align: middle;">조회수</th>
								<td><%= dto.getVisitcount() %></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">제목</th>
								<td colspan="3"><%= dto.getTitle() %>.</td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">내용</th>
								<td colspan="3"><%= dto.getContent().replace("\r\n", "<br/>") %>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="row">
						<div class="col text-right mb-4">
							<!-- 각종 버튼 부분 -->
							<!-- 해당 게시물을 작성한 아이디와 일치하면 수정, 삭제 버튼을 
							보이게 처리한다. -->
							<%
							if(session.getAttribute("UserId")!=null &&
			            	dto.getId().equals(session.getAttribute("UserId").toString())){
							%>
								<button type="button" onclick="location.href='boardEdit.jsp?num=<%= dto.getNum() %>';" class="btn btn-secondary">수정하기</button>
								<button type="button" onclick="deletePost();" class="btn btn-success">삭제하기</button>
							<%
							}
							%>
							<button type="button" class="btn btn-info">답글쓰기</button>
							<button type="button" class="btn btn-warning" 
								onclick="location.href='boardList.jsp';">목록보기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div
			class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<div class="row mb-5 mt-3">
			<%@ include file="./inc/copyright.jsp" %>
		</div>
	</div>
</form>
</body>
</html>