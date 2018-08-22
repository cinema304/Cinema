<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>태인이네영화관(관리자)-기간별매출통계</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	@import "../res/css/Menu.css";
	@import "../res/css/sales/Sales.css";
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
	<h2>▶기간별 매출통계</h2>
<form id ="formSearch" class="form-inline">
		<div class="form-group has-success has-feedback">
			<label for="timeVolStart">&nbsp;&nbsp;기간 &nbsp;</label>
			<input class="form-control" id="timeVolStart" type="date">
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group">
			<p> ~ <p>
		</div>
		<div class="form-group has-success has-feedback">
			<label for="timeVolEnd"></label>
			<input type="date" class="form-control" id="timeVolEnd">
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

	// 차트 데이터 설정
	var data = google.visualization.arrayToDataTable([
		['구분', '목표', '매출', '전년도매출'], // 항목 정의
		['1월', 100, 80, 80], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
		['2월', 120, 90, 75],
		['3월', 140, 100, 70]
	]);

	// 그래프 옵션
	var options = {
		title : '기간별 매출', // 제목
		width : 1240, // 가로 px
		height : 400, // 세로 px
		bar : {
			groupWidth : '40%' // 그래프 너비 설정 %
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
	<tr class="info">
		<th>구분</th>
		<th>목표</th>
		<th>매출</th>
		<th>달성율</th>
		<th>분기목표</th>
		<th>분기매출</th>
		<th>달성율</th>
		<th>전년도</th>
		<th>전년대비</th>
	</tr>
	<tbody>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>
				<div class="radio-inline">
				<label><input type="radio" name="userNo" value="${user.userNo}">${user.userNo}</label>
				</div></td>
				<td>${user.userName}</td>
				<td>${user.regDate}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tr>
		<th class="danger">1월</th>
		<td>1,000</td>
		<td>900</td>
		<td>90%</td>
		<td>4,500</td>
		<td>900</td>
		<td>4.6%</td>
		<td>700</td>
		<td>110%</td>
	</tr>
	<tr>
		<th class="danger">2월</th>
		<td>1,200</td>
		<td>700</td>
		<td>60%</td>
		<td>4,500</td>
		<td>1,500</td>
		<td>28%</td>
		<td>600</td>
		<td>120%</td>
	</tr>
	<tr>
		<th class="danger">3월</th>
		<td>1,400</td>
		<td>900</td>
		<td>80%</td>
		<td>4,500</td>
		<td>2,400</td>
		<td>48%</td>
		<td>800</td>
		<td>110%</td>
	</tr>
	<tr>
		<th class="success">합계</th>
		<td>4,500</td>
		<td>2,500</td>
		<td>70%</td>
		<td>4,500</td>
		<td>2,400</td>
		<td>48%</td>
		<td>2,100</td>
		<td>110%</td>
	</tr>
</table>
	<div id="excelSave">
		<button type="button" id="saveExcel" class="btn btn-warnning" data-toggle="modal" data-target="#excelM">엑셀저장</button>
		<button type="button" id="sales" class="btn btn-default" data-toggle="modal" data-target="#salesM">목표등록</button>
	</div>

	<div class="modal fade" id="excelM">
		<div class="modal-dialog modal-sm">
		
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modall-title">엑셀저장</h4>
				</div>
				<div class="modal-body">
					<p>엑셀저장 성공</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="salesM">
		<div class="modal-dialog modal-sm">
		
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modall-title">매출목표등록</h4>
				</div>
				<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="year">년도 &nbsp;</label>
						<select class="form-control" id="year">
							<option>2017년</option>
							<option selected>2018년</option>
						</select>
					</div>
					<table>
						<tr>
							<th>구분</th>
							<th>매출(단위:만원)</th>
						</tr>
						<tr>
							<th width="100">1월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">2월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">3월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">4월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">5월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">6월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">7월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">8월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">9월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">10월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">11월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
						<tr>
							<th width="100">12월</th>
							<td width="150"><input class="form-control" type="number" min="0" step="1000" placeholder="10,000"></td>
						</tr>
					</table>
					
				</div>
				<div class="modal-footer">
					<button type="submit" formaction="01.html" class="btn btn-default" data-dismiss="modal">등록</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</tbody>
</div>
</body>
