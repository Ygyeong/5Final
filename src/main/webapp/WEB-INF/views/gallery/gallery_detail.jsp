<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>후기 보기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Favicon -->
<link href="aboutGallery/img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="aboutGallery/lib/animate/animate.min.css" rel="stylesheet">
<link href="aboutGallery/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="aboutGallery/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="aboutGallery/css/style.css" rel="stylesheet">

<!--Font  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">




<style>
.star_rating {
	font-size: 0;
	letter-spacing: -4px;
	display: inline-block;
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
</style>
<script>
$(function(){
    

	
	
	$("#back").on("click",function(){
		/* location.href="javascript:history.back()" */
		location.href ="${pageContext.request.contextPath}/galList.gal?cpage=1"
		
		
	})


	 $("body").on("click","#del",function(){
	
	if(confirm("정말 삭제하시겠습니까?")){
		$(this).parents("#comment").siblings("#seq").attr("name","seq");
		
		$(this).parents(".commentForm").attr("action","/com/delete").submit();
	}
	
	
})


$("body").on("click","#modi",function(){

	if($(this).val()=="수정"){
		$(this).val("완료");
		$(this).parents(".container").children(".content").attr("contenteditable","true");
    	$(this).parents(".container").children(".content").focus();
    	$(this).parents(".").siblings("#seq").attr("name","seq");	
    	
	}else{
		$(this).parents(".container").find(".modifytxt").val($(this).parents(".container").children(".content").text());
		$(this).parents(".commentForm").attr("action","/com/update").submit();
	}
	 
	
	
}) 


	



	$("#btn").on("click",function(){
	
	var formData = $("#comForm").serialize();
		
		$.ajax({
		 	url:"/com/add",
			type:"post",
		 	data: formData
			
		}).done(function(resp){
			console.log(resp);
			
			
		});
		
		
	}) 
	
	
	



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
                <a href="/" class="navbar-brand"  style="font-family: 'Nanum Brush Script';font-size: 30px;font-weight:normal;"><img src="/assets/img/background/newLogo_negative.png"style="margin-right:-5px;margin-bottom:10px;">별보러갈래?</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse"> 
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="/info/list?index=1" class="nav-item nav-link">캠핑장</a>
                        <a href="/CampTipBoard/selectAll" class="nav-item nav-link">캠핑정보</a>
                        <a href="/products/selectAll?index=1" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>
                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                   
                        <a href="/member/signPage" class="nav-item nav-link">회원가입</a>
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
                <a href="/" class="navbar-brand"  style="font-family: 'Nanum Brush Script';font-size: 30px;"><img src="/assets/img/background/newLogo_negative.png"style="margin-right:-5px;margin-bottom:10px;">별보러갈래?</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="/info/list?index=1" class="nav-item nav-link">캠핑장</a>
                        <a href="/CampTipBoard/selectAll" class="nav-item nav-link">캠핑정보</a>
                        <a href="/products/selectAll?index=1" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>
                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑후기</a>
                        <div style="border: 1px solid none; width: 100px;"></div>
                        
                        <a href="/admin/home" class="nav-item nav-link">관리자 페이지</a>
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
                <a href="/" class="navbar-brand"  style="font-family: 'Nanum Brush Script';font-size: 30px;"><img src="/assets/img/background/newLogo_negative.png"style="margin-right:-5px;margin-bottom:10px;">별보러갈래?</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="/info/list?index=1" class="nav-item nav-link">캠핑장</a>
                        <a href="/CampTipBoard/selectAll" class="nav-item nav-link">캠핑정보</a>
                        <a href="/products/selectAll?index=1" class="nav-item nav-link">SHOP</a>
                        <a href="/rep/list?index=1" class="nav-item nav-link">중고장터</a>
                        <a href="/gal/list?cpage=1" class="nav-item nav-link">캠핑후기</a>
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


	<!-- Page Header Start -->
	<div class="page-header"
		style="background-image: url(aboutGallery/images/gallery_review2.jpg); height:500px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2 style="color:white; left:500px;">캠핑 후기</h2>
				</div>
				
			</div> 
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Single Page Start -->
	<div class="single">
		<div class="container">
			<div class="section-header text-center">


				<h3>${list.title }</h3>
				<div style="border-bottom: 1px solid gray;">
					${list.writer } | ${list.write_date } |

					<c:choose>

						<c:when test="${list.rating==1 }">

							<p class="star_rating">
								<a href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a>
								<a href="#">★</a> <a href="#">★</a>
							</p>

						</c:when>

						<c:when test="${list.rating==2 }">

							<p class="star_rating">
								<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
									href="#">★</a> <a href="#">★</a> <a href="#">★</a>
							</p>

						</c:when>

						<c:when test="${list.rating==3 }">

							<p class="star_rating">
								<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
									href="#" class="on">★</a> <a href="#">★</a> <a href="#">★</a>
							</p>

						</c:when>

						<c:when test="${list.rating==4 }">

							<p class="star_rating">
								<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
									href="#" class="on">★</a> <a href="#" class="on">★</a> <a
									href="#">★</a>
							</p>

						</c:when>

						<c:when test="${list.rating==5 }">

							<p class="star_rating">
								<a href="#" class="on">★</a> <a href="#" class="on">★</a> <a
									href="#" class="on">★</a> <a href="#" class="on">★</a> <a
									href="#" class="on">★</a>
							</p>

						</c:when>



					</c:choose>

				</div>


			</div>

			<div class="row" style="width: 70%; margin: auto;">
				<div class="col-12">
					<c:forEach var="img" items="${flist }">

						<img src="/resources/aboutGallery/files/${img.sysName}">
					</c:forEach>
					${list.contents }
				</div>
			
				<div class="btn_wrap" style="display: inline-block;margin-top:70px;">
					<c:choose>
						<c:when test="${loginID eq list.writer}">
							<a href="/gal/modifyForm?seq=${list.seq}" class="btn btn-warning"
								style="background-color: #ffc107; color: white">수정</a>
							<a href="#boardDeleteForm" class="btn btn-danger"
								data-toggle="modal">삭제</a>
						</c:when>
						
						<c:when test="${loginID=='admin'}">
						
						<a href="#boardDeleteForm" class="btn btn-danger"
								data-toggle="modal">삭제</a>
						
						
						</c:when>
						
					</c:choose>
					<a href="/gal/list?cpage=1" id="backBtn" class="btn btn-default pull-left"
						style="background-color: #00285b; color: white">목록</a>
				</div>

			</div>
		</div>
	</div>




	<!-- Single Page End -->
	<br>
	<br>
	<br>
	


	<c:choose>
		<c:when test="${loginID==null }">
			<div class="container"
				style="overflow: hidden; width: 800px; margin: auto;" id=comment>

				<div class="header" style="background-color: white;">
					<a href="temp_login.jsp">댓글을 작성하려면 로그인 해주세요.<!--로그인proc 두개 만들어 줘야/로그인해서 바로 게시물로 이어지는 프록  --></a>
				</div>

				<hr>

			</div>

		</c:when>




		<c:otherwise>
			<form method="post" id="comForm">


				<div class="container col-12 col-lg-12 col-xl-12 p-0"
					style="overflow: hidden; width: 800px; margin: auto; border: 1px solid #ddd; border-radius: 10px;"
					id=comment>

					<div class="header col-12 col-lg-12 col-xl-12 p-0"
						style="background-color: white;margin-left:15px;">글쓴이 : ${loginID}</div>
					<div class="content col-12 col-lg-12 col-xl-12 p-0"
						style="width: 770px; height: 110px;">
						<textarea
							style="height: 100%; width: 100%; border: 1px solid black; border-radius: 10px; margin-left: 12px;"
							name="comments" id=comments placeholder="댓글을 입력해주세요."
							class="content col-12 col-lg-12 col-xl-12 p-0" required></textarea>
						<input type=hidden value=${list.seq } name=gallery_seq>

					</div>

					<hr>
					<div class="reply">
						<button id=btn class="btn btn-primary"
							style="float: right; margin-bottom: 10px; margin-right: 10px;">등록</button>
					</div>




				</div>


			</form>

		</c:otherwise>
	</c:choose>

	<br>
	<br>
	<br>
	
	
	<!-- 등록 댓글 출력 부분 -->
	<c:forEach var="clist" items="${clist}">
		<c:choose>
			<c:when test="${loginID==clist.writer}">


				<form action="" method=get class=commentForm>
					<div class="container col-12 col-lg-12 col-xl-12 p-0"
						style="overflow: hidden; width: 800px; margin: auto;" id=comment>
						<div class="header" style="background-color: white;">ID
							:${clist.writer} ${clist.write_date }</div>
						<div class="content">${clist.comments }</div>
						<input name=comments type=hidden class=modifytxt> <input
							name=seq value="${clist.seq }" type=hidden>


						<hr>

						<div class="reply">

							<button type="button" id=del class="btn btn-primary"
								style="float: right; margin-bottom: 10px; margin-left: 10px;">삭제</button>
							<input type="button" id=modi class="btn btn-primary"
								style="float: right; margin-bottom: 10px;" value="수정">
						</div>
					</div>
					<input type="hidden" value="${clist.seq}" id="seq"> <input
						type="hidden" name="gallery_seq" value="${list.seq}">
				</form>
			</c:when>
			<c:otherwise>


				<br>
				<div class="container"
					style="overflow: hidden; width: 800px; margin: auto;" id=comment>

					<div class="header" style="background-color: white;">ID :
						${clist.writer} ${clist.write_date }</div>
					<div class="content">${clist.comments }</div>
					<hr>

				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>




	<!-- Board Delete Modal HTML -->
	<div id="boardDeleteForm" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/gal/delete?seq=${list.seq}" method="post">
					<div class="modal-header">
						<h4 class="modal-title">게시글을 삭제하시겠습니까?</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>삭제된 게시글은 복구할 수 없습니다.</p>
						<p class="text-warning">
							<small>해당 게시글의 댓글 또한 삭제됩니다.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="취소"> <input type="submit" class="btn btn-danger"
							value="삭제" id="delete">
					</div>
				</form>
			</div>
		</div>
	</div>



	


	<!-- <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a> -->

	<!-- JavaScript Libraries -->
	
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
