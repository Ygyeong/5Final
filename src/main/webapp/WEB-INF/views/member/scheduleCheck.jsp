<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>** SCHDULECHECK **</title>

<script>
	$(function(){
		$("#closeBtn").on('click', function(){
			self.close();
		})
	})
</script>

</head>
<body>
<table>
		<tr><th> 제 목 </th><th> 실행날짜 </th><th> 메모 </th></tr>
						
		<c:forEach items="${list}" var = "i">
		<tr>
			<td>${i.subject}</td>
			<td>${i.startDate}</td>
			<td>${i.memo}</td>
		</tr>
	</c:forEach>		
</table>


<button id="closeBtn">닫기</button>
</body>
</html>