<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>키트리 과제</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/customizing.css">
	<style type="text/css">
		.jumbotron{
			background-image: url('images/img1.jpg');
			background-size: cover;
			text-shadow: black 0.2em 0.2em 0.2em; 
			color: white;
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
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">KITRI 개인과제</h1>
			<p class="text-center">방명록(기본 CRUD)</p>
			<p class="text-center"><a class="btn btn-primary btn-lg" href="https://github.com/kcm5756/kitri_hw1" role="button">Github</a></p>
		</div>
		<form method="post" action="write">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;방명록 작성하기</h3>
				</div>
				<div class="panel-body">
					<c:if test="${USER_ID != NULL}">
						<textarea class="form-control col-sm-5" rows="2" style="resize: none;" id="userContent" name="CONTENT" placeholder="최소 두글자 이상은 입력해주세요 ^^"></textarea>
					</c:if>
					<c:if test="${USER_ID == NULL}">
						<textarea class="form-control col-sm-5" rows="2" style="resize: none;" id="userContent" name="CONTENT" placeholder="로그인 후 작성 가능합니다" disabled="disabled"></textarea>
					</c:if>
					<div class="row">
						<span class="pull-left" style="text-align:justify; color:#aaa;">&nbsp;&nbsp;&nbsp;( <span id="counter">0</span> / 최대 200자)</span>
						<span class="pull-right" style="text-align:justify; color:#aaa;"><button type="submit" class="btn btn-success" id="userSubmit"><span class="glyphicon glyphicon-ok">등록</span></button>&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>
			</div>
		</form>
		<div class="table-responsive">
			<table class="table table-striped table-hover" style="margin: auto;">
				<thead>
					<tr>
						<th width="10%" style="text-align: center;">번호</th>
						<th width="15%" style="text-align: center;">작성자</th>
						<th width="50%" style="text-align: center;">내용</th>
						<th width="25%" style="text-align: center;">날짜</th>
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
							</tr>
						</c:if>
						<c:if test="${boardList.USE_YN == 'Y'}">
							<tr>
								<td style="text-align: center;">${boardList.NUM}</td>
								<td style="text-align: center;">${boardList.USER_ID}</td>
								<td>${boardList.CONTENT}</td>
								<td style="text-align: center;">${boardList.IN_DATE}</td>
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