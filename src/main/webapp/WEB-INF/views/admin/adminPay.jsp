<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>



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



/*사이드 바 */

.side_nav{

 	display:inline-block;
    justify-content: space-between;
    align-items: center;
    background-color: #263343;
    padding-top:100px;
   
   
}

.side_menu{
	list-style: none;
	
}

.side_menu li{
	
	margin-left:-20px;
	padding: 30px;
	text-align:center; 
}

.side_menu li:hover {
    background-color: steelblue;
    border-radius: 4px;
}



.body_txt{
	
	display:inline-block;
	text-align:center;
	top:150px; left:300px; 
	position:absolute;
	overflow-y:auto;

}

#paymenu {
	height: 60px;
	width: 200px;

}

#paylist, #payinsert {
	height: 100%;
	width: 50%;
	background-color: #D9E5FF;
	float:left;	
	align-items: center;
}

#paylist:hover , #payinsert:hover {
	height: 100%;
	width: 50%;
	background-color: #EEEE;
	float:left;	
	align-items: center;
}
/*회원테이블 */

.id{
	width:150px;
}
.name {
	width:100px;

}

.mail{
	width:200px;

}

.phone{
	width:300px;
}

.address{

   width:60px;
}

.deleteBtn{
	
	width:180px;


}

</style>


</head>
<body>
	<nav class="navbar">
        <div class="navbar_logo">
           
            <a href="/" style="color:rgba(255, 255, 255, 0.925);"><img
							src="/assets/img/background/newLogo_negative.png"
							style="width: 120px; height: auto; margin-bottom: -6px; margin-right: -10px;">별보러갈래?</a>

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
    
    
    <!--사이드바  -->
    
     <div class="side_nav">
    
    	<ul class="side_menu">
            <li><a href="/admin/mem?cpage=1">회원관리</a></li>
            <li><a href="/admin/newProduct">새상품 관리</a></li>
            <li><a href="/admin/re">중고상품 관리</a></li>
            <li><a href="/admin/pay">결제내역 관리</a></li>
           	<li style="height:200px;"></li>
        </ul>   
    </div> 
    
    
    <div class="body_txt" >
    		
		<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col" class="id">아이디</th>
      <th scope="col" class="name">성명</th>
      <th scope="col" class="mail">주문번호</th>
      <th scope="col" class="phone">상품</th>
      <th scope="col" class="address">개수</th>
      <th scope="col" class="deleteBtn">총 가격</th>
    </tr>
  </thead>
  
  
 
  <tbody>
  
  <c:forEach var="i" items="${list}"> 	
    <tr>
      <th scope="row">${i.o_seq }</th>
      
      <td id="targetID">${i.m_id }</td>
      <td>${i.o_name }</td>
      <td>${i.o_num }</td>
      <td>${i.o_product }</td>
      <td>${i.o_qcy }</td>
      <td>${i.o_allSum }<span style="margin-left:4px;">원</span></td>
     </form>
    </tr>    
    </c:forEach>
  
  </tbody>
  
 
</table>
    	
    	
    	
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

</body>
</html>