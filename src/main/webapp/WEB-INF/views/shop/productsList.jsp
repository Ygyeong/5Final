<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품목록</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/products.css" rel="stylesheet" />
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>
<style>
*{box-sizing: border-box;}
.container-fluid{width:1100px;height: 1250px; margin: auto; margin-top:80px;}
h2{text-align: center;}
/* 	div{border:1px solid black;} */
#category{text-align:right; margin-right:10px;}
#category select{height:100%;}
#searchBox{border:1px solid black;
padding-top:5px; padding-bottom:5px;}
#searchBox img{height:18px; width:18px;}
#writeBox{text-align:right;}
#write{ text-decoration:none; color:black; height:100%;}
#word{border:0px solid black; width:90%;}
/*  input:focus {outline:none;}*/
.listbar{height:330px; margin: 0px; margin-top: 60px; }
.list{height:100%; width:246px;  margin:0px 10px 50px 10px; border:1px solid #ddd; }
.list:hover{cursor:pointer;}
.list .img{height:217px; margin-bottom: 10px; }
.link{padding:0px 10px 0px 10px;}
.img,.link:hover {cursor:pointer;}
.img,.link:hover~.link{text-decoration:underline;}
.img img{width:100%; height:100%;}
.price{font-weight:bold;font-size:1.2em; padding:0px 0px 0px 10px;}
.price span{font-size:0.7em; display:inline-block;padding-left:2px;}
.diffD{padding:6px 12px 0px 0px; color:#a9a9a9; font-size:0.8em; text-align:right;}
.area{font-size:0.8em; color:#606060; font-weight:500;}
.ar{border-top:1px solid #ddd;}
/*네비바 스타일 시작
--------------------------------------------------------------------------------------------------------------- */   
:root{--text-color:#f0f4f5;--background-color:#263343; --accent-color:steelblue;}
body{margin: 0;}
a{text-decoration: none;color: white;}
.navbar{display: inline-flex;justify-content: space-between;align-items: center;background-color: #263343;padding: 8px 12px;z-index:1000 !important;}
.navbar{position: fixed;top: 0;left: 0;right: 0;}
.navbar_logo{font-size: 32px;color: white;font-family: 'Nanum Brush Script';}
.navbar_logo i {color: white;}
.navbar_menu{display: flex;list-style: none;padding-left: 0;margin-bottom:-3px;}
.navbar_menu li {padding: 8px 12px;}
.navbar_menu li:hover {background-color: steelblue; border-radius: 4px;}
.navbar_member {list-style: none; color: white; display: flex; padding-left: 0; margin-bottom:-3px;}
.navbar_member li{padding: 8px 12px;}
.navbar_toogleBtn{display: none; position: absolute; right: 32px; font-size: 24px;}
@media screen and (max-width: 768px) {
.navbar{flex-direction: column;align-items: flex-start;padding: 8px 24px;}
.navbar_menu{display: none;flex-direction: column;align-items: center;width: 100%;}
.navbar_menu li {width: 100%;text-align: center;}
.navbar_member{display: none;justify-content: center;width: 100%;}
.navbar_toogleBtn{display: block;}
.navbar_menu.active,.navbar_member.active{display: flex;}
:root{--text-color:#f0f4f5;--background-color:#263343; --accent-color:steelblue;}
}
/*네비바 스타일 끝
--------------------------------------------------------------------------------------------------------------- */   
</style>
<script type="text/javascript">
$("#cart").on("click",function(){
 	
 	let result = confirm("상품이 저장되었습니다.\n장바구니로 이동하시겠습니까?");
 	if(result){
 		location.href="/cart/insertCart?p_seq=${dto.p_seq}&c_qty=1";	
 	};
 	
 	$(".list").on("click",function(){
		let seq=$(this).find(".seq").val();
		location.href="/products/detail?p_seq=${list.p_seq}";
	})
	$(document).on("click",".list",function(){
		let seq=$(this).find(".seq").val();
		location.href="/products/detail?p_seq=${list.p_seq}";
	})
</script>
</head>
<body>
<!-- 네비바 시작
----------------------------------------------------------------------------------------------------------------->
	<c:choose>
		<c:when test="${loginID==null }">
			<nav class="navbar">
				<div class="navbar_logo">
					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list">캠핑장</a></li>
					<li><a href="">캠핑정보</a></li>
					<li><a href="/products/selectAll">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>
				</ul>
				<ul class="navbar_member">
					<li><a href="/member/signUp">회원가입</a></li>
					<li><a href="/member/loginPage">로그인</a></li>
				</ul>
				<a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
			</nav>
		</c:when>
		<c:when test="${loginID='admin'}">
			<nav class="navbar">
				<div class="navbar_logo">
					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list">캠핑장</a></li>
					<li><a href="">캠핑정보</a></li>
					<li><a href="/products/selectAll">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>
				</ul>
				<ul class="navbar_member">
					<li><a href="">관리자페이지</a></li>
					<li><a href="/member/logOutProc">로그아웃</a></li>
				</ul>
				<a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
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
					<li><a href="">캠핑정보</a></li>
					<li><a href="/products/selectAll">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>
				</ul>
				<ul class="navbar_member">
					<li><a href="/member/myPage">마이페이지</a></li>
					<li><a href="/memeber/logOutProc">로그아웃</a></li>
				</ul>
				<a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
			</nav>
		</c:otherwise>
	</c:choose>
<!-- 네비바 끝
----------------------------------------------------------------------------------------------------------------->
	<div class="container-fluid">
        <h2>중고 장터</h2>
        <div class="row m-0 mt-5 h-120">
            <div class="col-2 p-0" id="category">
                <select name="rep_category" >
  					<option selected>전체종류</option>
                    <option value="텐트/타프">텐트/타프</option>
                    <option value="침낭/매트">침낭/매트</option>
                    <option value="테이블/의자">테이블/의자</option>
                    <option value="조명기구">조명기구</option>
                    <option value="주방용품">주방용품</option>
                    <option value="화로/버너/bbq">화로/버너/bbq</option>
                    <option value="겨울용품">겨울용품</option>
                    <option value="기타캠핑용품">기타캠핑용품</option>
                </select>
            </div>
            <div class="col-4" id=searchBox>
                <input type="text" id=word  placeholder="상품명을 입력하세요.">
                <img src="/img/search.png">
            </div>
            <div class="col-5 p-0 pt-1" id=writeBox>
            	<a href="/rep/write" id=write><i class="fas fa-pen-square"></i>등록하기</a>
            </div>
        </div>
        <div class="row listbar" >
        <c:forEach var="list" items="${list}">
			<div class="col-3 p-0 list"  seq="${list.p_seq}">
				<div class="col-12 img"><img src="/img/"></div>
				<div class="col-12 mb-1 link">${list.p_name}</div>
				<div class="row m-0 ">
					<div class="col-6 price">${list.p_price}<span>원</span></div>
					<div class="col-6 diffD">${list.p_rdate}</div>
				</div>
				<div class="row m-0 mt-2 pt-2 pb-2 ar">
					<div class="col-12 area"><a href="" id="cart"><i class="fas fa-shopping-cart 7x" style="color:black"></i></a>장바구니</div>
				</div>
				<input type=hidden value="${list.p_seq}" class=seq>
			</div>       
		</c:forEach>
		</div> 
    </div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/products.js"></script>
	<script>
    const toogleBtn = document.querySelector('.navbar_toogleBtn');
    const menu = document.querySelector('.navbar_menu');
    const member = document.querySelector('navbar_member');
    toogleBtn.addEventListener('click', () => {
        menu.classList.toggle('active');
        member.classList.toggle('active');
    });
    </script>
</body>
</html>
