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

회원 정보 수정

 -->
 
	<title>User Info Chainge</title>
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
.checkfont {
  font-family: 'Jua', sans-serif;
  font-size: 14pt;
}

</style>

<link rel="stylesheet" href="<%=cp %>/member/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/member/css/created.css" type="text/css"/>
<script type=text/javascript src="<%=cp %>/member/js/util.js" ></script>
<script type="text/javascript">

function sendIt(){
	
	var f = document.myForm;
	
	//아이디
	str = f.id.value;
	str = str.trim();
	if(!str){			
		alert("\n아이디를 입력하세요.");
		return;			
	}		
	f.id.value = str;
	
	//패스워드
	str = f.pwd.value;
	str = str.trim();
	if(!str){			
		alert("\n패스워드를 입력하세요.");
		return;			
	}		
	f.pwd.value = str;
		
	//이름
	str = f.name.value;
	str = str.trim();
	if(!str){			
		alert("\n이름을 입력하세요.");
		return;			
	}		 
	f.name.value = str;
	
	//생년월일
	str = f.birth.value;
	str = str.trim();
	if(!str){			
		alert("\n생년월일을 입력하세요.");
		return;			
	}		 
	f.birth.value = str;

	//성별
	str = f.gender.value;
	str = str.trim();
	if(!str){			
		alert("\n성별을 입력하세요.");
		return;			
	}		 
	f.gender.value =str;
	
	//페이지이동
	f.action = "<%=cp%>/escc/updated_ok.do";
	f.submit();	
	
}

function goback() {
	
	var f = document.myForm;
	f.action = "<%=cp%>/escm/main.do";
	f.submit();
	
}

function deleteId() {
	   
	var f = document.myForm;
	f.action = "<%=cp%>/escc/deleteId.do";
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
						Update CustomInfo
					</span>

					<span class="hyuna">
						ID
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "ID is required">
						<input class="input100 checkfont" type="text" name="id" placeholder="ID" value="${dto.id }">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						PASSWORD
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "PASSWORD is required">
						<input class="input100 checkfont" type="text" name="pwd" placeholder="PASSWORD" value="${dto.pwd }">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						NAME
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "NAME is required">
						<input class="input100 checkfont" type="text" name="name" placeholder="NAME" value="${dto.name }">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						BIRTH
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "BIRTH is required">
						<input class="input100 checkfont" type="text" maxlength="6" name="birth" placeholder="BIRTH(YYMMDD)" value ="${dto.birth }" onclick="this.value=''">
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						GENDER
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "GENDER is required">
						<select name="gender" class="hyunaSelect" onchange="genderCheck();" class="hyunaSelect" name="gender" >
							<option>성별</option>
							<c:if test="${dto.gender=='남성' }">
							<option value="여성">여성</option>
							<option value="남성" selected="selected">남성</option>
							</c:if>
							<c:if test="${dto.gender=='여성' }">
							<option value="여성" selected="selected">여성</option>
							<option value="남성">남성</option>
							</c:if>
						</select>
						<span class="focus-input100"></span>
					</div>
					
					<span class="hyuna">
						TEL
					</span>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "TEL is required">
						<input class="input100 checkfont" type="text" maxlength="13" name="tel" placeholder="TEL.010-XXXX-XXXX" value="${dto.tel }">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn-left checkfont" onclick="sendIt();">
							수정
						</button>
						
						<button class="login100-form-btn-right checkfont" onclick="goback();">
							취소
						</button>
					</div>
					
					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn checkfont" onclick="deleteId();">
							회원탈퇴
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
