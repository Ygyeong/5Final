<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modify.css">
<title>** Modify **</title>
<script>
$(function(){
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
	
	$("#back").on('click', function(){
		location.href="/member/myPage?cm_id=${member.cm_id}";
	});
	
	$("#signup").on('click', function(){
		$("#modifyForm").attr("action", "/member/memberModifyProc");
	})
})

</script>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Modify</h3>
                </div>
                <div class="card-body">
                    <form id="modifyForm">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" id="id" name="cm_id" class="form-control" value="${member.cm_id }" readonly>
                            
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i></i></span>
                            </div>
                            <input type="text" name="cm_email" class="form-control" value="${member.cm_email }">
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="text" name="cm_phone" class="form-control" value="${member.cm_phone }">
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="text"id="cm_zipcode" name="cm_zipcode" class="form-control" value="${member.cm_zipcode }">
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="btn btn-dark" id="postBtn" value="주소 찾기">
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="text" name="cm_address1" class="form-control"id="roadAddress" name="roadAddress" value="${member.cm_address1 }">
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"></span>
                            </div>
                            <input type="text" name="cm_address2" class="form-control" value="${member.cm_address2 }">
                        </div>

                        <div class="form-group">
                            <input type="submit" id="signup" value="정보변경" class="btn btn-success sign_btn">
                            
                            <input type="button" id="back" value="돌아가기" class="btn btn-danger back_btn">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</body>
</html>