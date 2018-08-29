<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>태인이네영화관-로그인페이지</title>
<title>logIn</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
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
.login-html .sign-in-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
	text-align:left;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}
.login-html .title{
	text-align:center;
	font-size:28px;
}
.msg{
	color:red;
	text-align:left;
}
</style>
</head>
<body>
<div class="login-wrap">
	<div class="group">
			<%
				if(session.getAttribute("userId")==null){
			
				String saveUserId = "";
				Cookie[] cookies = request.getCookies();
				if(cookies != null){
					for(Cookie cookie:cookies){
						if(cookie.getName().equals("saveUserId"))
							saveUserId = cookie.getValue();
					}
				}
			%>
		<form method="post" class="group">
			<div class="login-html">
				<div id="title">
					<strong>관리자 페이지 - 로그인</strong><br><br><br>
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
				<label for="tab-1" class="tab">로그인</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up">
				<label for="tab-2" class="tab"><a href="userAdd">회원가입</a></label>
					<div class="login-form">
						<div class="sign-in-htm">
							<div class="group">				
								<label class="label" for="id">ID</label>
								<input type="text" class="input" maxlength="12" id="id" name="userId" value="<%= saveUserId %>" placeholder="Enter Id" required><br><br>
							</div>
							<div class="group">
								<label class="label" for="pwd">Password</label>
								<input type="password" class="input" maxlength="12" id="pwd" name="userPw" placeholder="Enter password" required>
							</div><br>
							<div class="group">			
								<div class="checkbox">
									<input id="check" type="checkbox" class="check" name="remember" value="Y" checked><label for="check"><span class="icon"></span>아이디 저장</label>
								</div>
							</div>
							<div class="group">
								<button type="submit" method="post" formaction="logIn" class="button">로그인</button>
							</div>
							<div class="form-group">
								<strong id="msg">${msg}</strong>
							</div>
							<div class="hr"></div>
							<div class="foot-lnk">
								<div>					
									<a href="inquiryId">아이디 찾기</a> |						
									<a href="inquiryPw">비밀번호 찾기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</form>
			
			<%		
				}else{	
			%>
				${userId}로 로그인하셨습니다.<br>
				<a href ="admin/main/main">메인으로</a>
				<a href ="logOut">로그아웃</a>
			<%
				}
			%>
	</div>
</div>
</body>