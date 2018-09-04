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
#inquiryPwOk{
	float: right;
}
.all{
	text-align:center;
}
table{
	margin:auto;
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
	margin:40px 0 30px 0;
	background:rgba(255,255,255,.2);
}

.hr2{
	height:2px;
	margin:25px 0 15px 0;
	background:rgba(255,255,255,.2);
}

.foot-lnk{
	text-align:center;
}

.title{
	text-align:;
	color:white;
	font-size:28px;
}

.second-title{
	text-align:left;
	color:white;
	font-size:20px;
}
</style>
<script>
$(function(){
	$("form").validate({
		rules:{
			userId:{
				required:true
			},
			userName:{
				required:true
			},
			userEmail:{
				required:true
			}
		},
		messages:{
			userId:{
				required:"가입한 아이디를 입력하세요."
			},
			userName:{
				required:"가입한 이름을 입력하세요."
			},
			userEmail:{
				required:"가입한 이메일을 입력하세요."
			}		
		},
		sumitHandler:function(){
			$(form).submit();
		}
	});
});
</script>
</head>
<body>
<div class="login-wrap">
	<%
	if(request.getAttribute("inqNum")!=null){
	%>
	<script>
		location.href="inquiryPwNum";
	</script>
	<%
	}else{
	%>

	<div class="login-html">
		<div class="login-form" id="all">
			<div class="title">
				<strong>비밀번호찾기</strong>
			</div>
			<div class="hr2"></div>
			<div class="second-title">
				<strong>이메일로 인증</strong>
			</div>
			<small class = "help-block">*아이디와 이름, 가입 시 사용했던 이메일 주소가 입력한 이름과 이메일 주소와 같아야, 인증번호를 받을 수 있습니다.</small>
			<div class="group">
				<form method="post">
					<label>아이디</label><br>
					<input class="input" maxlength="12" id="userId" name="userId" type="text" placeholder="아이디를 입력하세요." required><br>
					<label>이름</label><br>
					<input class="input" maxlength="12" id="userName" name="userName" type="text" placeholder="이름을 입력하세요." required><br>
					<label>이메일</label>
					<input class="input" maxlength="25" id="userEmail" name="userEmail" type="email" placeholder="이메일 주소를 입력하세요." required><br>
					<button type="submit" formaction="inquiryPw" class="button" id="confiNum" name="confiNum">인증번호 받기</button>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href ="logOut">로그인 하러가기</a> |	
						<a href ="inquiryId">아이디 찾기</a>
					</div>
				</form>
				<div id="msgModal" class="modal fade">
		    		<div class="modal-dialog modal-sm">
		        		<div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal">×</button>
				            </div>
				            <div class="modal-body">
				                <p id="msg">${err}</p>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="close" data-dismiss="modal">확인</button>
				            </div>
				        </div>
		    		</div>
				</div>
		
				<%
					if(request.getAttribute("err")!=null){
				%>
					<script>
						$("#msgModal").modal("show");
					</script>
				<%
					}
					
				}
				%>
			</div>
		</div>
	</div>
</div>
</body>