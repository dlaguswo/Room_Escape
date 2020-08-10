<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.DTO.ThemaDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	Date time = new Date();
	SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
	String today = format1.format(time);
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
    <title>Article</title>
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
    <link rel="manifest" href="/rec/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
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
    <!-- 폰트링크 -->
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Jua&display=swap" rel="stylesheet">
    
	<script type="text/javascript">
		function sendIt() {
			
			var f = document.myForm;
			f.action = "<%=cp %>/esct/reviewWrite_ok.do";
			f.submit();
			
		}
		
		function saveIt(){
			
			var f = document.log;
	         
	         if(${empty xpage}){
	        	 
	         alert("WISH LIST에 추가되었습니다!!");
	         
	         f.action = "<%=cp%>/esct/mypage_in.do";
	         f.submit();
	         
	         }
	         
	         if(${!empty xpage}){
	            alert("이미 추가 되어있습니다!!");
	         }
			
		}
		
	</script>
	
	<style type="text/css">
	
.snow{
	font-family: 'East Sea Dokdo', cursive;
	font-size: 30px;
}
	
</style>
	
  </head>
  
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  
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
      

      <!-- 메인시작 -->
      
      <div class="main">
        <section class="module">
          <div class="container">
          
            <div class="row">
              <div class="col-sm-6 mb-sm-40"><a class="gallery">
              <img alt="포스터" src="${imagePath }${dto.imagefilename}"></a>
              </div>
              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">
                    <h1 class="product-title font-alt">${dto.the_name }</h1>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                  <c:forEach begin="1" end="${dto.the_level }" step="1">
                  <span><i class="fa fa-star star"></i></span>                  
                  </c:forEach>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="price font-alt"><span class="amount">${dto.playtime}</span></div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                  	<form>
                    <div class="description">
                      <textarea rows="14" cols="65" style="border: none;" readonly="readonly">${dto.the_story }</textarea>
                      
                    </div>
                    </form>
                  </div>
                </div>
                <form name="log">
                <div class="row mb-20">
                  <div class="col-xs-5"><a class="btn btn-lg btn-block btn-round btn-b" href="<%=cp%>/escb/bookmain.do?the_num=${dto.the_num }">예약하기</a></div>
                  
                  <c:if test="${!empty CustomInfo }">	
                   <div class="col-xs-5"><a class="btn btn-lg btn-block btn-round btn-b" href="javascript:void(0);" onclick="saveIt();">찜하기</a></div>
                   <input type="hidden" value="${dto.the_num }" name="the_num"/>
                   <input type="hidden" value="${CustomInfo.id }" name="id"/>
                  </c:if> 
                   
                </div>
                </form>
                <div class="row mb-20">
                  <div class="col-sm-12">
     
                  </div>
                </div>
              </div>
            </div>
            
            <br/><br/><br/><br/>
            
            <!-- 이미지 -->
            
            <hr class="divider-w">
		<section class="module-small">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h2 class="module-title font-alt">테마 추천</h2>
					</div>
				</div>
				<div class="row multi-columns-row">
					<c:forEach var="dao" items="${lists }">
		                  <c:if test="${dto.imagefilename != dao.imagefilename}">
		                     <div class="col-sm-6 col-md-3 col-lg-3">
		                        <div class="shop-item">
		                           <div class="shop-item-image">
		                              <img alt="" src="<%=cp%>/data/img/${dao.imagefilename}">
		                              <div class="shop-item-detail">
		                                 <a class="btn btn-round btn-b" href="<%=cp%>/esct/thema.do?the_num=${dao.the_num}">예약</a>
		                              </div>
		                           </div>
		                           <h4 class="shop-item-title font-alt snow">${dao.the_name }</h4>
		                        </div>
		                     </div>
		                  </c:if>
               		</c:forEach>
				</div>
				
				<br/><br/>
				<!-- 리뷰 시작 -->
				<div class="comment-form">
                  <h4 class="comment-form-title font-alt">Add your Review</h4>
                  <form name = "myForm">                    
                    <div class="form-group">
                      <section class="light" style="width: 40%;">	
                      		<b>체감난이도</b>
                      		<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_difficulty" value="매우 쉬움" checked="checked">
    							<span class="design"></span>
    							<span class="text">매우 쉬움</span>
  							</label>
  							
							<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_difficulty" value="쉬움">
    							<span class="design"></span>
    							<span class="text">쉬움</span>
  							</label>

 							<label style="margin-left: 10px;">
							    <input type="radio" name="review_rated_difficulty" value="보통">
							    <span class="design"></span>
							    <span class="text">보통</span>
							</label>
						
						  	<label style="margin-left: 10px;">
							    <input type="radio" name="review_rated_difficulty" value="어려움">
							    <span class="design"></span>
							    <span class="text">어려움</span>
							</label>
							
							<label style="margin-left: 10px;">
							    <input type="radio" name="review_rated_difficulty" value="매우 어려움">
							    <span class="design"></span>
							    <span class="text">매우 어려움</span>
							</label>		
						</section>
                    </div>
                    
                    <div class="form-group">
                      <section class="light" style="width: 30%;">
                      		<b>성공 여부</b>
							<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_success" value= "성공" checked="checked">
    							<span class="design"></span>
    							<span class="text">성공</span>
  							</label>

 							<label style="margin-left: 10px;">
							    <input type="radio" name="review_rated_success" value= "실패">
							    <span class="design"></span>
							    <span class="text">실패</span>
							</label>
						
						</section>
                    </div>
                    
                    
                    <div class="form-group">
                      <section class="light" style="width: 30%;">
                      		<b>별점</b>
							<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_star" value = "1" checked="checked">
    							<span class="design"></span>
    							<span class="text"><span><i class="fa fa-star star"></i></span> </span>
  							</label>

 							<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_star" value = "2">
    							<span class="design"></span>
    							<span class="text"><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span> </span>
  							</label>
						
						  	<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_star" value = "3">
    							<span class="design"></span>
    							<span class="text"><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span> </span>
  							</label>
							
							<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_star" value = "4">
    							<span class="design"></span>
    							<span class="text"><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span> </span>
  							</label>
  							
  							<label style="margin-left: 10px;">
    							<input type="radio" name="review_rated_star" value = "5">
    							<span class="design"></span>
    							<span class="text"><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span> </span>
  							</label>

						</section>
                    </div>
                   
                    <div class="form-group">
                    	<c:choose>
                    		<c:when test="${!empty sessionScope.CustomInfo.id }">
                    			<textarea class="form-control" id="comment" name="review_content" rows="4" placeholder="이 테마의 어떤점이 마음에 드셨나요?"></textarea>
                    		</c:when>
                    		<c:when test="${empty sessionScope.CustomInfo.id }">
								<textarea class="form-control" id="comment" name="review_content" rows="4" placeholder="로그인 후 이용해 주세요"></textarea>
							</c:when>
                    	</c:choose>                      
                    </div>
					<input type="hidden" name = "id" value = "${sessionScope.CustomInfo.id }"/>
					<input type="hidden" name = "the_num" value = "${dto.the_num }"/>
					<input type="hidden" name= "the_name" value="${dto.the_name}"/>
					<c:choose>
						<c:when test="${!empty sessionScope.CustomInfo.id }">
							<input type = "button" class="btn btn-round btn-d" onclick="sendIt();" value="등록하기" />
						</c:when>
						<c:when test="${empty sessionScope.CustomInfo.id }">
							<input type = "button" class="btn btn-round btn-d" onclick="javascript:location.href='<%=cp%>/escc/Login.do?the_num=${dto.the_num }';" value="등록하기" />
						</c:when>
					</c:choose>
                  </form>
                </div>
                                
                
                
                <br/><br/>
                    
              	<h4 class="comment-title font-alt">REVIEW</h4>
              	<br/><br/>
				<c:forEach var = "dto" items="${reviews }">  
                  <div class="comment clearfix">
                    <div class="comment-avatar"></div>
                    <div class="comment-content clearfix" style="border-bottom: 1px dotted #c2c2c2;">                               
                      <div class="comment-author font-alt">
                      	작성자:&nbsp;&nbsp; <b>${dto.id }</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      	체감난이도:&nbsp;&nbsp; <b>${dto.review_rated_difficulty }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      	별점:&nbsp;&nbsp; <b>
                      	<c:forEach begin="1" end="${dto.review_rated_star }" step="1">
                      		<span><i class="fa fa-star star"></i></span>
                      	</c:forEach>
                      	</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      	성공여부:&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.review_rated_success }</b>
                      </div>
                      <div class="comment-body">
                        <p><font size="4">${dto.review_content }</font></p>
                      </div>
                      <div class="comment-meta font-alt">${dto.re_created }&nbsp;&nbsp;&nbsp;&nbsp;
                      
                      
                     	<c:if test="${CustomInfo.id == dto.id }"> 
                      		<a href="<%=cp%>/esct/reviewWrite_de.do?re_num=${dto.re_num}&the_num=${dto.the_num}">삭제</a>
                      	</c:if>
                      	<c:if test="${CustomInfo.id != dto.id }"> 
                      		<a>삭제</a>
                      	</c:if>
                      	
                      	
                      </div>
                    </div>                  
                  </div>
				</c:forEach>
				</div>   
        </section>
        </div>
        </section>
			</div>
			
			
<!-- 내용 밑 -->
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
      
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>

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