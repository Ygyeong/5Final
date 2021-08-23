<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
$(function(){

	$("#dataupdate").on("click",function(){
		alert("ok");
		location.href="/dataupdate";
	})
	
	
})
</script>
<body>
		<button id="dataupdate">DB에 저장</button>
</body>
</html>