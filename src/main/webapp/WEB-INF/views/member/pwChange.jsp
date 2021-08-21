<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** PW CHANGE **</title>

<script>
	$("#cm_pw2").on('click', function(){
		
		var pw = $("#cm_pw").val();
		var pw2 = $("#cm+pw").val();
		
		if(pw == pw2){
			
			$(".pwCheckText").css("color", "charteuse");
			$(".pwCheckText").text("새로운 비밀번호 일치");
			
		}else if(pw != pw2){
			
			$(".pwCheckText").css("color", "red");
			$(".pwCheckText").text("새로운 비밀번호 불일치");
		}
	})
</script>
</head>
<body>
	<div id="pwChangeBox">
	
		<input type="password" id="cm_pw" name="cm_pw" placeholder="변경할 비밀번호를 입력해주세요.">
		<input type="password" id="cm_pw2" name="cm_pw2" placeholder="비밀번호를 확인해주세요.">
		<div class="pwCheckText"></div>
		<input type="submit" value="비밀번호 변경">
		
	</div>
</body>
</html>