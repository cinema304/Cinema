<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>태인이네영화관(관리자)-예매회원비율 통계</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
#formSearch{
	float: right;
}

#pieChart{
	float: left;
}

#pieTable{
	float: right;
	width: 300px; 
	height: 100px;
}

th, td{
	text-align : center;
}

#excelSave{
	float: right;
}
#vol{
	float: right;
	text-align : right;
	margin-top:190px;
}
</style>
<%@ include file="../menu.jsp" %>
	<div class="modal fade" id="errMsgM">
		<div class="modal-dialog modal-sm">
		
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="location.href='/admin/statistic/userVol'">&times;</button>
					<h4 class="modall-title">성별 예매율통계</h4>
				</div>
				<div class="modal-body">
					<p>${errMsg}</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='/admin/statistic/userVol'">확인</button>
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
	<h2>▶예매회원비율통계</h2>
<form id ="formSearch" class="form-inline">
		<div class="form-group has-success has-feedback">
			<label for="timeStart">기간</label>
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
<div id="pieChart" style="width: 800px; height: 500px;"></div>
<script>
google.charts.load('current', {'packages':['corechart']});
	
	function drawChart() {

		var rowlen = $('#pieTable tr').length;
		var collen = $('#pieTable tr').eq(0).find('th').length;
		
		var one = $('#pieTable tr').eq(0).find('th').eq(0).text();
		var two = $('#pieTable tr').eq(1).find('th').eq(0).text();

		var tmp = [];
		var tot = [];
		
		for(var i=0; i<collen; i++){
			tmp.push($('#pieTable tr').eq(0).find('th').eq(i).text());
			if(i == 0){
				tmp.push($('#pieTable tr').eq(1).find('th').eq(i).text());
			}else{
				var tmp2 = ($('#pieTable tr').eq(1).find('th').eq(i).text());
				tmp2 = tmp2.replace(/\,/g,'');
				tmp.push(Number(tmp2));
			}
		
			console.log(tmp);
			tot.push(tmp);
			tmp = [];
		}	
		
	var data = google.visualization.arrayToDataTable(tot);

	var options = {
	     title: '예매 회원비율 통계'
	};

	var chart = new google.visualization.PieChart(document.getElementById('pieChart'));

	chart.draw(data, options);
	}


google.charts.setOnLoadCallback(drawChart);
</script>
<div>
<p id="vol">(단위: 명) (기간: ${timeStart} ~ ${timeEnd})</p>
</div>
<table id="pieTable" class="table table-hover">
	<tr>
		<th class="info">구분</th>
		<c:forEach var="userReservations" items="${userVol}">
			<th class="info">${userReservations.user}</th>
		</c:forEach>
	</tr>
	<tr>
		<th class="danger">예매수</th>
		<c:forEach var="userReservations" items="${userVol}">
			<th>${userReservations.resCount}</th>
		</c:forEach>
	</tr>
</table>
	<br><br><br><br><br><br>
	<div id="excelSave">
		<button type="button" id="saveExcel" class="btn btn-warnning">엑셀저장</button>
	</div>
</tbody>
</div>
</body>