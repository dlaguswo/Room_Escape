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

예약 페이지

 -->
	<title>Reservation</title>
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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- WIWI 배너 -->
<link href="/rec/assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="/rec/assets/css/colors/default.css" rel="stylesheet">

<style type="text/css">

.hyuna {
  font-family: Ubuntu-Bold;
  font-size: 20px;
  color: #403866;
  line-height: 1.2;
  text-transform: uppercase;
  text-align: left;
  width: 100%;
  display: block;
}
.SelectDate {
  width: 33.3%;
  height: 50px;
  position: relative;
  background-color: #e6e6e6;
  border: 1px solid transparent;
  border-radius: 3px;
  padding-left: 30px;
  font-family: 'Jua', sans-serif;
  font-size: 18px;
  color: #403866;
  float: left;
}
.hyunaSelect {
  width: 100%;
  height: 50px;
  position: relative;
  background-color: #e6e6e6;
  border: 1px solid transparent;
  border-radius: 3px;
  padding-left: 30px;
  font-family: 'Jua', sans-serif;
  font-size: 18px;
  color: #403866;
  float: left;
}
.checkfont {
  font-family: 'Jua', sans-serif;
  font-size: 13pt;
}

</style>

<script type="text/javascript">

function sendIt(){
	
	var f = document.myForm;
	
	if(!f.yearSel.value){
		alert("년도를 선택하세요");
		f.yearSel.focus();
		return;
	}
	
	if(!f.monthSel.value){
		alert("월을 선택하세요");
		f.monthSel.focus();
		return;
	}
	
	if(!f.dateSel.value){
		alert("일을 선택하세요");
		f.dateSel.focus();
		return;
	}
	
	if(!f.ye_time.value){
		alert("시간을 선택하세요");
		f.ye_time.focus();
		return;
	}
	
	if(!f.inwon.value){
		alert("인원을 선택하세요");
		f.inwon.focus();
		return;
	}
	
	if(!f.ye_name.value){
		alert("이름을 입력하세요");
		f.inwon.focus();
		return;
	}
	
	if(!f.ye_tel.value){
		alert("전화번호를 입력하세요");
		f.ye_tel.focus();
		return;
	}
	
	f.action = "<%=cp%>/escb/bookmain_ok.do";
	f.submit();
	
}

function priceSet(){
	
	var f = document.myForm;
	
	f.ye_price.value = f.inwon.value*10000;
	
}

function calendar(){
	
	var f = document.myForm;
	
	f.action = "<%=cp%>/escb/bookmain.do";
	f.submit();
	
}

function goToMain(){
	
	var f = document.myForm;	
	
	f.action="<%=cp%>/escm/main.do";
	f.submit();
	
}


</script>

</head>
<body>

	<!-- WIWI 배너 -->
      
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
					
					<input type="hidden" name="the_num" value="${the_num }">
					<input type="hidden" name="nalja" value="${nalja }">
				
					<span class="login100-form-title p-b-51">
						Reservation
					</span>

					
					<span class="hyuna">
						REGION
					</span>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100 checkfont" type="text" name="region" value="${dtoC.region }" readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						CAFE NAME
					</span>
					<div class="wrap-input100 validate-input m-b-16" >
						<input class="input100 checkfont" type="text" name="cafe_name" value="${dtoC.cafe_name }" readonly="readonly">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						THEMA
					</span>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100 checkfont" type="text" name="the_name" value="${dtoT.the_name }" readonly="readonly" width="200">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						DATE
					</span>
					<div class="wrap-input100 validate-input m-b-16">
						<div>
							<select name="yearSel" class="SelectDate" onchange="">
							<option value="">년도선택</option>
							<c:forEach var="i" begin="2020" end="2022">
								<c:if test="${i==year }">
								<option value="${i }" selected="selected">${i }<b>년</b></option>
								</c:if>
								<c:if test="${i!=year }">
								<option value="${i }">${i }<b>년</b></option>
								</c:if>
							</c:forEach>
							</select>
							<span class="focus-input100"></span>
						</div>
						<div>
							<select name="monthSel" class="SelectDate" onchange="calendar();">
							<option value="">월선택</option>
							<c:forEach var="j" begin="1" end="12">
								<c:if test="${j==month }">
								<option value="${j }" selected="selected">${j }<b>월</b></option>
								</c:if>
								<c:if test="${j!=month }">
								<option value="${j }">${j }<b>월</b></option>
								</c:if>
							</c:forEach>
							</select>
							<span class="focus-input100"></span>
						</div>
						<div>
							<select name="dateSel" class="SelectDate" onchange="calendar();" font-family: 'Jua', sans-serif;>
							<option value="">일선택</option>
								<c:forEach var="k" begin="1" end="${endDay }">
								
									<c:if test="${k==date }">
									<option value="${k}" selected="selected">${k }<b>일</b></option>
									</c:if>
									<c:if test="${k!=date }">
									<option value="${k}">${k }<b>일</b></option>
									</c:if>
								
								</c:forEach>
							</select>
							<span class="focus-input100"></span>
						</div>
					</div>
					
					<span class="hyuna">
						TIME
					</span>
					<div class="wrap-input100 validate-input m-b-16">
						<select name="ye_time" class="hyunaSelect">
							<option value="">시간선택</option> 
							<c:forEach var="dtoTT" items="${listsTT }">
								<option value="${dtoTT.time }">
								${dtoTT.time }
								</option>
							</c:forEach>
						</select>
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						INWON
					</span>
					<div class="wrap-input100 validate-input m-b-16">
						<select name="inwon" class="hyunaSelect" onchange="priceSet();">
							<option value="">인원선택</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
						</select>
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						PRICE
					</span>
					<div class="wrap-input100 m-b-16">
						<input class="input100 checkfont" type="text" name="ye_price" readonly="readonly" placeholder="PRICE">
						<span class="focus-input100"></span>
					</div>
					
					<c:if test="${!empty sessionScope.CustomInfo.id }">
					<span class="hyuna">
						NAME
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "NAME is required">
						<input class="input100 checkfont" readonly="readonly" type="text" name="ye_name" value="${CustomInfo.name }" placeholder="NAME">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						TEL
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "TEL is required">
						<input class="input100 checkfont" readonly="readonly" type="text" name="ye_tel" value="${CustomInfo.tel }" placeholder="TEL">
						<span class="focus-input100"></span>
					</div>
					</c:if>
					
					<c:if test="${empty sessionScope.CustomInfo.id }">
					<span class="hyuna">
						NAME
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "NAME is required">
						<input class="input100 checkfont" type="text" name="ye_name" value="${CustomInfo.name }" placeholder="NAME">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						TEL
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "TEL is required">
						<input class="input100 checkfont" type="text" name="ye_tel" maxlength="13" value="${CustomInfo.tel }" placeholder="TEL">
						<span class="focus-input100"></span>
					</div>
					</c:if>
					

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn-right checkfont" onclick="sendIt();">
							예약하기
						</button>
						
						<button class="login100-form-btn-right checkfont" onclick="goToMain();">
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