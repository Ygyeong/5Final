<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>
<style>
body.sijunBody{
background-color:#f5f5f0;
font-size:13pt;
min-width:1480px;
width:100%
padding:50px 0;
}
#frame{
width:80%;
margin:0 auto;
padding:50px 50px;
background-color:#fff;
}
#frame2{
border-botton:solid 1px #e0e0eb;
padding-bottom:10px;
}
.home{
folat:rignt;
}
table.calculation1{
clear:both;
border: solid qpx #e0e0eb;
border-collapse:collapse;
background-color:#f5f5f0;
width:100%;
font-size:10px;
}
table.calculation1 th{
border:solid 1px #e0e0eb;
padding:10px 0;
}
table.calculation1 td{
border:solid 1px #e0e0eb;
text-align:center;
}
table.calculation2{
border:solid 1px #e0e0eb;
boarder-collapse:collapse;
background-color:#f5f5f0;
width:100%
font-size:10pt;
}
table.calculation2 th{
border:solid 1px #e0e0eb;
boarder-collapse:collapse;
background-color:#f5f5f0;
width:100%;
font-size:10pt;
}
table.calculation2 td{
boarder:solid 1px #e0e0eb;
}
.price{
font-size:20px;
font-weight:bold;
}
.lifont{
font-size:10pt; color:gray;}
.btn{
border:none;
color:white;
padding:5px 10px;
cursor:pointer;
border-radius:5px;
}
.default{
background-color:#fff; border:solid 1px gray; color:black;}
.default:hover{background:#ddd;}
.backBtn{background:#fff; border:solid 1px gray;}

.btnfloat{float:left;}
.btnfloat2{folat:right;}
.clearboth{clear:both;}

.footbtn{float:right; font-weight:bolder; font-size:12pt; border-radius:3px;}
#allProduct,#productClear, #footerbtn{apdding:11px 25px;}
#allProduct{margin-left:140px; background-color:#264d73; color:#fff, font-weight:bold; font-size:12pt;}
#productClear{background-color:gray; color:#fff; font-weight:bold; font-size:12pt;}

.aa:hover{cursor:pointer;}

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
</head>
<body>
<!-- 네비바 시작
----------------------------------------------------------------------------------------------------------------->
<c:choose>
<c:when test="${loginID==null }">
<nav class="navbar">
        <div class="navbar_logo">
            <a href="/"><img src="/assets/img/background/newLogo_negative.png"style="width:90px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
        </div>
        <ul class="navbar_menu">
            <li><a href="/info/list?index=1">캠핑장</a></li>
            <li><a href="/CampTipBoard/selectAll">캠핑정보</a></li>
            <li><a href="/products/selectAll?index=1">SHOP</a></li>
            <li><a href="/rep/list?index=1">중고장터</a></li>
            <li><a href="/gal/list?cpage=1">캠핑후기</a></li>
        </ul>
        <ul class="navbar_member">
            <li><a href="/member/signPage">회원가입</a></li>
            <li><a href="/member/loginPage">로그인</a></li>
        </ul>
        <a href="#" class="navbar_toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>
</c:when>
<c:when test="${loginID=='admin'}">
<nav class="navbar">
        <div class="navbar_logo">
            <a href="/"><img src="/assets/img/background/newLogo_negative.png"style="width:90px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
        </div>
        <ul class="navbar_menu">
            <li><a href="/info/list?index=1">캠핑장</a></li>
            <li><a href="/CampTipBoard/selectAll">캠핑정보</a></li>
            <li><a href="/products/selectAll?index=1">SHOP</a></li>
            <li><a href="/rep/list?index=1">중고장터</a></li>
            <li><a href="/gal/list?cpage=1">캠핑후기</a></li>
        </ul>
        <ul class="navbar_member">
            <li><a href="/admin/home">관리자페이지</a></li>
            <li><a href="/member/logOutProc">로그아웃</a></li>
        </ul>
        <a href="#" class="navbar_toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>
</c:when>
<c:otherwise>
<nav class="navbar">
        <div class="navbar_logo">
            <a href="/"><img src="/assets/img/background/newLogo_negative.png"style="width:90px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
        </div>
        <ul class="navbar_menu">
            <li><a href="/info/list?index=1">캠핑장</a></li>
            <li><a href="/CampTipBoard/selectAll">캠핑정보</a></li>
            <li><a href="/products/selectAll?index=1">SHOP</a></li>
            <li><a href="/rep/list?index=1">중고장터</a></li>
            <li><a href="/gal/list?cpage=1">캠핑후기</a></li>
        </ul>
        <ul class="navbar_member">
            <li><a href="/member/myPage?cm_id=${loginID}">마이페이지</a></li>
            <li><a href="/member/logOutProc">로그아웃</a></li>
        </ul>
        <a href="#" class="navbar_toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>
</c:otherwise>
</c:choose> 
<!-- 네비바 끝
----------------------------------------------------------------------------------------------------------------->
<div id="container">
<div id="frame">
<form>
<div id="frame2">
<span style="font-size:16pt; font-whight:bold">장바구니</span>

</div>
</form>
</div>
</div>
</body>
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
</html>