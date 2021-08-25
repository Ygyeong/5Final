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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/navBar.css">
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
</head>
<body>
		<!--nav start -->
		<c:choose>
		<c:when test="${loginID==null }">
		<nav class="navbar">
		        <div class="navbar_logo">
		     	   <a href=""><img src="/assets/img/background/camp_logo.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
		        </div>
		        <ul class="navbar_menu">
		            <li><a href="/info/list?index=1">캠핑장</a></li>
		            <li><a href="/CampTipBoard/selectAll">캠핑정보</a></li>
		            <li><a href="/products/selectAll?index=1">SHOP</a></li>
		            <li><a href="/rep/list?index=1">중고장터</a></li>
		            <li><a href="/gal/list?cpage=1">캠핑후기</a></li>
		        </ul>
		        <ul class="navbar_member">
		            <li><a href="/member/signUp">회원가입</a></li>
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
		            <a href=""><img src="/assets/img/background/camp_logo.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
		        </div>
		        <ul class="navbar_menu">
		            <li><a href="/info/list?index=1">캠핑장</a></li>
		            <li><a href="/CampTipBoard/selectAll">캠핑정보</a></li>
		            <li><a href="/products/selectAll?index=1">SHOP</a></li>
		            <li><a href="/rep/list?index=1">중고장터</a></li>
		            <li><a href="/gal/list?cpage=1">캠핑후기</a></li>
		        </ul>
		        <ul class="navbar_member">
		            <li><a href="">관리자페이지</a></li>
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
		            <a href=""><img src="/assets/img/background/camp_logo.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
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
		<!-- nav end -->	

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
</body>
</html>