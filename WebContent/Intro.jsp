<%@ page  contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!doctype html>
<html lang="kr">
	<head>
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=cp%>/data/img/31.png"/>
	<meta charset="UTF-8">
	
	<!--  타이틀 -->
	<title>Introduce</title>
	
	<link rel="apple-touch-icon" sizes="57x57" href="/rec/assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/rec/assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/rec/assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/rec/assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/rec/assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/rec/assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/rec/assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/rec/assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/rec/assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/rec/assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/rec/assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/rec/assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/rec/assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/rec/assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="/rec/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="/rec/assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="/rec/assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/rec/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="/rec/assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="/rec/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/rec/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="/rec/assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="/rec/assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    
    <!-- Main stylesheet and color file-->
    <link href="/rec/assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="/rec/assets/css/colors/default.css" rel="stylesheet">

<style>
body {
  background-color: #1D1D1D;
  position: relative;
  min-height: 120vh;
  margin: 1;
  font-family: 'Droid Sans', sans-serif;
  color: #fff;
}
body:before {
  content: '';
  position: fixed;
  top: 0px;
  left: 50%;
  bottom: 0px;
  -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
  width: 4px;
  background-color: #fff;
}
body .entries {
  width: calc(100% - 80px);
  max-width: 1600px;
  margin: auto;
  position: relative;
  left: -5px;
}
body .entries .entry {
  width: calc(50% - 80px);
  float: left;
  padding: 20px;
  clear: both;
  text-align: right; 
}
body .entries .entry:not(:first-child) {
  margin-top: -60px;
}
body .entries .entry .title {
  font-size: 50px;
  margin-bottom: 12px;
  position: relative;
}
body .entries .entry .title:before {
  content: '';
  position: absolute;
  width: 8px;
  height: 8px;
  border: 4px solid #ffffff;
  background-color: #1D1D1D;
  border-radius: 100%;
  top: 50%;
  
          transform: translateY(-50%);
  right: -73px;
  z-index: 1000;
}
body .entries .entry .title.big:before {
  width: 24px;
  height: 24px;
  -webkit-transform: translate(8px, -50%);
          transform: translate(8px, -50%);
}
body .entries .entry .body {

}
body .entries .entry .body p {
  line-height: 1.4em;
}
body .entries .entry:nth-child(2n) {
  text-align: left;
  float: right;
}
body .entries .entry:nth-child(2n) .title {
  font-size: 50px;
}
body .entries .entry:nth-child(2n) .title:before {
  left: -63px;
}
body .entries .entry:nth-child(2n) .title.big:before {
  width: 24px;
  height: 24px;
  -webkit-transform: translate(-8px, -50%);
          transform: translate(-8px, -50%);
}
p{}
.p1{text-align: left;}
.p2{font-size: 23px;}

		
}
</style>
</head>
<body>

<!--  화면전환 로딩 --> 
	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>
      
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
	<div class="navbar-header">
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="<%=cp%>/escm/main.do">WIWI</a>
	</div>
          
<!--  헤더목록 -->
		<div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="<%=cp %>/escm/main.do">Home</a></li>
         	  <li><a href="<%=cp%>/escm/intro.do">Introduce</a></li>
              <li><a href="<%=cp%>/escb/book.do">Check</a></li>
			  <li><a href="<%=cp%>/escp/postList.do">Board</a></li>
			  <c:if test="${empty CustomInfo }">
			  <li><a href="<%=cp%>/escc/Login.do">Login</a>
			  <li><a href="<%=cp%>/escc/customJoin.do">Create</a>
			  </c:if>
			  <c:if test="${!empty CustomInfo }">
			  <li style="padding-top: 12px;"><font size="2pt" color="white">${CustomInfo.id }님</font></li>
			  <li><a href="<%=cp%>/esct/mypage.do?id=${CustomInfo.id}">MYPAGE</a></li>
			  <li><a href="<%=cp%>/escc/Logout.do">Logout</a></li>
			  </c:if>
            </ul>
          </div>

	</div>
	</nav>
	
  <div class="entries" >
    <div class="entry">

    </div>
    <div class="entry"><br/><br/><br/><br/>
      <div class="title big">방탈출 카페란?</div>
      <div class="body">
      <img src="<%=cp %>/data/img/1.png" width="500">
        <p class="p2">방탈출 카페(Escape room)는 방에 갇혀 추리하여<br/>
			탈출을 목적으로하는 일종의 놀이 공간이다.<br/>
		비디오 게임 장르 중 탈출 게임의 현실로 재현한 것으로,<br/>
		이야기 진행에 맞춰 단서를 찾아 탈출해야 한다.<br/><br/>
		원래 미국이나 유럽 등지에서 이벤트 형식으로 열리던 것이다.<br/>
		2010년대에 들어서 캐나다, 중국, 대만, 한국에서 인기를 끌고 있다.<br/>
		놀이 공간으로 정착한 것은 아시아권으로, <br/>
		이후 북미, 유럽, 호주, 남미 등에도 생겨나기 시작했다.
      </div>
    </div>
    
    <br/><br/>
    <div class="entry">
       <div class="title big">"WIWI"란?</div>
      <div class="body">
     
     <p class="p2">  
    <b>"WIWI"</b>란<b> "Where am I?, Who am I?"</b>으로
    <br/>강남과 홍대의 방 탈출 카페의 정보를 <br/>
    	 카페마다 검색해서 볼 필요없이 한곳에서<br/>
    	 다양한 카페의 정보를 확인할 수 있으며<br/>
		다양한 장르와 내용을 확인 가능하고<br/>
		비회원 예약이 가능하여 쉽고 편리하게<br/>
		방 탈출 카페를 이용하실 수 있습니다.<br/><br/><br/><br/><br/><br/> 
		</p> 
      </div>
    </div>
 
	
    <div class="entry">
     <img src="<%=cp %>/data/img/3372.png" width="500">
      <div class="title big">&nbsp;&nbsp;&nbsp;&nbsp;이용시 주의사항</div>
      <div class="body">
        <p class="p2">1. 안전유의<br/> 
        			  2. 사진촬영 금지<br/>
        			  3. 물품 파손 주의<br/>
        			  4. 인화성 위험물질 반입금지<br/>
        			  5. 스포일러 금지
        			  </p>
      </div>
    </div>
  </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript"></script>
   <script src="/rec/assets/lib/jquery/dist/jquery.js"></script>
    <script src="/rec/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/rec/assets/lib/wow/dist/wow.js"></script>
    <script src="/rec/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="/rec/assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="/rec/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="/rec/assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="/rec/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="/rec/assets/lib/smoothscroll.js"></script>
    <script src="/rec/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="/rec/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="/rec/assets/js/plugins.js"></script>
    <script src="/rec/assets/js/main.js"></script>
</body>
</html>
