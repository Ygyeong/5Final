<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    *{box-sizing: border-box;}
    .container-fluid{width: 950px; margin: auto; margin-top:50px;}
       
    .col-3{background-color: #e9e9e9;}
    .top{font-size: 31px; border-bottom:2px solid black ;}
    .title{font-size: 19px; font-weight: 600;border-bottom:3px solid #ddd ; }
    .txt{border: 1px solid #ddd;}
    input[type=text]{width: 100%;border: none;} 

    div[class^=col]{height: 40px; line-height: 30px; padding-top: 3px;}
    .btnBox{text-align: center;}
    .bt{margin: 30px 0px 50px 0px; padding: 0px;}
    #payBtn{margin-left: 10px;width: 100px; height: 50px;}
    #back{margin-left: 10px;width: 100px; height: 50px;}
</style>
<script>
    $(function(){
    	
    	$("#payBtn").on("click",function () {
    		let sum = $("#o_allSum").val();
    		let email = $("#o_email").val();
    		let name = $("#o_name").val();
    		let phone = $("#o_phone").val();
    		
    		console.log(sum);
    		  var IMP = window.IMP; // 생략가능
    	        IMP.init('imp81223023');
    	        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    	        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
    	        IMP.request_pay({
    	        pg: 'inicis', // version 1.1.0부터 지원.
    	        /*
    	        'kakao':카카오페이,
    	        html5_inicis':이니시스(웹표준결제)
    	        'nice':나이스페이
    	        'jtnet':제이티넷
    	        'uplus':LG유플러스
    	        'danal':다날
    	        'payco':페이코
    	        'syrup':시럽페이
    	        'paypal':페이팔
    	        */
    	        pay_method: 'card',
    	        /*
    	        'samsung':삼성페이,
    	        'card':신용카드,
    	        'trans':실시간계좌이체,
    	        'vbank':가상계좌,
    	        'phone':휴대폰소액결제
    	        */
    	        merchant_uid: 'merchant_' + new Date().getTime(),
    	        /*
    	        merchant_uid에 경우
    	        https://docs.iamport.kr/implementation/payment
    	        위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
    	        참고하세요.
    	        나중에 포스팅 해볼게요.
    	        */
    	        name: '별보러갈래',
    	        //결제창에서 보여질 이름
    	        //amount: 100, 
    	        amount: sum, 
    	        //가격
    	      	buyer_email: email,
    	        buyer_name: name,
    	        buyer_tel: phone,
    	        m_redirect_url: 'https://www.yourdomain.com/payments/complete'
    	        /*
    	        모바일 결제시,
    	        결제가 끝나고 랜딩되는 URL을 지정
    	        (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
    	        */
    	        }, function (rsp) {
    	        console.log(rsp);
    	        if (rsp.success) {
    	         var msg = '결제가 완료되었습니다.';
    	        /*msg += '고유ID : ' + rsp.imp_uid;
    	        msg += '상점 거래ID : ' + rsp.merchant_uid;
    	        msg += '결제 금액 : ' + rsp.paid_amount;
    	        msg += '카드 승인번호 : ' + rsp.apply_num; */
    	        
    	       	location.href="/products/selectAll?index=1"; 
    	        } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	        }
    	        alert(msg);
    	        });
    	       
    	        
    	        $(".back").on("click",function(){
    	        	alert("AAA");
    	        	location.href="/cart/cartList";
    	        })
    	});
    	
    	});
    	
  

</script>
</head>
<body>
	<c:choose>
	<c:when test="${size!=null}">
		 <div class="container-fluid p-0 ">
        <div class="row m-0">
            <div class="col-12 top">주문/결제</div>
        </div>
        <div class="row m-0 mt-4">
            <div class="col-12 pb-2 title">구매자 정보</div>
            <div class="row m-0 p-0 txt">
                <div class="col-3 ">이름</div>
                <div class="col-4"><input type="text" name="" value="${mdto.cm_id}" disabled></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">연락처</div>
                <div class="col-4"><input type="text" name="" value="${mdto.cm_phone }"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">이메일</div>
                <div class="col-4"><input type="text" name="" value="${mdto.cm_email}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3 ">우편번호</div>
                <div class="col-4 "><input type="text" name="" id=postcode value="${mdto.cm_zipcode}">
                </div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">배송지주소</div>
                <div class="col-6"><input type="text" name="" id=address1 value="${mdto.cm_address1 }"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">상세주소</div>
                <div class="col-6"><input type="text" name="" id=address2 value="${mdto.cm_address2 }"></div>
            </div>
        </div>
        <div class="row m-0 mt-4">
            <div class="col-12 title">상품정보</div>
            <c:forEach var="i" items="${list}" >
            	<div class="row m-0 p-0 txt">
                <div class="col-6">${i.o_product}<span style="margin-left:10px;">${i.o_qcy}개</span></div>
            </div>
            </c:forEach>
            
        </div>
        <div class="row m-0 mt-4">
            <div class="col-12 title">결제 정보</div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">상품가격</div>
                <div class="col-4"><input type="text" name="" value="${sumMoney}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">배송비</div>
                <div class="col-4"><input type="text" name="" value="${delivery}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">총결제금액</div>
                <div class="col-4"><input type="text" name="" value="${allSum}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">결제방법</div>
                <div class="col-9">
                    <input type="radio" name=pay onclick="return(false);"> 계좌이체
                    <input type="radio" name=pay checked> 신용/체크카드
                    <input type="radio" name=pay onclick="return(false);"> 무통장입금
                </div>
            </div>
            <input type=hidden id="o_seq" value="${o_seq }">
            <input type=hidden id="o_allSum" value="${allSum }">
            <input type=hidden id="o_email" value="${mdto.cm_email }">
            <input type=hidden id="o_name" value="${mdto.cm_name }">
            <input type=hidden id="o_phone" value="${mdto.cm_phone }">
            <div class="row bt">
                <div class="col-12 btnBox">
                    <button type="button" id="back" class="btn btn-outline-dark back">메인으로</button>
                    <button type="button" id="payBtn" class="btn btn-dark">결제하기</button>
                </div>
            </div>
        </div>
    </div>
	</c:when>
	<c:otherwise>
		 <div class="container-fluid p-0 ">
        <div class="row m-0">
            <div class="col-12 top">주문/결제</div>
        </div>
        <div class="row m-0 mt-4">
            <div class="col-12 pb-2 title">구매자 정보</div>
            <div class="row m-0 p-0 txt">
                <div class="col-3 ">이름</div>
                <div class="col-4"><input type="text" name="" value="${dto.o_name }" disabled></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">연락처</div>
                <div class="col-4"><input type="text" name="" value="${dto.o_phone }"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">이메일</div>
                <div class="col-4"><input type="text" name="" value="${dto.o_email}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3 ">우편번호</div>
                <div class="col-4 "><input type="text" name="" id=postcode value="${dto.o_zipcode}">
                </div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">배송지주소</div>
                <div class="col-6"><input type="text" name="" id=address1 value="${dto.o_address1 }"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">상세주소</div>
                <div class="col-6"><input type="text" name="" id=address2 value="${dto.o_address2 }"></div>
            </div>
        </div>
        <div class="row m-0 mt-4">
            <div class="col-12 title">상품정보</div>
            <div class="row m-0 p-0 txt">
                <div class="col-6">${dto.o_product}<span style="margin-left:10px;">${dto.o_qcy}개</span></div>
            </div>
        </div>
        <div class="row m-0 mt-4">
            <div class="col-12 title">결제 정보</div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">상품가격</div>
                <div class="col-4"><input type="text" name="" value="${price}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">배송비</div>
                <div class="col-4"><input type="text" name="" value="${dto.o_delivery}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">총결제금액</div>
                <div class="col-4"><input type="text" name="" value="${dto.o_allSum}"></div>
            </div>
            <div class="row m-0 p-0 txt">
                <div class="col-3">결제방법</div>
                <div class="col-9">
                    <input type="radio" name=pay onclick="return(false);"> 계좌이체
                    <input type="radio" name=pay checked> 신용/체크카드
                    <input type="radio" name=pay onclick="return(false);"> 무통장입금
                </div>
            </div>
            <input type=hidden id="o_seq" value="${dto.o_seq }">
            <input type=hidden id="o_allSum" value="${dto.o_allSum}">
            <input type=hidden id="o_email" value="${dto.o_email }">
            <input type=hidden id="o_name" value="${dto.o_name }">
            <input type=hidden id="o_phone" value="${dto.o_phone }">
            <div class="row bt">
                <div class="col-12 btnBox">
                    <button type="button" id="back" class="btn btn-outline-dark back">메인으로</button>
                    <button type="button" id="payBtn" class="btn btn-dark">결제하기</button>
                </div>
            </div>
        </div>
    </div>
	</c:otherwise>
	</c:choose>
   
</body>
</html>