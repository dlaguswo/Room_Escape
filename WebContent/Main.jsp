<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>WIWI</title>
    <!--  
    Favicons
    =============================================
    -->
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

    <!-- Default stylesheets-->
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
    
<!--  폰트 링크 -->  
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Jua&display=swap" rel="stylesheet">

<style type="text/css">

.main_button{
 	width: auto;
 	float : left;
 	padding-left: 100px;
 	padding-top: 35%;
}

.main_button2{
 	width: auto;
 	float : right;
 	padding-right: 100px;
 	padding-top: 35%;
}

.checkfont {
  font-family: 'Jua', sans-serif;
  font-size: 16px;
  color: #403866;
}

.snow{
font-family: 'East Sea Dokdo', cursive;
font-size: 30px;
}

.module,
.module-small {
  position: relative;
  padding-top: 200px;
  padding-bottom: 200px;
  background-repeat: no-repeat;
  background-position: 50% 50%;
  background-size: cover;
} 	
.module-medium {
  padding: 0px;
}
.comments,
.comment-form {
  margin: 40px 0 0;
}

.flexslider .slides img {
  height: 590px;
  -moz-user-select: none;
}
.flex-viewport {
  max-height: 590px;
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -ms-transition: all 1s ease;
  -o-transition: all 1s ease;
  transition: all 1s ease;
} 	
 	

</style>
 
<script type="text/javascript">

	function sendIt() {
		
		f = document.myForm;
		
		f.action = "<%=cp%>/escm/main_ok.do?currentPage=${currentPage }";
		f.submit();
	}
	
	function noneYeak() {
		   
		   if(${!empty msg}){
		      
		   alert("예약정보가 존재하지 않습니다!!!");
		   
		   }

	}

</script>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" onload="noneYeak();">
    <main>
 
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
      
<!--  ㅇㅣㅁㅣ지 -->
	<section class="bg-dark-30 showcase-page-header module parallax-bg module-medium">
          <div class="testimonials-slider">
            <ul class="slides">
              <li>
				<img src="<%=cp %>/data/img/index/index1.gif" width="1920px" >
              </li>
              <li>
				<img src="<%=cp %>/data/img/index/index2.gif" width="1920px" >       
              </li>
              <li>  
				<img src="<%=cp %>/data/img/index/index3.gif" width="1920px" >    
              </li>
            </ul>
          </div>
        </section>

<!--  체크박스  -->  
	<form action="" method="post" name="myForm">
	<div class="container">
	<section class="module-medium" id="demos">
		<div class="comment-form">	
			<hr class="divider-w mt-10 mb-20">
			<div class="checkfont well well-lg"><strong><font size="3px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>지&nbsp;점&nbsp;선&nbsp;택</b></font></strong>
					<input type="radio"  name="chain" value="1" checked="checked" style="margin-left: 50px;">&nbsp;&nbsp;강남점
					<input type="radio" name="chain" value="0" style="margin-left: 50px">&nbsp;&nbsp;홍대점
			</div>
					
			<div class="checkfont well well-lg"><strong><font size="3px;">
	              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	              	<b>테&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마&nbsp;&nbsp;</b></font></strong>
				<input type="checkbox" value="0" name="thema" style="margin-left: 30px">&nbsp;코믹
				<input type="checkbox" value="1" name="thema" style="margin-left: 30px">&nbsp;액션
				<input type="checkbox" value="2" name="thema" style="margin-left: 30px">&nbsp;드라마
				<input type="checkbox" value="3" name="thema" style="margin-left: 30px">&nbsp;역사
				<input type="checkbox" value="4" name="thema" style="margin-left: 30px">&nbsp;로맨스/감성
				<input type="checkbox" value="5" name="thema" style="margin-left: 30px">&nbsp;공포/스릴러
				<input type="checkbox" value="6" name="thema" style="margin-left: 30px">&nbsp;추리
				<input type="checkbox" value="7" name="thema" style="margin-left: 30px">&nbsp;미스터리
				<input type="checkbox" value="8" name="thema" style="margin-left: 30px">&nbsp;힐링
				<input type="checkbox" value="9" name="thema" style="margin-left: 30px">&nbsp;기타				
			</div>
				
			<div class="checkfont well well-lg"><strong><font size="3px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>난&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;도</b></font></strong>
					<input type="radio" name="level" value="1" style="margin-left: 50px">&nbsp;&nbsp;<span><i class="fa fa-star star"></i></span>
					<input type="radio" name="level" value="2" style="margin-left: 50px">&nbsp;&nbsp;<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span>
					<input type="radio" name="level" value="3" style="margin-left: 50px">&nbsp;&nbsp;<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span>
					<input type="radio" name="level" value="4" style="margin-left: 50px">&nbsp;&nbsp;<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span>
					<input type="radio" name="level" value="5" style="margin-left: 50px">&nbsp;&nbsp;<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span>
			</div>
			<hr class="divider-w mt-10 mb-20">				
			<div align="center">
				<button class="btn btn-round btn-d" type="submit" onclick="sendIt();">SEARCH</button>
			</div>
		</div>
	</section>
	</div>
	
  	</form>
  	
	<form action="" method="post">
		<div class="main showcase-page">
        
        <!--  페이징 화살표 -->
			<div class="main_button ">
				<a href="<%=cp%>/escm/main.do?pageNum=${prePageNum}">
				<img class="content_center" alt="화살표" src="<%=cp %>/data/img/left.png" width="40" height="40" align="middle">
				</a>
			</div>

		<!--  페이징 화살표 -->
			<div class="main_button2">
				<a href="<%=cp%>/escm/main.do?pageNum=${nextPageNum }">
				<img class="content_center" alt="화살표" src="<%=cp %>/data/img/right.png" width="40" height="40" align="middle">
				</a>
			</div>
		
		<!--  메인 내용 -->
			<div class="container">
				<div class="row multi-columns-row">
					<c:forEach var="dto" items="${lists }" begin="0" end="10" step="1">
						<div class="col-md-4 col-sm-6 col-xs-12"><a class="content-box" href="<%=cp%>/esct/thema.do?the_num=${dto.the_num }">
						<div class="content-box-image"><img alt="포스터" src="${imagePath }${dto.imagefilename}"></div>
						<h3 class="snow">${dto.the_name }</h3> </a></div>
            		</c:forEach>
            	</div>
			</div>
		</div>
	</form>

	<!--  내용 밑 -->
   <section class="module-extra-small bg-dark">
      <div class="container">
         <div class="row">
            <div class="col-sm-6 col-md-12 col-lg-12">
               <div class="callout-text font-alt">
                  <p style="margin-bottom: 0px;">미안하다 이거 보여주려고 어그로끌었다.. 
                  임현재 박서연 싸움수준 ㄹㅇ실화냐? 진짜 6 강의장 최강자들의 싸움이다.. 
                  그 지각하던 임현재가 맞나? 진짜 임현재는 전설이다..진짜 맨날 임현재 봘는데 병같은존재인 지각왕이 되서 세계최강 전설적인 자긱쟁이가된 임현재보면 진짜 내가다 감격스럽고 레드벨벳 노래부터 명장면까지 가슴울리는장면들이 뇌리에 스치면서 가슴이 웅장해진다.. 
                  그리고 극장판에 이건우앞에 운석날라오는 거대한 걸 박서연이 갑자기 순식간에 나타나서 부숴버리곤 개간지나게 임현재가 없다면 강의실을 지킬 자는 나밖에 없다
                   라며 바람처럼 사라진장면은 진짜 학원처음부터 온사람이면 안울수가없더라 진짜 너무 감격스럽고 프로젝트를 최근에 알았는데 미안하다..
                    지금 20화보는데 진짜 임현재나와서 너무 감격스럽고 모두어엿하게 큰거보니 내가 다 뭔가 알수없는 추억이라해야되나 그런감정이 이상하게 얽혀있다.. 
                    태양은 말이많아진거같다 좋은 팀원이고..그리고 박서연왜욕하냐 귀여운데 임현재를보는것같다 성격도 닮았어 
                    그리고 강의실에 박서연 임현재 둘이싸워도 못당하는 강사님같은존재 나온다는게 사실임?? 그리고 인터닛에 쳐봣는디 이거 ㄹㅇㄹㅇ 진짜팩트냐?? 
                    저적이 강의실에 나오는 신급임?ㅡ 임현재 박서연 싸우는거봐라 진짜 ㅆㅂ 이거보고 개충격먹어가지고 와 소리 저절로 나오더라 ;; 진짜 저건 개오지는데.. 
                    저게 ㄹㅇ이면 진짜 꼭봐야돼 진짜 강의실도 파괴시키는거아니야 .. 와 진짜 임현재 박서연이 저렇게 되다니 진짜 눈물나려고했다.. 강의실이라서 계속보는중인데 저거 ㄹㅇ이냐..? 
                    하.. ㅆㅂ 집에가고싶다..  진짜 언제 이렇게 되었을까 옛날생각나고 나 중딩때생각나고 뭔가 슬프기도하고 좋기도하고 감격도하고 여러가지감정이 복잡하네.. 
                    아무튼 프로젝트는 최거작임..</p>
                   </div>
            </div>
            </div>
      </div>
   </section>
	<div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>\
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
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