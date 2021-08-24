<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.21.1/themes/base/jquery/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<head>
<meta charset="UTF-8">
<title>** SCHEDULE INSERT **</title>
<script>
$(function(){
	
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
			yearSuffix: "년",
			monthNameShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
		});
		$("#startDate").datepicker();
		$("#startDate").datepicker('setDate', 'today');
		
});
</script>


</head>
<body>
	<div class="group" id="popupGroup">
		<div class="group-head">
			<h1 class = "zTree-h1">일정 추가</h1>
		</div>
		<div class="group-body">
		<form action="/schedule/addSchedule" method="POST">
			<input type="text" name="cm_id" value=${member.cm_id }>
			<div class="top">
				<input class="subject" id="subject" name="subject" type="text" placeholder="제목을 입력해주세요.">
			</div>
			<div class="domain">
				<h3 class="zTree-h3"> 시작 </h3>
			</div>
			<div class="domain">
				<input class="date" id="startDate" name="startDate" id="startDate" type="text" readonly>
			</div>
			<div class="domain">
				<h3 class="zTree-h3"> 메모 </h3>
			</div>
			<div class="domain">
				<textarea class="memo" id="memo" name="memo" rows="5" cols="20" placeholder="100글자까지 입력가능합니다."></textarea>
			</div>
			<input type="submit" value="저장">
		</form>
		</div>
	</div>
</body>
</html>