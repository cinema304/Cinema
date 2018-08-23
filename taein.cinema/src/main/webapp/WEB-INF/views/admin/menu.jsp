<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#info{
	text-align:right;
	float: right;
}
#logo{
	float: left;
}
</style>
<div class="container">
	<br>
	<div id="logo">
		<a href="admin/main/main">
		<img src="<c:url value="/img/logo.jpg"/>" width="200" height="50" alt="logo" />
		</a>
	</div>
	<br>
	<div id="info">
	  	<p>${userId}님, 로그인을 환영합니다.
		<button type="button" class="btn btn-danger" onclick="location.href='/logOut'">로그아웃</button>
		<button type="button" class="btn btn-success" onclick="location.href='사용자페이지'">사용자페이지</button></p>
	</div>
	<div class="btn-group btn-group-justified">
		<div class="btn-group">
			<button type="button" class="btn btn-primary" onclick="location.href='/admin/notice/notice'">공지사항</button>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			회원관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="/admin/user/user">회원관리</a></li>
				<li><a href="/admin/user/employee">직원관리</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			영화관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="/admin/movie/addMovie">영화등록</a></li>
				<li><a href="/admin/movie/upDelMovie">영화수정/삭제</a></li>
				<li><a href="/admin/movie/review">리뷰관리</a></li>
				<li><a href="/admin/movie/reviewReturn">신고관리</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			극장관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="/admin/cinema/addCinema">극장등록</a></li>
				<li><a href="/admin/cinema/upDelCinema">극장수정/삭제</a></li>
				<li><a href="/admin/cinema/cinemaAddMovie">영화등록</a></li>
				<li><a href="/admin/cinema/cinemaUpDelMovie">영화수정/삭제</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary" onclick="location.href='/admin/reservation/reservation'">예매관리</button>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			매출관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="/admin/sales/timeSales">기간별</a></li>
				<li><a href="/admin/sales/movieSales">영화별</a></li>
				<li><a href="/admin/sales/cinemaSales">극장별</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			통계관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="/admin/statistic/sexVol">성별</a></li>
				<li><a href="/admin/statistic/localVol">지역별</a></li>
				<li><a href="/admin/statistic/ageVol">연령별</a></li>
				<li><a href="/admin/statistic/timeVol">시간별</a></li>
				<li><a href="/admin/statistic/movieVol">영화별</a></li>
				<li><a href="/admin/statistic/userVol">회원비율</a></li>
				<li><a href="/admin/statistic/gradeVol">평점</a></li>
			</ul>
		</div>
	</div>
</div>
</head>
<body>
</body>