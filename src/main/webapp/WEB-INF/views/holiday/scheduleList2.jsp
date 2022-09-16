<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>

<!-- jquery CDN -->  
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
<!-- fullcalendar CDN -->  
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' /> 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>  
<!-- fullcalendar 언어 CDN -->  
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js'></script>

<style>

	body {		
		margin: 40px 10px;
		padding: 0;
		font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		font-size: 14px;
	}
	
	#holiday-personal-calendar {
		height:850px;
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
	
	
    <!-- 일정 등록 모달 -->
		<div class="modal" id="schedule-enroll-modal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h6 class="modal-title">일정등록</h6>
						<button type="button" class="modal_close" id="schedule-cancle-btn1" onclick='$("#schedule-enroll-modal").modal("hide");'>&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<table style="margin-left:40px;">
							<tr>
								<td><label for="scheduleCategory">구분</label></td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
									<select class="inputModal" type="text" name="scheduleCategory" id="scheduleCategory">
									   <option value="1">개인일정</option>
									   <option value="2">부서일정</option>
									   <option value="3">회사일정</option>
									 </select>                                	
								</td>
							</tr>
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
                              		<input class="inputModal" type="text" name="scheduleTitle" id="scheduleTitle" style="width:268px;" required="required"/>                              		
								</td>
							</tr>
							<tr>
								<td>시작날짜/시간</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                              		<input class="inputModal" type="date" name="scheduleStart" id="scheduleStart" required/><input class="inputModal" type="time" name="scheduleTimeStart" id="scheduleTimeStart" style="width:134px;"/>                               	
								</td>
							</tr>
							<tr>
								<td>종료날짜/시간</td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                                	<input class="inputModal" type="date" name="scheduleEnd" id="scheduleEnd" required/><input class="inputModal" type="time" name="scheduleTimeEnd" id="scheduleTimeEnd" style="width:134px;"/>                                	
								</td>
							</tr>
							<tr>
								<td><label for="scheduleColor">배경색상</label></td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                                	<select class="inputModal" name="scheduleColor" id="scheduleColor">
                                		<option value="#495057" style="background:#495057; color:white;">검정색</option>
                                		<option value="#FFC0CB" style="background:#FFC0CB;">분홍색</option>
	                                    <option value="#D25565" style="background:#DC143C;">빨간색</option>
	                                    <option value="#ffa94d" style="background:#ffa94d;">주황색</option>
	                                    <option value="#FFFF00" style="background:#FFD700;">노란색</option>
	                                    <option value="#63e6be" style="background:#9ACD32;">연두색</option>
	                                    <option value="#a9e34b" style="background:#2E8B57;">초록색</option>	                                                                       
	                                    <option value="#74c0fc" style="background:#0000CD;">파란색</option>                                                        
	                                    <option value="#4d638c" style="background:#000080;">남색</option>
	                                    <option value="#9775fa" style="background:#9775fa;">보라색</option> 
                               		</select>
								</td>
							</tr>
							<tr>
								<td><label for="scheduleContent">일정설명</label></td>
								<td>&nbsp;&nbsp;&nbsp;:&nbsp;</td>
								<td style="padding-left:15px;">
                                	<div style="width:100%;">
                                		<textarea rows="5" cols="30" class="inputModal" name="scheduleContent" id="scheduleContent" style="resize:none;"></textarea>
									</div>
								</td>
							</tr>
						</table>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer modalBtnContainer-addEvent">
						<button type="button" class="btn btn-jycancle" id="schedule-cancle-btn2" onclick='$("#schedule-enroll-modal").modal("hide");'>취소</button>
		                <button type="button" class="btn btn-jyok" id="schedule-enroll-modal-btn" onclick=>등록</button>	                            
	                </div>
                    
				</div>
			</div>
		</div>

	
	<!-- 풀캘린더 불러오는 스크립트 -->
	<script>
			
		var draggedEventIsAllDay;
		var activeInactiveWeekends = true;
		var calendarEl = document.getElementById('holiday-personal-calendar');
		
		document.addEventListener('DOMContentLoaded', function() {
			calendarRendering();
		});
		
		
		function calendarRendering(){
			
			console.log("calendarRendering 실행");
			
			$.ajax({
    			type: "GET",
    			url: "scheduleList.sc",
    			data: {userNo:'${loginUser.userNo}'},
    			success: function(response){
    				
    				console.log(response); // [{}, {}, ..]
    				
    				let data = [];
    				
    				for(let i=0; i<response.length; i++) {
    					let obj = {
	    						title: response[i].scheduleTitle,
	    						start: response[i].scheduleStart,
	    						end: response[i].scheduleEnd,
	    				    	color : response[i].scheduleColor				
	    					};
    					
    					data.push(obj);
    				}
    				
    				
					var calendar = new FullCalendar.Calendar(calendarEl, {
						height: '850px;',
						expandRows: true,
						initialView : 'dayGridMonth', // 기본으로 보여지는 화면 => '이번달'
						googleCalendarApiKey: 'AIzaSyAjhvoWANExZ7MjlAGJm4VvKEC_Z-EgulE', // 구글캘린더 API키
						eventSources: [
							{
								googleCalendarId: 'blffot637do35g8hc1hf9a046s@group.calendar.google.com', // 구글캘린더 ID
								className: '대한민국빨간날',
								color: '#e65245', // 테두리배경색 지정
								textColor: 'white', // 글자색 지정					
								editable : false // 공휴일은 수정할 수 없도록 함
							}
						],
						headerToolbar: { // 상단에 보여지는 버튼 순서 지정
								left: 'prev,next today',
								center: 'title',
								right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
						},
					    titleFormat : function(date){
					    	return date.date.year + '년 ' + (date.date.month + 1) + '월';
					    },
					    locale: 'ko',
						editable : true, // 수정 가능여부
						selectable : true, // 달력 일자 드래그 가능
						droppable : true,
						nowIndicator : true, // 현재 시간 마크
						dayMaxEvents : true, // 이벤트가 오버되면 높이 제한
						dayPopoverFormat: { year: 'numeric', month: 'long', day: 'numeric' },
						dateClick: function(info) {
							$("#schedule-enroll-modal").modal("show");			
					    },	
					    events: data

					});
					
					calendar.render();
					
    			}
    		})
						
		}
	</script>

	<!-- 풀캘린더 일정 추가 스크립트 
	<script>
			
		var draggedEventIsAllDay;
		var activeInactiveWeekends = true;
		var calendarEl = document.getElementById('holiday-personal-calendar');
		
		document.addEventListener('DOMContentLoaded', function() {
			calendarAddevents();
		});
		
		
		function calendarAddevents(){
			
			console.log("calendarAddevents 실행");
			
			$.ajax({
    			type: "GET",
    			url: "scheduleEnrollForm.sc",
    			data: {userNo:'${loginUser.userNo}'},
    			success: function(response){
    				
    				console.log(response); // [{}, {}, ..]
    				
    				let data = [];
    				
    				for(let i=0; i<response.length; i++) {
    					let obj = {
	    						title: response[i].scheduleTitle,
	    						start: response[i].scheduleStart,
	    						end: response[i].scheduleEnd,
	    				    	color : response[i].scheduleColor				
	    					};
    					
    					data.push(obj);
    				}
    				
    				
					var calendar = new FullCalendar.Calendar(calendarEl, {
						height: '850px;',
						expandRows: true,
						initialView : 'dayGridMonth', // 기본으로 보여지는 화면 => '이번달'
						googleCalendarApiKey: 'AIzaSyAjhvoWANExZ7MjlAGJm4VvKEC_Z-EgulE', // 구글캘린더 API키
						eventSources: [
							{
								googleCalendarId: 'blffot637do35g8hc1hf9a046s@group.calendar.google.com', // 구글캘린더 ID
								className: '대한민국빨간날',
								color: '#e65245', // 테두리배경색 지정
								textColor: 'white', // 글자색 지정					
								editable : false // 공휴일은 수정할 수 없도록 함
							}
						],
						headerToolbar: { // 상단에 보여지는 버튼 순서 지정
								left: 'prev,next today',
								center: 'title',
								right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
						},
					    titleFormat : function(date){
					    	return date.date.year + '년 ' + (date.date.month + 1) + '월';
					    },
					    locale: 'ko',
						editable : true, // 수정 가능여부
						selectable : true, // 달력 일자 드래그 가능
						droppable : true,
						nowIndicator : true, // 현재 시간 마크
						dayMaxEvents : true, // 이벤트가 오버되면 높이 제한
						dayPopoverFormat: { year: 'numeric', month: 'long', day: 'numeric' },
						dateClick: function(info) {
							$("#schedule-enroll-modal").modal("show");			
					    },	
					    events: data
					    
					});
					calendar.render();
					
    			}
    		})
						
		}
	</script>
	-->

	
	

	
	<!-- 이벤트 추가 스크립트 => 이거 아닌듯ㅎ
	<script>
	
		var eventModal = $('#schedule-enroll-modal');
		
		var scheduleCategory = $('#scheduleCategory');
		var scheduleAllday = $('#scheduleAllday');
		var scheduleTitle = $('#scheduleTitle');
		var scheduleStart = $('#scheduleStart');
		var scheduleEnd = $('#scheduleEnd');
		var scheduleTimeStart = $('#scheduleTimeStart');
		var scheduleTimeEnd = $('#scheduleTimeEnd');
		var scheduleColor = $('#scheduleColor');
		var scheduleContent = $('#scheduleContent');
		
		var addBtnContainer = $('#modalBtnContainer-addEvent');
		
		/* 새로운 일정 생성*/
		var newEvent = function(start, end, eventType) {
			
			$("#contextMenu").hide();
			
			scheduleCategory.val(eventType).prop('selected', true);
			scheduleTitle.val('');
			scheduleStart.val(scheduleStart);
			scheduleEnd.val(scheduleEnd);
			scheduleTimeStart.val(scheduleTimeStart);
			scheduleTimeEnd.val(scheduleTimeEnd);
			scheduleContent.val('');
			
			addBtnContainer.show();
			eventModal.modal('show');
			
			$('#schedule-enroll-modal-btn').unbind();
			$('#schedule-enroll-modal-btn').on('click', function(){
				
				var eventData = {
					scheduleTitle : scheduleTitle.val(),
					schedulStart : scheduleStart.val(),
					scheduleEnd : scheduleEnd.val(),
					scheduleTimeStart : scheduleTimeStart.val(),
					scheduleTimeEnd : scheduleTimeEnd.val(),
					scheduleContent : scheduleContent.val(),
					scheduleCategory : scheduleCategory.val(),
					scheduleColor : scheduleColor.val(),
					scheduleAllday: false
				};
				
				if (eventData.scheduleStart > eventData.scheduleEnd) {
					alert('끝나는 날짜가 앞설 수 없습니다.');
					return false;
				}
								
				if (scheduleAllday.is('checked')) {
					eventData.scheduleStart = moment(eventData.scheduleStart).format('YYYY-MM-DD');
					eventData.scheduleEnd = moment(eventData.scheduleEnd).add(1, 'days').format('YYYY-MM-DD');		
					
					eventData.scheduleAllday = true;
				}
				
				$('#holiday-personal-calendar').fullCalendar('renderEvent', eventData, true);
				eventModal.find('input, textarea').val('');
				scheduleAllday.prop('checked', false);
				eventModal.modal('hide');
				
				// 새로운 일정 저장
				$ajax({
					type: "get",
					url: "scheduleInsert.sc",
					data : {
						scheduleTitle : scheduleTitle.val(),
						schedulStart : scheduleStart.val(),
						scheduleEnd : scheduleEnd.val(),
						scheduleTimeStart : scheduleTimeStart.val(),
						scheduleTimeEnd : scheduleTimeEnd.val(),
						scheduleContent : scheduleContent.val(),
						scheduleCategory : scheduleCategory.val(),
						scheduleColor : scheduleColor.val(),
						scheduleAllday: scheduleAllday.val()
					},
					dataType:"json",
					success: function(response){
						console.log(response);
						$('#holiday-personal-calendar').fullCalendar('removeEvents');
		                $('#holiday-personal-calendar').fullCalendar('refetchEvents');
					}, error:function(){
						console.log("ajax통신 실패")
					}
				});				
			});			
		};
		
	</script>
	-->
	</div>
		
		<jsp:include page="../common/footer.jsp" />
	</div>	

</body>
</html>