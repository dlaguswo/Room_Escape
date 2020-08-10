<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 반응형 meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=yes">

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
    
<link href="https://www.roomescape.co.kr/_template/assets/css/font.css?ver=" rel="stylesheet" />

<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>


<link href="https://www.roomescape.co.kr/_template/assets/css/reset.css?ver=171731" rel="stylesheet" />
<link href="https://www.roomescape.co.kr/_template/assets/css/style.css?ver=171731" rel="stylesheet" />

<link href="https://www.roomescape.co.kr/_template/assets/css/common.css?ver=171731" rel="stylesheet" />

<link href="https://www.roomescape.co.kr/_template/assets/css/header.css?ver=171731" rel="stylesheet" />
<link href="https://www.roomescape.co.kr/_template/assets/css/footer.css?ver=171731" rel="stylesheet" />

<link href="https://www.roomescape.co.kr/_template/assets/css/sub_banner.css?ver=171731" rel="stylesheet" />
<!-- <link href="https://www.roomescape.co.kr/_template/assets/css/sub_banner.css?ver=171731" rel="stylesheet" /> -->


<link href="https://www.roomescape.co.kr/_template/assets/css/board.css?ver=171731" rel="stylesheet" />
<link href="https://www.roomescape.co.kr/_template/assets/css/login_layer.css?ver=171731" rel="stylesheet" />
<link href="https://www.roomescape.co.kr/_template/assets/css/nonbootstrap.css?ver=171731" rel="stylesheet" />

<!-- include summernote css/js -->
<link href="https://www.roomescape.co.kr/_template/assets/css/summernote.css?ver=171731" rel="stylesheet" />
<script src="https://www.roomescape.co.kr/_template/assets/js/summernote.js?ver=171731"></script>

<!-- tweenmax libaray -->
<script src="https://www.roomescape.co.kr/_template/assets/js/TweenMax.min.js"></script>

<!--jquery UI libaray -->

<!-- safari browser css -->
<script src="https://www.roomescape.co.kr/_template/assets/js/safari.js"></script>

<script type="https://www.roomescape.co.kr/_template/assets/js/jquery.form.min.js"></script>
<script>
	var $assets_url = "https://www.roomescape.co.kr/_template/assets";
	var $home_url = "https://www.roomescape.co.kr";
</script>
<title>Post Update</title>
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

	function sendCheck() {
		var f = document.myForm;
		
		// 게시판 수정 검사
		
		if(!f.subject.value){
			alert("제목은 필수 입니다!!");
			f.subject.focus();
			return;
		}
		
		if(!f.bo_content.value){
			alert("내용은 필수 입니다!!");
			f.bo_content.focus();
			return;
		
		}
		
		f.method = "post";
		f.action = "<%=cp %>/escp/postUpdate_ok.do";
		f.submit();
	}
	
</script>
</head>
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60" class="board write">

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
		<div class="board_inner inner_1_depth"  style="background-color: white;">
			<div class="board_inner inner_2_depth" style="border-top: 1.5px solid black; border-bottom: 1.5px solid black; margin-top: 100px;" >
				<div class="remote_navi">
					<%-- <ul >
						<li class="active" style="margin-right: 75px;"><a href="<%=cp %>/escp/postList.do"> 자유게시판</a></li>
<!-- 						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=boardpan"> 보드판 갤러리</a></li>						
						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=party"> 일행구하기</a></li>					
						<li style="margin-right: 75px;"><a href="https://www.roomescape.co.kr/board/list.php?board=notice"> 공지사항</a></li> -->
					</ul> --%>
				</div>

				<div class="clearfix"></div>
				
				<div class="board_panel">
					<form class="boardFrm" name = "myForm" enctype="multipart/form-data">			
					<!-- 세션 로그인으로 수정해야함 -->
						<input type="hidden" name= "id" value = "${sessionScope.CustomInfo.id }"/>							
							<input type="text" class="input input_text" id="subject" name="bo_subject" placeholder="제목" value = "${dto.bo_subject}" />
							<input type="hidden" name = "exist_upload" value = "${dto.bo_imagename }"/>
							<input type="file" class="input input_text" name="upload" placeholder="파일" />
						<div class="clearfix"></div>

						<style>
							.board_option,
							.notice_option {
								width:100%;
								padding:10px;
								margin-bottom:20px;
							}
						</style>
						<img alt="" src="${imagePath }/${dto.bo_imagename }">
			  			<textarea rows="12" cols="63" name="bo_content" style="margin: 0px; width: 989px; height: 264px; margin-top: 20px;">${dto.bo_content }</textarea>
						<div>
							
						</div>
			  			<div class="boardFrm_btn">
			  				<input type = "hidden" name = "num" value = "${dto.bo_num }" />
							<input type = "hidden" name = "pageNum" value = "${pageNum }" />
							<input type = "hidden" name = "searchKey" value = "${searchKey }" />
							<input type = "hidden" name = "searchValue" value = "${searchValue }" />
							<input type = "button" style="background-color: #EAEAEA; margin-top: 15px;"class="boardFrm_submit" value="수정하기" onclick="sendCheck();">	
							<input type = "button" style="background-color: #EAEAEA; margin-top: 15px;" class="boardFrm_submit" value = "수정취소" onclick="javascript:location.href = '<%=cp %>/escp/postList.do?${params }'"/>			  							  											
			  			</div>
					</form>
				</div>
			</div>
		</div>

		<script src="https://www.roomescape.co.kr/_template/assets/js/exif.js"></script>
		
		<!-- <script>
			var char_min = parseInt(255);
    		var char_max = parseInt(10225);

			function isEmpty(value) { 
	            if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
	                return true 
	            } else { 
	                return false 
	            } 
	        }

	        function getParameterByName(name,url) {
	            if(!url) url = window.location.href;
	            name = name.replace(/[\[\]]/g,"\\$&");
	            var regex = new RegExp("[?&]"+name+"(=([^&#]*)|&|#|&)"),
	                results = regex.exec(url);
	            return results[2];
	        }
		</script>

		<script>
			$("#boardFrm_submit").click(function(e){

				e.preventDefault();	

				$.ajax({
		            url: "https://www.roomescape.co.kr/bbs/board.write.token.php",
		            type: "POST",
		            data: {
		                "subject": "11111"
		            },
		            dataType: "json",
		            cache: false,
		            success: function(data) {

						if(isEmpty($('textarea[name=bo_content]').val()) === true) {
							alert("내용을 입력해주세요.");					
							return false;
						} else {
							$("#boardFrm").submit();
						}
		            }
		        });
			});
		</script> -->
	</div>
</body>
</html>

