<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>회원가입</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/customizing.css">
<style type="text/css">
		.panel-body{
			height: 630px;
		}
		@media (max-width: 767px) {  /* 작은 해상도에서 드랍다운 아이템에 마우스를 올렸을 때 */
			.panel-body{
			height: 550px;
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
		<form method="post" action="join">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;회원가입 화면</h3>
				</div>
				<div class="panel-body text-center">
					<br>
					<span style="font-size: 20px; color: #000000;">아이디&nbsp;</span> <input type="text" class="form-control center-block" placeholder="ID를 입력해주세요" style="width: 60%;" id="ID" name="ID">
					<div id="idcheck"><span style="color: green;">아이디를 4자리 이상 입력해주세요</span></div>
					<div id="idcheckYES"><span style="color: blue;">사용 가능한 아이디입니다</span></div>
					<div id="idcheckNO"><span style="color: red;">중복 된 아이디입니다. 다른 아이디를 입력해주세요</span></div>
					<br>
					<span style="font-size: 20px; color: #000000;">비밀번호&nbsp;</span> <input type="password" class="form-control center-block" placeholder="비밀번호를 입력해주세요" style="width: 60%;" id="pwd1" name="PW">
					<div id="pw1check"><span style="color: green;">비밀번호 4자리 이상 입력해주세요</span></div>
					<div id="pw1checkYES"><span style="color: blue;">사용 가능한 비밀번호입니다</span></div>
					<br>
					<span style="font-size: 20px; color: #000000;">비밀번호 확인&nbsp;</span> <input type="password" class="form-control center-block" placeholder="비밀번호를 한번 더 입력해주세요" style="width: 60%;" id="pwd2" name="PW2">
					<div id="pw2check"><span style="color: green;">위와 동일한 비밀번호를 입력해주세요</span></div>
					<div id="pw2checkYES"><span style="color: blue;">위와 비밀번호가 일치합니다</span></div>
					<br>
					<span style="font-size: 20px; color: #000000;">이름&nbsp;</span> <input type="text" class="form-control center-block" placeholder="이름을 입력해주세요" style="width: 60%;" id="" name="NAME">
					<div id="namecheck"><span style="color: green;">id/pw찾기에 이름이 활용됩니다</span></div>
					<br>
					<span style="font-size: 20px; color: #000000;">이메일&nbsp;</span> <input type="text" class="form-control center-block" placeholder="이메일을 입력해주세요" style="width: 60%;" id="EMAIL" name="EMAIL">
					<div id="emailcheck"><span style="color: green;">id/pw찾기는 메일 발송으로 처리됩니다</span></div>
					<div id="emailcheckNO"><span style="color: red;">중복 된 이메일입니다. 다른 이메일을 입력해주세요</span></div>
					<br>
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<span style="color:#aaa;"><button type="submit" class="btn btn-success" id="userSubmit"><span class="glyphicon glyphicon-ok">&nbsp;회원가입</span></button></span>
					</div>
				</div>
			</div>
		</form>
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