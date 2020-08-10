<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 

로그인

 -->
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/rec/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/rec/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/rec/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/rec/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/rec/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/rec/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/rec/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/rec/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/rec/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/rec/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/rec/login/css/main.css">
<!--===============================================================================================-->

<!-- WIWI 배너 -->
<link href="/rec/assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="/rec/assets/css/colors/default.css" rel="stylesheet">
    
<!-- 폰트주소 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style type="text/css">

.checkfont {
  font-family: 'Jua', sans-serif;
  font-size: 13pt;
}
.msg {
  font-family: 'Jua', sans-serif;
  font-size: 16px;
  color: red;
  line-height: 1.4;
  padding-left: 70px;
}

</style>
<script type="text/javascript">

function login() {
		
	var f = document.myForm;
	
	if(!f.id.value){
		alert("ID는 필수 입니다!!");
		return;
	}
		
	if(!f.pwd.value){
		alert("PW는 필수 입니다!!");
		return;
	}
	
	if(${empty the_num && empty cpage }){//메인에서 로그인창으로
		
		f.action = "<%=cp%>/escc/Login_ok.do";
	
	}else if(${!empty cpage}){//자유게시판에서 로그인창으로
		
		f.action = "<%=cp%>/escc/Login_ok.do?cpage=${cpage}";
		
	}else{//테마아티클에서 로그인창으로
		f.action = "<%=cp%>/escc/Login_ok.do?the_num=${the_num}";	
	}
	
	f.submit();
	
}
	
function join() {
		
	var f = document.myForm;
		
	f.action = "<%=cp%>/escc/customJoin.do";
	f.submit();
	
}
	
	
</script>

</head>
<body>

	<!-- WIWI 배너 --> 
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
      
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
	<div class="navbar-header">
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="<%=cp %>/escm/main.do">WIWI</a>
	</div>
	</div>
	</nav>
          
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" name="myForm" method="post" onsubmit="return false;">
					<span class="login100-form-title p-b-51">
						Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "USERNAME is required">
						<input class="input100 checkfont" type="text" name="id" placeholder="USERNAME">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "PASSWORD is required">
						<input class="input100 checkfont" type="password" name="pwd" placeholder="PASSWORD">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div>
							<a href="<%=cp %>/escc/find.do" class="txt1">
								Forgot Account?
							</a>
						</div>
					</div>
					
					<c:if test="${!empty message }">
					<div>
						<div class="msg">
							<font><b>${message }</b></font>
						</div>
					</div>
					</c:if>
					
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn checkfont" onclick="login();">
							로그인
						</button>
					</div>
					<div class="flex-sb-m w-full p-t-3 p-b-24" align="center">
						<div align="center">
							<a href="<%=cp%>/escc/customJoin.do" class="txt1">
								Created Account
							</a>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/rec/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/rec/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/rec/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/rec/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/rec/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/rec/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/rec/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/rec/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/rec/login/js/main.js"></script>
	
	<!-- WIWI 배너 -->
	<script src="/rec/assets/js/plugins.js"></script>
    <script src="/rec/assets/js/main.js"></script>
	
</body>
</html>