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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script
	src="https://www.roomescape.co.kr/_template/assets/js/summernote.js?ver=171731"></script>

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
<style type="text/css">
select {
	width: 100px; /* 원하는 너비설정 */
	height: 39px;
	font-size: 14px;
	text-align-last: center;
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url('이미지 경로') no-repeat 95% 50%;
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-moz-appearance: none;
	appearance: none;
}
.page_info_ {
    float: left;
    width: 130px;
    height: 45px;
}

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
		var f = document.myForm;
		f.action = "<%=cp %>/escp/postList.do";
		f.submit();
	}
</script>
<title>Post List</title>
</head>
<body class="board list">

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
      
	<div class="board_inner inner_1_depth" style="background-color: white;">
		<div class="board_inner inner_2_depth">
		<div class="remote_navi" >
<%-- 					<ul >
						<li class="active" style="margin-right: 75px;"><a href="<%=cp %>/escp/postList.do"> 자유게시판</a></li>
						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=boardpan"> 보드판 갤러리</a></li>						
						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=party"> 일행구하기</a></li>					
						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=notice"> 공지사항</a></li> 
					</ul> --%>
				</div>
			<div class="clearfix"></div>
			<div class="board_panel">
				<div class="cap">
					<div class="page_info" >
						<!-- 페이지 정보 -->
						<span style="width: 20px;">페이지정보 : ${currentPage }/${totalPage }</span>
					</div>
					<form action = "<%=cp %>/escp/postList.do" method = "get" name = "myForm">
						<div class="search">
							<div class="keyword">
								<select name = "searchKey" class="selectField" >
									<option value="total">전체</option>
									<option value="bo_subject">제목</option>
									<option value="id">작성자</option>
									<option value="bo_content">내용</option>
								</select>
								&nbsp;
							</div>
							<div class="keyword">
								<input type="text" name="searchValue" id="search_query"
									class="search_query" style="width: calc(100% - 66px)" />
								<button id = "search" type = "button" onclick="sendIt();">
									<i class = "fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>

				<div class="clearfix"></div>

				<div class="table">
					<table >
						<thead>
							<tr>
								<th class="tag numb">번호</th>
								<th class="tag subject">제목</th>
								<th class="tag name" align="center">닉네임</th>
								<th class="tag date">등록일</th>
								<th class="tag view">조회수</th>
							</tr>
						</thead>

						<tbody>
							<!-- DB C:forEach -->
							<c:forEach var="dto" items="${lists }">
								<tr class="notice">
									<td class="value numb" style="color: #121212; font-weight: 900;">${dto.bo_num }&nbsp;</td>
									<td class="value subject">					
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "${articleUrl }&num=${dto.bo_num}">${dto.bo_subject }</a>
										[${dto.cnt }]										
									</td>									
									<td class="value name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.id }</td>
									<td class="value date">${dto.bo_created}</td>
									<td class="value view">${dto.hit}</td>
								</tr>
							</c:forEach>
							<!-- DB C:forEach -->																																
						</tbody>
					</table>
				</div>

				<div class="pagination">
					<div id = "footer" align="center">
						<c:if test="${dataCount != 0}">
							${pageIndexList }
						</c:if>
						<c:if test="${dataCount == 0 }">
							등록된 게시물이 없습니다
						</c:if>
					</div>
				</div>
			</div>
						
			<div class="board_btn" >
				<c:if test="${!empty sessionScope.CustomInfo.id}"> 
					<input type = "button" style="background-color: #EAEAEA;" value = "글쓰기" class = "btn_write" onclick="javascript:location.href = '<%=cp %>/escp/postWrite.do';" > 
				</c:if>
				<c:if test="${empty sessionScope.CustomInfo.id}">
					<input type = "button" style="background-color: #EAEAEA;" value = "글쓰기" class = "btn_write" onclick="javascript:location.href = '<%=cp %>/escc/Login.do?cpage=1';"> 				
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>

