<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!-- 

	예약 정보 확인

 -->
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Reservation Confirmation</title>
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

</style>

<script type="text/javascript">

function sendIt() {
		
	var f = document.myForm;	
		
	f.action="<%=cp%>/escb/book_de.do";
	f.submit();
		
}
	
function goToMain(){
		
	var f = document.myForm;	
		
	f.action="<%=cp%>/escm/main.do";
	f.submit();
		
}

function alreadyBooked() {
	   
	if(${!empty msg}){
		alert("이미 예약된 정보가 있습니다!");
	}
	
	if(${!empty msg1}){   
		alert("예약 취소후 탈퇴해 주세요!!");
	 }

}

</script>

</head>
<body onload="alreadyBooked();">

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
						Reservation Info
					</span>
								
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text" value="BOOK NUM  :  ${ye_num }" readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text" value="DATE  :  ${ye_date }" readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text" value="TIME  :  ${ye_time }" readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text" value="NAME  :  ${ye_name }" readonly="readonly">
						<input type="hidden" name="ye_name" value="${ye_name }">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text" value="TEL  :  ${ye_tel }" readonly="readonly">
						<input type="hidden" name="ye_tel" value="${ye_tel }">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text"  value="THEME  :  ${the_name } " readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text"  value="INWON  :  ${inwon } " readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text" value="PRICE  :  ${ye_price } ￦" readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn-left checkfont" onclick="goToMain();">
							확인
						</button>
						
						<button class="login100-form-btn-left checkfont" onclick="sendIt();">
							예약취소
						</button>
						<input type="hidden" value="${the_num }" name="the_num">
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