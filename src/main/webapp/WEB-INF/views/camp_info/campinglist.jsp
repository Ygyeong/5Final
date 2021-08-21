<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camping List</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
		z-index:10;
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

</style>
<script>
	$(function(){

		
	})
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
                        		<a href='/detail.info?contentId=${i.contentId }'><img class="img-fluid" src="${i.firstImageUrl}">
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
    

</body>
</html>