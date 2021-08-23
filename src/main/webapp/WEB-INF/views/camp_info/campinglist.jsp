<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camping List</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>
<link href="/css/liststyles.css" rel="stylesheet">

</head>
<style>
	#header{
		width:100%;
		height:200px;
		background-image:url('/img/campinglist/camping06.jpg');
		margin:0%;	
	}
	
	.text-center{
		margin: 50px 0 50px 0;
	}
	
	#headerimg{
		position:absolute;
		background-color:rgba(0, 0, 0, 0.35);
		width:100%;
		height:200px;
	}
	
	#searchbox{
		background-color:rgba(0, 0, 0, 0.10);
		width:90%;
		height:100px;
  		margin:auto;
  		text-align:center;
	}
	
	#cmapinglist{
		margin: 3% 1% 0 1%;
	}
	
	#items{
		margin:auto;
		text-align:center;	
	}
	
	#searchinput{
		width:40%;
	}
	
	#search {
		width:100%;
  		display: inline-block;
    	margin-top: 30px;
	}	
	
	
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
     z-index:100;
    

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
         z-index:100;
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

</style>
<script>
	$(function(){

		
	})
</script>
<!--nav bar  -->
<c:choose>
<c:when test="${loginID==null }">
<nav class="navbar">
        <div class="navbar_logo">
           
            <a href=""><img src="/assets/img/background/camp_logo.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>

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

        <a href="#" class="navbar_toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>

</c:when>
<c:when test="${loginID='admin'}">
<nav class="navbar">
        <div class="navbar_logo">
           
            <a href=""><img src="/assets/img/background/camp_logo.png"style="width:50px;height:auto;margin-right:7px;margin-top:-12px;">별보러갈래?</a>

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

        <a href="#" class="navbar_toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </nav>

</c:otherwise>


</c:choose>

    
    <script>
    
    
    const toogleBtn = document.querySelector('.navbar_toogleBtn');
    const menu = document.querySelector('.navbar_menu');
    const member = document.querySelector('navbar_member');


    toogleBtn.addEventListener('click', () => {

        menu.classList.toggle('active');
        member.classList.toggle('active');


    });
    
    </script>
    
<div id=header>
     <div id="headerimg"></div>  
</div>           
<body id="page-top" class="" style="">

           <div class="container">			
           	<div class="list">
           	<!-- 캠핑 글씨 -->
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Camping</h2>
                    <h3 class="section-subheading text-muted"> 가고 싶은 캠핑장을 골라 보세요! </h3>
                </div>
             <!--  검색 박스 -->
             <div id="searchbox">
             	<div id="search">
             		검색 <input type=text id="searchinput"><button>검색</button>
             	</div>
			</div>
			<!--  목록 출력 -->
                <div class="row" id="cmapinglist">
                <c:forEach var="i" items="${list}">
                    <div class="col-lg-3 col-sm-6 mb-4" id=items>
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                        		<a href='/info/detail?contentId=${i.contentId }'><img class="img-fluid" src="${i.firstImageUrl}">
                            	</a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">${i.facltNm}</div>
                                <div class="portfolio-caption-subheading text-muted"></div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>   
                </div>
              </div>
              
           </div>


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    	<script botId="B2pe9j" src="https://www.closer.ai/js/webchat.min.js"></script>

</body>
</html>