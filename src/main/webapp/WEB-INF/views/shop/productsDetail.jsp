<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>
<style>
.container-fluid{width:1100px; margin-top: 75px; margin-bottom: 60px; padding-top: 30px;}
#menu{height: 430px;}
#detailB{height: 50px;line-height: 50px;}
#detailB>div{height: 100%;}
#img{height:100%;}
img{width:570%;; height:100%;}
.content{margin: 120px 0px 150px 0px;}
#detailB>div{border:1px solid #ddd;}
#detailT{border-bottom: 1px solid #ddd;}
#detailT,#cmtT{font-size: 1.3em; font-weight: bold;}
#infoBox{padding-left:8px; padding-top:3px;}
#name{font-size: 1.2em; padding-left:8px;}
#price{font-size: 1.8em;padding-left:8px; font-weight: bold; }
.cmtBox{border-bottom: 1px solid #ddd; padding-bottom: 45px; margin: 20px 80px 0px 12px;}
#content{resize: none; width: 97%; height: 95%; margin: 0px; padding: 8px; border:1px solid #ddd; border-radius:5px;}
#cmtBtn{ width:75px; height:40px; margin:11px 0px 10px 0px; padding:8px 0px 0px 8px; border-radius:5px;background-color:black; color:white; font-size:0.9em;}
#userBtn{width:75px; height:40px; margin:11px 0px 10px 0px; padding:8px 0px 0px 8px; border-radius:5px;background-color:black; color:white; font-size:0.9em;}
#userBtn,#cmtBtn:hover{cursor: pointer;}
textarea{border:none; font-size:0.9em;}
.col-3,.col-9{font-size: 0.9em;}
.txt{background-color:#f6f6f6;font-size: 0.8em; text-align:center; width:70px; height:22px; margin-right:265px; padding: 2px 0px 0px 0px;}
.ex{color:#949494; font-size: 0.8em; width:85px; padding: 2px 0px 0px 0px;}
#funcBox{border-top: 1px solid #ddd; height: 60px; margin: 0px; }
#funcBox>div{ height:100%; text-align: center; line-height: 40px;}
#like{margin-right: 7px; width: 48%;}
#chat{margin-left: 7px; width: 48%;  border:1px solid black;}
#like,#chat:hover {cursor: pointer;}
#like button{width:100%; height:100%;}
#userBox{background-color:#F6F6F6;margin:48px 20px 0px 50px; width: 230px; height: 200px;}
#userID{text-align:center; font-weight:600;}
#repCount{margin-left:20px;width:50px;}
#repCount span{font-weight:600; padding-left:5px;}
#userID,#repCount,#repCount span:hover{cursor:pointer;}
#crudBox{border: 1px solid #ddd;margin: 0px; padding-left:10px;}
.ckT{font-size:20px; font-weight:600;}
.ck{font-size:15px; font-weight:600; margin-top:20px;}
.sold span{font-size:13px; margin-left:5px;}
#update{border:1px solid #ddd; border-radius:10px; height:30px; margin:25px 10px 0px 20px; text-align:center; font-size:13px;}
#delete{border:1px solid #ddd; border-radius:10px; height:30px; margin:4px 10px 20px 20px; text-align:center; font-size:13px;}
#submit{border:1px solid #ddd; border-radius:10px; height:30px; margin:4px 10px 20px 20px; text-align:center; font-size:13px;}
#update,#delete,#submit:hover {cursor: pointer;}
.recmtBox{ border-bottom: 1px solid #ddd; padding-bottom: 15px; margin: 0px 80px 0px 12px; padding-top:10px;}
.ID{font-weight:600; font-size:18px;}
.ID span{margin-left:5px; font-weight:400; font-size:14px;}
.cmt{width:930px; margin-bottom:15px;}
.btnBox{text-align:right;}
.del{margin-left:5px;}
/* Modal styles
--------------------------------------------------------------------------------------------------------------- */
.modal .modal-dialog {max-width: 400px;}
.modal .modal-header, .modal .modal-body, .modal .modal-footer {padding: 20px 30px;}
.modal .modal-content {border-radius: 3px; font-size: 14px;}
.modal .modal-title {display: inline-block;}
.modal .form-control {border-radius: 2px; box-shadow: none; border-color: #dddddd;}
.modal .modal-footer {background: #ecf0f1; border-radius: 0 0 3px 3px;}
.modal textarea.form-control {resize: vertical;}
.modal form label {font-weight: normal;}
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
<script>
 	$(function(){
		$("#update").on("click",function(){
			location.href="/products/modify?p_seq="+$("#p_seq").val();	
		})
		
		$("#delete").on("click",function(){
			let result = confirm("게시글을 삭제하시겠습니까?");
			if(result){
				location.href="/products/delete?p_seq="+$("#p_seq").val();
			}
		})
		
		$("#userBtn").on("click",function(){
			let result = confirm("로그인이 필요한 기능입니다. 로그인하시겠습니까?");
			if(result){
				location.href="/member/loginPage";
			}
			$("#content").val("");
		})
		
 	    $("#cartBtn").on("click",function(){
 	    	
 	    	if(${loginID==null}){
 	    		let result1 = confirm("로그인이 필요합니다 기능입니다\n로그인하시겠습니까?");
 	    		if(result1){
 	    			location.href="/member/loginPage";
 	    		}
 	    	}else{
 	    		location.href="/cart/insertCart?p_seq=${dto.p_seq}&c_qty=1";
 	    	}
 	    	
 	    })
 	    $("#payBtn").on("click",function(){
 	    	alert("현재 구현중인 기능입니다.\n21/8/27 구현예정입니다.");
 	    })

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
					<a href=""><img src="/assets/img/background/newLogo_negative.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="CampTipBoard/selectAll">캠핑정보</a></li>
					<li><a href="/products/selectAll?index=1">SHOP</a></li>
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
		<c:when test="${loginID=='admin'}">
			<nav class="navbar">
				<div class="navbar_logo">
					<a href=""><img src="/assets/img/background/newLogo_negative.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="CampTipBoard/selectAll">캠핑정보</a></li>
					<li><a href="/products/selectAll?index=1">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>
				</ul>
				<ul class="navbar_member">
					<li><a href="/admin/mem">관리자페이지</a></li>
					<li><a href="/member/logOutProc">로그아웃</a></li>
				</ul>
				<a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="navbar">
				<div class="navbar_logo">
					<a href=""><img src="/assets/img/background/newLogo_negative.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="CampTipBoard/selectAll">캠핑정보</a></li>
					<li><a href="/products/selectAll?index=1">SHOP</a></li>
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
	<c:choose>
		<c:when test="${loginID =='admin'}">
			<div class="container-fluid">
				<div class="row m-0" id=menu>
					<div class="col-6 p-0" id=img>
						<c:forEach var="i" items="${slist}">
						<div class="col-2 p-0" id=img>
							<img src="/img/${i.sysName}">
						</div>
					</c:forEach>
					</div>
					<div class="col-5 " id=infoBox>
						<div class="row m-0 mb-4">
							<div class="col-2 txt">${dto.p_category}</div>
							<div class="col-2 ex">
							</div>
						</div>

						<div class="row m-0">
							<div class="col-12 p-0 pb-1" id=name>${dto.p_name}</div>
						</div>
						<div class="row m-0" id=priceBox>
							<div class="col-12 p-0 pb-2" id=price>${dto.p_price}원</div>
						</div>
						<div class="row m-0 pb-2">
							<div class="col-3 p-0">배송비</div>
							<div class="col-9 p-0">50,000이상 무료배송</div>
							<div class="col-3 p-0"></div>
							<div class="col-9 p-0">2,500원 / 도서산간 5,000원</div>
						</div>

						<div class="row m-0 pb-4">
							<div class="col-3 p-0">거래지역</div>
							<div class="col-9 p-0">전지역</div>
						</div>
						<div class="row pt-3" id=funcBox>
							<div class="col-5 p-0" id=like>
								<button class="btn btn-outline-dark" id="modifyBtn">수정하기</button>
							</div>
							<div class="col-5 p-0" id=like>
								<button class="btn btn-outline-dark" id="deleteBtn">삭제하기</button>
							</div>

						</div>
						<input type=hidden id=p_seq value="${dto.p_seq}">
					</div>
				</div>
				<div class="row p-0 content">
					<div class="col-11">
						<div class="col-12 pb-2 pt-5" id=detailT>상세정보</div>
						<div class="col-12 pt-4 pb-4">${dto.p_contents}</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container-fluid">
				<div class="row m-0" id=menu>
					<div class="col-6 p-0" id=img>
						<c:forEach var="i" items="${slist}">
						<div class="col-2 p-0" id=img>
							<img src="/img/${i.sysName}">
						</div>
					</c:forEach>
					</div>
					<div class="col-5 " id=infoBox>
						<div class="row m-0 mb-4">
							<div class="col-2 txt">${dto.p_category}</div>
							<div class="col-2 ex">
							</div>
						</div>

						<div class="row m-0">
							<div class="col-12 p-0 pb-1" id=name>${dto.p_name}</div>
						</div>
						<div class="row m-0" id=priceBox>
							<div class="col-12 p-0 pb-2" id=price>${dto.p_price}원</div>
						</div>
						<div class="row m-0 pb-2">
							<div class="col-3 p-0">배송비</div>
							<div class="col-9 p-0">50,000이상 무료배송</div>
							<div class="col-3 p-0"></div>
							<div class="col-9 p-0">2,500원 / 도서산간 5,000원</div>
						</div>

						<div class="row m-0 pb-4">
							<div class="col-3 p-0">거래지역</div>
							<div class="col-9 p-0">전지역</div>
						</div>
						<div class="row pt-3" id=funcBox>
							<div class="col-5 p-0" id=like>
								<button class="btn btn-outline-dark" id="cartBtn">장바구니</button>
							</div>
							<div class="col-5 p-0" id=like>
								<button class="btn btn-outline-dark" id="payBtn">결제하기</button>
							</div>

						</div>
						<input type=hidden id=seq value="${dto.p_seq}">
					</div>
				</div>
				<div class="row p-0 content">
					<div class="col-11">
						<div class="col-12 pb-2 pt-5" id=detailT>상세정보</div>
						<div class="col-12 pt-4 pb-4">${dto.p_contents}</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
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