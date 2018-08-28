<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>태인이네영화관(관리자)-시간별예매율통계</title>
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
					<button type="button" class="close" data-dismiss="modal" onclick="location.href='/admin/statistic/timeVol'">&times;</button>
					<h4 class="modall-title">지역별 예매율통계</h4>
				</div>
				<div class="modal-body">
					<p>${errMsg}</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='/admin/statistic/timeVol'">확인</button>
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
	<h2>▶시간별 예매율통계</h2>
<form id ="formSearch" class="form-inline">
		<div class="form-group">
			<label for="timeSea">시간 &nbsp;</label>
			<select class="form-control" id="timeSea" name="timeSea">
				<option value="" selected disabled hidden>전체</option>
				<option value="09">9~10시</option>
				<option value="10">10~11시</option>
				<option value="11">11~12시</option>
				<option value="12">12~13시</option>
				<option value="13">13~14시</option>
				<option value="14">14~15시</option>
				<option value="15">15~16시</option>
				<option value="16">16~17시</option>
				<option value="17">17~18시</option>
				<option value="18">18~19시</option>
				<option value="19">19~20시</option>
				<option value="20">20~21시</option>
				<option value="21">21~22시</option>
				<option value="22">22~23시</option>					
			</select>
		</div>
		<div class="form-group has-success has-feedback">
			<label for="timeStart">&nbsp;&nbsp;기간 &nbsp;</label>
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

	// 차트 데이터 설정
	var data = google.visualization.arrayToDataTable(tot);

	// 그래프 옵션
	var options = {
		title : '시간별 예매율', // 제목
		width : 1240, // 가로 px
		height : 400, // 세로 px
		bar : {
			groupWidth : '50%' // 그래프 너비 설정 %
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
<p id="vol">(단위: 명) (기간: ${timeStart} ~ ${timeEnd})</p>
</div>
<table id="stickTable" class="table table-hover">
	<tr>
		<th class="info">시간</th>
		<c:forEach var="timeReservations" items="${timeVol}">
			<th class="info">${timeReservations.time}시</th>
		</c:forEach>
	</tr>
	<tr>
		<th class="danger">예매수</th>
		<c:forEach var="timeReservations" items="${timeVol}">
			<th>${timeReservations.resCount}</th>
		</c:forEach>
	</tr>
</table>
	<div id="excelSave">
		<button type="button" id="saveExcel" class="btn btn-warnning">엑셀저장</button>
	</div>
</tbody>
</div>
</body>