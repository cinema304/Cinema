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
#formSearch{
	float: right;
}
#stickTable{
	margin-top : 30px;
}

th, td{
	text-align : center;
}

#stickChart{
	float: left;
}
#excelSave{
	float: right;
}
#vol{
	text-align : right;
}
</style>
<%@ include file="../menu.jsp" %>
	<div class="modal fade" id="errMsgM">
		<div class="modal-dialog modal-sm">
		
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="location.href='/admin/sales/movieSales'">&times;</button>
					<h4 class="modall-title">영화별 매출통계</h4>
				</div>
				<div class="modal-body">
					<p>${errMsg}</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='/admin/sales/movieSales'">확인</button>
				</div>
			</div>
		</div>
	</div>
</head>
<body>
<div class="container">
<%
	if(request.getAttribute("errMsg")!=null){
%>
	<script>
		$('#errMsgM').modal({backdrop: 'static', keyboard: false});
		$("#errMsgM").modal("show");
	</script>
<%
	}
%>
<br>
	<h2>▶영화별 매출통계</h2>
<form id ="formSearch" class="form-inline">
		<div class="form-group">
			<label for="movieName">영화명 &nbsp;</label>
			<select class="form-control" id="movieName" name="movieName">
				<option value="" selected disabled hidden>전체</option>
				<option value="미션 임파서블:폴아웃">미션임파서블</option>
				<option value="신과함께-인과 연">신과함께</option>
				<option value="신비아파트:금빛 도깨비와 비밀의 동굴">신비아파트</option>
				<option value="아이 엠 러브">아이 엠 러브</option>
				<option value="앤트맨과 와스프">앤트맨과와스프</option>
			</select>
		</div>
		<div class="form-group has-success has-feedback">
			<label for="timeStart">&nbsp;&nbsp; 기간 &nbsp;</label>
			<input type="date" class="form-control" id="timeStart" name="timeStart" required>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group">
			<p> ~ <p>
		</div>
		<div class="form-group has-success has-feedback">
			<label for="timeEnd"></label>
			<input type="date" class="form-control" id="timeEnd" name="timeEnd" required>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group">
			<button type="submit" id="search" class="btn btn-success">검색</button>
		</div>
</form>
<tbody>
<script>
google.charts.load('current', {packages:['corechart']});
</script>
<div id="stickChart"></div>
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
		if(i == 0){
			tmp.push($('#stickTable tr').eq(1).find('th').eq(i).text());
		}else{
			var tmp2 = ($('#stickTable tr').eq(1).find('th').eq(i).text());
			tmp2 = tmp2.replace(/\,/g,'');
			tmp.push(Number(tmp2));
		}		
	
		tot.push(tmp);
		tmp = [];
	}	
	
var data = google.visualization.arrayToDataTable(tot);
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
<p id="vol">(단위: 만원) (기간: ${timeStart} ~ ${timeEnd})</p>
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