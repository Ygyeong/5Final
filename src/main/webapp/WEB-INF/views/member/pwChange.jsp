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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<title>** PW CHANGE **</title>
<script>
$(function(){
	$(".back_btn").on('click', function(){
		location.href="/"
	})
	
	$("#password2").on('keyup', function(){
		var pw = $("#cm_pw").val();
		var pwCheck = $("#password2").val();
		
		if(pw == pwCheck){
			
			$(".pwCheckText").css("color", "chartreuse");
			$(".pwCheckText").text("비밀번호 일치");
			$(".pwCheckText").attr("</br>");
			
		}else if(pw != pwCheck){
			
			$(".pwCheckText").css("color", "red");
			$(".pwCheckText").text("비밀번호 불일치");
			$(".pwCheckText").attr("</br>")
		}
	});
	
})
</script>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>PASSWORD CHANGE</h3>
                </div>
                <div class="card-body">
                    <form action="/member/pwModifyProc?cm_id=${member }" method="POST">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            
                            <input type="password" id="cm_pw" name="cm_pw" class="form-control" placeholder="새로운 비밀번호를 입력하세요." required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="password" id="password2" name="password2" class="form-control" placeholder="비밀번호를 확인하세요." required>
                        </div>
                        <div class=pwCheckText></div><br>
                        <div class="form-group" style="text-align:center">
                            <input type="submit" value="변경완료" class="btn btn-success change_btn">
                            <input type="button" value="뒤로가기" class="btn btn-danger back_btn">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>