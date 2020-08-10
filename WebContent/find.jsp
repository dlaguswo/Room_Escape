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

비밀번호 찾기

 -->
	<title>Search Password</title>
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

<!--  폰트 링크 -->  
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- WIWI 배너 -->
<link href="/rec/assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="/rec/assets/css/colors/default.css" rel="stylesheet">

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
  padding-left: 60px;
}

</style>

<script type="text/javascript">

function login() {
	
	var f = document.myForm;
	
	if(!f.id.value){
		alert("아이디를 입력하세요!");
		return;
	}
	
	if(!f.tel.value){
		alert("전화번호를 입력하세요!")
		return;
	}
	
	f.action = "<%=cp%>/escc/find_ok.do";
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
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="<%=cp%>/escm/main.do">WIWI</a>
	</div>
	</div>
	</nav>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" name="myForm" method="post" onsubmit="return false;">
					<span class="login100-form-title p-b-51">
						Search Password
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "USERID is required">
						<input class="input100 checkfont" type="text" name="id" placeholder="USERID">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "TEL is required">
						<input class="input100 checkfont" type="text" maxlength="13" name="tel" placeholder="TEL.010-XXXX-XXXX">
						<span class="focus-input100"></span>
					</div>
					
					<c:if test="${!empty message }">
					<div class="msg">
						<div>
							<font><b>${message }</b></font>
						</div>
					</div>
					</c:if>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn-left checkfont" onclick="login();">
							확인
						</button>
						
						<button class="login100-form-btn-right checkfont" onclick="javascript:location.href='<%=cp%>/escc/Login.do';">
							취소
						</button>
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