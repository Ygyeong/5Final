<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Camp Tip</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/js/jquery.multiscroll.js"></script>
<link rel="stylesheet" type="text/css"
	href="/css/jquery.multiscroll.css" />
<link rel="stylesheet" type="text/css" href="/css/camp_tip.css" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Fonts and Material Icons -->
<link rel="stylesheet" as="font"
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,600,700|Material+Icons" />

<!-- Font-Style -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<!--네비바 링크  -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js"
	crossorigin="anonymous"></script>

<script>
	$(function() {	
		$('#myContainer').multiscroll({
			sectionsColor : [ '#ffffff', '#ffffff', '#ffffff', '#ffffff' ],
			anchors : [ 'first', 'second', 'third', 'fourth' ],
			menu : '#menu',
			css3 : true,
			paddingTop : '70px',
			paddingBottom : '70px'
		});
		$(".write").on("click", function() {
			location.href = "/CampTipBoard/write";
		})
		
		$("#back").on("click", function() {
			location.href = "javascript:history.back()";
		})
		// **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	      
	});
    function list(page){
        location.href="${path}/CampTipBoard/selectAll?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }    
</script>
<style>
.boardlistMain { /*게시물 컬럼*/
	border-top: 2px solid gray;
	border-bottom: 1px solid gray;
	height: 70px;
	line-height: 60px;
}

.boardlist { /*게시글 리스트*/
	border-bottom: 1px solid gray;
	line-height: 45px;
}

.boardlist>#titleMove>a { /* 타이틀 클릭시 효과 */
	color: black;
	text-decoration: none;
}

.search_box {
	width: 1000px;
	margin: auto;
}
.container{
	max-width: 850px;
}

#boardlist{text-align: center;}
#header {top: 0px;}
#footer {bottom: 0px;}
#menu {top: 65px;}

.logo {
	pointer-events: none;
	color: white;
	background-color: #00000095;
	width: 200px;
	height: 75px;
	margin: 0 auto;
	border-radius: 30px;
}

.logo>img {width: 150px;height: 75px;}

#springImg>img {
	padding-left: 10px;
	float: left;
	width: 50%;
	height: 100%;
}

#springText>* {
	text-align: center;
	line-height: 75px;
}
#myContainer{padding-top: 10px;}
.ms-left{top:20px !important;}

/*네비바 스타일  */
:root { -
	-text-color: #f0f4f5; -
	-background-color: #263343; -
	-accent-color: steelblue;
}

body {margin: 0;}
a {text-decoration: none;color: white;}
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #263343;
	padding: 8px 12px;
}
.navbar {
	z-index: 1;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
}
.navbar_logo {
	font-size: 32px;
	color: white;
	font-family: 'Nanum Brush Script';
}
.navbar_logo i {color: white;}

.navbar_menu {
	display: flex;
	list-style: none;
	padding-left: 0;
	margin-bottom: -3px;
}

.navbar_menu li {padding: 8px 12px;}
.navbar_menu li:hover {
	background-color: steelblue;
	border-radius: 4px;
}

.navbar_member {
	list-style: none;
	color: white;
	display: flex;
	padding-left: 0;
	margin-bottom: -3px;
}
.navbar_member li {padding: 8px 12px;}
.navbar_toogleBtn {
	display: none;
	position: absolute;
	right: 32px;
	font-size: 24px;
}

@media screen and (max-width: 768px) {
	.navbar {
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
	}
	.navbar_menu {
		display: none;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	.navbar_menu li {
		width: 100%;
		text-align: center;
	}
	.navbar_member {
		display: none;
		justify-content: center;
		width: 100%;
	}
	.navbar_toogleBtn {
		display: block;
	}
	.navbar_menu.active, .navbar_member.active {
		display: flex;
	}
}

/*네비바 스타일 끝  */
#titleMove>*{color: black;}
#boardlist>*{color: black;}
#menu>li{background-color: #0f4c8199;}
#menu>li:hover{background-color: #0f4c8170;}
</style>
</head>

<body>
	<!--nav bar  -->
	<c:choose>
		<c:when test="${loginID == null }">
			<nav class="navbar">
				<div class="navbar_logo">

					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>

				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="">캠핑정보</a></li>
					<li><a href="/products/selectAll">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>

				</ul>
				<ul class="navbar_member">
					<li><a href="/member/signUp">회원가입</a></li>
					<li><a href="/member/loginPage">로그인</a></li>
				</ul>

				<a href="#" class="navbar_toogleBtn"> <i class="fas fa-bars"></i>
				</a>
			</nav>

		</c:when>
		<c:when test="${loginID =='admin'}">
			<nav class="navbar">
				<div class="navbar_logo">

					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>

				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="">캠핑정보</a></li>
					<li><a href="/products/selectAll">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>

				</ul>
				<ul class="navbar_member">
					<li><a href="">관리자페이지</a></li>
					<li><a href="/member/logOutProc">로그아웃</a></li>
				</ul>

				<a href="#" class="navbar_toogleBtn"> <i class="fas fa-bars"></i>
				</a>
			</nav>

		</c:when>
		<c:otherwise>
			<nav class="navbar">
				<div class="navbar_logo">

					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>

				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list">캠핑장</a></li>
					<li><a href="/CampTipBoard/selectAll">캠핑정보</a></li>
					<li><a href="/products/selectAll">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>

				</ul>
				<ul class="navbar_member">
					<li><a href="/member/myPage">마이페이지</a></li>
					<li><a href="/memeber/logOutProc">로그아웃</a></li>
				</ul>

				<a href="#" class="navbar_toogleBtn"> <i class="fas fa-bars"></i>
				</a>
			</nav>

		</c:otherwise>

	</c:choose>

	<div id="myContainer">
		<ul id="menu">
			<li data-menuanchor="first"><a href="#first">봄</a></li>
			<li data-menuanchor="second"><a href="#second">여름</a></li>
			<li data-menuanchor="third"><a href="#third">가을</a></li>
			<li data-menuanchor="fourth"><a href="#fourth">겨울</a></li>
		</ul>
		<div class="ms-left">
			<div class="ms-section" id="left1">
				<div id="springImg">
					<img src="/resources/assets/img/background/spring.jpg">
				</div>
				<div id="springText">
					<h3>추위 조심</h3>
					<h4>핫팩 필수</h4>
					<h3>벌레 조심</h3>
					<h4>벌레 퇴치제 필수</h4>
					<h3>뱀 조심!</h3>
					<h4>물리면 즉시 119</h4>
				</div>
			</div>
			<div class="ms-section" id="left2">
				<div id="springImg">
					<img src="/resources/assets/img/background/summer.jpg">
				</div>
				<div id="springText">
					<h3>날씨 조심!</h3>
					<h4>폭염과 장마 그리고 태풍</h4>
					<h3>화재 조심!</h3>
					<h4>가스버너는 조심히 다뤄주세요.</h4>
					<h3>해충 조심!</h3>
					<h4>몸을 보호할 겉옷이 필요해요</h4>
				</div>
			</div>
			<div class="ms-section" id="left3">
				<div id="springImg">
					<img src="/resources/assets/img/background/autumn.jpg">
				</div>
				<div id="springText">
					<h3>날씨 조심!</h3>
					<h4>일교차가 커요</h4>
					<h3>화재 조심!</h3>
					<h4>화재사고가 흔한 계절!</h4>
					<h3>뱀, 독충 조심!</h3>
					<h4>몸을 보호할 겉옷이 필요해요</h4>
				</div>
			</div>
			<div class="ms-section" id="left4">
				<div id="springImg">
					<img src="/resources/assets/img/background/winter.jpg">
				</div>
				<div id="springText">
					<h3>날씨 조심!</h3>
					<h4>방한도구 꼼꼼히 확인</h4>
					<h3>가스 조심!</h3>
					<h4>가스 중독사고가 흔한 계절!</h4>
					<h3>화재 조심!</h3>
					<h4>난방용품 수시 점검해요</h4>
				</div>
			</div>
		</div>

		<div class="ms-right">
			<div class="ms-section" id="right1">
				<div class="container">
					<input type="hidden" id="category" name="category" value="1">
					<div class="logo">
						<a href="/" title="Slides Framework"
							style="font-family: 'Nanum Brush Script'; font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png"
							style="width: 60px; height: 50px; margin-bottom: -6px; margin-right: -10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-1">분류</div>
								<div class="col-1">번호</div>
								<div class="col-3">제목</div>
								<div class="col-3">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>

							<c:forEach var="i" items="${map.list}">

								<div class="row boardlist">
									<div class="col-1">${i.category}</div>
									<div class="col-1">${i.camp_tip_num}</div>
									<div class="col-3" id="titleMove">
										<a
											href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}" id="titleLink">${i.title}</a>
									</div>
									<div class="col-3">${i.writer}</div>
									<div class="col-2">${i.write_date}</div>
									<div class="col-2">${i.view_count}</div>
								</div>

							</c:forEach>

							<div id="boardlist">
								<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('1')">[처음]</a>
								</c:if>
								<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
								</c:if>
								<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								<c:forEach var="p" begin="${map.boardPager.blockBegin}"
									end="${map.boardPager.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${p == map.boardPager.curPage}">
											<span style="color: red">${p}</span>&nbsp;
										</c:when>
										<c:otherwise>
											<a href="javascript:list('${p}')">${p}</a>&nbsp;
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
								<c:if
									test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
									<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
								</c:if>
								<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
									<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
								</c:if>
							</div>

							<div class="row btns">
								<div class="col-12 btns" align="right">
									<br>
									<button type="button" class="btn btn-outline-secondary"
										id="back">뒤로가기</button>
									<button type="button" class="btn btn-outline-secondary write"
										id="write">글 쓰기</button>
								</div>
							</div>

							<div class="search_box">
								<br>
								<form
									action="${pageContext.request.contextPath}/CampTipBoard/selectAll?curPage='+page+'&searchOption-${map.searchOption}'+'&keyword=${map.keyword}"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="searchOption"
												id="srch_item">
												<option value="">선택해주세요</option>
												<option value="writer"
													<c:out value="${map.searchOption == 'writer'?'selected':''}"/>>작성자</option>
												<option value="contents"
													<c:out value="${map.searchOption == 'contents'?'selected':''}"/>>내용</option>
												<option value="title"
													<c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value=""> <input
												type="hidden" name="cpage" value="1">
										</div>
										<div class="col-2">
											<button type="submit" class="btn btn-dark mb-2 w-100"
												id="btn_srch">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ms-section" id="right2">
				<div class="container">
					<input type="hidden" id="category" name="category" value="1">
					<div class="logo">
						<a href="/" title="Slides Framework"
							style="font-family: 'Nanum Brush Script'; font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png"
							style="width: 60px; height: 50px; margin-bottom: -6px; margin-right: -10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-1">분류</div>
								<div class="col-1">번호</div>
								<div class="col-3">제목</div>
								<div class="col-3">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>

							<c:forEach var="i" items="${map.list}">

								<div class="row boardlist">
									<div class="col-1">${i.category}</div>
									<div class="col-1">${i.camp_tip_num}</div>
									<div class="col-3" id="titleMove">
										<a
											href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}" id="titleLink">${i.title}</a>
									</div>
									<div class="col-3">${i.writer}</div>
									<div class="col-2">${i.write_date}</div>
									<div class="col-2">${i.view_count}</div>
								</div>

							</c:forEach>

							<div id="boardlist">
								<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('1')">[처음]</a>
								</c:if>
								<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
								</c:if>
								<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								<c:forEach var="p" begin="${map.boardPager.blockBegin}"
									end="${map.boardPager.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${p == map.boardPager.curPage}">
											<span style="color: red">${p}</span>&nbsp;
										</c:when>
										<c:otherwise>
											<a href="javascript:list('${p}')">${p}</a>&nbsp;
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
								<c:if
									test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
									<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
								</c:if>
								<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
									<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
								</c:if>
							</div>

							<div class="row btns">
								<div class="col-12 btns" align="right">
									<br>
									<button type="button" class="btn btn-outline-secondary"
										id="back">뒤로가기</button>
									<button type="button" class="btn btn-outline-secondary write"
										id="write">글 쓰기</button>
								</div>
							</div>

							<div class="search_box">
								<br>
								<form
									action="${pageContext.request.contextPath}/CampTipBoard/selectAll?curPage='+page+'&searchOption-${map.searchOption}'+'&keyword=${map.keyword}"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="searchOption"
												id="srch_item">
												<option value="">선택해주세요</option>
												<option value="writer"
													<c:out value="${map.searchOption == 'writer'?'selected':''}"/>>작성자</option>
												<option value="contents"
													<c:out value="${map.searchOption == 'contents'?'selected':''}"/>>내용</option>
												<option value="title"
													<c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value=""> <input
												type="hidden" name="cpage" value="1">
										</div>
										<div class="col-2">
											<button type="submit" class="btn btn-dark mb-2 w-100"
												id="btn_srch">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ms-section" id="right3">
				<div class="container">
					<input type="hidden" id="category" name="category" value="1">
					<div class="logo">
						<a href="/" title="Slides Framework"
							style="font-family: 'Nanum Brush Script'; font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png"
							style="width: 60px; height: 50px; margin-bottom: -6px; margin-right: -10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-1">분류</div>
								<div class="col-1">번호</div>
								<div class="col-3">제목</div>
								<div class="col-3">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>

							<c:forEach var="i" items="${map.list}">

								<div class="row boardlist">
									<div class="col-1">${i.category}</div>
									<div class="col-1">${i.camp_tip_num}</div>
									<div class="col-3" id="titleMove">
										<a
											href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}" id="titleLink">${i.title}</a>
									</div>
									<div class="col-3">${i.writer}</div>
									<div class="col-2">${i.write_date}</div>
									<div class="col-2">${i.view_count}</div>
								</div>

							</c:forEach>

							<div id="boardlist">
								<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('1')">[처음]</a>
								</c:if>
								<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
								</c:if>
								<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								<c:forEach var="p" begin="${map.boardPager.blockBegin}"
									end="${map.boardPager.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${p == map.boardPager.curPage}">
											<span style="color: red">${p}</span>&nbsp;
										</c:when>
										<c:otherwise>
											<a href="javascript:list('${p}')">${p}</a>&nbsp;
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
								<c:if
									test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
									<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
								</c:if>
								<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
									<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
								</c:if>
							</div>

							<div class="row btns">
								<div class="col-12 btns" align="right">
									<br>
									<button type="button" class="btn btn-outline-secondary"
										id="back">뒤로가기</button>
									<button type="button" class="btn btn-outline-secondary write"
										id="write">글 쓰기</button>
								</div>
							</div>

							<div class="search_box">
								<br>
								<form
									action="${pageContext.request.contextPath}/CampTipBoard/selectAll?curPage='+page+'&searchOption-${map.searchOption}'+'&keyword=${map.keyword}"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="searchOption"
												id="srch_item">
												<option value="">선택해주세요</option>
												<option value="writer"
													<c:out value="${map.searchOption == 'writer'?'selected':''}"/>>작성자</option>
												<option value="contents"
													<c:out value="${map.searchOption == 'contents'?'selected':''}"/>>내용</option>
												<option value="title"
													<c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value=""> <input
												type="hidden" name="cpage" value="1">
										</div>
										<div class="col-2">
											<button type="submit" class="btn btn-dark mb-2 w-100"
												id="btn_srch">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ms-section" id="right4">
				<div class="container">
					<input type="hidden" id="category" name="category" value="1">
					<div class="logo">
						<a href="/" title="Slides Framework"
							style="font-family: 'Nanum Brush Script'; font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png"
							style="width: 60px; height: 50px; margin-bottom: -6px; margin-right: -10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-1">분류</div>
								<div class="col-1">번호</div>
								<div class="col-3">제목</div>
								<div class="col-3">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>

							<c:forEach var="i" items="${map.list}">

								<div class="row boardlist">
									<div class="col-1">${i.category}</div>
									<div class="col-1">${i.camp_tip_num}</div>
									<div class="col-3" id="titleMove">
										<a
											href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}" id="titleLink">${i.title}</a>
									</div>
									<div class="col-3">${i.writer}</div>
									<div class="col-2">${i.write_date}</div>
									<div class="col-2">${i.view_count}</div>
								</div>

							</c:forEach>

							<div id="boardlist">
								<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('1')">[처음]</a>
								</c:if>
								<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curBlock > 1}">
									<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
								</c:if>
								<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								<c:forEach var="p" begin="${map.boardPager.blockBegin}"
									end="${map.boardPager.blockEnd}">
									<!-- **현재페이지이면 하이퍼링크 제거 -->
									<c:choose>
										<c:when test="${p == map.boardPager.curPage}">
											<span style="color: red">${p}</span>&nbsp;
										</c:when>
										<c:otherwise>
											<a href="javascript:list('${p}')">${p}</a>&nbsp;
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
								<c:if
									test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
									<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
								</c:if>
								<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
									<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
								</c:if>
							</div>

							<div class="row btns">
								<div class="col-12 btns" align="right">
									<br>
									<button type="button" class="btn btn-outline-secondary"
										id="back">뒤로가기</button>
									<button type="button" class="btn btn-outline-secondary write"
										id="write">글 쓰기</button>
								</div>
							</div>

							<div class="search_box">
								<br>
								<form
									action="${pageContext.request.contextPath}/CampTipBoard/selectAll?curPage='+page+'&searchOption-${map.searchOption}'+'&keyword=${map.keyword}"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="searchOption"
												id="srch_item">
												<option value="">선택해주세요</option>
												<option value="writer"
													<c:out value="${map.searchOption == 'writer'?'selected':''}"/>>작성자</option>
												<option value="contents"
													<c:out value="${map.searchOption == 'contents'?'selected':''}"/>>내용</option>
												<option value="title"
													<c:out value="${map.searchOption == 'title'?'selected':''}"/>>제목</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value=""> <input
												type="hidden" name="cpage" value="1">
										</div>
										<div class="col-2">
											<button type="submit" class="btn btn-dark mb-2 w-100"
												id="btn_srch">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    
    
    const toogleBtn = document.querySelector('.navbar_toogleBtn');
    const menu = document.querySelector('.navbar_menu');
    const member = document.querySelector('navbar_member');


    toogleBtn.addEventListener('click', () => {

        menu.classList.toggle('active');
        member.classList.toggle('active');


    });
    
    </script>

	<script botId="B2pe9j" src="https://www.closer.ai/js/webchat.min.js"></script>
	
</body>

</html>