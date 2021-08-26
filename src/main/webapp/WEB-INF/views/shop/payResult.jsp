<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <style>
        .container-fluid{width: 1000px;margin: auto; margin-top:50px;}
        .top{width: 600px; height: 40px; line-height: 40px;font-size: 20px ;font-weight: bold; background-color: #ddd;text-align: center; margin: auto;}
        .txt{margin: auto; text-align: center;}
        .col-3{background-color: #e9e9e9;}
        div[class^=col]{height: 38px; line-height: 30px;}
        .infoT{font-weight: bold;padding-top: 3px;}
        .box{border: 1px solid #ddd;}
        .topB{border-top: 2px solid black;}
        .btnBox>div {text-align: center; margin-top: 30px;}
        .btn{width: 100px;  margin: auto; margin-top: 15px;  }
    </style>
    <script>
    	$(function(){
    		$("#btn").on("click",function(){
        		location.href="/products/selectAll?index=1";
        	})
    	})
    </script>
</head>
<body>
    <div class="container-fluid">
        <div class="row m-0 topr">
            <div class="col-12 top">주문 감사합니다</div>
        </div>
        <div class="row m-0">
            <div class="col-12 txt">${dto.o_name}님의 결제 내용은 다음과 같습니다</div>
        </div>
            <div class="row m-0 mt-4 p-0 box topB">
                <div class="col-3 infoT">주문번호</div>
                <div class="col-4">${dto.o_num }</div>
            </div>
            <div class="row m-0 p-0 box">
                <div class="col-3 infoT">결제금액</div>
                <div class="col-4">${dto.o_allSum}<span style="margin-left:4px;">원</span></div>
           </div>
        <div class="row m-0 p-0 box">
            <div class="col-3 infoT">상품명</div>
            <div class="col-4">${dto.o_product}</div>
        </div>
         <div class="row m-0 p-0 box">
            <div class="col-3 infoT">배송지</div>
            <div class="col-4">${dto.o_address1 } ${dto.o_address2}</div>
        </div>
        <div class="row p-0">
            <div class=" col-2 btn"><button type=button class="btn btn-outline-dark" id=btn>확인</button></div>
        </div>
        
    </div>
</body>
</html>