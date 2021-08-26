<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 디테일</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
.table-title {
	background: #00285b;
	color: #fff;
	padding: 16px 30px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

label {
	padding: 4px;
	margin-top: 3px;
	vertical-align: center;
}

form>div:first-child {
	margin-top: 10px;
	margin-bottom: 10px;
	border: 0;
	border-bottom: 1px solid #eee;
}

.writeDiv:nth-child(n+2) {
	padding: 0px;
	margin-top: 3px;
}

select {margin-top: 3px;}
#contents{
	height:500px;
	overflow: scroll;
}
</style>


<script>
$(function(){
	let i=0;
	$("#back").on("click", function() {
		location.href = "javascript:history.back()";
	})
	
	$("#upBtn").on("click",function(){
		location.href = "/CampTipBoard/modify";
	})
	
	$("#delBtn").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			$("#frm").attr("action","/CampTipBoard/delete");
			$("#frm").submit();
		}
	})
	
})
</script>
</head>
<body>

	<div class="container">

		<div class="table-wrapper">
			<div class="row">
				<div class="table-title col-12">
					<h2>
						<b>게시글 디테일</b>
					</h2>
				</div>
			</div>
		</div>

<c:choose>
	<c:when test="${loginID == list.writer}">
			<form id="frm" action="" method="post"
			enctype="multipart/form-data">
			<div class="row">

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">카테고리</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="category"
							name="category">${list.category }</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">글번호</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="num">${list.camp_tip_num }</div>
						<input type="hidden" name="camp_tip_num" value="${list.camp_tip_num }">
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="title"
							name="title">${list.title }</div>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="writer"
							name="writer">${list.writer }</div>
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10 writeDiv">
						<div type="text" class="form-control" id="contents"
							name="contents">${list.contents }</div>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
					<div class="col-sm-10 writeDiv">
						<%-- <c:forEach var="file" items="${flist }">
							<a href="">${file.oriName }</a> 
    			 		</c:forEach>  --%>
    			 		<c:forEach var="file" items="${flist }">
    			 			<div>
    			 				<a href="/CampTipFile/download?seq=${file.seq}&sysname=${file.sysName}&oriname=${file.oriName}">${file.oriName }</a>
    			 			</div>
    			 		</c:forEach>
					</div>
				</div>
				
			</div>
			
			<div id="imgtest"></div>
			<div class="row">

				<div class="col-12">
					<button type="button" id="back"
						class="btn btn-default pull-left"
						style="background-color: #00285b; color: white">뒤로가기</button>

					<div class="pull-right">
						<a id="delBtn" class="btn btn-info boardAddBtn"><span
							class="glyphicon glyphicon-pencil"></span> 삭제</a>
						<a href="/CampTipBoard/modify?camp_tip_num=${list.camp_tip_num}&category=${list.category}" id="upBtn" class="btn btn-info boardAddBtn">
						<span class="glyphicon glyphicon-pencil"></span> 수정</a>
					</div>
				</div>
			</div>
		</form>
	</c:when>
	<c:otherwise>
				<div class="row">

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">카테고리</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="category"
							name="category">${list.category }</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">글번호</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="num">${list.camp_tip_num }</div>
						<input type="hidden" name="camp_tip_num" value="${list.camp_tip_num }">
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="title"
							name="title">${list.title }</div>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10 writeDiv">
						<div class="form-control" id="writer"
							name="writer">${list.writer }</div>
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10 writeDiv">
						<div type="text" class="form-control" id="contents"
							name="contents">${list.contents }</div>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
					<div class="col-sm-10 writeDiv">
						<c:forEach var="file" items="${flist }">
							<div>${file.oriName }</div>   
    			 		</c:forEach> 
					</div>
				</div>
				
			</div>
			
			<div id="imgtest"></div>
			<div class="row">

				<div class="col-12">
					<button type="button" id="back"
						class="btn btn-default pull-left"
						style="background-color: #00285b; color: white">뒤로가기</button>
				</div>
			</div>
	
	</c:otherwise>
</c:choose>
	</div>
</body>
</html>