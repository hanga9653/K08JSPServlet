<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">

<style type="text/css">
#headerBar{
height : 100px;


}
@media screen and (max-width: 768px) {
        .navbar {
                flex-direction: column;
                align-items: flex-start;
                padding: 8px 24px;
        }

</style>


</head>
<body>



	<div class="container">
		<nav id = "headerBar" class="navbar navbar-expand-lg bg-dark navbar-dark">
			<a class="navbar-brand" href="#"> <img
				src="https://www.tjoeun.co.kr/images/logo.gif?v=20190918" alt="Logo"
				style="width: px;" class="rounded-pill">
			</a>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">자료실</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(0)">방명록</a></li>
					<li class="nav-item">
						<button type="button" class="btn nav-link dropdown-toggle"
							data-bs-toggle="dropdown">드롭다운</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Tablet</a> <a
								class="dropdown-item" href="#">Smartphone</a>
							<hr class="dropdown-divider">
							<a class="dropdown-item" href="#">카메라</a> <a
								class="dropdown-item" href="#">워크맨</a>
						</div>
					</li>
					<li>
						<form class="d-flex ">
							<input class="form-control me-2" type="text" placeholder="Search">
							<button class="btn btn-warning" type="button">
								<i class="bi bi-search"></i>
							</button>
						</form>
					</li>
				</ul>

				<ul class="navbar-nav">
					<li class="nav-item"><a href="#regist" class="nav-link"><i
							class="bi bi-person-plus-fill"></i>회원가입</a></li>
					<li class="nav-item"><a href="#modifi" class="nav-link"><i
							class="bi bi-person-lines-fill"></i>회원정보수정</a></li>
					<li class="nav-item"><a href="#login" class="nav-link"><i
							class="bi bi-box-arrow-in-right"></i></i>로그인</a></li>
					<li class="nav-item"><a href="#logout" class="nav-link"><i
							class="bi bi-box-arrow-right"></i>로그아웃</a></li>
				</ul>
			</div>
		</nav>
	</div>



</body>
</html>