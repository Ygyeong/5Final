<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
<script src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage.css">
<title>** MY PAGE **</title>
<script>
	$(function(){
		$("#myPageModify").on("click", function(){
			location.href="/member/memberModify?cm_id=${loginID}";
		})
		$("#myPagePwChange").on("click", function(){
			location.href="/member/pwChange"
		})
		$("#myPageMemberDelete").on("click", function(){
			location.href="/member/memberOutProc?cm_id=${loginID}"
		})
		$("#goHome").on("click",function(){
			location.href="/"
		})
	})
</script>
</head>
<body>
	<div>
		<div id="myBox">
	        <div id="me" class="card">
				<img src="card-img-top" src="" alt="card image">
                <div class="card_body">
                    <h5 class="card-title"> ${loginID}님의 마이페이지 </h5>
                    <button class="myPageBtn btn-success" id="myPageModify">회원정보 수정</button>
                    <button class="myPageBtn btn-primary" id="myPagePwChange">비밀번호 변경</button>
                    <button class="myPageBtn btn-danger" id="myPageMemberDelete">회원 탈퇴</button>
                    <button class="myPageBtn btn-dark" id="goHome">메인으로</button>
                </div>
            </div>
            <div id="calendar"></div>
            <div class="container">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link" href="#">리뷰</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">장바구니</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">찜 목록</a>
                    </li>
                </ul>     
                <table class="table table-hover">
                  <thead>
	                  <tr>
	                  	<th>Firstname</th>
	                    <th>Lastname</th>
	                    <th>Email</th>
	                  </tr>
                  </thead>
                  <tbody>
	                    <tr>
	                      <td>John</td>
	                      <td>Doe</td>
	                      <td>john@example.com</td>
	                    </tr>
	                    <tr>
	                      <td>Mary</td>
	                      <td>Moe</td>
	                      <td>mary@example.com</td>
	                    </tr>
	                    <tr>
	                      <td>July</td>
	                      <td>Dooley</td>
	                      <td>july@example.com</td>
	                    </tr>
                	</tbody>
            	</table>
			</div>
        </div>
    </div>
</body>
</html>