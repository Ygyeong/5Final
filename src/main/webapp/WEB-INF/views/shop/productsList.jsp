<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
*{box-sizing: border-box;}
.container-fluid{width:1100px;height: 1250px; margin: auto; margin-top:80px;}
h2{text-align: center;}
/*    div{border:1px solid black;} */
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
$(function(){
	
	$("#word").on("click",function(){
		alert("현재 미구현 기능입니다.\n21/08/28 구현 예정입니다. 죄송합니다.");
		
	})
    
    $(".list").on("click",function(){
       let p_seq=$(this).find(".p_seq").val();
       location.href="/products/detail?p_seq="+p_seq;
   })
   $(document).on("click",".list",function(){
      let p_seq=$(this).find(".p_seq").val();
      location.href="/products/detail?p_seq="+p_seq;
   })
   
   let index=1;
   $(window).scroll(function(){
      let $window = $(this);
      let scrollTop = $(this).scrollTop();
      let windowHeight = $window.height();
      let documentHeight = $(document).height();
      console.log("scrollTop : "+scrollTop+"| windowHeight : "+windowHeight+
            "| documentHeight"+documentHeight)
      if(scrollTop+windowHeight+50>=documentHeight){
         index++;
         setTimeout(getList(),2000);
         
      }
            
   })
   
   function getList(){
		$.ajax({
			url:"/products/scrollList",
			dataType:"json",
			data:{"index":index}
		}).done(function(resp){
			for(let i=0;i<resp.length;i++){
				let list = $("<div class='col-3 p-0 list'>");
				
				let img = $("<div class='col-12 img'>");
				let thum = $("<img src=''>");
				
				thum.attr("src","/img"+resp[i].p_thumsysName);
				img.append(thum);
				let name =$("<div class='col-12 mb-1 link'>");
				name.text(resp[i].p_name);
				
				let row1 =$("<div class='row m-0'>");
				let price = $("<div class='col-6 price'>");
				let span = $("<span>");
				span.text("원");
				price.text(resp[i].p_price);
				price.append(span);
				
				let date = $("<div class='col-6 diffD'>");
				date.text(resp[i].rep_diff_date);
				
				row1.append(price);
				row1.append(date);
				
				let row2 =$("<div class='row m-0 mt-2 pt-2 pb-2 ar'>");
				let area = $("<div class='col-12 area'>");
				let font = $("<i class='fas fa-map-marker-alt' style='margin-right: 8px; color:#a9a9a9'>");
				area.append(font);
				area.append(resp[i].rep_area);
				row2.append(area);
				let seq = $("<input type=hidden class=p_seq>");
				seq.val(resp[i].p_seq);
				
				
				list.append(img);
				list.append(name);
				list.append(row1);
				list.append(row2)
				list.append(p_seq);
				$(".listbar").append(list);
				
				
			}
		})
	}
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
   <c:choose>
      <c:when test="${loginID == 'admin'}">
         <div class="container-fluid">
            <h2>캠핑상품</h2>
            <div class="row m-0 mt-5 h-120">
               <div class="col-2 p-0" id="category">
                  <select name="rep_category">
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
                  <input type="text" id=word placeholder="상품명을 입력하세요."> <img
                     src="/img/search.png">
               </div>
               <div class="col-5 p-0 pt-1" id=writeBox>
                  <a href="/products/write" id=write><i
                     class="fas fa-pen-square"></i>등록하기</a>
               </div>
            </div>
            <div class="row listbar">
               <c:forEach var="list" items="${list}">
                  <div class="col-3 p-0 list" seq="${list.p_seq}">
                     <div class="col-12 img">
                        <img src="/img/${list.p_thumsysName}">
                     </div>
                     <div class="col-12 mb-1 link">${list.p_name}</div>
                     <div class="row m-0 ">
                        <div class="col-6 price">
                        <fmt:formatNumber value="${list.p_price}" maxFractionDigits="3"/><span>원</span>
                        </div>
                        <div class="col-6 diffD">${list.p_rdate}</div>
                     </div>
                     <div class="row m-0 mt-2 pt-2 pb-2 ar">
                     </div>
                     <input type=hidden value="${list.p_seq}" class=p_seq>
                  </div>
               </c:forEach>
            </div>
         </div>
      </c:when>
      <c:otherwise>
         <div class="container-fluid">
            <h2>캠핑상품</h2>
            <div class="row m-0 mt-5 h-120">
               <div class="col-2 p-0" id="category">
                  <select name="rep_category">
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
                  <input type="text" id=word placeholder="상품명을 입력하세요."> <img
                     src="/img/search.png">
               </div>
            </div>
            <div class="row listbar">
               <c:forEach var="list" items="${list}">
                  <div class="col-3 p-0 list" seq="${list.p_seq}">
                     <div class="col-12 img">
                        <img src="/img/${list.p_thumsysName}">
                     </div>
                     <div class="col-12 mb-1 link">${list.p_name}</div>
                     <div class="row m-0 ">
                        <div class="col-6 price">
                           <fmt:formatNumber value="${list.p_price}" maxFractionDigits="3"/><span>원</span>
                        </div>
                        <div class="col-6 diffD">${list.p_rdate}</div>
                     </div>
                     <div class="row m-0 mt-2 pt-2 pb-2 ar">
                        <div class="col-12 area"></div>
                     </div>
                     <input type=hidden value="${list.p_seq}" class=p_seq>
                  </div>
               </c:forEach>
            </div>
         </div>
      </c:otherwise>
   </c:choose>
   
  
   
   <!-- Bootstrap core JS-->
   <script botId="B2pe9j" src="https://www.closer.ai/js/webchat.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
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