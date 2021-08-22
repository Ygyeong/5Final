<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="/css/cartList.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
		<input type="hidden" name="cmd" value="order">
		<div class="basketdiv" id="basket">
			<div class="row head">
				<div class="subdiv">
					<div class="check">선택</div>
					<div class="img">이미지</div>
					<div class="pname">상품명</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">가격</div>
					<div class="num">수량</div>
					<div class="sum">합계</div>
				</div>
				<div class="subdiv">

					<div class="basketcmd">삭제</div>
				</div>
				<div class="split"></div>
			</div>
			<c:forEach var="list" items="${map.list}">
			<div class="row data">
				<div class="subdiv">
					<div class="check">
						<input type="checkbox" name="buy" value="260" checked=""
							onclick="javascript:basket.checkItem();">&nbsp;
					</div>
					<div class="img">
						<img src="/img/surf.jpg" width="60">
					</div>
					<div class="pname">
						<span>${list.p_name}</span>
						<input type="hidden" value="${list.c_seq}" id="c_seq">
						<input type="hidden" value="${list.p_seq}" id="p_seq">
					</div>
				</div>
				<div class="subdiv">
					<div class="basketprice">
						<input type="hidden" name="p_price" id="p_price${list.c_seq}" class="p_price"
							value="${list.p_price}">${list.p_price}
					</div>
					<div class="num">
						<div class="updown">
							<input type="text" name="p_num${list.c_seq}" id="p_num${list.c_seq}" size="2"
								maxlength="4" class="p_num" value="${list.c_qty}"
								onkeyup="javascript:basket.changePNum(${list.c_seq});"> <span
								onclick="javascript:basket.changePNum(${list.c_seq});"><i
								class="fas fa-arrow-alt-circle-up up"></i></span> <span
								onclick="javascript:basket.changePNum(${list.c_seq});"><i
								class="fas fa-arrow-alt-circle-down down"></i></span>
						</div>
					</div>
					<div class="sum">${list.p_price}</div>
				</div>
				<div class="subdiv">
					<div class="basketcmd">
						<a href="javascript:void(0)" class="abutton"
							onclick="javascript:basket.delItem();">삭제</a>
							
					</div>
				</div>
			</div>
			</c:forEach>
		</div>

		<div class="right-align basketrowcmd">
			<a href="javascript:void(0)" class="abutton"
				onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> <a
				href="javascript:void(0)" class="abutton"
				onclick="javascript:basket.delAllItem();">장바구니비우기</a>
		</div>

		<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:
			4개</div>
		<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액:
			${dto.c_price}</div>

		<div id="goorder" class="">
			<div class="clear"></div>
			<div class="buttongroup center-align cmd">
				<a href="javascript:void(0);">선택한 상품 주문</a>
			</div>
		</div>
	</form>

</body>
<script type="text/javascript" src="/js/cartList.js"></script>  
</html>