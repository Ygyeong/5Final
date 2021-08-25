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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- diary -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js"></script>
<!-- import -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage.css">
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
		location.href="/cart/cartList?cm_id=${loginID}"
	})
	$('#calendar').fullCalendar({
		header: {
			right: 'custom1 ,custom2 prevYear,prev,next,nextYear'
		},
	    customButtons: {
			custom2: {
				text: '일정추가',
		        id: 'add',
				click: function() { 
				}
			}
		}	
	})

		
	$(".fc-custom2-button").on('click', function(){
		var url = "/schedule/scheduleOpen?cm_id=${loginID}";
		var name = "/schedule/scheduleOpen";
		var option = "width=600,height=600 left=100, top=50, location=no";
		window.open(url, name, option)
	})
	
	$("#myInput").on("click", function() {
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
</style>
</head>
<body>
	<div>
		<!--nav start -->
		<c:choose>
		<c:when test="${loginID==null }">
		<nav class="navbar">
		        <div class="navbar_logo">
		     	   <a href=""><img src="/assets/img/background/newLogo_negative.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
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
		            <a href=""><img src="/assets/img/background/newLogo_negative.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
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
		            <a href=""><img src="/assets/img/background/newLogo_negative.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>
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
		<!-- mypage start -->
		<div id="myBox">
	        <div id="me" class="card">

                <div class="card_bottom">
                    <h5 class="card-title"> ${loginID }님의 마이페이지 </h5>
                    <button class="btn btn-success" id="myPageModify">회원정보 수정</button>
                    <button class="btn btn-primary" id="myPagePwChange">비밀번호 변경</button>
                    <button class="btn btn-danger" id="myPageMemberDelete">회원 탈퇴</button>
                    <button class="btn btn-dark" id="goHome">메인으로</button><br><br>

                </div>
            </div>
        </div>
        <div id="calendar" style="width:600px; margin:auto;"></div>
        <div id="tableBox" style="text-align: center;">
        	<input class="form-control" id="myInput" type="date" placeholder="Search.." style="width:600px;margin:auto; margin-top:10px;">
			<table class="table table-striped" style="width:600px; margin:auto; margin-top:10px; margin-bottom:20px;">
				
				<thead class="thead-dark">
				<tr><th> 날짜 </th><th> 일정 </th><th> 메모 </th></tr>
				</thead>
				
				<tbody id="myTable">
					<c:forEach items="${list}" var = "i">
						<tr>
							<td>${i.startDate}</td>
							<td>${i.subject}</td>
							<td>${i.memo}</td>
						</tr>
					</c:forEach>
				</tbody>				
		
				</table>
           </div>
    </div>  
</body>
</html>