<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ce179a320cf4d7ee0e06336563f2a077&libraries=LIBRARY&libraries=services"></script>
<link href="/css/campdetail.css" rel="stylesheet">
</head>
<Script>
   $(function(){
      
      $(".likeicon").on("click", function(){

         var like = $(".likeicon").attr('id');
         var contentId = $("#contentId").html();
         console.log(like);
         console.log(contentId);
         
         if(like == "dislike"){   
            
            alert("찜하기 목록에 추가합니다. 목록은 마이페이지에서 확인 가능합니다.");
            $(".likeicon").attr("src", "/img/detailimage/like/like.png");
            $(".likeicon").attr('id','like');
            
            $.ajax({
                     url: "/info/wishinsert",
                     data: {contents:"like", contentId:contentId},
                     method:"post",
                     dataType:"application/json"
                  });
            
         }else if(like == "like"){
            alert("찜하기를 취소합니다.");
            $(".likeicon").attr("src", "/img/detailimage/like/dislike.png");
            $(".likeicon").attr('id','dislike');
            
            $.ajax({
                url: "/info/wishdelete",
                data: {contents:"dislike", contentId:contentId},
                method:"post",
                dataType:"application/json"
             });
         }else if(like = "xlike"){
        	 alert("로그인 후에 이용 가능합니다.");
         }

      });
      
      //슬라이드
       $(document).ready(function(
            ){ $('.slick-sample').slick({ 
               dots: true 
               });
            });
      
      //슬라이드 반응형
      $('.responsive').slick({ 
         slidesToShow: 4, 
         slidesToScroll: 4, 
         responsive: [ 
            { breakpoint: 600, // 화면의 넓이가 600px 이상일 때 
               settings: { 
                  slidesToShow: 3, 
                  slidesToScroll: 3 
                  }}, 
                  { breakpoint: 320, // 화면의 넓이가 320px 이상일 때 
                     settings: { 
                        slidesToShow: 1, 
                        slidesToScroll: 1 
                        } 
                  } 
                  ] 
      }); 
      
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var addr1 = $("#addr1").html();	//주소
		var name = $("#namebox").html();	//캠핑장 이름
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr1, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + name + '</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
   })
   
   
})
   
</Script>
<body>
<div id=header>
     <div id="headerimg"></div>  
</div> 
<div class=container>
   <div class=box>
      <div id=onetop class=boxcon>

      <c:forEach var="i" items="${list}">
        <div id=onebox>
         <div id=namebox>
            ${i.facltNm} 
         </div>


         <!-- 슬라이드 -->
         <div id=slidebox>
            <div class="slick-sample"> 
               <div><img src="/img/campinglist/camping01.jpg"></div> 
               <div><img src="/img/campinglist/camping02.jpg"></div>
               <div><img src="/img/campinglist/camping03.jpg"></div> 
               <div><img src="/img/campinglist/camping04.jpg"></div> 
               <div><img src="/img/campinglist/camping05.jpg"></div>  
            </div>
         </div>
         <!-- 정보 -->
         <div id=infobox>
            <div id=tablebox>
               <table class="infotable1">
                  <tr>
                     <th> 주소</th>
                     <td id="addr1">${i.addr1} ${i.addr2}</td>
                  </tr>
                  <tr>
                     <th> 캠핑장 환경</th>
                     <td>${i.lctCl}</td>
                  </tr>
                  <tr>
                     <th> 캠핑장 유형</th>
                     <td>${i.induty}</td>
                  </tr>
                  <tr>
                     <th> 운영기간</th>
                     <td>${i.operPdCl}</td>
                  </tr>
                  <tr>
                     <th> 운영일</th>
                     <td>${i.operDeCl}</td>
                  </tr>
                  <tr>
                     <th> 홈페이지</th>
                     <td>${i.homepage}</td>
                  </tr>
                  <tr>
                     <th> 예약방법</th>
                     <td>${i.tel}</td>
                  </tr>
                  <tr>
                     <th> 주변 이용 가능 시설</th>
                     <td>${i.posblFcltyCl}</td>
                  </tr>
                  <tr>
                     <th> Id</th>
                     <td id="contentId">${i.contentId}</td>
                  </tr>
               </table>
            </div>
          </div>
         </div>
         </c:forEach>
         
            <div id=btnbox>
               <!-- 찜하기 -->	
               <div id=wishbox>   
                 <c:choose>
                 	<c:when test="${contents eq 'like'}">         
			        <h4>찜하기</h4> 
			            <div id=wishbox_icon>
			               <img src="/img/detailimage/like/like.png" id="like" class="likeicon">             
			            </div>
			         </c:when>
			         <c:when test="${loginID ==null }">
			         	<h4>찜하기</h4> 
			            <div id=wishbox_icon>
			               <img src="/img/detailimage/like/dislike.png" id="xlike" class="likeicon">             
			            </div>
			         </c:when>
			         <c:otherwise>
			         	<h4>찜하기</h4> 
			            <div id=wishbox_icon>
			               <img src="/img/detailimage/like/dislike.png" id="dislike" class="likeicon">             
			            </div>
			         </c:otherwise>
			   	</c:choose>
               </div>

               <!-- 예약 버튼 -->   
               <div id=reservebox> 
                  <a href="#" class="myButton" id="reservebtn"><h4>예약하러 가기</h4></a>
               </div>   
             </div>

      </div><!-- onetop --> 
      
   
      <div id=twotop  class=boxcon>
         <div id=camptabbox>
            <ul id=camptab>
               <li id="camp_guide">안내</li>
               <li id="camp_map">위치</li>
               <li id="camp_review">후기</li>
            </ul>
         </div>
      </div>
      
      <div id=threetop  class=boxcon>
      <c:forEach var="i" items="${list}">
         <div id=camp_guide_box class="camp_info_box">
            <div id="introbox">   
               <div id="lineintro">
                  ${i.lineIntro}
               </div>   

               <div id="themaEnvrnClbox">
                  <div id="themaEnvrnClName"> keyword! </div>
                  <div id="themaEnvrnCl">      </div>
               </div>

               <div id="intro">
                  ${i.intro}
               </div>
            </div>
         <div id="etcbox">
            <div id="sbrsClbox">
               <div id="sbrcClName"> 캠핑장 시설 정보 </div>
               <div id="sbrcClCon">
                  ${i.sbrsCl}
               </div>   
            </div>
            <div id="Cobox">
               <div id="Coname"> 기타 주요 시설 </div>
               <div id="Cocon">일반 야영장(${i.gnrlSiteCo}) 자동차야영장(${i.autoSiteCo}) 글램핑(${i.glampSiteCo}) 카라반(${i.caravSiteCo}) 개인카라반(${i.indvdlCaravSiteCo})</div>
            </div>
            <div id="sbrcEtcbox">
               <div id="sbrcEtcName">부대시설</div>
               <div id="sbrcEtcCon"> ${i.sbrsEtc} </div>
            </div>
            <div id="brazierClbox">
               <div id="brazierClName">화로</div>
               <div id="brazierClCon">${i.animalCmgCl}</div>
            </div>
            <div id="animalCmgClbox">
               <div id="animalCmgClName">반려동물</div>
               <div id="animalCmgClCon">${i.brazierCl}</div>
            </div>
         </div>
         <div id=camp_map_box class="camp_info_box">
         	<h1>위치</h1>
         	<div id="map" style="width:500px;height:400px;"></div>
         </div>
         <div id=camp_review_box class="camp_info_box"></div>            
         </div>         
      </c:forEach>
      </div>   <!-- three -->

      
   </div> <!-- box --> 
</div> <!-- 전체 -->
</body>
</html>