<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<!-- 반응형 meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=yes">

<!-- IE 대응 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
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

<link
	href="https://www.roomescape.co.kr/_template/assets/css/font.css?ver="
	rel="stylesheet" />

<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />


<link
	href="https://www.roomescape.co.kr/_template/assets/css/reset.css?ver=171731"
	rel="stylesheet" />
<link
	href="https://www.roomescape.co.kr/_template/assets/css/style.css?ver=171731"
	rel="stylesheet" />

<link
	href="https://www.roomescape.co.kr/_template/assets/css/common.css?ver=171731"
	rel="stylesheet" />

<link
	href="https://www.roomescape.co.kr/_template/assets/css/header.css?ver=171731"
	rel="stylesheet" />
<link
	href="https://www.roomescape.co.kr/_template/assets/css/footer.css?ver=171731"
	rel="stylesheet" />

<link
	href="https://www.roomescape.co.kr/_template/assets/css/sub_banner.css?ver=171731"
	rel="stylesheet" />
<!-- <link href="https://www.roomescape.co.kr/_template/assets/css/sub_banner.css?ver=171731" rel="stylesheet" /> -->




<link
	href="https://www.roomescape.co.kr/_template/assets/css/board.css?ver=171731"
	rel="stylesheet" />


<link
	href="https://www.roomescape.co.kr/_template/assets/css/login_layer.css?ver=171731"
	rel="stylesheet" />

<link
	href="https://www.roomescape.co.kr/_template/assets/css/nonbootstrap.css?ver=171731"
	rel="stylesheet" />


<!-- include summernote css/js -->
<link
	href="https://www.roomescape.co.kr/_template/assets/css/summernote.css?ver=171731"
	rel="stylesheet" />
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
 	
</style>
<script type="text/javascript">

	function sendIt() {
		
		f = document.myForm;
		
		f.action = "<%=cp%>/escm/main_ok.do?currentPage=${currentPage }";
		f.submit();
	}
</script>
<script src="https://www.roomescape.co.kr/_template/assets/js/summernote.js?ver=171731"></script>

<!-- tweenmax libaray -->
<script
	src="https://www.roomescape.co.kr/_template/assets/js/TweenMax.min.js"></script>

<!--jquery UI libaray -->

<!-- safari browser css -->
<script src="https://www.roomescape.co.kr/_template/assets/js/safari.js"></script>

<script
	type="https://www.roomescape.co.kr/_template/assets/js/jquery.form.min.js"></script>
<script>
	var $assets_url = "https://www.roomescape.co.kr/_template/assets";
	var $home_url = "https://www.roomescape.co.kr";
</script>
<title>Post Article</title>
</head>
<body class="board view" >

      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container" style="width:1140px;">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="<%=cp%>/escm/main.do">WIWI</a>
          </div>
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
			  <li style="padding-top: 18px;"><font size="2pt" color="white">${CustomInfo.id }님</font></li>
			  <li><a href="<%=cp%>/esct/mypage.do?id=${CustomInfo.id}">MYPAGE</a></li>
			  <li><a href="<%=cp%>/escc/Logout.do">Logout</a></li>
			  </c:if>
            </ul>
          </div>
        </div>
      </nav>	
      
      
	<div class="container">
		<div class="board_inner inner_1_depth" style="background-color: white;" >
			<div class="board_inner inner_2_depth" style="border-top: 1.5px solid black; border-bottom: 1.5px solid black; margin-top: 30px;">
				<div class="remote_navi">
<%-- 					<ul >
						<li class="active" style="margin-right: 75px;"><a href="<%=cp %>/escp/postList.do"> 자유게시판</a></li>
 						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=boardpan"> 보드판 갤러리</a></li>						
						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=party"> 일행구하기</a></li>					
						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=notice"> 공지사항</a></li> 
					</ul> --%>
				</div>

				<div class="clearfix"></div>

				<div class="board_panel">
					<div class="post_info">
						<div class="post_info_left">
							<div class="post_title">
								<h3>${dto.bo_subject}</h3>
							</div>
						</div>

						<div class="post_info_right">
							<div class="post_write_date">
								<span>${dto.bo_created }</span>
							</div>

							<div class="post_view_count">
								<span>조회수</span> <span>${dto.hit }</span>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="post_orther_info">

						<div class="post_orther_info_right">
							<div class="post_writer">
								<span>${dto.id }</span>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>


					<div class="board_main_text free">
						<div class="post_content">
							<img alt="" src="${imagePath }/${dto.bo_imagename }">
							<br><br>	
							<!-- 후기 내용 -->
							${dto.bo_content }
						</div>

						<hr class="hr" />

						<div class="clearfix"></div>
					</div>

					<div class="board_btn_box">
						<c:if test="${!empty sessionScope.CustomInfo.id && sessionScope.CustomInfo.id == dto.id}" >
							<div class="board_btn_box_inner left">
								<a href="<%=cp %>/escp/postUpdate.do?num=${dto.bo_num}&${params}" class="board_btn">수정</a>
								<a href="<%=cp %>/escp/postDelete.do?num=${dto.bo_num}&${params}" class="board_btn">삭제</a>
							</div>
						</c:if>
										
						<div class="board_btn_box_inner right">
							<a href="<%=cp %>/escp/postList.do?pageNum=${pageNum}" class="board_btn">목록</a>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="comments_box">
						<div class="comments_info">
							<span><i class="fa fa-comment"></i></span> <span>댓글</span>
						</div>
						<form method = "post" action="<%=cp%>/escp/comment.do">
							<div class="comment_write">
								<input type = "hidden" name = "id" value = "${sessionScope.CustomInfo.id }" />
								<input type = "hidden" name = "bo_num" value = "${dto.bo_num }" />
								<input type = "hidden" name = "pageNum" value = "${pageNum }"	/>			
								<c:choose>
									<c:when test="${!empty sessionScope.CustomInfo.id }">
										<textarea name="comment_box" class="comment_box" placeholder="댓글을 입력해주세요." type="textarea"></textarea>
									</c:when>
									<c:otherwise>
										<textarea name="comment_box" class="comment_box" placeholder="로그인 후 이용해주세요." type="textarea"></textarea>
									</c:otherwise>
								</c:choose>												
							
								<c:choose>
									<c:when test="${!empty sessionScope.CustomInfo.id }">
										<div class="comment_input_btn_box">
											<input type="submit" value="입력" style=" padding: 7px; width : 110px;  box-sizing: border-box; background: white; border: 1.5px solid #1b1b1b;" >
										</div>
									</c:when>								
								</c:choose>
								<div class="clearfix"></div>
							</div>
						</form>	
						<div class="clearfix"></div>
						<c:forEach var = "dto" items="${lists }">
							<div class="comment" id="comment_id_130">
								<div class="comment_info">
									<div class="comment_name">
										<span>
											
											
										</span>
										<span class="comments_writer_nickname">${dto.id }</span>
									</div>
	
								</div>
	
								<div class="comment_content">
									<span>${dto.co_content }</span>
								</div>
	
								<div class="comment_write_datetime">
									<span>${dto.co_created }</span>
									<span>
										<c:if test="${! empty sessionScope.CustomInfo.id && sessionScope.CustomInfo.id == dto.id }">
											<button type="button" class="comments_delete" onclick="location.href = '<%=cp %>/escp/comment_delete.do?pageNum=${pageNum }&num=${dto.bo_num }&co_num=${dto.co_num }'">삭제</button>
										</c:if>										
									</span>
								</div>
							</div>	
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	
	
</body>
</html>