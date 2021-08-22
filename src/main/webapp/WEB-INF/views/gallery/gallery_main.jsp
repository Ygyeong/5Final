<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>캠핑 후기</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
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

        <!-- Template Stylesheet -->
        <link href="aboutGallery/css/style.css" rel="stylesheet">
        
        
        <!--Font  -->


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script>
	
		$(function(){
			$("#writeBtn").on("click",function(){
				
				location.href="/gal/galleryWrite";
			})
			
			
		})
	
	</script>

<style>
.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating a {
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #ffd400;
}




.a img {
  transition: all 0.2s linear;
}
.a:hover img {
  transform: scale(1.3);
}

.blog-img {
	overflow: hidden;
}



</style>



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
                        <a href="index.html" class="nav-item nav-link">캠핑장</a>
                        <a href="about.html" class="nav-item nav-link">캠핑정보</a>

                        <a href="/shop/productsList" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>

                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑 후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                        
                        <a href="portfolio.html" class="nav-item nav-link">회원가입</a>
                        <a href="contact.html" class="nav-item nav-link">로그인</a>
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
                        <a href="index.html" class="nav-item nav-link">캠핑장</a>
                        <a href="about.html" class="nav-item nav-link">캠핑정보</a>
                        <a href="service.html" class="nav-item nav-link">SHOP</a>
                        <a href="price.html" class="nav-item nav-link">중고장터</a>
                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑 후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                        
                        <a href="portfolio.html" class="nav-item nav-link">관리자 페이지</a>
                        <a href="contact.html" class="nav-item nav-link">로그아웃</a>
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
                        <a href="index.html" class="nav-item nav-link">캠핑장</a>
                        <a href="about.html" class="nav-item nav-link">캠핑정보</a>

                        <a href="/shop/productsList" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>

                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑 후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                        
                        <a href="portfolio.html" class="nav-item nav-link">마이페이지</a>
                        <a href="contact.html" class="nav-item nav-link">로그아웃</a>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        </c:otherwise>
        
        </c:choose>
        <!-- Nav Bar End -->


        <!-- Page Header Start -->
        <div class="page-header"
		style="background-image: url(aboutGallery/images/gallery_review2.jpg); height:500px;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2 style="color: white;">캠핑 후기</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Blog Start -->
        <div class="blog">
            <div class="container">
                
                <div class="row blog-page">



				<c:forEach items="${list }" var="list">
                    <div class="col-lg-4 col-md-6" >
                        <div class="blog-item">
                            <div class="blog-img" style="width: 350px; height: 300px;">
                                <a href="/gal/detail?seq=${list.seq }" class="a"><img src="/resources/aboutGallery/files/${list.thumbPath }" style="object-fit: cover;"></a> 
                            </div>
                            <div class="blog-meta">
                                
                                <i class="fa fa-calendar-alt"></i>
                                <p>${list.write_date}</p>
                                <br>
                                <i class="fas fa-user" style="margin-left:-1px;"></i>
                                <p>${list.writer}</p>
                            </div>
                            <div class="blog-text" style="height:100px;">
                               <h3> <a href="/gal/detail?seq=${list.seq }"> ${list.title }</a></h3>
                                               
                                <c:choose>
  									
  									
  									<c:when test="${list.rating==0 }">
                                	
                                	<p class="star_rating">
   										<a href="/gal/detail?seq=${list.seq }" >★</a>
    									<a href="/gal/detail?seq=${list.seq }" >★</a>
    									<a href="/gal/detail?seq=${list.seq }" >★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
								 	</p>
                                	
                                	</c:when>
  									
  									
  									
  									
  									
  									<c:when test="${list.rating==1 }">
                                	
                                	<p class="star_rating">
   										<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" >★</a>
    									<a href="/gal/detail?seq=${list.seq }" >★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
								 	</p>
                                	
                                	</c:when>
                                	
                                	<c:when test="${list.rating==2 }">
                                	
                                	<p class="star_rating">
   										<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" >★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
								 	</p>
                                	
                                	</c:when>
                                	
                                	<c:when test="${list.rating==3 }">
                                	
                                	<p class="star_rating">
   										<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
								 	</p>
                                	
                                	</c:when>
                                	
                                	<c:when test="${list.rating==4 }">
                                	
                                	<p class="star_rating">
   										<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }">★</a>
								 	</p>
                                	
                                	</c:when>
                                	
                                	<c:when test="${list.rating==5 }">
                                	
                                	<p class="star_rating">
   										<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
    									<a href="/gal/detail?seq=${list.seq }" class="on">★</a>
								 	</p>
                                	
                                	</c:when>
                                
                                
                                
                                </c:choose>
                                



                                
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                     
                    
                   
                </div>
                
                
                
                
                <div >
                	
                
                <div class="row">
                    <div class="col-12">
                        <ul class="pagination justify-content-center">
                             <li class="page-item"><a class="page-link" href="/gal/galleryWrite">글쓰기</a></li>
                           <!-- <button type="button" id="writeBtn" class="page-item">글쓰기</button> -->
                            
                        </ul> 
                    </div>
                </div>
                </div>
                <div>
                <div class="row">
                    <div class="col-12">
                        <ul class="pagination justify-content-center">
                            
                        
                        
                        
                        <li style="border:1px solid black;">
                            <form action="/gal/list" method="get" id="searchForm">
                            <input type=hidden name=cpage value="1">
                            <select name="category" style="font-size:large; height:40px; border:none;">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
                            <input type="text" name="keyword" class="page-item active" style="width:200px;height:40px;border:none;" placeholder="검색어를 입력하세요" >
                            <a class=btn onclick="jQuery('#searchForm').submit();" style="padding-left:5px;"><img src="/resources/aboutGallery/images/search.png" style="width:20px;height:20px;margin-bottom:3px;margin-right:-4px"></a>
                        	</form>
                        </li>
                        
                        
                        
                        
                        </ul> 
                    </div>
                </div>
                </div>

	
		



			<!-- 페이징 -->
			<%-- <div class="row">
				<div class="col-12">
					 <ul class="pagination justify-content-center">
					
					
					<c:if test="${paging.startPage != 1 }">
						<li class="page-item"><a class="page-link" href="list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li class="page-item active"><b class="page-link" >${p }</b></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li class="page-item"><a class="page-link"  href="list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li class="page-item"><a class="page-link" href="list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					</c:if>
					
					
					</ul>
				</div>
			</div> --%>




			<!-- <div class="row">
                    <div class="col-12">
                        <ul class="pagination justify-content-center">
                        
                        
                            <li class="page-item"><a class="page-link" href="#"><</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">></a></li>
                            
                            
                            
                            
                        </ul> 
                    </div>
                </div> -->

	<div class="row">
		<div class="col-12">
             <ul class="pagination justify-content-center">
             
             
             
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
          	  						<li class="page-item active" ><a class="page-link" href="list?cpage=${i}"> ${cpage} </a></li>
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
          	  						<li class="page-item active" ><a class="page-link" href="list?cpage=${i}&category=${category}&keyword=${keyword}" id="bottomNumber"> ${cpage} </a></li>
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
           		 
           		 </ul>
            </div>
	</div>


		<!-- 	<div class="row">
                    <div class="col-12">
                        <ul class="pagination justify-content-center">
                            <li class="page-item"><a class="page-link" href="#"><</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">></a></li>
                        </ul> 
                    </div>
                </div> -->
                
                
                
                
                
                
            </div>
        </div>
        
        
        
        <!-- Blog End -->


        

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="aboutGallery/lib/easing/easing.min.js"></script>
        <script src="aboutGallery/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="aboutGallery/lib/isotope/isotope.pkgd.min.js"></script>
        <script src="aboutGallery/lib/lightbox/js/lightbox.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="aboutGallery/mail/jqBootstrapValidation.min.js"></script>
        <script src="aboutGallery/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="aboutGallery/js/main.js"></script>
    </body>
</html>
