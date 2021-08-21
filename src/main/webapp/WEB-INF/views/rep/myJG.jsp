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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <style>
        
        .container-fluid{width:1000px;height: 1250px; margin: auto; margin-top:80px;}
        .rep{font-weight:bold;}
        .rep,.wish{font-size:20px;}
        .rep a{border-bottom:2px solid black; margin-top:2px;}
        .rep a,.wish a:hover{cursor:pointer;}
        .count{font-weight:600;}
        .count span{margin-left:5px;}
        
        .listbar{ margin: 0px; margin-top: 15px; }
      .list{height:100%; width:220px;  margin:0px 14px 50px 13px; border:1px solid #ddd;}
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
    		$(".userID").text($(".writer").val());
    		
    		$(".list").on("click",function(){
    			let seq=$(this).find(".seq").val();
    			location.href="/rep/detail?rep_seq="+seq;
    		})
    		$(".rep").on("click",function(){
    			location.href="/rep/myJG?id="+$(".userID").text();
    		})
    		$(".wish").on("click",function(){
    			location.href="/rep/myWishList";
    		})
    		
    	})
    </script>
</head>
<body>
    <div class="container-fluid p-0">
    <c:choose>
    	<c:when test="${id==userID}">
    		<div class="row m-0">
            <div class="col-3 p-0">
                <div class="col-12 p-0 userID">${userID }</div>
                <div class="col-12 p-0">시작 날짜</div>
            </div>
            <div class="col-9 p-0">
                <div class="row m-0">
                    <div class="col-2 rep"><a>판매상품</a></div>
                    <div class="col-2 wish"><a>찜상품</a></div>
                </div>
                <div class="row m-0 mt-5">
                    <div class="col-12 count">전체<span>${Count }</span></div>
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
                            <input type=hidden value=${i.rep_writer } class=writer>
                        </div>     
                 </c:forEach>
                    
                </div> 
            </div>
        </div>
    	</c:when>
    	<c:otherwise>
    		<div class="row m-0">
            <div class="col-3 p-0">
                <div class="col-12 p-0 userID">${userID }</div>
                <div class="col-12 p-0">시작 날짜</div>
            </div>
            <div class="col-9 p-0">
                <div class="row m-0 mt-5">
                    <div class="col-12 count">전체<span>${Count }</span></div>
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
                            <input type=hidden value=${i.rep_writer } class=writer>
                        </div>     
                 </c:forEach>
                    
                </div> 
            </div>
        </div>
    	</c:otherwise>
    </c:choose>
    </div>
</body>
</html>