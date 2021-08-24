<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
<!--네비바 링크  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4625b781d5.js" crossorigin="anonymous"></script>
<style>
	body{background-color:#F9F9F9;}
    *{box-sizing: border-box;}
    /* div{border: 1px solid black;} */
    .container{margin-top: 95px; margin-bottom: 80px; width:950px; height: 1000px;padding:20px 30px 0px 30px; 
    border-radius:30px; background-color:white;}
    #title{font-weight:700; font-size: 1.7em; text-align: center; border-bottom:1px solid #ddd; 
    line-height: 70px; height: 70px; margin-bottom: 60px;}
    .box{height:40px;line-height: 35px; }
    .box input[type=text]{height: 70%; margin-top:5px;}
    #input-file{height: 100%;}
    #btnBox{text-align: center; margin-top: 50px;}
    .txt{font-weight:580;}
    input[type=checkbox]:checked:after{color:black;}
    .row {--bs-gutter-x: none;}
    .note-modal-footer {height: 55px;}
    .note-btn-group.note-insert,.note-resizebar{display:none;}
    .note-toolbar {text-align: center;}
/*네비바 스타일 시작
--------------------------------------------------------------------------------------------------------------- */   
:root{--text-color:#f0f4f5;--background-color:#263343; --accent-color:steelblue;}
body{margin: 0;}
a{text-decoration: none;color: white;}
.navbar{display: inline-flex;justify-content: space-between;align-items: center;background-color: #263343;padding: 8px 12px;z-index:1000 !important;}
.navbar{position: fixed;top: 0;left: 0;right: 0;}
.navbar_logo{font-size: 32px;color: white;font-family: 'Nanum Brush Script';}
.navbar_logo i {color: white;}
.navbar_menu{display: flex;list-style: none;padding-left: 0;margin-bottom:-3px;}
.navbar_menu li {padding: 8px 12px;}
.navbar_menu li:hover {background-color: steelblue; border-radius: 4px;}
.navbar_member {list-style: none; color: white; display: flex; padding-left: 0; margin-bottom:-3px;}
.navbar_member li{padding: 8px 12px;}
.navbar_toogleBtn{display: none; position: absolute; right: 32px; font-size: 24px;}
@media screen and (max-width: 768px) {
.navbar{flex-direction: column;align-items: flex-start;padding: 8px 24px;}
.navbar_menu{display: none;flex-direction: column;align-items: center;width: 100%;}
.navbar_menu li {width: 100%;text-align: center;}
.navbar_member{display: none;justify-content: center;width: 100%;}
.navbar_toogleBtn{display: block;}
.navbar_menu.active,.navbar_member.active{display: flex;}
:root{--text-color:#f0f4f5;--background-color:#263343; --accent-color:steelblue;}
}
/*네비바 스타일 끝
--------------------------------------------------------------------------------------------------------------- */  
</style>
<script>
$(function(){
	// 툴바생략
	$('#summernote').summernote({
	        placeholder: '상품 상세 정보를 입력하세요.',
	        height: 500,
	        minHeight: 400,             // set minimum height of editor
	        maxHeight: 400,             // set maximum height of editor
            focus : true,
            lang : 'ko-KR',
            codeviewFilter: true,
	        codeviewIframeFilter: true,
            //콜백 함수
	        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0],this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
			}
});
        
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/summer/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
});
</script>

</head>
<body>
<!-- 네비바 시작
----------------------------------------------------------------------------------------------------------------->
	<c:choose>
		<c:when test="${loginID==null }">
			<nav class="navbar">
				<div class="navbar_logo">
					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="CampTipBoard/selectAll">캠핑정보</a></li>
					<li><a href="/products/selectAll?index=1">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>
				</ul>
				<ul class="navbar_member">
					<li><a href="/member/signUp">회원가입</a></li>
					<li><a href="/member/loginPage">로그인</a></li>
				</ul>
				<a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
			</nav>
		</c:when>
		<c:when test="${loginID=='admin'}">
			<nav class="navbar">
				<div class="navbar_logo">
					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="CampTipBoard/selectAll">캠핑정보</a></li>
					<li><a href="/products/selectAll?index=1">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>
				</ul>
				<ul class="navbar_member">
					<li><a href="">관리자페이지</a></li>
					<li><a href="/member/logOutProc">로그아웃</a></li>
				</ul>
				<a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="navbar">
				<div class="navbar_logo">
					<a href=""><img src="/assets/img/background/camp_logo.png"
						style="width: 50px; height: auto; margin-right: 7px; margin-top: -12px;">별보러갈래?</a>
				</div>
				<ul class="navbar_menu">
					<li><a href="/info/list?index=1">캠핑장</a></li>
					<li><a href="CampTipBoard/selectAll">캠핑정보</a></li>
					<li><a href="/products/selectAll?index=1">SHOP</a></li>
					<li><a href="/rep/list?index=1">중고장터</a></li>
					<li><a href="/gal/list?cpage=1">캠핑후기</a></li>
				</ul>
				<ul class="navbar_member">
					<li><a href="/member/myPage">마이페이지</a></li>
					<li><a href="/memeber/logOutProc">로그아웃</a></li>
				</ul>
				<a href="#" class="navbar_toogleBtn"><i class="fas fa-bars"></i></a>
			</nav>
		</c:otherwise>
	</c:choose>
<!-- 네비바 끝
----------------------------------------------------------------------------------------------------------------->
<div class="container">
        <form action="/products/insert" method="post" enctype="multipart/form-data">
        <div id=title>상품 등록</div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">카테고리</div>
            <div class="col-6 p-0">
                <select name="p_category" id="">
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
            <div class="col-5 p-0"><input type="text" name=p_name class="form-control"></div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">금액</div>
            <div class="col-5 p-0"><input type="text" name=p_price class="form-control"></div>
        </div>
        <div class="row m-0 mt-3 mb-3 box">
            <div class="col-2 p-0 txt">사진</div>
            <div class="col-5 p-0">
                <input type="file" id=input-file name=file accept=".gif, .jpg, .png" multiple>
            </div>
        </div>
        <div class="row m-0 mt-3 pt-4">
		        <textarea class="col-12" id="summernote" name=p_contents></textarea>
        </div>
        <div class="row m-0">
            <div class="col-12"  id=btnBox>
                <button type="submit" class="btn btn-outline-dark" id=submit>등록</button>
                <button type="button" class="btn btn-outline-dark" id=cancel onclick="history.go(-1)">취소</button>
            </div>
        </div>
        </form>
	</div>
	<script>
    const toogleBtn = document.querySelector('.navbar_toogleBtn');
    const menu = document.querySelector('.navbar_menu');
    const member = document.querySelector('navbar_member');
    toogleBtn.addEventListener('click', () => {
        menu.classList.toggle('active');
        member.classList.toggle('active');
    });
    </script>
</body>
</html>