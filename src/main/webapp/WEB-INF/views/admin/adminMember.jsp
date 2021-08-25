<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>

<script>

$(function(){
	
	$('.memDelete').on('click',function(){
		
		
		if(confirm("정말 강제탈퇴를 실행하시겠습니까?")){
					
			$('#deleteForm').submit();
		}else{
			
			
		}
		
		
	})
	
	
});



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
    z-index:1000;
    

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


.side_nav{
    
     position:fixed;
   
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

.side{
	height:220px;

}



.body_txt{
	
	display:inline-block;
	text-align:center;
<<<<<<< HEAD
	padding:10%;
=======
	top:120px; left:230px; 
	position:absolute;

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
	width:180px;
}

.address{

   width:330px;
}

.deleteBtn{
	
	width:100px;


}


/*페이징  */
.pagination{

	diplay:inline;
>>>>>>> 98afcbb78e320ff0d8e89514932453a62e7bc88c
	position:absolute;
	top:600px;
	left:700px;

}

/*검색창 */

#searchForm{
	diplay:inline;
	position:absolute;
	top:530px;
	left:560px;
}


</style>
<script>
$(function(){
	
	$("#delete").on("click",function(){
		alert("클릭");
		var cm_id = $("#cm_id").val();
		console.log(cm_id);
		 $.ajax({
             url: "/admin/memberdelete",
             data: {cm_id: cm_id},
             method:"post",
             dataType:"application/json"
          }).done(function(){
        	  alert(cm_id+"님이 탈퇴됐습니다.");
          });

	})
	
}
</script>
</head>
<body>
	<nav class="navbar">
        <div class="navbar_logo">
           
            <a href="/" style="color:rgba(255, 255, 255, 0.925);"><img
							src="/assets/img/background/newLogo_negative.png"
							style="width: 120px; height: auto; margin-bottom: 4px;margin-top:-8px; margin-right: -8px;">별보러갈래?</a>

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
    
    
    <!--사이드바  -->
    
     <div class="side_nav">
    
    	<ul class="side_menu">
            <li><a href="/admin/mem?cpage=1">회원관리</a></li>
            <li><a href="/admin/newProduct">새상품 관리</a></li>
            <li><a href="/admin/pay">중고상품 관리</a></li>
            <li><a href="/admin/re">결제내역 관리</a></li>
           	<li class="side"></li>

        </ul>
        
    
    
    </div> 
    
    
    <div class="body_txt" >
   			
		<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col" class="id">아이디</th>
      <th scope="col" class="name">성명</th>
      <th scope="col" class="mail">이메일</th>
      <th scope="col" class="phone">전화번호</th>
      <th scope="col" class="address">주소</th>
      <th scope="col" class="deleteBtn"></th>
    </tr>
  </thead>
  
  
 
  <tbody>
  
  <c:forEach var="i" items="${list}"> 	
    <tr>
      <th scope="row">${i.cm_no }</th>
      
      <td id="targetID">${i.cm_id }</td>
      <td>${i.cm_name }</td>
      <td>${i.cm_email }</td>
      <td>${i.cm_phone }</td>
      <td>${i.cm_address1 }</td>
      <form action="/admin/memberOutProc" method="post" id="deleteForm">
      <input type="hidden" name="cm_id" value="${i.cm_id }">
      <td><input type="submit" value="강제탈퇴" onclick="if(!confirm('정말 강제탈퇴를 실행하시겠습니까?')){return false;}"></td>
     </form>
    </tr>    
    </c:forEach>
  
  </tbody>
  
 
</table>
 			
   			
 </div>


<!--페이징  -->


<nav aria-label="Page navigation example" class="page">
  <ul class="pagination">
    <li class="page-item">
     
     
     
      <c:choose>
             <c:when test="${category==null || keyword==null }">
           
              <c:forEach var="i" items="${navi}" varStatus="s">
          	  		<c:choose>
          	  			<c:when test="${i == '>' }">
          	  		
          	  				<li class="page-item"><a class="page-link" href="list?cpage=${navi[s.index-1]+1}"> ${i} </a></li>
          	  			 
          	  			</c:when>
          	  			<c:when test="${i == '<' }">
          	  		
          	  				<li class="page-item"><a class="page-link" href="list?cpage=${navi[s.index+1]-1}"> ${i} </a></li>
          	  			
          	  			</c:when>
          	  		
          	  			<c:otherwise>
          	  				<c:choose>
          	  					<c:when test="${i==cpage}">
          	  						<li class="page-item active"><a class="page-link" href="list?cpage=${i}"> ${cpage} </a></li>
          	  					</c:when>
          	  					<c:otherwise>
          	  						<li class="page-item"><a class="page-link" href="list?cpage=${i}"> ${i} </a></li>
          	  					</c:otherwise>
          	  				</c:choose>
          	  			</c:otherwise>
          	  		</c:choose>
          	  		</c:forEach>
          	  	</c:when>
          	  	<c:otherwise>
          	  	
              <c:forEach var="i" items="${navi}" varStatus="s">
          	  		<c:choose>
          	  			<c:when test="${i == '>' }">
          	  		
          	  				<li class="page-item"><a class="page-link" href="list?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}" id="rightArrow"> ${i} </a></li>
          	  			 
          	  			</c:when>
          	  			<c:when test="${i == '<' }">
          	  		
          	  				<li class="page-item"><a class="page-link" href="list?cpage=${navi[s.index+1]-1}&category=${category}&keyword=${keyword}" id="leftArrow"> ${i} </a></li>
          	  			
          	  			</c:when>
          	  		
          	  			<c:otherwise>
          	  				<c:choose>
          	  					<c:when test="${i==cpage}">
          	  						<li class="page-item active"><a class="page-link" href="list?cpage=${i}&category=${category}&keyword=${keyword}" id="bottomNumber"> ${cpage} </a></li>
          	  					</c:when>
          	  					<c:otherwise>
          	  						<li class="page-item"><a class="page-link" href="list?cpage=${i}&category=${category}&keyword=${keyword}" id="bottomNumber"> ${i} </a></li>
          	  					</c:otherwise>
          	  				</c:choose>
          	  			</c:otherwise>
          	  		</c:choose>
          	  		</c:forEach>
          	  	
          	  	
          	  	
          	  	</c:otherwise>
          	  	
          	  	
          	  	</c:choose>
   
   
   
   
    </li>
  </ul>
</nav>



<!--검색창 -->

						<div>
                            <form action="/admin/mem" method="get" id="searchForm" style="border:1px solid black;">
                            <input type=hidden name=cpage value="1">
                            <select name="category" style="font-size:large; height:40px; border:none;">
								<option value="cm_id">아이디</option>
								<option value="cm_name">이름</option>
								<option value="cm_email">이메일</option>
								<option value="cm_phone">전화번호</option>
								<option value="cm_address1">주소</option>
							</select>
                            <input type="text" name="keyword" class="page-item active" style="width:200px;height:40px;border:none;" placeholder="검색어를 입력하세요" >
                            <a class=btn onclick="jQuery('#searchForm').submit();" style="padding-left:5px;"><img src="/resources/aboutGallery/images/search.png" style="width:20px;height:20px;margin-bottom:3px;margin-right:-4px"></a>
                        	</form>
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