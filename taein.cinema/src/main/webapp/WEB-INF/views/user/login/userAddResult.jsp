<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body{
	margin:0;
	color:#dee2f7;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
	text-align:center;
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

.hr{
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
</head>
<body>
<div class="login-wrap">
	<div class="login-html">
		<div class="login-form">
			<div class="title">
				<strong>회원가입완료</strong>		
			</div>
			<div class="hr"></div>
			<div class="group" id="addMsg">
				<h4>회원가입을 완료하였습니다.</h4>
				<div class="hr"></div>
				<div class="foot-lnk">
					<h4><a href ="logIn">로그인하러 가기</a></h4>
				</div>
			</div>
		</div>
	</div>
</div>
</body>