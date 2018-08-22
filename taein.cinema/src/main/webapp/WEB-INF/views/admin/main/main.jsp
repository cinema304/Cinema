<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>태인이네영화관(관리자)-메인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	@import "../res/css/Menu.css";
</style>
<style>
@charset "utf-8";
#stickTable{
	width : 540px;
}
#pieTable{
	width : 540px;
}
th, td{
	text-align : center;
}
#goodMenu button{
	width : 155px;
	height : 130px;
	font-size: 20px;
}

#sales{
	float: left;
	width: 560px;
	margin-right: 10px;
}
#member{
	float: left;
	width: 560px;
}
#stickAnotation, #pieAnotation{
	text-align : right;
}
p{
	text-align : right;
}
h2{
	margin-top: 20px;
}
</style>
<div class="container">
<div id="logOutM" class="modal fade">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p id="msg">로그아웃 성공</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="close" data-dismiss="modal" onclick="location.href='../adminLogin/01.html'">확인</button>
			</div>
		</div>
	</div>
</div>
	<br>
	<div id="logo">
		<a href="../adminMain/01.html">
		<img src="../res/img/logo.jpg" width="200" height="50" alt="logo" />
		</a>
	</div>
	<br>
	<div id="info">
	  	<p>admin님, 로그인을 환영합니다.
		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#logOutM">로그아웃</button>
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
				<li><a href="../adminSales/01.html">기간별</a></li>
				<li><a href="../adminSales/02.html">영화별</a></li>
				<li><a href="../adminSales/03.html">극장별</a></li>
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
<div id="sales">
	<h2 id="title1">▶ 매출현황</h2>
	<p><a href="../adminSales/01.html">자세히</a></p>
	<div class="panel-group">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#salesCart">펼치기/접기</a>
				</h4>
			</div>
			<div id="salesCart" class="panel-collapse collapse in">
				<div class="panel-body">
				<script>
				google.charts.load('current', {packages:['corechart']});
				</script>
				<div id="stickChart"></div><!-- 여기에 차트가 생성됩니다. -->
				<script>
				google.charts.setOnLoadCallback(drawChart);

				function drawChart() {

						// 차트 데이터 설정
					var data = google.visualization.arrayToDataTable([
						['구분', '목표', '매출', '전년'], // 항목 정의
						['1월', 100, 80, 80], // 항목, 값 (값은 숫자로 입력하면 그래프로 생성됨)
						['2월', 120, 90, 75],
						['3월', 140, 100, 70]
					]);

					// 그래프 옵션
					var options = {
						title : '기간별 매출 통계', // 제목
						width : 530, // 가로 px
						height : 245, // 세로 px
						bar : {
							groupWidth : '60%' // 그래프 너비 설정 %
								}
					};

					var chart = new google.visualization.ColumnChart(document.getElementById('stickChart'));
					chart.draw(data, options);
				}
				</script>
				<p id="stickAnotation">(단위: 만원) (기간: ~ 2018-07-29)</p>
				<div id="stickTable">
				<table class="table table-hover">
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
				</div>
				</div>
			</div>
		</div>
	</div>
</div>



<div id="member">
<h2 id="title2">▶ 회원예매비율</h2>
<p><a href="../adminStatistic/06.html">자세히</a></p>
	<div class="panel-group">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" href="#memberChar">펼치기/접기</a>
				</h4>
			</div>
			<div id="memberChar" class="panel-collapse collapse in">
				<div class="panel-body">
				<script>
				google.charts.load('current', {packages:['corechart']});
				</script>
				<div id="pieChart" style="width: 530px; height: 245px;"></div>
				<script>
				google.charts.setOnLoadCallback(drawChart);
				
				function drawChart() {

				var data = google.visualization.arrayToDataTable([
     				['구분', '비율'],
    				['', 0],
    				['', 0],
    				['', 0],
    				['회원', 65],
    				['비회원', 35]
    		   ]);

				var options = {
						title: '회원예매비율 통계'
				};

				var chart = new google.visualization.PieChart(document.getElementById('pieChart'));

				chart.draw(data, options);
				}
				</script>
				<p id="pieAnotation">(단위: 명) (기간: ~ 2018-07-29)</p>
				<div id="pieTable">
				<table class="table table-hover">
					<tr class="info">
						<th>구분</th>
						<th>회원</th>
						<th>비회원</th>
						<th>전체</th>
					</tr>
					<tr>
						<th class="danger">비율</th>
						<td>435</td>
						<td>215</td>
						<td>723</td>
					<tr>
				</table> 
				</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="col-xs-12"><h3>#자주 찾는 메뉴</h3></div>
    <div class="col-xs-12" id="goodMenu">
        <button type="button" class="btn btn-info" onclick="location.href='../adminUser/01.html'">회원관리</button>
        <button type="button" class="btn btn-primary" onclick="location.href='../adminMovie/01.html'">영화등록</button>
        <button type="button" class="btn btn-success" onclick="location.href='../adminCinema/01.html'">극장등록</button>
        <button type="button" class="btn btn-info" onclick="location.href='../adminCinema/03.html'">극장별<br>상영영화등록</button>
        <button type="button" class="btn btn-warning" onclick="location.href='../adminMovie/03.html'">리뷰관리</button>
        <button type="button" class="btn btn-danger" onclick="location.href='../adminReservation/01.html'">예매관리</button>
        <button type="button" class="btn btn-success" onclick="location.href='../adminSales/01.html'">매출현황</button>
    </div>

<div class="col-xs-12"><br>
<h2>▶공지사항</h2>	
<p><a  href="../adminNotice/01.html">자세히</a></p>
	<div class="panel panel-info">
		<div class="panel-heading">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="pill" href="#home">전체</a></li>
				<li><a data-toggle="pill" href="#planning">기획부</a></li>
				<li><a data-toggle="pill" href="#marketing">마케팅부</a></li>
				<li><a data-toggle="pill" href="#business">영업부</a></li>
				<li><a data-toggle="pill" href="#accounting">회계부</a></li>
			</ul>
		</div>
		<div class="panel-body">
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<table class="table table-hover">
						<tr>
							<th style="width:50px">번호</th>
							<th style="width:550px">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th style="width:60px">조회수</th>
						</tr>
						<tr>
							<td>132</td>
							<td><a href="../adminNotice/03.html">정기휴일 및 8월의 일정</a></td>
							<td>admin</td>
							<td>2018-07-30</td>
							<td><span class="badge">112</span></td>
						</tr>
						<tr>
							<td>131</td>
							<td><a href="../adminNotice/03.html">법규위반 사업용자동차 행정처분 의뢰</a></td>
							<td>admin</td>
							<td>2018-07-28</td>
							<td><span class="badge">32</span></td>
						</tr>
						<tr>
							<td>130</td>
							<td><a href="../adminNotice/03.html">신촌점 오픈 일정</a></td>
							<td>admin</td>
							<td>2018-07-28</td>
							<td><span class="badge">36</span></td>
						</tr>
						<tr>
							<td>129</td>
							<td><a href="../adminNotice/03.html">정기휴일 및 7월의 일정</a></td>
							<td>admin</td>
							<td>2018-06-30</td>
							<td><span class="badge">161</span></td>
						</tr>
						<tr>
							<td>128</td>
							<td><a href="../adminNotice/03.html">홍대점 오픈 일정</a></td>
							<td>admin</td>
							<td>2018-06-15</td>
							<td><span class="badge">51</span></td>
						</tr>
					</table>
				</div>
				<div id="planning" class="tab-pane fade">
					<table class="table table-hover">
						<tr>
							<th style="width:50px">번호</th>
							<th style="width:550px">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th style="width:60px">조회수</th>
						</tr>
						<tr>
							<td>130</td>
							<td><a href="../adminNotice/03.html">신촌점 오픈 일정</a></td>
							<td>admin</td>
							<td>2018-07-28</td>
							<td><span class="badge">36</span></td>
						</tr>
						<tr>
							<td>128</td>
							<td><a href="../adminNotice/03.html">홍대점 오픈 일정</a></td>
							<td>admin</td>
							<td>2018-06-15</td>
							<td><span class="badge">15</span></td>
						</tr>
												<tr>
							<td>125</td>
							<td><a href="../adminNotice/03.html">건대점 오픈 일정</a></td>
							<td>admin</td>
							<td>2018-06-11</td>
							<td><span class="badge">64</span></td>
						</tr>
						<tr>
							<td>123</td>
							<td><a href="../adminNotice/03.html">연신내점 오픈 일정</a></td>
							<td>admin</td>
							<td>2018-06-08</td>
							<td><span class="badge">35</span></td>
						</tr>
												<tr>
							<td>118</td>
							<td><a href="../adminNotice/03.html">김포점 오픈 일정</a></td>
							<td>admin</td>
							<td>2018-05-21</td>
							<td><span class="badge">36</span></td>
						</tr>
					</table>
				</div>
				<div id="marketing" class="tab-pane fade">
					<table class="table table-hover">
						<tr>
							<th style="width:50px">번호</th>
							<th style="width:550px">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th style="width:60px">조회수</th>
						</tr>
						<tr>
							<td>132</td>
							<td><a href="../adminNotice/03.html">정기휴일 및 8월의 일정</a></td>
							<td>admin</td>
							<td>2018-07-30</td>
							<td><span class="badge">112</span></td>
						</tr>
						<tr>
							<td>129</td>
							<td><a href="../adminNotice/03.html">정기휴일 및 7월의 일정</a></td>
							<td>admin</td>
							<td>2018-06-30</td>
							<td><span class="badge">161</span></td>
						</tr>
												<tr>
							<td>121</td>
							<td><a href="../adminNotice/03.html">정기휴일 및 6월의 일정</a></td>
							<td>admin</td>
							<td>2018-05-30</td>
							<td><span class="badge">181</span></td>
						</tr>
						<tr>
							<td>110</td>
							<td><a href="../adminNotice/03.html">정기휴일 및 5월의 일정</a></td>
							<td>admin</td>
							<td>2018-04-30</td>
							<td><span class="badge">115</span></td>
						</tr>
						<tr>
							<td>101</td>
							<td><a href="../adminNotice/03.html">정기휴일 및 4월의 일정</a></td>
							<td>admin</td>
							<td>2018-03-30</td>
							<td><span class="badge">111</span></td>
						</tr>
					</table>
				</div>
				<div id="business" class="tab-pane fade">
					<table class="table table-hover">
						<tr>
							<th style="width:50px">번호</th>
							<th style="width:550px">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th style="width:60px">조회수</th>
						</tr>
						<tr>
							<td>131</td>
							<td><a href="../adminNotice/03.html">법규위반 사업용자동차 행정처분 의뢰</a></td>
							<td>admin</td>
							<td>2018-07-28</td>
							<td><span class="badge">32</span></td>
						</tr>
						<tr>
							<td>103</td>
							<td><a href="../adminNotice/03.html">영업용 차량 운행일지 양식</a></td>
							<td>admin</td>
							<td>2018-03-15</td>
							<td><span class="badge">16</span></td>
						</tr>
						<tr>
							<td>81</td>
							<td><a href="../adminNotice/03.html">서울시 거래처 목록(20171230)</a></td>
							<td>admin</td>
							<td>2017-12-30</td>
							<td><span class="badge">81</span></td>
						</tr>
						<tr>
							<td>70</td>
							<td><a href="../adminNotice/03.html">업 차량 구입 보고서</a></td>
							<td>admin</td>
							<td>2017-11-25</td>
							<td><span class="badge">15</span></td>
						</tr>
						<tr>
							<td>34</td>
							<td><a href="../adminNotice/03.html">비용청구서 양식</a></td>
							<td>admin</td>
							<td>2017-08-12</td>
							<td><span class="badge">11</span></td>
						</tr>
					</table>
				</div>
				<div id="accounting" class="tab-pane fade">
					<table class="table table-hover">
						<tr>
							<th style="width:50px">번호</th>
							<th style="width:550px">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th style="width:60px">조회수</th>
						</tr>
						<tr>
							<td>114</td>
							<td><a href="../adminNotice/03.html">분기 매출현황 보고</a></td>
							<td>admin</td>
							<td>2018-07-01</td>
							<td><span class="badge">32</span></td>
						</tr>
						<tr>
							<td>105</td>
							<td><a href="../adminNotice/03.html">6월 매출현황 보고</a></td>
							<td>admin</td>
							<td>2018-06-01</td>
							<td><span class="badge">56</span></td>
						</tr>
						<tr>
							<td>104</td>
							<td><a href="../adminNotice/03.html">6월 미수금 현황보고</a></td>
							<td>admin</td>
							<td>2018-06-01</td>
							<td><span class="badge">21</span></td>
						</tr>
						<tr>
							<td>95</td>
							<td><a href="../adminNotice/03.html">6월 매출현황 보고</a></td>
							<td>admin</td>
							<td>2018-05-01</td>
							<td><span class="badge">61</span></td>
						</tr>
						<tr>
							<td>96</td>
							<td><a href="../adminNotice/03.html">5월 미수금 현황보고</a></td>
							<td>admin</td>
							<td>2018-05-01</td>
							<td><span class="badge">18</span></td>
						</tr>
					</table>
				</div>
			</div>		
		</div>
	</div>
</div>

</div>
</body>