<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<head>
<meta charset="UTF-8">
<title>** SCHEDULE **</title>
<script>
$(function(){
	$(".btn-danger").on('click', function(){
		window.close();
	})
	
	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#myTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	
});
</script>
</head>
<body>

 <div id="tableBox" style="text-align: center;">
        
        	<input class="form-control" id="myInput" type="text" placeholder="키워드를 입력해주세요" style="width:600px;margin:auto; margin-top:10px;">
			<table class="table table-striped" style="width:600px; margin:auto; margin-top:10px; margin-bottom:20px;">
				
				<thead class="thead-dark">
				<tr><th> 날짜 </th><th> 일정 </th><th> 메모 </th></tr>
				</thead>
				
				<tbody id="myTable">
					<c:forEach items="${list}" var = "i">
						<tr>
							<td>${i.startDate}</td>
							<td>${i.subject}</td>
							<td>${i.memo}</td>
						</tr>
					</c:forEach>
				</tbody>				
		
				</table>
           </div>
           <div style="text-align:center;">
				<button class="btn btn-danger"> 닫기 </button>
           </div>
          

</body>
</html>