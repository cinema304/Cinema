<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="http://cdn.jsdelivr.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="http://common.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#inquiryIdOk{
	float: right;
}
#all, h2{
	text-align:center;
}
#time{
	color: red;
	font-weight:bold;
}
body{
	margin:0;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:525px;
	min-height:670px;
	position:relative;
	background:url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}

.login-form .group{
	margin-bottom:15px;
}

.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}

.login-form .group .button{
	background:#1161ee;
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}

.hr2{
	height:2px;
	margin:40px 0 30px 0;
	background:rgba(255,255,255,.2);
}

.foot-lnk{
	text-align:center;
}

.title{
	text-align:center;
	color:white;
	font-size:28px;
}
</style>
<script>
$(function(){
	$("form").validate({
		rules:{
			confiNum:{
				required:true,
				minlength:6
			}
		},
		messages:{
			confiNum:{
				required:"인증번호를 입력하세요.",
				minlength:"인증번호는 6자리입니다."
			}			
		},
		sumitHandler:function(){
			$(form).submit();
		}
	});
});
</script>
<script>
function $ComTimer(){
}

$ComTimer.prototype = {
    comSecond : ""
    , fnCallback : function(){}
    , timer : ""
    , domId : ""
    , fnTimer : function(){
        var m = Math.floor(this.comSecond / 60) + ": " + (this.comSecond % 60) ;	
        this.comSecond--;			
        $("#time").html("&nbsp;&nbsp;"+m);
        if(this.comSecond <0){
        	clearInterval(this.timer);
        	$('#timeModal').modal({backdrop: 'static', keyboard: false});
        	$("#timeModal").modal("show");
        	}
    }
    ,fnStop : function(){
        clearInterval(this.timer);
    }
}

var AuthTimer = new $ComTimer()
AuthTimer.comSecond = 180;
AuthTimer.fnCallback = function(){alert("다시 인증을 시도해주세요.")}
AuthTimer.timer =  setInterval('AuthTimer.fnTimer()',1000);
AuthTimer.domId = document.getElementById("timer");
</script>
<div id="timeModal" class="modal fade">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" onclick="location.href='inquiryId'">×</button>
            </div>
            <div class="modal-body">
                <p id="msg">인증시간이 초과되었습니다. 다시 인증을 시도해주세요.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="close" data-dismiss="modal" onclick="location.href='inquiryId'">확인</button>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	$("#inquiryIdOk").bind("click",function(){
		$.ajax({
			url:"inquiryIdOk",
			method:"get",
			data:{
				confiNum:$("#confiNum").val()
			},
			success:function(result){
				if(result.is === true){
					$("#all").empty();
					$("#all").append("<h4>귀하의 아이디는 "+result.userId+"입니다.</h4><br>");
					clearInterval(AuthTimer.timer);
				}else {
					$("#msgModal #msg").html("<p>"+result.errMsg+"</p>");
					$("#msgModal").modal("show");
				}
			},
			error:function(a,b,errMsg){
				$("#msgModal #msg").html("<p>인증 실패: "+errMsg+"</p>");
				$("#msgModal").modal("show");
			}
		});
	});
});
</script>
<div id="msgModal" class="modal fade">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            <div class="modal-body">
                <p id="msg"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="close" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
</head>
<body>
<div class="login-wrap">
	<form>
		<div class="login-html">
			<div class="login-form">
				<div class="title">
					<strong>아이디찾기</strong>
				</div>
				<div class="hr2"></div>
				<div class="group" id = "all">
					<h3>인증번호 입력</h3><br>
					<input id="confiNum" name="confiNum" maxlength="6" oninput="maxLengthCheck(this)" class="input" type="number" placeholder = "인증번호 6자리 숫자 입력"><br>
					<p id="time"></p><br>
					<a href="#" id="msg" data-toggle="tooltip" data-placement="right"
					title="스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증번호 받기'를 눌러주세요.">
					인증번호가 오지 않나요?</a><br><br>
					<button type="button" class="button" id="inquiryIdOk">확인</button>
				</div>
				<br>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href ="logOut">로그인 하러가기</a> |	
					<a href ="inquiryPw">비밀번호 찾기</a>
				</div>
				<script>
				function maxLengthCheck(object){
					if(object.value.length > object.maxLength){
						object.value = object.value.slice(0, object.maxLength);
					}
				}
				</script>				
			</div>
		</div>
		<script>
		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip();
		});
		</script>
	</form>
</div>
</body>