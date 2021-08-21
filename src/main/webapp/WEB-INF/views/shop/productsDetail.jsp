<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>상품상세</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    // Activate tooltip
    $('[data-toggle="tooltip"]').tooltip();
    
    // 장바구니 modal에 p_seq 값 부여
    $("#inputCart").on("shown.bs.modal",function(e){
       let seq = $(e.relatedTarget).data("seq");
       $("#okCart").attr("p_seq",seq);
    })
    
    $("#okCart").on("click",function(){
    	let p_seq = ${dto.p_seq};
    	
    	location.href = "/cart/insertCart?p_seq=${dto.p_seq}&c_qty=1";
    })
})

	
</script>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="d-flex" style="float:right;">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="/img/surf.jpg" alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">SKU: BST-498</div>
					<h1 class="display-5 fw-bolder">${dto.p_name}</h1>
					<div class="fs-5 mb-5">금액 : 
						<span>${dto.p_price} 원</span>
					</div>
					<div class="">
					<div class="fs-5 mb-5">
					<input class="btn btn-warning btn-lg btn-block flex-shrink-0" style="background-color: #ffc107; color:white;" type="button" value="결제하기">
					<a href="#inputCart" class="btn btn-secondary btn-lg full-right" data-seq="${dto.p_seq}" data-target="#inputCart"data-toggle="modal">장바구니</a>
					</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related items section-->
	<section class="py-5 bg-light">
		
				
		
	</section>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	
	<!-- 장바구니 이동 여부 확인 -->
   <div id="inputCart" class="modal fade">
      <div class="modal-dialog">
         <div class="modal-content">
            <form action="/products/insertCart" method="">
               <div class="modal-header">
                  <h4 class="modal-title">장바구니에 상품을 담았습니다.</h4>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">&times;</button>
               </div>
               <div class="modal-body">
                  <p>장바구니로 이동하시겠습니까?</p>
               </div>
               <div class="modal-footer">
                  <input type="button" class="btn btn-default" data-dismiss="modal"
                     value="취소">
                     <input type="hidden" class="p_seq" value="${dto.p_seq }">
                     <input type="submit" class="btn btn-danger" value="확인" id="okCart" data-dismiss="modal">
               </div>
            </form>
         </div>
      </div>
   </div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
		
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
</body>
</html>
