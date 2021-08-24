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
		<tr><th>할일</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						
		<c:forEach items="${list}" var = "i">
		<tr>
			<td>${i.subject}</td>
			<td>${i.startDate}</td>
			<td>${i.memo}</td>
		</tr>
	</c:forEach>		
</table>


<button id="closeBtn">완료!</button>
</body>
</html>