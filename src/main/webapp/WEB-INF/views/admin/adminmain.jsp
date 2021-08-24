<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){

	$("#dataupdate").on("click",function(){
		alert("ok");
		location.href="/admin/dataupdate";
	});


})
</script>
<style>
body {
    background-color: #EAEAEA;
}

.container {
    background-color: #FFFFFF;
    width: 80%;
    height:1000px;
    margin: auto;
    margin-top: 10%;
    padding: 2%;
}

#menutab li {
    color: #fff;
    line-height: 40px;
    font-size: 15px;
    text-decoration: none;
    display: block;
}

#menutab {
    list-style:none;
    margin:0;
    padding:0;
}

#menutab li {
	float:left;
	width:24%;
	font-size:22px;
	text-align:center;
	background-color: #EAEAEA;
	margin: 0 1px;
	padding: 1% 0;
	color:black;
}

#menutab li:visited {
     background-color: white;
     cursor:pointer;
}
</style>
<body>
		<!-- <button id="dataupdate">DB에 저장</button> -->
	<div class=container>
		<div id=menu>
			<ul id=menutab>
               <li id="mem">회원 관리</li>
               <li id="pro">상품 관리</li>
               <li id="repro">중고판매 관리</li>
               <li id="camp">캠핑장 관리</li>
            </ul>
		</div>
	</div>	
</body>
</html>