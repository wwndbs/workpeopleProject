<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery CDN -->  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
<!-- fullcalendar CDN -->  
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' /> 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>  
<!-- fullcalendar 언어 CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js'></script>

<!-- datetime picker CDN -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<!-- datetime picker 아이콘 연동 위한 폰트어썸 CDN -->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />

<!-- 풀캘린더&구글캘린더 연동 스크립트 -->
<script>
	
		document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('holiday-personal-calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
		  googleCalendarApiKey: 'AIzaSyAjhvoWANExZ7MjlAGJm4VvKEC_Z-EgulE',
		  eventSources: [
		    {
		        googleCalendarId: 'blffot637do35g8hc1hf9a046s@group.calendar.google.com',
		        className: '대한민국빨간날',
		          color: '#e65245',
		          textColor: 'white' 
		    } 
		  ]
		});
		  calendar.render();
		});
	
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

</style>

</head>
<body>

<!-- 장서원 / 일정관리_개인일정관리 -->

	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />

		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		<!-- 컨텐츠 부분 wrapper -->
		<div class="adminx-content">
		
		<!-- 일자 클릭시 메뉴오픈 -->
		<div id="contextMenu" class="dropdown clearfix">
		    <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
		        style="display:block;position:static;margin-bottom:5px;">
		        <li><a tabindex="-1" href="#">개인일정등록</a></li>
		        <li><a tabindex="-1" href="#">부서일정등록</a></li>
		        <li><a tabindex="-1" href="#">회사일정등록</a></li>
		        <li class="divider"></li>
		        <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
		    </ul>
		</div>
		
		<!-- 풀캘린더 보여질 부분 -->	
		<div class="adminx-main-content">
	
			<div id='holiday-personal-calendar'></div>
			
		</div>
	</div>
	
	<!-- 일정 등록 모달 -->
	<form action="" method="POST">
		<div class="modal" id="schedule-enroll">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h6 class="modal-title">일정등록</h6>
						<button type="button" class="modal_close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<table style="margin-left:50px;">
							<tr>
								<td>하루종일</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
									<label for="scheduleAllday">하루종일</label>
                                	<input class='scheduleAllday' id="scheduleAllday" type="checkbox"></label>
                                </td>
							</tr>
							<tr>
								<td>일정명</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
									<input class="inputModal" type="text" name="scheduleTitle" id="edit-title" required="required" />
								</td>
							</tr>
							<tr>
								<td>수정요청시간</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;"><input type="time" name="" value="" style="width:120px;">&nbsp;~&nbsp;<input type="time" name="" value="" style="width:120px;" readonly></td>
							</tr>
							<tr>
								<td>요청사유 작성</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;"><textarea style="resize:none; width:258px; height:60px;"></textarea></td>
							</tr>
						</table>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer" style="justify-content:center;">
						<button type="submit" class="btn btn-jyok" id="schedule-enroll-btn">수정</button>	                
						<button type="button" class="btn btn-jycancle" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	
	
	
	
		
		<jsp:include page="../common/footer.jsp" />
	</div>	

</body>
</html>