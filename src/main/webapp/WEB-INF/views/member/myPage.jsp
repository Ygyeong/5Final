<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- diary -->
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js"></script>
<!-- import -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/navBar.css">

<title>** MY PAGE **</title>
<script>

$(function(){
	$("#myPageModify").on("click", function(){
		location.href="/member/memberModify?cm_id=${loginID}"
	})
	$("#myPagePwChange").on("click", function(){
		location.href="/member/pwChange?cm_id=${loginID}"
	})
	$("#myPageMemberDelete").on("click", function(){
		location.href="/member/memberOutProc?cm_id=${loginID}"
	})
	$("#goHome").on("click",function(){
		location.href="/"
	})
	$("#cartList").on("click",function(){
		var url = "/cart/cartList?cm_id=${loginID}"
		var name = "/cart/cartList"
		var option = "width=600,height=600 left=100, top=50, location=no";
		window.open(url, name, option)
	})
	$("#wishlist").on('click', function(){
		var url = "/member/wishlist?cm_id=${loginID}";
		var name = "/member/wishlist";
		var option = "width=600,height=600 left=100, top=50, location=no";
		window.open(url, name, option)
	})
	
	$("#sheduleCheck").on('click', function(){
		var url = "/member/scheduleCheck?cm_id=${loginID}";
		var name = "/member/scheduleCheck";
		var option = "width=600,height=600 left=100, top=50, location=no";
		window.open(url, name, option)
	})
	
	
	$(".days div").on('click', function(){
		var a= $(".day div").html();
		var url = "/schedule/scheduleOpen?cm_id=${loginID}";
		var name = "/schedule/scheduleOpen";
		var option = "width=600,height=600 left=100, top=50, location=no";
		window.open(url, name, option)
	})
	
	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#myTable").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		  });
		});

});
</script>
<style type="text/css">
    div{ 
       overflow: auto;   
    }
    #myBox{
		border: 1px solid white;
		    background-color: rgba(255, 255, 255, 0.144);
		    width: 600px;
		    height: 320px;
		    margin-top: 20px;
		    margin-right: auto;
		    margin-left: auto;    
		}
    #me{
        background-color: white;
        width: 590px;
        margin-top: 50px;
        height: 200px;
        text-align: center;
        float: left; 
    }
    .card_body{
        background-color: white;
        width: 600px;
        height: 200px;
    }
    .myPageBtn{ margin-top: 10px;}
    .add-button{
    	position: absolute;
    	top: 1px;
    	right: 230px;
    	background: #2C3E50;
    	border: 0;
    	color: white;
    	height: 35px;
    	border-radius: 3px;
    	width: 157px;
    }
    
    .fc-left{
    	textsize: 10px;
    }
    
    

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  
}

html {
}

.container {
  font-family: "Quicksand", sans-serif;
  width: 50%;
  height: 100vh;
  background-color: #12121f;
  color: white;
  display: flex;
  justify-content: center;
  align-items: center;
}

.calendar {
  width: 45rem;
  height: 52rem;
  background-color: #222227;
  box-shadow: 0 0.5rem 3rem rgba(0, 0, 0, 0.4);
}

.month {
  width: 100%;
  height: 12rem;
  background-color: #167e56;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 2rem;
  text-align: center;
  text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
}

.month i {
  font-size: 2.5rem;
  cursor: pointer;
}

.month h1 {
  font-size: 3rem;
  font-weight: 400;
  text-transform: uppercase;
  letter-spacing: 0.2rem;
  margin-bottom: 1rem;
}

.month p {
  font-size: 1.6rem;
}

.weekdays {
  width: 100%;
  height: 5rem;
  padding: 0 0.4rem;
  display: flex;
  align-items: center;
}

.weekdays div {
  font-size: 1.5rem;
  font-weight: 400;
  letter-spacing: 0.1rem;
  width: calc(44.2rem / 7);
  display: flex;
  justify-content: center;
  align-items: center;
  text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
}

.days {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  padding: 0.2rem;
}

.days div {
  font-size: 1.4rem;
  margin: 0.3rem;
  width: calc(40.2rem / 7);
  height: 5rem;
  display: flex;
  justify-content: center;
  align-items: center;
  text-shadow: 0 0.3rem 0.5rem rgba(0, 0, 0, 0.5);
  transition: background-color 0.2s;
}

.days div:hover:not(.today) {
  background-color: #262626;
  border: 0.2rem solid #777;
  cursor: pointer;
}

.prev-date,
.next-date {
  opacity: 0.5;
}

.today {
  background-color: #167e56;
}
</style>
</head>
<body>
	<div>
	<!--네비바 시작 -->
	<c:choose>
	<c:when test="${loginID == null }">
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
	
	<!--네비바 끝  -->
						
		<!-- mypage start -->
		<div id="myBox">
	        <div id="me" class="card">
                <div class="card_bottom">
                    <h5 class="card-title"> ${loginID }님의 마이페이지 </h5>
                    <button class="btn btn-success" id="myPageModify">회원정보 수정</button>
                    <button class="btn btn-primary" id="myPagePwChange">비밀번호 변경</button>
                    <button class="btn btn-danger" id="myPageMemberDelete">회원 탈퇴</button>
                    <button class="btn btn-dark" id="goHome">메인으로</button><br><br>
                    <button class="btn btn-info" id="cartList">장바구니</button>
                    <button class="btn btn-light" id="wishlist">찜목록 
                    <c:if test="${wish == 0}">
                    	<span class="badge badge-secondary"> ${wish }</span>
                    </c:if>
                    <c:if test="${wish > 0}">
                    	<span class="badge badge-primary"> ${wish }</span>
                    </c:if>
                    </button>
                    <button class="btn btn-warning" id="sheduleCheck">메모확인</button>

                </div>
            </div>
        </div>
        
           <div class="container">
        <div class="calendar">
          <div class="month">
            <i class="fas fa-angle-left prev"></i>
            <div class="date">
              <h1></h1>
              <p></p>
            </div>
            <i class="fas fa-angle-right next"></i>
          </div>
          <div class="weekdays">
            <div>Sun</div>
            <div>Mon</div>
            <div>Tue</div>
            <div>Wed</div>
            <div>Thu</div>
            <div>Fri</div>
            <div>Sat</div>
          </div>
          <div class="days"></div>
        </div>
    </div>
 </div>  
    
    
 <!--네비바 스크립트  -->
    <script>
    const toogleBtn = document.querySelector('.navbar_toogleBtn');
    const menu = document.querySelector('.navbar_menu');
    const member = document.querySelector('navbar_member');

    toogleBtn.addEventListener('click', () => {
        menu.classList.toggle('active');
        member.classList.toggle('active');
    });
    
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/asd.js"></script>
    
</body>
</html>