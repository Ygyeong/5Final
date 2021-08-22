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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

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
	      
	});
</script>
<style>
a{color:inherit;text-decoration: none;}
/* Fixed header and footer.
		* --------------------------------------- */
#header, #footer {
	position: fixed;
	height: 50px;
	display: block;
	width: 100%;
	background: #333;
	z-index: 9;
	text-align: center;
	color: #f2f2f2;
	padding: 20px 0 0 0;
}

#header {
	top: 0px;
}

#footer {
	bottom: 0px;
}

#menu {
	top: -6px;
}
.logo{
	pointer-events:none;
	color:white;
	background-color:#00000095;
	width: 200px;
	height: 75px;
	margin: 0 auto;
	border-radius: 30px;
	}
.logo>img {
	width: 150px;
	height: 75px;
}
</style>
</head>

<body>

	<div id="header">Header</div>
	<div id="footer">Footer</div>

	<ul id="menu">
		<li data-menuanchor="first"><a href="#first">봄</a></li>
		<li data-menuanchor="second"><a href="#second">여름</a></li>
		<li data-menuanchor="third"><a href="#third">가을</a></li>
		<li data-menuanchor="fourth"><a href="#fourth">겨울</a></li>
	</ul>

	<div id="myContainer">

		<div class="ms-left">
			<div class="ms-section" id="left1">
				<h1>봄 캠핑 장단점</h1>
			</div>
			<div class="ms-section" id="left2">
				<h1>여름 캠핑 장단점</h1>
			</div>
			<div class="ms-section" id="left3">
				<h1>가을 캠핑 장단점</h1>
			</div>
			<div class="ms-section" id="left4">
				<h1>겨울 캠핑 장단점</h1>
			</div>
		</div>

		<div class="ms-right">
			<div class="ms-section" id="right1">
				<div class="container">
					<div class="logo">
						<a href="/" title="Slides Framework" style="font-family: 'Nanum Brush Script';font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png" style="width:60px;height:50px;margin-bottom:-6px;margin-right:-10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-2">글번호</div>
								<div class="col-4">제목</div>
								<div class="col-2">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>
							
							<c:forEach var="i" items="${list}">
								<c:if test="${i.category == 1 }">
									<div class="row boardlist">
										<div class="col-2">${i.camp_tip_num}</div>
										<div class="col-4" id="titleMove">
											<a href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}">${i.title}</a>
										</div>
										<div class="col-2">${i.writer}</div>
										<div class="col-2">${i.write_date}</div>
										<div class="col-2">${i.view_count}</div>
									</div>
								</c:if>
							</c:forEach>

							<div id="boardlist">
								                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
								                <c:if test="${map.dto.curBlock > 1}">
								                    <a href="javascript:list('1')">[처음]</a>
								                </c:if>
								                
								                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
								                <c:if test="${map.dto.curBlock > 1}">
								                    <a href="javascript:list('${map.dto.prevPage}')">[이전]</a>
								                </c:if>
								                
								                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
								                <c:forEach var="p" items="${list }" begin="${map.dto.blockBegin}" end="${map.dto.blockEnd}">
								                    <!-- **현재페이지이면 하이퍼링크 제거 -->
								                    <c:choose>
								                        <c:when test="${i == map.dto.curPage}">
								                            <span style="color: red">${p.camp_tip_num}</span>&nbsp;
								                        </c:when>
								                        <c:otherwise>
								                            <a href="javascript:list('${p.camp_tip_num}')">${p.camp_tip_num}</a>&nbsp;
								                        </c:otherwise>
								                    </c:choose>
								                </c:forEach>
								                
								                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
								                <c:if test="${map.dto.curBlock <= map.dto.totBlock}">
								                    <a href="javascript:list('${map.dto.nextPage}')">[다음]</a>
								                </c:if>
								                
								                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
								                <c:if test="${map.dto.curPage <= map.dto.totPage}">
								                    <a href="javascript:list('${map.dto.totPage}')">[끝]</a>
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
								<form action="${pageContext.request.contextPath}/select.board"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="category1" id="srch_item">
												<option value="">선택해주세요</option>
												<option value="category">카테고리</option>
												<option value="nickname">작성자</option>
												<option value="title">제목</option>
												<option value="contents">내용</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value="">
											<c:choose>
												<c:when test="${param.category == 1 }">
													<input type="hidden" name="category" value="1">
												</c:when>
												<c:when test="${param.category == 2 }">
													<input type="hidden" name="category" value="2">
												</c:when>
												<c:otherwise>
													<input type="hidden" name="category" value="3">
												</c:otherwise>
											</c:choose>
											<input type="hidden" name="cpage" value="1">
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
					<div class="logo">
						<a href="/" title="Slides Framework" style="font-family: 'Nanum Brush Script';font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png" style="width:60px;height:50px;margin-bottom:-6px;margin-right:-10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-2">글번호</div>
								<div class="col-4">제목</div>
								<div class="col-2">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>
							
							<c:forEach var="i" items="${list}">
								<c:if test="${i.category == 2 }">
									<div class="row boardlist">
										<div class="col-2">${i.camp_tip_num}</div>
										<div class="col-4" id="titleMove">
											<a href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}">${i.title}</a>
										</div>
										<div class="col-2">${i.writer}</div>
										<div class="col-2">${i.write_date}</div>
										<div class="col-2">${i.view_count}</div>
									</div>
								</c:if>
							</c:forEach>

							<div id="boardlist">
								<br>
<%-- 								<nav aria-label="Page navigation example" class="page_nav">
									<ul class="pagination justify-content-center">
										<c:forEach var="w" items="${navi}" varStatus="s">

											<!-- c:forEach var="i" begin="0" end="10" step="1" 같은 것. -->
											<c:choose>
												<c:when test="${w == '>'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index-1]+1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:when test="${w == '<'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index+1]-1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${w}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:otherwise>
											</c:choose>

											<!-- boolean으로 값이 마지막일 경우에만. true가 됩니다. -->
										</c:forEach>
									</ul>
								</nav> --%>
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
								<form action="${pageContext.request.contextPath}/select.board"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="category1" id="srch_item">
												<option value="">선택해주세요</option>
												<option value="category">카테고리</option>
												<option value="nickname">작성자</option>
												<option value="title">제목</option>
												<option value="contents">내용</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value="">
											<c:choose>
												<c:when test="${param.category == 1 }">
													<input type="hidden" name="category" value="1">
												</c:when>
												<c:when test="${param.category == 2 }">
													<input type="hidden" name="category" value="2">
												</c:when>
												<c:otherwise>
													<input type="hidden" name="category" value="3">
												</c:otherwise>
											</c:choose>
											<input type="hidden" name="cpage" value="1">
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
					<div class="logo">
						<a href="/" title="Slides Framework" style="font-family: 'Nanum Brush Script';font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png" style="width:60px;height:50px;margin-bottom:-6px;margin-right:-10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-2">글번호</div>
								<div class="col-4">제목</div>
								<div class="col-2">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>
							
							<c:forEach var="i" items="${list}">
								<c:if test="${i.category == 3 }">
									<div class="row boardlist">
										<div class="col-2">${i.camp_tip_num}</div>
										<div class="col-4" id="titleMove">
											<a href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}">${i.title}</a>
										</div>
										<div class="col-2">${i.writer}</div>
										<div class="col-2">${i.write_date}</div>
										<div class="col-2">${i.view_count}</div>
									</div>
								</c:if>
							</c:forEach>

							<div id="boardlist">
								<br>
<%-- 								<nav aria-label="Page navigation example" class="page_nav">
									<ul class="pagination justify-content-center">
										<c:forEach var="w" items="${navi}" varStatus="s">

											<!-- c:forEach var="i" begin="0" end="10" step="1" 같은 것. -->
											<c:choose>
												<c:when test="${w == '>'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index-1]+1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:when test="${w == '<'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index+1]-1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${w}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:otherwise>
											</c:choose>

											<!-- boolean으로 값이 마지막일 경우에만. true가 됩니다. -->
										</c:forEach>
									</ul>
								</nav> --%>
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
								<form action="${pageContext.request.contextPath}/select.board"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="category1" id="srch_item">
												<option value="">선택해주세요</option>
												<option value="category">카테고리</option>
												<option value="nickname">작성자</option>
												<option value="title">제목</option>
												<option value="contents">내용</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value="">
											<c:choose>
												<c:when test="${param.category == 1 }">
													<input type="hidden" name="category" value="1">
												</c:when>
												<c:when test="${param.category == 2 }">
													<input type="hidden" name="category" value="2">
												</c:when>
												<c:otherwise>
													<input type="hidden" name="category" value="3">
												</c:otherwise>
											</c:choose>
											<input type="hidden" name="cpage" value="1">
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
					<div class="logo">
						<a href="/" title="Slides Framework" style="font-family: 'Nanum Brush Script';font-size: 40px;">
							<img src="/resources/assets/img/background/tent_logo.png" style="width:60px;height:50px;margin-bottom:-6px;margin-right:-10px;">별보러갈래?
						</a>
					</div>
					<br>
					<div class="row body cnt">
						<div class="col-12">
							<div class="row boardlistMain">
								<div class="col-2">글번호</div>
								<div class="col-4">제목</div>
								<div class="col-2">작성자</div>
								<div class="col-2">등록일</div>
								<div class="col-2">조회수</div>
							</div>
							
							<c:forEach var="i" items="${list}">
								<c:if test="${i.category == 4 }">
									<div class="row boardlist">
										<div class="col-2">${i.camp_tip_num}</div>
										<div class="col-4" id="titleMove">
											<a href="/CampTipBoard/detail?camp_tip_num=${i.camp_tip_num}&category=${i.category}">${i.title}</a>
										</div>
										<div class="col-2">${i.writer}</div>
										<div class="col-2">${i.write_date}</div>
										<div class="col-2">${i.view_count}</div>
									</div>
								</c:if>
							</c:forEach>

							<div id="boardlist">
								<br>
<%-- 								<nav aria-label="Page navigation example" class="page_nav">
									<ul class="pagination justify-content-center">
										<c:forEach var="w" items="${navi}" varStatus="s">

											<!-- c:forEach var="i" begin="0" end="10" step="1" 같은 것. -->
											<c:choose>
												<c:when test="${w == '>'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index-1]+1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:when test="${w == '<'}">
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${navi[s.index+1]-1}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/select.board?cpage=${w}&&category=${param.category}">${w
                                                                    }</a></li>
												</c:otherwise>
											</c:choose>

											<!-- boolean으로 값이 마지막일 경우에만. true가 됩니다. -->
										</c:forEach>
									</ul>
								</nav> --%>
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
								<form action="${pageContext.request.contextPath}/select.board"
									method="get">
									<div class="row">
										<div class="col-3">
											<select class="form-control" name="category1" id="srch_item">
												<option value="">선택해주세요</option>
												<option value="category">카테고리</option>
												<option value="nickname">작성자</option>
												<option value="title">제목</option>
												<option value="contents">내용</option>
											</select>
										</div>
										<div class="col-7">
											<input type="text" class="form-control mb-2" name="keyword"
												id="" placeholder="검색할 내용을 입력해 주세요." value="">
											<c:choose>
												<c:when test="${param.category == 1 }">
													<input type="hidden" name="category" value="1">
												</c:when>
												<c:when test="${param.category == 2 }">
													<input type="hidden" name="category" value="2">
												</c:when>
												<c:otherwise>
													<input type="hidden" name="category" value="3">
												</c:otherwise>
											</c:choose>
											<input type="hidden" name="cpage" value="1">
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
</body>

</html>