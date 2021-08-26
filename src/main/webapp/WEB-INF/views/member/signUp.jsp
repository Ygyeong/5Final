<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/signUp.css">
<title>** Welcome **</title>

<script>

$(function(){
	// 뒤로가기 버튼 (Back Btn)
	$("#back").on('click', function(){
		location.href="/";	
	});
	
	$("#signup").on('click', function(){
		var email = $("#cm_email").val();

		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[0-9a-zA-Z]{2,5}$/i;

		if(!regExp.test(email)){
			alert("이메일 형식이 틀립니다.")
		}else{
			$("#formaction").attr("action", "/member/signProc")
		}
	});
	
	
	// 주소 (PostAddress)
	$("#postBtn").on('click', function(){
	        new daum.Postcode({
	            oncomplete: function(data) {

	                var roadAddr = data.roadAddress;
	                var extraRoadAddr = '';

	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }

	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }

	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }


	                document.getElementById('cm_zipcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = data.roadAddress;

	            }
	        }).open();
	
	});
	// id 중복 Check(Checked id)
	$("#idCheck").on('click', function(){
		$.ajax({
			url:"/member/idDuplCheck",
			type: "POST",
			dataType:"JSON",
			data:{"cm_id" : $("#cm_id").val()},
			success : function(data){
				if(data > 0){
					alert("중복된 아이디입니다.");
					$("#cm_id").val("");
					$("#cm_id").focus;
				}else if(data == 0){
					alert("사용 가능한 아이디입니다.")
				}
			}
		})
	});
	
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
			return false;
		}
	});
	
});

</script>

</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>SIGN UP</h3>
                </div>
                <div class="card-body">
                    <form method="post" name="formaction" id="formaction">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" id="cm_id" name="cm_id" class="form-control" placeholder="아이디를 입력하세요." required>
                           	<input type="button" value="ID 중복확인" id="idCheck">
                           	
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" id="cm_pw" name="cm_pw" class="form-control" placeholder="비밀번호를 입력하세요." required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i></i></span>
                            </div>
                            <input type="password" id="password2" name="password2" class="form-control" placeholder="비밀번호를 확인하세요." required>
                            
                        </div>
                        <div class=pwCheckText></div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i></i></span>
                            </div>
                            <input type="text" id="cm_name" name="cm_name" class="form-control" placeholder="이름을 입력하세요." required>
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            </div>
                            <input type="text" id="cm_email" name="cm_email" class="form-control" placeholder="이메일 입력." required>
                          
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="text" id="cm_phone" name="cm_phone" class="form-control" placeholder="01012345678" required>
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="text" id="cm_zipcode" name="cm_zipcode" class="form-control" placeholder="postcode">
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" id="postBtn" class="btn btn-primary" value="주소찾기">
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            </div>
                            <input type="text" id="roadAddress" name="cm_address1" class="form-control" placeholder="도로명 주소">

                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="text" class="form-control" name="cm_address2" placeholder="상세주소">
                        </div>

                        <div class="form-group">
                            <input type="submit" id="signup" value="회원가입" class="btn btn-success sign_btn">
                    		<input type="button" id="back" value="돌아가기" class="btn btn-danger back_btn">
                        </div> 
                	</form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>