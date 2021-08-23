<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

 <meta content="Free Website Template" name="keywords">
        <meta content="Free Website Template" name="description">

        <!-- Favicon -->
        <link href="aboutGallery/img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="aboutGallery/lib/animate/animate.min.css" rel="stylesheet">
        <link href="aboutGallery/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="aboutGallery/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        
        <!--Font  -->


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<style>
	 *{box-sizing: border-box;}
       .container{width:1100px;height: 1250px; margin: auto; margin-top:80px;}
       h2{text-align: center;}
/* 	div{border:1px solid black;} */
       #category{text-align:right; margin-right:10px;}
       #category select{height:100%;}
       #searchBox{border:1px solid black;
       padding-top:5px; padding-bottom:5px;}
       #searchBox img{height:18px; width:18px;}
       #keyword{width:90%;}
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
</style>
<script>
	$(function(){
		$(".list").on("click",function(){
			let seq=$(this).find(".seq").val();
			location.href="/rep/detail?rep_seq="+seq;
		})
		$(document).on("click",".list",function(){
			let seq=$(this).find(".seq").val();
			location.href="/rep/detail?rep_seq="+seq;
		})
		let index=1;
		$(window).scroll(function(){
			let $window = $(this);
			let scrollTop = $(this).scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();
			console.log("scrollTop : "+scrollTop+"| windowHeight : "+windowHeight+
					"| documentHeight"+documentHeight)
			if(scrollTop+windowHeight>=documentHeight){
				index++;
				setTimeout(getList(),2000);
				
			}
					
		})
		
		$("#search").on("click",function(){
			location.href="/rep/list?index=1&keyword="+$("#keyword").val();
		})
		
		function getList(){
			$.ajax({
				url:"/rep/scrollList",
				dataType:"json",
				data:{"index":index}
			}).done(function(resp){
				for(let i=0;i<resp.length;i++){
					let list = $("<div class='col-4 list'>");
					
					let img = $("<div id=img>");
					img.text("사진");
					let name =$("<div id=link>");
					name.text(resp[i].rep_name);
					let price = $("<div>");
					price.text(resp[i].rep_price);
					let date = $("<div>");
					date.text(resp[i].rep_write_date);
					let seq = $("<input type=hidden class=seq>");
					seq.val(resp[i].rep_seq);
					
					list.append(img);
					list.append(name);
					list.append(price);
					list.append(date);
					list.append(seq);
					$(".listbar").append(list);
					
					
				}
			})
		}
		
		
		
		
	})
</script>
</head>
<body>
	<!-- Nav Bar Start -->
        
        <c:choose>
  			<c:when test="${loginID==null }">
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
               <!--  <a href="/" class="navbar-brand"><img src="/assets/img/background/logo.png"style="width:200px;height:1000px;"></a> -->
                <a href="/" class="navbar-brand"  style="font-family: 'Nanum Brush Script';font-size: 30px;"><img src="/assets/img/background/camp_logo.png"style="width:60px;height:100px;margin-bottom:-6px;">별보러갈래?</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="/info/list" class="nav-item nav-link">캠핑장</a>
                        <a href="about.html" class="nav-item nav-link">캠핑정보</a>

                        <a href="/products/selectAll" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>

                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑 후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                        
                        <a href="/member/signUp" class="nav-item nav-link">회원가입</a>
                        <a href="/member/loginPage" class="nav-item nav-link">로그인</a>
                    </div>
                </div>
            </div>
        </div>
        </c:when>
         <c:when test="${loginID=='admin'}">
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
               <!--  <a href="/" class="navbar-brand"><img src="/assets/img/background/logo.png"style="width:200px;height:1000px;"></a> -->
                <a href="/" class="navbar-brand"  style="font-family: 'Nanum Brush Script';font-size: 30px;"><img src="/assets/img/background/camp_logo.png"style="width:60px;height:100px;margin-bottom:-6px;">별보러갈래?</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="/info/list" class="nav-item nav-link">캠핑장</a>
                        <a href="about.html" class="nav-item nav-link">캠핑정보</a>
                        <a href="/products/selectAll" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>
                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑 후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                        
                        <a href="portfolio.html" class="nav-item nav-link">관리자 페이지</a>
                        <a href="/member/logOutProc" class="nav-item nav-link">로그아웃</a>
                    </div>
                </div>
            </div>
        </div>
        
        </c:when>
        
        
        <c:otherwise>
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
               <!--  <a href="/" class="navbar-brand"><img src="/assets/img/background/logo.png"style="width:200px;height:1000px;"></a> -->
                <a href="/" class="navbar-brand"  style="font-family: 'Nanum Brush Script';font-size: 30px;"><img src="/assets/img/background/camp_logo.png"style="width:60px;height:100px;margin-bottom:-6px;">별보러갈래?</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="/info/list" class="nav-item nav-link">캠핑장</a>
                        <a href="about.html" class="nav-item nav-link">캠핑정보</a>

                        <a href="/products/selectAll" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>

                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑 후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                        
                        <a href="/member/myPage" class="nav-item nav-link">마이페이지</a>
                        <a href="/memeber/logOutProc" class="nav-item nav-link">로그아웃</a>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        </c:otherwise>
        
        </c:choose>
        <!-- Nav Bar End -->
	<div class="container">
	
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
                <input type="text" id=keyword  placeholder="상품명, 지역명 입력하세요">
                <img src="/img/search.png" id=search>
            </div>
            <div class="col-5 p-0 pt-1" id=writeBox>
            	<a href="/rep/write" id=write><i class="fas fa-pen-square"></i>등록하기</a>
            </div>
        </div>
        <div class="row listbar" >
        <c:forEach var="i" items="${list }">
			<div class="col-3 p-0 list"  seq="${i.rep_seq }">
				<div class="col-12 img"><img src="/img/${i.thumsysName}"></div>
				<div class="col-12 mb-1 link">${i.rep_name }</div>
				<div class="row m-0 ">
					<div class="col-6 price">${i.rep_price }<span>원</span></div>
					<div class="col-6 diffD">${i.rep_diff_date }</div>
				</div>
				<div class="row m-0 mt-2 pt-2 pb-2 ar">
					<div class="col-12 area"><i class="fas fa-map-marker-alt" style="margin-right: 8px; color:#a9a9a9"></i>${i.rep_area}</div>
				</div>
				<input type=hidden value=${i.rep_seq } class=seq>
			</div>       
		</c:forEach>
		</div> 
    </div>
</body>
</html>