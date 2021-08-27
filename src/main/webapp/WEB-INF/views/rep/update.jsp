<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
	body{background-color:#F9F9F9;}
    *{box-sizing: border-box;}
    /* div{border: 1px solid black;} */
    .container{margin-top: 70px; margin-bottom: 80px; width:950px; height: 1100px;padding:20px 30px 0px 30px; 
    border-radius:30px; background-color:white;}
    #title{font-weight:700; font-size: 1.7em; text-align: center; border-bottom:1px solid #ddd; 
    line-height: 70px; height: 70px; margin-bottom: 60px;}
    .box{height:40px;line-height: 35px; }
    .box input[type=text]{height: 70%; margin-top:5px;}
    #input-file{height: 100%;}
    #btnBox{text-align: center; margin-top: 50px;}
    .txt{font-weight:580;}
    input[type=checkbox]:checked:after{color:black;}
    .note-btn-group.note-insert,.note-resizebar{display:none;}
    .summer{margin-top:100px;}
    .pic{}
    
</style>
<script>
$(function(){
	$('#summernote').summernote({
        tabsize: 2,
        height: 300,
        width:1100
      });
	
	 $(".delBtn").on("click",function(){
		 let seq = $(this).attr("seq");
		 $(this).parents(".delBox").remove();
		 
		 let delTarget = $("<input>");
		 delTarget.attr("type","hidden");
		 delTarget.attr("name","delete");
		 delTarget.attr("value",seq);
		 
		 $("#input-file").append(delTarget);
		 
		 
		
	})
	
	
})
</script>
</head>
<body>
	<div class="container">
        <form action="/rep/updateProc" method="post" enctype="multipart/form-data">
        <div id=title>중고장터 수정하기</div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">종류</div>
            <div class="col-5 p-0">
                <select name="rep_category" id="">
                    <option value="텐트/타프" selected>텐트/타프</option>
                    <option value="침낭/매트">침낭/매트</option>
                    <option value="테이블/의자">테이블/의자</option>
                    <option value="조명기구">조명기구</option>
                    <option value="주방용품">주방용품</option>
                    <option value="화로/버너/bbq">화로/버너/bbq</option>
                    <option value="겨울용품">겨울용품</option>
                    <option value="기타캠핑용품">기타캠핑용품</option>
                </select>
            </div>
           <input type=hidden value="${dto.rep_category}" id=category>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">이름</div>
            <div class="col-5 p-0"><input type="text" name=rep_name class="form-control" value="${dto.rep_name}"></div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">금액</div>
            <div class="col-5 p-0"><input type="text" name=rep_price class="form-control" value="${dto.rep_price}"></div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">거래방법</div>
            <div class="col-6 p-0">
            	<c:choose>
            		<c:when test="${dto.rep_delivery == '택배배송'}">
            			<input type="checkbox" name=rep_delivery value="택배배송" id="parcel" checked> 택배배송
               			<input type="checkbox" name=rep_delivery value="직거래"> 직거래
            		</c:when>
            		<c:otherwise>
            			 <input type="checkbox" name=rep_delivery value="택배배송" id="parcel"> 택배배송
                		 <input type="checkbox" name=rep_delivery value="직거래" checked> 직거래
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">배송비</div>
            <div class="col-6 p-0">
            <c:choose>
            	<c:when test="${dto.rep_delivery_price == '배송비 포함'}">
            		 <input type="radio" name="rep_delivery_price" value="배송비 포함" checked> 판매자 부담
                	 <input type="radio" name="rep_delivery_price" value="배송비 별도"> 구매자 부담
            	</c:when>
            	<c:otherwise>
            		  <input type="radio" name="rep_delivery_price" value="배송비 포함"> 판매자 부담
                	  <input type="radio" name="rep_delivery_price" value="배송비 별도" checked> 구매자 부담
            	</c:otherwise>
             </c:choose>
            </div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">거래지역</div>
            <div class="col-5 p-0">
            	<input type="text" name=rep_area class="form-control" value="${dto.rep_area}">
            </div>
        </div>
        <div class="row m-0 mt-3 mb-3 box pic">
            <div class="col-2 p-0 txt ">사진</div>
            <div class="col-6 p-0">
           		<div class="row m-0">
            		<div class="col-12">
            			<input type="file" id=input-file name=file accept=".gif, .jpg, .png" multiple>
            		</div>
            		<c:forEach var="i" items="${pdto}">
            			<div class="col-12 delBox">${i.reOriName} <span><input type=button class=delBtn seq="${i.repicture_seq}" value="삭제"></span></div>
            		</c:forEach>
            	</div>
            </div>
        </div>
        <div class="row  pt-4 summer">
		        <textarea class="col-12" id="summernote" name=rep_detail>${dto.rep_detail}</textarea>
        </div>
        <div class="row m-0">
            <div class="col-12"  id=btnBox>
                <button type="submit" class="btn btn-outline-dark" id=submit>등록</button>
                <button type="button" class="btn btn-outline-dark" id=cancel onclick="history.go(-1)">취소</button>
            </div>
        </div>
        <input type=hidden name="rep_seq" value="${dto.rep_seq }">
        </form>
	</div>
</body>
</html>