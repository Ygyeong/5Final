<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 수정</title>
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

select {
	margin-top: 3px;
}
</style>


<script>
$(function(){
	let i=0;
	$("#back").on("click", function() {
		location.href = "javascript:history.back()";
	})
	
	$("#delBtn").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "/CampTipBoard/delete";
		}
	})

	$("#upBtn").on("click",function(){
		
		let title = $("#title").val();
		let writer = $("#writer").val();
		let contents = $("#summernote").val();
		
		let blankRegex = /.*\S+/;
		let titleLengthRegex = /^.{0,66}$/;
		let writerLengthRegex = /^.{0,7}$/;
		let contentsLengthRegex = /^.{0,1333}$/;
		
		let bresult1 = blankRegex.test(title);
		let bresult2 = blankRegex.test(writer);
		let bresult4 = blankRegex.test(contents);
		
		let titleResult = titleLengthRegex.test(title);
		let writerResult = writerLengthRegex.test(writer);
		let contentsResult = contentsLengthRegex.test(contents);
		
		if(!bresult1){
			alert("제목을 반드시 입력해주세요!");
		}else if(!bresult2){
			alert("작성자를 입력해주세요!");
		}else if(!bresult4){
			alert("내용을 입력해주세요!");
		}else if(!titleResult){
			alert("제목은 66글자 이내로 작성해주세요.")
		}else if(!contentsResult){
			alert("내용은 1,333글자 이내로 작성해주세요.")
		}
		else{
			$("input[name=files]").remove();
			$("#frm").submit();
		}
	})
	
	
	 $('#summernote').summernote({
	        placeholder: '내용을 입력하세요.',
	        height: 500,
	        lang : 'ko-KR',
	        minHeight: 400,             // set minimum height of editor
	        maxHeight: 400,             // set maximum height of editor
	        codeviewFilter: true,
	        codeviewIframeFilter: true,
	        callbacks:{
	            onImageUpload:function(files) {
	                  
	                 let editor = this;  
	                 let file = files[0];      
	               
	                 let form = new FormData()    
	                 form.append("file",file);    
	                 
	                 $.ajax({
	                    data:form,
	                    type:"post",
	                    url:"/CampTipBoard/modify",
	                    contentType:false,
	                    enctype : 'multipart/form-data',
	                    processData:false,  
	                	dataType:"json",
	           
	                 }).done(function(resp){
	                	 let url = resp.url;
	                	 console.log(resp.url);
	                	
	                   $(editor).summernote('insertImage', resp.url); //editor 인스턴스의 insertImage 기능으로 이미지를 화면에 출력
	   
	                   // input type=hidden 노드
	                   let input = $("<input type='hidden'>");
	                   input.attr("name","summerImg");
	                   input.attr("value",[resp.oriName,resp.sysName]);
	                   
	                   $("#frm").append(input);
	                 }); 
	               }
	           }
	      });

 	$(window).on("unload",function(){
		navigator.sendBeacon("${pageContext.request.contextPath}/unload.file");
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
						<b>게시글 수정</b>
					</h2>
				</div>
			</div>
		</div>

		<form id="frm" action="/CampTipBoard/modify" method="post"
			enctype="multipart/form-data">
			<div class="row">

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">카테고리</label>
					<div class="col-sm-10 writeDiv">
						<select class="form-control" id="category" name="category">
							<option selected>선택하세요.</option>
							<option value="1">봄</option>
							<option value="2">여름</option>
							<option value="3">가을</option>
							<option value="4">겨울</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10 writeDiv">
						<input type="text" class="form-control" id="title"
							name="title" placeholder="Title" value="${list.title }">
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10 writeDiv">
						<input type="text" class="form-control" name="writer" placeholder="Writer">
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10 writeDiv">
						<textarea cols="3" name="contents" id="summernote"></textarea>
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
						<a id="upBtn" class="btn btn-info boardAddBtn"><span
							class="glyphicon glyphicon-pencil"></span> 수정</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>