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
<scprpt type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2ef783c8be226165a93db942b27adf0"></scprpt>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<link href="/css/campdetail.css" rel="stylesheet">
</head>
<Script>
   $(function(){
      
      $(".likeicon").on("click", function(){

         var like = $(".likeicon").attr('id');
         var contentId = "${i.contentId}";
         console.log(like);
         console.log(contentId);
         
         if(like == "dislike"){   
            
            alert("찜하기 목록에 추가합니다. 목록은 마이페이지에서 확인 가능합니다.");
            $(".likeicon").attr("src", "/img/detailimage/like/like.png");
            $(".likeicon").attr('id','like');
            
            $.ajax({
                     url: "wishinsert.info",
                     data: {contents:"dislike", ci_seq:"contentId"},
                     method:"post",
                     dataType:"application/json"
                  });
            
         }else if(like == "like"){
            alert("찜하기를 취소합니다.");
            $(".likeicon").attr("src", "/img/detailimage/like/dislike.png");
            $(".likeicon").attr('id','dislike');
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
            <h1>${i.facltNm}</h1>
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
                     <td>${i.addr1} ${i.addr2}</td>
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
               </table>
            </div>
          </div>
         </div>
         </c:forEach>
         
            <div id=btnbox>
               <!-- 찜하기 -->

               <div id=wishbox>               
			               <h4>찜하기</h4> 
			            <div id=wishbox_icon>
			               <img src="/img/detailimage/like/dislike.png" id="dislike" class="likeicon">             
			            </div>

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
         <div id=camp_map_box class="camp_info_box"></div>
         <div id=camp_review_box class="camp_info_box"></div>            
         </div>         
      </c:forEach>
      </div>   <!-- three -->
      
   </div> <!-- box --> 
</div> <!-- 전체 -->
</body>
</html>