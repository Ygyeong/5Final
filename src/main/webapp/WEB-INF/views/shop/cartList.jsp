<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>
<style>
.container{
background-color:#f5f5f0;
font-size:13pt;
min-width:1480px;
width:100%;
padding:50px 0;
margin-top: 60px;
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
border: solid 1px #e0e0eb;
border-collapse:collapse;
background-color:#f5f5f0;
width:100%;
font-size:10pt;
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
width:100%;
font-size:10pt;
}
table.calculation2 th{
border:solid 1px #e0e0eb;

}
table.calculation2 td{
boarder:solid 1px #e0e0eb;
text-align:center;
}
.price{
font-size:20pt;
font-weight:bold;
}
.lifont{
font-size:10pt; color:gray;}
.btn{
border:none;
color:white;
padding:5px 10px;
font-size:13px;
cursor:pointer;
border-radius:5px;
}
.default{background-color:#fff; border:solid 1px gray; color:black;}
.default:hover{background:#ddd;}
.backBtn{background:#fff; border:solid 1px gray;}

.btnfloat{float:left;}
.btnfloat2{float:right;}
.clearboth{clear:both;}

.footerbtn{float:right; font-weight:bolder; font-size:12pt; border-radius:3px;}
#allProduct,#productClear, #footerbtn{padding:11px 25px;}
#allProduct{background-color:#264d73; color:#fff;, font-weight:bold; font-size:12pt;}
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
<script>
	$(document).ready(function(){
		
		$("#deleteBtn").on("click",function(){
			let result = confirm("상품을 삭제하시겠습니까?");
			let c_seq = $(this).attr('value');
			let tr = $("calculation1tbody tr").val();
			if(result){
				if(tr==null){
					
				}
				location.href="/cart/delete?c_seq="+c_seq;
			}
			
		})
		
	})
</script>
<body>
<!-- 네비바 시작
----------------------------------------------------------------------------------------------------------------->
<c:choose>
<c:when test="${loginID == null }">
<nav class="navbar">
        <div class="navbar_logo">
            <a href="/"><img src="/assets/img/background/newLogo_negative.png"style="width:90px;height:auto;margin-right:7px;margin-top:-10px;">별보러갈래?</a>
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
            <a href="/"><img src="/assets/img/background/newLogo_negative.png"style="width:90px;height:auto;margin-right:7px;margin-top:-10px;">별보러갈래?</a>
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
<div class="container">
		<div id="frame">
			<form>
				<div id="frame2"align="center">
					<span style="font-size: 30pt; font-weight: bold;">장바구니</span>
				</div>
				<br />
				<div>
					<table class="calculation1">
						<thead>
							<tr>
								<th colspan="9" style="text-align: left; padding-left: 10px;">일반상품</th>
							</tr>

							<tr>
								<th colspan="2"><span>이미지</span></th>
								<th style="width: 550px;"><span>상품정보</span></th>
								<th>판매가</th>
								<th>수량</th>
								<th>배송구분</th>
								<th>배송비</th>
								<th>합계</th>
								<th>선택</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="list" items="${map.list}" varStatus="i">
							<tr style="height: 90px; background-color: #fff;">
								<td style="text-align:left; text-align:center; border-right: none;">
									<input type="checkbox" id="checkbox">
								</td>
								<td style="border-left:none; border-right:none;">
									<img style="width:80%" src="/img/"/></td>
								<td style="text-align:left; padding-left:10px; border-left:none; font-weight:bold;">
								${list.p_name}
								</td>
								<td><span><fmt:formatNumber value="${list.p_price}" maxFractionDigits="3"/></span>원</td>
								<td style="width:80px;">
									<input type="number" style="text-align:right; width:43px; margin-bottom:5px;" min="1" max="99" step="1" value="1"/>
									<button class="btn default" style="border-radius:3px; size:10px;">변경</button>
								</td>
								
								
								<td>기본배송</td>
								<td>2,500<br/>고</td>
								<td><span>0</span>원</td>
								
								<td>
									<button class="btn default" style="border-radius:3px; width:90px; margin-button:3px; font-size:11px; background-color:#264d73; color:#fff">주문하기</button>
									<button class="btn default" id="deleteBtn" value="${list.c_seq}" style="border-radius:3px; width:90px; margin-button:3px; font-size:11px;">삭제</button>
								</td>
								</tr>
								</c:forEach>
						</tbody>
						<tfoot>
						<tr style="height:60px;">
						<td colspan="5" style="border-right:none; text-align:left; padding-left:10px;">
							<span>[기본배송]</span>
						</td>
						<td>
						상품금액 : <span>${map.sumMoney}</span>+ <span>배송비 2,500원 = 합계</span>&nbsp;<span style="font-whight:bold; font-size:15pt;">0</span>
						</td>
						</tr>
						</tfoot>
					</table>
					<div style="margin:10px 0;">
						<button class="btn default backBtn btnfloat2">장바구니 비우기</button>
					</div>
					<br/><br/>
					
					<table class="calculation2">
						<tr>
							<th>총 상품금액</th>
							<th>총 배송비</th>
							<th style="width:750px; padding:22px 0;"><span>결제예정금액</span></th>
						</tr>
						
						<tr style="background-color:#fff;">
						<td style="padding:22px 0;"><span class="price">0</span>원</td>
						<td>+<span class="price">0</span>원</td>
						<td>=<span class="price">0</span>원</td>
						</tr>
					</table>
					
					<div align="center" style="margin-top:10px;">
						<button class="btn default" id="allProduct">전체상품주문</button>
						<button class="btn default backBtn" id="productClear">쇼핑계속하기</button>
						<span class="clearboth"></span>
					</div>
					<br/><br/><br/><br/><br/>
				</div>
			</form>
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
</body>
</html>