<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/idCheckResult.css">
<meta charset="UTF-8">
<title>Result</title>
<script>
	$(function(){
		$("#pwChange").on('click', function(){
			location.href="/member/pwChange?cm_id=${member}"
		})
	})
</script>
<style>
/*네비바 스타일  */     
:root{
    --text-color:#f0f4f5;
    --background-color:#263343;
    --accent-color:steelblue;
}
body{
    margin: 0;
    
}
a{
    text-decoration: none;
    color: white;

}

.navbar{
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #263343;
    padding: 8px 12px;
    

}

.navbar{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
   
}


.navbar_logo{
    font-size: 32px;
    color: white;
    font-family: 'Nanum Brush Script';
}

.navbar_logo i {
    color: white;
}

.navbar_menu{
    display: flex;
    list-style: none;
    padding-left: 0;
    margin-bottom:-3px;

}
.navbar_menu li {
    padding: 8px 12px;
}

.navbar_menu li:hover {
    background-color: steelblue;
    border-radius: 4px;
}


.navbar_member {
    list-style: none;
    color: white;
    display: flex;
    padding-left: 0;
	margin-bottom:-3px;
}

.navbar_member li{
    padding: 8px 12px;
}

.navbar_toogleBtn{
    display: none;
    position: absolute;
    right: 32px;
    font-size: 24px;
    
}

@media screen and (max-width: 768px) {
    
    .navbar{
        flex-direction: column;
        align-items: flex-start;
        padding: 8px 24px;
    }

    .navbar_menu{
        display: none;
        flex-direction: column;
        align-items: center;
        width: 100%;
    }

    .navbar_menu li {
        width: 100%;
        text-align: center;
    }

    .navbar_member{
        display: none;
        justify-content: center;
        width: 100%;
    }
    .navbar_toogleBtn{
        display: block;
    }

    .navbar_menu.active,
    .navbar_member.active{
        display: flex;
    
    }

}
/*네비바 스타일 끝  */ 
</style>
</head>
<body>

<!--네비바 시작 -->
</style>
</head>
<body>
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

    <div id="box">
        <div id="boxText">
            <c:if test="${member != null}">
               ${member}님 확인 되었습니다.</br> 
            </c:if>
        </div>
        <div id="boxBtn">
            <button id="pwChange" class="btn btn-primary"> 비밀번호 변경 </button>
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