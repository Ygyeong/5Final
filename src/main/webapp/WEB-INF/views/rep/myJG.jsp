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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>
 <style>
        
        .container-fluid{width:1000px; margin: auto; margin-top:160px; margin-bottom:100px;}
        #sell,#wish,#soldout{font-weight:1000;}
        #sell a,#wish a,#soldout a{border-bottom:2px solid black; margin-top:22px;}
        .sell,.wish,.soldout a{cursor:pointer;}
        .sell,.wish,.soldout{font-size:20px; font-weight:300px;}
        .wish{padding-left:18px;}
        .count{font-weight:600;}
        .count span{margin-left:5px;}
        
        .listbar{ margin: 0px; margin-top: 15px; }
      .list{height:100%; width:220px;  margin:0px 14px 50px 13px; border:1px solid #ddd;}
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
      .userID{font-size:25px;font-weight:bold; text-align:center;}
      .userID span{font-size:13px; margin-left:3px;}
      #pageList{text-align:center; margin-top:30px;}
      #page{color:black; }

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
    <script>
    	$(function(){
    		$(".userID").text($(".writer").val());
    		
    		let cseq = $("#click").val();
    		console.log(cseq);
    		if(cseq==1) {
    			$(".sell").attr("id","sell");
    		}else if(cseq==2) {
    			$(".wish").attr("id","wish");
    		}else {
    			$(".soldout").attr("id","soldout");
    		}
    		
    		$(".list").on("click",function(){
    			let seq=$(this).find(".seq").val();
    			location.href="/rep/detail?rep_seq="+seq;
    		})
    		$(".sell").on("click",function(){
    			let seq = $(this).attr("seq");
    			console.log(seq);
    			location.href="/rep/myJG?index=1&id="+$("#id").val()+"&seq="+seq;
    		})
    		$(".wish").on("click",function(){
    			let seq = $(this).attr("seq");
    			console.log(seq);
    			location.href="/rep/myJG?index=1&id="+$("#id").val()+"&seq="+seq;
    		})
    		$(".soldout").on("click",function(){
    			let seq = $(this).attr("seq");
    			console.log(seq);
    			location.href="/rep/myJG?index=1&id="+$("#id").val()+"&seq="+seq;
    		})
    		
    	})
    </script>
</head>
<body>
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

    <div class="container-fluid p-0">
    <c:choose>
    	<c:when test="${loginID!=userID}">
    		<div class="row m-0">
            <div class="col-3 p-0 mt-5">
                <div class="col-12 p-0 userID">${userID }<span>님</span></div>
                <div class="col-12 p-0">시작 날짜</div>
                <div class="col-12 p-0">상품<span id=total>${totalCount}</span></div>
            </div>
            <div class="col-9 p-0">
                <div class="row m-0">
                    <div class="col-2 sell" seq=1><a>판매상품</a></div>
                    <div class="col-2 wish" seq=2><a>찜상품</a></div>
                    <div class="col-2 soldout" seq=3><a>판매완료</a></div>
                    <input type=hidden id="click" value="${seq}" >
                    <input type=hidden id="id" value="${userID}" >
                </div>
                <div class="row m-0 mt-5">
                    <div class="col-12 count">전체<span>${Count }</span></div>
                </div>
                <div class="row listbar" >
                <c:choose>
                	<c:when test="${Count == 0}">
                		<div class="col-12"></div>
                	</c:when>
                	<c:otherwise>
                		
                	</c:otherwise>
                </c:choose>
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
                            <input type=hidden value=${i.rep_writer } class=writer>
                        </div>     
                 </c:forEach>
                </div> 
                <div class="col-12" id="pageList">
			<c:forEach var="i" items="${navi}" varStatus="s">
			<c:choose>
				<c:when test="${i =='>' }">
					<a
						href="/rep/myJG?index=${navi[s.index-1]+1}&id=${userID}&seq=${seq}">${i }</a>
				</c:when>
				<c:when test="${i =='<' }">
					<a
						href="/rep/myJG?cpage=${navi[s.index+1]-1}&id=${userID}&seq=${seq}">${i }</a>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${i==cpage }">
							<a
						href="/rep/myJG?cpage=${i}&id=${userID}&seq=${seq}" id=page>${index}</a>
						</c:when>
						<c:otherwise>
							<a
						href="/rep/myJG?cpage=${i}&id=${userID}&seq=${seq}" id=page>${i}</a>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</div>
            </div>
        </div>
    	</c:when>
    	<c:otherwise>
    		<div class="row m-0">
            <div class="col-3 p-0">
                <div class="col-12 p-0 userID">${userID }</div>
                <div class="col-12 p-0">시작 날짜</div>
            </div>
            <div class="col-9 p-0">
                <div class="row m-0 mt-5">
                    <div class="col-12 count">전체<span>${Count }</span></div>
                </div>
                <div class="row listbar" >
                 <c:choose>
                	<c:when test="${Count == 0}">
                		<div class="col-12">판매중인 상품이 없습니다.</div>
                	</c:when>
                	<c:otherwise>
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
                            <input type=hidden value=${i.rep_writer } class=writer>
                        </div>     
               			</c:forEach>
                	</c:otherwise>
                </c:choose>
              
                    
                </div> 
            </div>
        </div>
    	</c:otherwise>
    </c:choose>
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