<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<head>
<meta charset="UTF-8">
<title>** SCHEDULE INSERT **</title>
<script>
$(function(){
	
});
</script>
</head>
<body>
찜하기페이지
<table>
		<tbody id="myTable">
			<c:forEach items="${list}" var = "i">
			<tr>
				<td></td>
				<td>${i.facltNm}</td>
				<td></td>
			</tr>
			</c:forEach>
		</tbody>				
</table>
</body>
</html>