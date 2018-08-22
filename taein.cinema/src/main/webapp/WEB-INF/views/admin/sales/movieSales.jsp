<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>태인이네영화관(관리자)-영화별매출통계</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	@import "../../../res/css/Menu.css";
	@import "../../../res/css/sales/Sales.css";
</style>
<div class="container">
	<br>
	<div id="logo">
		<a href="../adminMain/01.html">
		<img src="../res/img/logo.jpg" width="200" height="50" alt="logo" />
		</a>
	</div>
	<br>
	<div id="info">
	  	<p>${userId}님, 로그인을 환영합니다.
		<button type="button" class="btn btn-danger" onclick="location.href='../adminLogin/01.html'">로그아웃</button>
		<button type="button" class="btn btn-success" onclick="location.href='사용자페이지.html'">사용자페이지</button></p>
	</div>
	<div class="btn-group btn-group-justified">
		<div class="btn-group">
			<button type="button" class="btn btn-primary" onclick="location.href='../adminNotice/01.html'">공지사항</button>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			회원관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="../adminUser/01.html">회원관리</a></li>
				<li><a href="../adminUser/02.html">직원관리</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			영화관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="../adminMovie/01.html">영화등록</a></li>
				<li><a href="../adminMovie/02.html">영화수정/삭제</a></li>
				<li><a href="../adminMovie/03.html">리뷰관리</a></li>
				<li><a href="../adminMovie/05.html">신고관리</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			극장관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="../adminCinema/01.html">극장등록</a></li>
				<li><a href="../adminCinema/02.html">극장수정/삭제</a></li>
				<li><a href="../adminCinema/03.html">영화등록</a></li>
				<li><a href="../adminCinema/05.html">영화수정/삭제</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary" onclick="location.href='../adminReservation/01.html'">예매관리</button>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			매출관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="01.html">기간별</a></li>
				<li><a href="02.html">영화별</a></li>
				<li><a href="03.html">극장별</a></li>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
			통계관리 <span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="../adminStatistic/01.html">성별</a></li>
				<li><a href="../adminStatistic/02.html">지역별</a></li>
				<li><a href="../adminStatistic/03.html">연령별</a></li>
				<li><a href="../adminStatistic/04.html">시간별</a></li>
				<li><a href="../adminStatistic/05.html">영화별</a></li>
				<li><a href="../adminStatistic/06.html">회원비율</a></li>
				<li><a href="../adminStatistic/07.html">평점</a></li>
			</ul>
		</div>
	</div>
</div>
</head>
<body>

<div class="container">
<br>
	<h2>▶영화별 매출통계</h2>
<form id ="formSearch" class="form-inline">
		<div class="form-group">
			<label for="movieName">영화명 &nbsp;</label>
			<select class="form-control" id="movieName">
				<option>전체</option>
				<option>앤트맨</option>
				<option>슈퍼맨</option>
				<option>배트맨</option>
				<option>아이언맨</option>
				<option>토르</option>
				<option>헐크</option>
			</select>
		</div>
		<div class="form-group has-success has-feedback">
			<label for="timeStart">&nbsp;&nbsp; 기간 &nbsp;</label>
			<input class="form-control" id="timeStart" type="date">
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group">
			<p> ~ <p>
		</div>
		<div class="form-group has-success has-feedback">
			<label for="timeEnd"></label>
			<input type="date" class="form-control" id="timeEnd">
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group">
			<button type="button" id="search" class="btn btn-success">검색</button>
		</div>
</form>
<tbody>
<script>
google.charts.load('current', {packages:['corechart']});
</script>
<div id="stickChart"></div><!-- 여기에 차트가 생성됩니다. -->
<script>
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

	var rowlen = $('#stickTable tr').length;
	var collen = $('#stickTable tr').eq(0).find('th').length;
	
	var one = $('#stickTable tr').eq(0).find('th').eq(0).text();
	var two = $('#stickTable tr').eq(1).find('th').eq(0).text();

	var tmp = [];
	var tot = [];
	
	for(var i=0; i<collen; i++){
		tmp.push($('#stickTable tr').eq(0).find('th').eq(i).text());
		if(i == 0)
			tmp.push($('#stickTable tr').eq(1).find('th').eq(i).text());
		else
			tmp.push(Number($('#stickTable tr').eq(1).find('th').eq(i).text()));
	
		tot.push(tmp);
		tmp = [];
	}	
	
// 차트 데이터 설정
var data = google.visualization.arrayToDataTable(tot);

	// 그래프 옵션
	var options = {
		title : '극장별 매출', // 제목
		width : 1240, // 가로 px
		height : 400, // 세로 px
		bar : {
			groupWidth : '30%' // 그래프 너비 설정 %
		},
		legend : {
			position : 'none' // 항목 표시 여부 (현재 설정은 안함)
		}
	};

	var chart = new google.visualization.ColumnChart(document.getElementById('stickChart'));
	chart.draw(data, options);
}

</script>
<div class="col-xs-12">
<p>(단위: 만원) (기간: ~ 2018-07-29)</p>
</div>
<table id="stickTable" class="table table-hover">
	<tr>
		<th class="info">영화</th>
		<c:forEach var="sales" items="${totSales}">
			<th class="info">${sales.movieName}</th>
		</c:forEach>
	</tr>
	<tr>
		<th class="danger">매출</th>
		<c:forEach var="sales" items="${totSales}">
			<th>${sales.sales}</th>
		</c:forEach>
	</tr>
</table>
	<div id="excelSave">
		<button type="button" id="saveExcel" class="btn btn-warnning">엑셀저장</button>
	</div>
</tbody>
</div>
</body>