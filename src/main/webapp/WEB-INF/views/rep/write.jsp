<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    .container{margin-top: 70px; margin-bottom: 80px; width:950px; height: 1000px; padding:0px;
    border-radius:30px; background-color:white;}
    #title{font-weight:700; font-size: 1.7em; text-align: center; border-bottom:1px solid #ddd; background: #00285b;
	color: #fff; line-height: 70px; height: 70px; margin-bottom: 60px;}
    .box{height:40px;line-height: 35px;padding-left:20px; }
    .box input[type=text]{height: 70%; margin-top:5px;}
    .imgBox{height:40px;line-height: 35px;padding-left:20px; }
    .imgbox input[type=text]{height: 70%; margin-top:5px;}
    #price{ height:28px;}
    .priceBox{margin:16px 0px 40px 0px;}
    #ex{font-size:11px; height:13px; color:#00498c;}
    #input-file{height: 100%;}
    #btnBox{text-align: center; margin-top: 50px;}
    .txt{font-weight:580;}
    .ptxt{font-weight:580;}
    input[type=checkbox]:checked:after{color:black;}
    .note-btn-group.note-insert,.note-resizebar{display:none;}
    .del_price{display: none;}
    .summer{padding:0px 20px 0px 20px;}
</style>

<script>
$(function(){
    $("#ok").on("click",function(){
      
      let name = $("#name").val();
      let price = $("#price").val();
      let area = $("#area").val();
      let content = $("#content").val();
      let file = $("#input-file").val();
	  let delivery = $('input:checkbox[name=rep_delivery]').is(':checked');
	  
      let nameRegex= /^.{4,30}$/;
      let priceRegex = /^[1-9][0-9]{0,}$/;
      let areaRegex = /^.{1,10}$/;
      let contentRegex = /^.{1,1000}$/;
      let fileRegex = /^.{1,}$/;

      let nameResult = nameRegex.test(name);
      let priceResult = priceRegex.test(price);
      let areaResult = areaRegex.test(area);
      let contentResult = contentRegex.test(content);
      let fileResult = fileRegex.test(file);
      
      if(!nameResult){
         alert("상품이름은 4글자 이상 입력해주세요!");

      }else if(!priceResult){
         alert("가격을 입력해주세요!");
      }else if(!delivery){
    	  alert("거래방법을 선택해주세요!");
      }else if(!areaResult){
         alert("거래 지역을 입력해주세요!");
      }else if(!contentResult){
         alert("내용을 4000자 이내로 입력해주세요!");
      }else if(!fileResult){
        alert("첨부파일을 넣어주세요!");
      }else{
    	  document.getElementById("repFrm").submit();  
      }
     
      
   }) 

   $("#parcel").on("click",function(){
    let result = $("#parcel").prop("checked");
   if(!result){
    $(".del_price").css("display","none");
   }else{
    $(".del_price").css("display","flex");
   }
   })

	$('#summernote').summernote({
        tabsize: 2,
        height: 300,
        width:1050
      });
	
	
	
	
})
</script>
</head>
<body>
	<div class="container">
        <form action="/rep/insertProc" method="post" enctype="multipart/form-data" id="repFrm">
        <div id=title> 중고장터 등록하기</div>
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
           
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">이름</div>
            <div class="col-5 p-0"><input type="text" name=rep_name class="form-control" id=name></div>
        </div>
        <div class="row box priceBox">
            <div class="col-2 p-0 txt">금액</div>
            <div class="col-5 p-0">
            	<div class=col-12><input type="text" name=rep_price class="form-control" id=price></div>
            	<div class="col-12" id="ex">*가격은 천만원 단위까지 작성가능 ( 숫자로만 입력가능 )</div> 
            </div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">거래방법</div>
            <div class="col-6 p-0">
                <input type="checkbox" name=rep_delivery value="택배배송" id="parcel" class="check"> 택배배송
                <input type="checkbox" name=rep_delivery value="직거래" class="check"> 직거래
            </div>
        </div>
        <div class="row m-0 mt-3 mb-3 box del_price">
            <div class="col-2 p-0 txt">배송비</div>
            <div class="col-6 p-0">
                <input type="radio" name="rep_delivery_price" value="배송비 포함" checked> 판매자 부담
                <input type="radio" name="rep_delivery_price" value="배송비 별도"> 구매자 부담
            </div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">거래지역</div>
            <div class="col-5 p-0"><input type="text" name=rep_area class="form-control" id=area></div>
        </div>
        <div class="row m-0 mt-3 mb-3 imgBox">
            <div class="col-2 p-0 txt">사진</div>
            <div class="col-5 p-0">
                <input type="file" id=input-file name=file accept=".gif, .jpg, .png" multiple>
            </div>
        </div>
        <div class="row m-0 mt-3 pt-4 summer">
		        <textarea class="col-12" id="summernote" name=rep_detail id=content></textarea>
        </div>
        <div class="row m-0">
            <div class="col-12"  id=btnBox>
                <input type="button" class="btn btn-outline-dark" id=ok value=등록>
                <button type="button" class="btn btn-outline-dark" id=cancel onclick="history.go(-1)">취소</button>
            </div>
        </div>
        </form>
	</div>
    
    
</body>
</html>