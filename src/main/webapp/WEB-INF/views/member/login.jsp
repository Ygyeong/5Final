<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<title>** login **</title>
<script>

	Kakao.init('6b3c3c63b3e936ce62f9510a5191d297');
	Kakao.isInitialized();
	console.log(Kakao.isInitialized());

	$(function(){
		$("#kakaoLogin").on('click', function(){
			alert("준비중입니다.");
		})
		
		$("#googleLogin").on('click', function(){
			alert("준비중입니다.");
		})
	})

</script>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>LogIn</h3>

                </div>
                <div class="card-body">
                    <form action="loginProc" method="POST">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" id="cm_id" name="cm_id" class="form-control" placeholder="아이디를 입력하세요." required>
                            
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" name="cm_pw"class="form-control" placeholder="비밀번호를 입력하세요." required>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="로그인" class="btn float-right login_btn">
                        </div>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        같이 별보러 갈래요?<a href="/member/signPage">회원 가입</a>
                    </div>
                    <div class="d-flex justify-content-center links2">
                        <a href="/member/pwChange">저런! 비밀번호를 잊으셨군요?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>