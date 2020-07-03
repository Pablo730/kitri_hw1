<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>작성한 방명록</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/customizing.css">
	<style type="text/css">
		.panel-body{
			height: 660px;
		}
		@media (max-width: 767px) {  /* 작은 해상도에서 드랍다운 아이템에 마우스를 올렸을 때 */
			.panel-body{
			height: 660px;
			}
		}
	</style>
</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button	type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only"></span>	
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<c:if test="${USER_ID == NULL}">
					<a class="navbar-brand" href="http://www.kitri.re.kr/academy/it_education/edu_application_view.web?hd_site_div=C&lv_pkid=595&lv_mm=0&lv_yyyy=2020&lv_choice=0">KITRI-자바 웹 개발자 과정</a>
				</c:if>
				<c:if test="${USER_ID != NULL}">
					<a class="navbar-brand" href="main">${USER_NAME}님 접속</a>
				</c:if>
			</div>	
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="main">방명록<span class="sr-only"></span></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${USER_ID == NULL}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sign<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="signInPage">Sign in</a></li>
								<li><a href="signUpPage">Sign up</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${USER_ID != NULL}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MyPage<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="inforPage">나의 정보</a></li>
								<li><a href="userWritePage">내가 쓴 방명록</a></li>
								<li><a href="logout">로그아웃</a></li>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;내가 작성한 방명록</h3>
			</div>
			<div class="panel-body text-center">
				<div class="table-responsive">
					<table class="table table-striped table-hover" style="margin: auto;">
					<thead>
						<tr>
							<th width="10%" style="text-align: center;">번호</th>
							<th width="10%" style="text-align: center;">작성자</th>
							<th width="50%" style="text-align: center;">내용</th>
							<th width="20%" style="text-align: center;">날짜</th>
							<th width="10%" style="text-align: center;">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="boardList">
							<c:if test="${boardList.USE_YN == 'N'}">
								<tr>
									<td style="text-align: center;">${boardList.NUM}</td>
									<td style="text-align: center;"></td>
									<td style="text-align: center;">삭제 된 방명록 입니다</td>
									<td style="text-align: center;"></td>
									<td style="text-align: center;"></td>
								</tr>
							</c:if>
						<c:if test="${boardList.USE_YN == 'Y'}">
							<tr>
								<td style="text-align: center;">${boardList.NUM}</td>
								<td style="text-align: center;">${boardList.USER_ID}</td>
								<td>${boardList.CONTENT}</td>
								<td style="text-align: center;">${boardList.IN_DATE}</td>
								<td style="text-align: center;"><span style="color:#aaa;"><button type="button" class="btn btn-primary" onclick="location.href='delete?NUM=${boardList.NUM}'"><span class="glyphicon glyphicon-ok">&nbsp;삭제</span></button></span></td>
							</tr>
						</c:if>
					</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					<ul class="pagination">

				</ul>
				</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-3" style="text-align: center;"><h5>Copyright &copy; 2020</h5><h5>김창민(Changmin Kim)</h5></div>
				<div class="col-sm-6"><h4>개발자 소개</h4><p>안녕하세요 개발자 김창민입니다. 웹 개발을 위한 Server-Client 개발 환경 구축, 어플리케이션 아키텍쳐, 프론트엔드, 백엔드 등 웹 개발 전반에 걸쳐 관심이 많습니다.</p></div>
				<div class="col-sm-3"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by 김창민</h4><h5 style="text-align: center;">kcm1619@naver.com</h5></div>
			</div>
		</div>
	</footer>
</body>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</html>