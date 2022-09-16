<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">

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
			
			
			<!-- 풀캘린더 보여질 부분 -->	
			<div class="adminx-main-content">
			
				<div id='holiday-personal-calendar'></div>
				
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
		    			url: "",
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
										right: 'dayGridMonth,timeGridWeek,listMonth'
								},
							    locale: 'ko',
								editable : false, // 수정 가능여부
								selectable : false, // 달력 일자 드래그 가능
								droppable : false,
								nowIndicator : true, // 현재 시간 마크
								dayMaxEvents : true, // 이벤트가 오버되면 높이 제한
								dayPopoverFormat: { year: 'numeric', month: 'long', day: 'numeric' },
							    events: data,
							    eventClick: function(info){
							    	   //클릭시 구글캘린더 url로 이동하는거 막는 함수
							    	   info.jsEvent.stopPropagation();
							    	   info.jsEvent.preventDefault();
							    	 }
		
							});
							
							calendar.render();
							
		    			}
		    		})
								
				}
				
			</script>

	</div>
		
		<jsp:include page="../common/footer.jsp" />
	</div>	

</body>
</html>