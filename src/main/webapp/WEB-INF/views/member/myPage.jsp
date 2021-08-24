<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script  src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myPage.css">
<!-- diary -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>


<title>** MY PAGE **</title>
<script>
	$(function(){
		$("#myPageModify").on("click", function(){
			location.href="/member/memberModify?cm_id=${loginID.cm_id}"

		})
		$("#myPagePwChange").on("click", function(){
			location.href="/member/pwChange?cm_id=${loginID.cm_id},a=1"
		})
		$("#myPageMemberDelete").on("click", function(){

			location.href="/member/memberOutProc?cm_id=${loginID.cm_id}"

		})
		$("#goHome").on("click",function(){
			location.href="/"
		})
		
		$('#calendar').fullCalendar({
			    header: {
			      right: 'custom1 ,custom2 prevYear,prev,next,nextYear'
			    },
		        // 출석체크를 위한 버튼 생성
			    customButtons: { 
			    	custom1: {
				          text: '일정확인',
				          id: 'check',
				          click: function() { 
				          }
				     },
			        custom2: {
			          text: '일정추가',
			          id: 'add',
			          click: function() { 
			          }
			        }
			    }
		});
		
		$(".fc-custom2-button").on('click', function(){
			var url = "/schedule/scheduleOpen?cm_id=${loginID.cm_id}";
			var name = "/schedule/scheduleOpen";
			var option = "width=600,height=600 left=100, top=50, location=no";
			window.open(url, name, option)
		})
		
		$(".fc-custom1-button").on('click', function(){
			var url ="/schedule/scheduleCheckOpen?cm_id=${loginID.cm_id}"
			var name = "/schedule/scheduleCheckOpen";
			var option = "width=600,height=600 left=100, top=50, location=no";
			window.open(url, name, option)
		})
		
		
	})
</script>
</head>
<body>
	<div>
		<div id="myBox">
	        <div id="me" class="card">

                <div class="class=ard_body">
                    <h5 class="card-title"> ${member.cm_id}님의 마이페이지 </h5>
                    <button class="myPageBtn btn-success" id="myPageModify">회원정보 수정</button></br>
                    <button class="myPageBtn btn-primary" id="myPagePwChange">비밀번호 변경</button></br>
                    <button class="myPageBtn btn-danger" id="myPageMemberDelete">회원 탈퇴</button></br>

                    <button class="myPageBtn btn-dark" id="goHome">메인으로</button>
                </div>
            </div>
            <div id="calendar" style="max-width:600px; margin:auto;"></div>
            
        </div>
    </div>  
</body>
</html>