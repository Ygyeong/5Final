<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<head>
<meta charset="UTF-8">
<title>** SCHEDULE INSERT **</title>
<script>
$(function(){
	
		$.datepicker.setDefaults({
			dateFormat : 'yy.mm.dd.',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
			yearSuffix: "년",
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
		});
		$("#startDate").datepicker();
		$("#startDate").datepicker('setDate', 'today');
		
		$(".btn-danger").on('click', function(){
			window.close();
		})
		
});
</script>


</head>
<body>
	<div class="group" id="popupGroup" style="text-align:center">
		<div class="group-head">
			<h1 class = "zTree-h1">일정 추가</h1>
		</div>
		<hr>
		<div class="group-body">
		<form action="/schedule/addSchedule" method="POST">
			<input type="hidden" name="cm_id" value=${loginID }>
			<div class="top">
				<label>제목</label>
				<input class="subject" id="subject" name="subject" type="text" placeholder="제목을 입력해주세요." required>
			</div>
			<div class="domain">
			<label>날짜</label>
				<input class="date" id="startDate" name="startDate" type="text" required>
			</div>
			<div class="domain">
				<h3 class="zTree-h6"> 메모 </h3>
			</div>
			<div class="domain">
				<textarea class="memo" id="memo" name="memo" rows="5" cols="30" placeholder="100글자까지 입력가능합니다." required  style="resize: none;"></textarea>
			</div>
			<input type="submit" class="btn btn-success" value="저장">
			<button class="btn btn-danger"> 닫기 </button>
		</form>
		</div>
	</div>
</body>
</html>