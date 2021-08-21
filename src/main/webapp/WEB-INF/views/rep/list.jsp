<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	 *{box-sizing: border-box;}
       .container-fluid{width:1100px;height: 1250px; margin: auto; margin-top:80px;}
       h2{text-align: center;}
/* 	div{border:1px solid black;} */
       #category{text-align:right; margin-right:10px;}
       #category select{height:100%;}
       #searchBox{border:1px solid black;
       padding-top:5px; padding-bottom:5px;}
       #searchBox img{height:18px; width:18px;}
       #writeBox{text-align:right;}
       #write{ text-decoration:none; color:black; height:100%;}
       #word{border:0px solid black; width:90%;}
       /*  input:focus {outline:none;}*/
      .listbar{height:330px; margin: 0px; margin-top: 60px; }
      .list{height:100%; width:246px;  margin:0px 10px 50px 10px; border:1px solid #ddd; }
      .list:hover{cursor:pointer;}
      .list .img{height:217px; margin-bottom: 10px; }
      .link{padding:0px 10px 0px 10px;}
      .img,.link:hover {cursor:pointer;}
      .img,.link:hover~.link{text-decoration:underline;}
      .img img{width:100%; height:100%;}
      .price{font-weight:bold;font-size:1.2em; padding:0px 0px 0px 10px;}
      .price span{font-size:0.7em; display:inline-block;padding-left:2px;}
      .diffD{padding:6px 12px 0px 0px; color:#a9a9a9; font-size:0.8em; text-align:right;}
      .area{font-size:0.8em; color:#606060; font-weight:500;}
      .ar{border-top:1px solid #ddd;}
</style>
<script>
	$(function(){
		$(".list").on("click",function(){
			let seq=$(this).find(".seq").val();
			location.href="/rep/detail?rep_seq="+seq;
		})
		$(document).on("click",".list",function(){
			let seq=$(this).find(".seq").val();
			location.href="/rep/detail?rep_seq="+seq;
		})
		let index=1;
		$(window).scroll(function(){
			let $window = $(this);
			let scrollTop = $(this).scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();
			console.log("scrollTop : "+scrollTop+"| windowHeight : "+windowHeight+
					"| documentHeight"+documentHeight)
			if(scrollTop+windowHeight>=documentHeight){
				index++;
				setTimeout(getList(),2000);
				
			}
					
		})
		
		function getList(){
			$.ajax({
				url:"/rep/scrollList",
				dataType:"json",
				data:{"index":index}
			}).done(function(resp){
				for(let i=0;i<resp.length;i++){
					let list = $("<div class='col-4 list'>");
					
					let img = $("<div id=img>");
					img.text("사진");
					let name =$("<div id=link>");
					name.text(resp[i].rep_name);
					let price = $("<div>");
					price.text(resp[i].rep_price);
					let date = $("<div>");
					date.text(resp[i].rep_write_date);
					let seq = $("<input type=hidden class=seq>");
					seq.val(resp[i].rep_seq);
					
					list.append(img);
					list.append(name);
					list.append(price);
					list.append(date);
					list.append(seq);
					$(".listbar").append(list);
					
					
				}
			})
		}
		
		
		
		
	})
</script>
</head>
<body>
	<div class="container-fluid">
        <h2>중고 장터</h2>
        <div class="row m-0 mt-5 h-120">
            <div class="col-2 p-0" id="category">
                <select name="rep_category" >
  					<option selected>전체종류</option>
                    <option value="텐트/타프">텐트/타프</option>
                    <option value="침낭/매트">침낭/매트</option>
                    <option value="테이블/의자">테이블/의자</option>
                    <option value="조명기구">조명기구</option>
                    <option value="주방용품">주방용품</option>
                    <option value="화로/버너/bbq">화로/버너/bbq</option>
                    <option value="겨울용품">겨울용품</option>
                    <option value="기타캠핑용품">기타캠핑용품</option>
                </select>
            </div>
            <div class="col-4" id=searchBox>
                <input type="text" id=word  placeholder="상품명, 지역명 입력하세요">
                <img src="/img/search.png">
            </div>
            <div class="col-5 p-0 pt-1" id=writeBox>
            	<a href="/rep/write" id=write><i class="fas fa-pen-square"></i>등록하기</a>
            </div>
        </div>
        <div class="row listbar" >
        <c:forEach var="i" items="${list }">
			<div class="col-3 p-0 list"  seq="${i.rep_seq }">
				<div class="col-12 img"><img src="/img/${i.thumsysName}"></div>
				<div class="col-12 mb-1 link">${i.rep_name }</div>
				<div class="row m-0 ">
					<div class="col-6 price">${i.rep_price }<span>원</span></div>
					<div class="col-6 diffD">${i.rep_diff_date }</div>
				</div>
				<div class="row m-0 mt-2 pt-2 pb-2 ar">
					<div class="col-12 area"><i class="fas fa-map-marker-alt" style="margin-right: 8px; color:#a9a9a9"></i>${i.rep_area}</div>
				</div>
				<input type=hidden value=${i.rep_seq } class=seq>
			</div>       
		</c:forEach>
		</div> 
    </div>
</body>
</html>