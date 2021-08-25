<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글수정</title>
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
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	border-radius: 3px 3px 0 0;
	margin: 0 0 5px 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-wrapper {
	margin-top: 100px;
}

label {
	padding: 3px;
	margin-top: 2px;
	vertical-align: center;
}

.writeDiv {
	padding: 0px;
}

.pull-left {
	margin: 15px;
}

.pull-right {
	margin-top: 15px;
}

input[type=file] {
	width: 450px;
	height: 35px;
	display: inline;
}

/* 별점 */
.blind {
	position: absolute;
	overflow: hidden;
	margin: -1px;
	padding: 0;
	width: 1px;
	height: 1px;
	border: none;
	clip: rect(0, 0, 0, 0);
}

.startRadio {
	display: inline-block;
	overflow: hidden;
	height: 40px;
}

.startRadio:after {
	content: "";
	display: block;
	position: relative;
	z-index: 10;
	height: 40px;
	background:
		url("data:image/png;base64,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")
		repeat-x 0 0;
	background-size: contain;
	pointer-events: none;
}

.startRadio__box {
	position: relative;
	z-index: 1;
	float: left;
	width: 40px;
	height: 40px;
	cursor: pointer;
}

.startRadio__box input {
	opacity: 0 !important;
	height: 0 !important;
	width: 0 !important;
	position: absolute !important;
}

.startRadio__box input:checked+.startRadio__img {
	background-color: #0084ff;
}

.startRadio__img {
	display: block;
	position: absolute;
	right: 0;
	width: 500px;
	height: 40px;
	pointer-events: none;
}
</style>


<script>
$(function(){
   let i=0;
   $("#backBtn").on("click",function(){
      location.href = "/gal/list";
   })
   
   
   $("#saveBtn").on("click",function(){
      
      let title = $("#bbs_title").val();
      let content = $("#summernote").val();
      
      
      let blankRegex = /.*\S+/;
      let titleLengthRegex = /^.{0,60}$/;
      let contentLengthRegex = /^.{0,4000}$/;
      
      let bresult1 = blankRegex.test(title);
      let bresult2 = blankRegex.test(content);
      
      let titleResult = titleLengthRegex.test(title);
      let contentResult = contentLengthRegex.test(content);
      
      if(!bresult1){
         alert("제목을 반드시 입력해주세요!");
      }else if(!bresult2){
         alert("내용을 입력해주세요!");
      }else if(!titleResult){
         alert("제목은 60글자 이내로 작성해주세요.")
      }else if(!contentResult){
         alert("내용은 4000글자 이내로 작성해주세요.")
      }
      else{
         $("input[name=files]").remove();
         $("#frm").submit();
      }
   }) 
   
   
   $("#btn1").on("click",function(){
      $("#file1").val("");
   })
   $("#btn2").on("click",function(){
      $("#file2").val("");
   })
   $("#btn3").on("click",function(){
      $("#file3").val("");
   })   

   
   $(".delAttach").on("click",function(){
		 let seq = $(this).attr("seq");
		 $(this).parent().remove();
		 
		 let delTarget = $("<input>");
		 delTarget.attr("type","hidden");
		 delTarget.attr("name","delete");
		 delTarget.attr("value",seq);
		 
		 $("#btn1").append(delTarget);
		 
		 
		
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
						<b>캠핑리뷰 - 수정</b>
					</h2>
				</div>
			</div>
		</div>

		<form id="frm" action="/gal/modifyProc?seq=${list.seq}" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Title</label>
					<div class="col-sm-10 writeDiv">
						<input type="text" class="form-control" id="bbs_title"
							name="title" value="${list.title }">
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">contents</label>
					<div class="col-sm-10 writeDiv">
						<textarea cols="3" name="contents" id="summernote">${list.contents}</textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">첨부파일</label>
					<div class="col-sm-10 writeDiv">
					
						<div class="input-group">	
							
							<input type="file" class="form-control" id="file1" name="file"
								style="display: inline; width: 430px" accept="image/jpeg,.png"
								multiple required >
								
							
							
							
							<div class="input-group-btn" style="display: inline;">

								
             						<button class="btn btn-danger"	type="button" id="btn1">삭제</button>
								
							</div>
						</div>
						<c:forEach var="file"  items="${flist }">
       				<div>
        				${file.oriName }<button type="button" seq="${file.seq}" class="delAttach btn btn-outline-success btn-sm">삭제</button>
       				</div>   
    			 </c:forEach> 


					</div>

				</div>



			</div>


			<div id="imgtest"></div>

			<br>



			<%-- <label>평점: </label>
    <select name="rating">
    	<c:forEach items="${ ratingOptions }" var="r">
    	<option>${r}</option>
    	</c:forEach>
    </select> --%>

			<!--별점 -->

			<label>평점: </label>
			<c:choose>
				<c:when test="${list.rating==0 }">

					<div class="startRadio" style="margin-left: 10px;">
						<label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="1"> <span
							class="startRadio__img"><span class="blind">별 1개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="2"> <span
							class="startRadio__img"><span class="blind">별 2개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="3"> <span
							class="startRadio__img"><span class="blind">별 3개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="4"> <span
							class="startRadio__img"><span class="blind">별 4개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="5"> <span
							class="startRadio__img"><span class="blind">별 5개</span></span>
						</label>

					</div>

				</c:when>



				<c:when test="${list.rating==1 }">

					<div class="startRadio" style="margin-left: 10px;">
						<label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="1" checked> <span
							class="startRadio__img"><span class="blind">별 1개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="2"> <span
							class="startRadio__img"><span class="blind">별 2개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="3"> <span
							class="startRadio__img"><span class="blind">별 3개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="4"> <span
							class="startRadio__img"><span class="blind">별 4개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="5"> <span
							class="startRadio__img"><span class="blind">별 5개</span></span>
						</label>
						

					</div>


				</c:when>

				<c:when test="${list.rating==2 }">

					<div class="startRadio" style="margin-left: 10px;">
						<label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="1" checked> <span
							class="startRadio__img"><span class="blind">별 1개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="2" checked> <span
							class="startRadio__img"><span class="blind">별 2개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="3"> <span
							class="startRadio__img"><span class="blind">별 3개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="4"> <span
							class="startRadio__img"><span class="blind">별 4개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="5"> <span
							class="startRadio__img"><span class="blind">별 5개</span></span>
						</label>
						</div>
				</c:when>

				<c:when test="${list.rating==3 }">

					<div class="startRadio" style="margin-left: 10px;">
						<label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="1" checked> <span
							class="startRadio__img"><span class="blind">별 1개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="2" checked> <span
							class="startRadio__img"><span class="blind">별 2개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="3" checked> <span
							class="startRadio__img"><span class="blind">별 3개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="4"> <span
							class="startRadio__img"><span class="blind">별 4개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="5"> <span
							class="startRadio__img"><span class="blind">별 5개</span></span>
						</label>
						</div>
				</c:when>

				<c:when test="${list.rating==4 }">


					<div class="startRadio" style="margin-left: 10px;">
						<label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="1" checked> <span
							class="startRadio__img"><span class="blind">별 1개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="2" checked> <span
							class="startRadio__img"><span class="blind">별 2개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="3" checked> <span
							class="startRadio__img"><span class="blind">별 3개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="4" checked> <span
							class="startRadio__img"><span class="blind">별 4개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="5"> <span
							class="startRadio__img"><span class="blind">별 5개</span></span>
						</label>
						</div>
				</c:when>


				<c:when test="${list.rating==5 }">


					<div class="startRadio" style="margin-left: 10px;">
						<label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="1" checked> <span
							class="startRadio__img"><span class="blind">별 1개</span></span>
						</label> <label class="startRadio__box" > <input type="radio"
							name="rating" id="" value="2" checked> <span
							class="startRadio__img"><span class="blind">별 2개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="3" checked> <span
							class="startRadio__img"><span class="blind">별 3개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="4" checked> <span
							class="startRadio__img"><span class="blind">별 4개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="rating" id="" value="5" checked> <span
							class="startRadio__img"><span class="blind">별 5개</span></span>
						</label>
						</div>
				</c:when>



			</c:choose>








			<div class="row">
				<hr>
				<div class="col-12">
					<button type="button" id="backBtn"
						class="btn btn-default pull-left"
						style="background-color: #00285b; color: white">목록</button>

					<div class="pull-right">
						<a id="saveBtn" class="btn btn-info boardAddBtn"><span
							class="glyphicon glyphicon-pencil"></span>수정하기</a>
					</div>
				</div>
			</div>
		</form>
	</div>


	<script>
		$('#summernote').summernote(
				{

					height : 500,
					minHeight : 400,
					maxHeight : 400,
					lang : "ko-KR",
					toolbar : [
							// [groupName, [list of button]]
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							/* ['insert',['picture']], */
							[ 'view', [ 'fullscreen', 'help' ] ] ],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
							'바탕체' ],
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ]

				});
	</script>


</body>
</html>