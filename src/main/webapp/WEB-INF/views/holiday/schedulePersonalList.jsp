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
<!-- bpopup CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>

<style>

	body {
	  margin: 40px 10px;
	  padding: 0;
	  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	  font-size: 14px;
	}
  
	.fc .fc-button-primary {
		background-color:#007bff !important;
		border:0.5px solid #F8F8FF !important;
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
		
		<!-- 풀캘린더 스크립트 -->
		<script>
			
			var draggedEventIsAllDay;
			var activeInactiveWeekends = true;
			
			document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('holiday-personal-calendar');
			
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				googleCalendarApiKey: 'AIzaSyAjhvoWANExZ7MjlAGJm4VvKEC_Z-EgulE',
				eventSources: [
					{
						googleCalendarId: 'blffot637do35g8hc1hf9a046s@group.calendar.google.com',
						className: '대한민국빨간날',
						color: '#e65245',
						textColor: 'white' 
					} 
				],
				headerToolbar: {
						left: 'prev,next today',
						center: 'title',
						right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				},
				navlinks : true,
				editable : true,
				selectable: true,
				dateClick: function(info) {
					document.querySelector('#schedule-enroll-modal').style.display ='block';
					
			    },
				
				
				});
				  calendar.render();
				});
			
		</script>
		
		
				
		<!-- 일자 클릭시 메뉴오픈 
		<div id="contextMenu" class="dropdown clearfix" style="margin-left:30%;">
		    <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
		        style="display:block;position:static;margin-bottom:5px;">
		        <li><a tabindex="-1" href="#">개인일정등록</a></li>
		        <li><a tabindex="-1" href="#">부서일정등록</a></li>
		        <li><a tabindex="-1" href="#">회사일정등록</a></li>
		        <li class="divider"></li>
		        <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
		    </ul>
		</div>
		
			 실패시 지울거 / 카테고리 필터링 
			<div class="schedule-filter" style="margin-left:30%;">
				<label for="calendar_view">구분별</label>
				<div class="input-group">
					<select class="filter" id="type_filter" multiple="multiple" style="width:80px;">
						<option value="1">개인</option>
						<option value="2">부서</option>
						<option value="3">회사</option>
					</select>
				</div>
			</div>
			
		-->
		
		<!-- 풀캘린더 보여질 부분 -->	
		<div class="adminx-main-content">
		
			<div id='holiday-personal-calendar'></div>
			
		</div>
	</div>
	
	
    <!-- 일정 등록 모달 -->
	<form action="" method="POST">
		<div class="modal" id="schedule-enroll-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h6 class="modal-title">일정등록</h6>
						<button type="button" class="modal_close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<table style="margin-left:40px;">
							<tr>
								<td><label for="scheduleAllday" style="width:80px;">하루종일</label></td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                                	<input class='allDayNewEvent' id="scheduleAllday" type="checkbox"></label>
                                </td>
							</tr>
							<tr>
								<td><label for="scheduleTitle">일정명</label></td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                              		<input class="inputModal" type="text" name="scheduleTitle" id="scheduleTitle" style="width:278px;" required="required"/>                              		
								</td>
							</tr>							
							<tr>
								<td>날짜</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                              		<input class="inputModal" type="date" name="scheduleStart" id="scheduleStart" required/>~<input class="inputModal" type="date" name="scheduleEnd" id="scheduleEnd" required/>                               	
								</td>
							</tr>
							<tr>
								<td>시간</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                                	<input class="inputModal" type="time" name="scheduleTimeStart" id="scheduleTimeStart" style="width:134px;"/>~<input class="inputModal" type="time" name="scheduleTimeEnd" id="scheduleTimeEnd" style="width:134px;"/>                                	
								</td>
							</tr>
							<tr>
								<td><label for="scheduleColor">배경색상</label></td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                                	<select class="inputModal" name="scheduleColor" id="scheduleColor">
                                		<option value="#495057" style="color:#495057;">검정색</option>
                                		<option value="#FFC0CB" style="color:#FFC0CB;">분홍색</option>
	                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
	                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
	                                    <option value="#FFFF00" style="color:#FFFF00;">노란색</option>
	                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
	                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>	                                                                       
	                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>                                                        
	                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
	                                    <option value="#9775fa" style="color:#9775fa;">보라색</option> 
                               		</select>
								</td>
							</tr>
							<tr>
								<td><label for="scheduleContent">일정설명</label></td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                                	<div style="width:100%;">
                                		<textarea rows="5" cols="32" class="inputModal" name="scheduleContent" id="scheduleContent" style="resize:none;"></textarea>
									</div>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- Modal footer -->
					<!-- 등록용 모달 버튼 -->
					<div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">등록</button>
                    </div>
                    
                    <!-- 수정용 모달 버튼
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">수정</button>
                    </div>
                    -->
				</div>
			</div>
		</div>
	</form>
	
	
	
	
		
		<jsp:include page="../common/footer.jsp" />
	</div>	

</body>
</html>