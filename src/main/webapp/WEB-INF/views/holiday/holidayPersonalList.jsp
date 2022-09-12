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

<script>

	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('holiday-personal-calendar');
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	      },
	      initialDate: '2022-09-02',
	      navLinks: true, // can click day/week names to navigate views
	      businessHours: true, // display business hours
	      editable: true,
	      selectable: true,
	      events: [
	        {
	          title: 'Business Lunch',
	          start: '2022-09-03T13:00:00',
	          constraint: 'businessHours'
	        },
	        {
	          title: 'Meeting',
	          start: '2022-09-13T11:00:00',
	          constraint: 'availableForMeeting', // defined below
	          color: '#257e4a'
	        },
	        {
	          title: 'Conference',
	          start: '2022-09-18',
	          end: '2022-09-20'
	        },
	        {
	          title: 'Party',
	          start: '2022-09-29T20:00:00'
	        },
	
	        // areas where "Meeting" must be dropped
	        {
	          groupId: 'availableForMeeting',
	          start: '2022-09-11T10:00:00',
	          end: '2022-09-11T16:00:00',
	          display: 'background'
	        },
	        {
	          groupId: 'availableForMeeting',
	          start: '2022-09-13T10:00:00',
	          end: '2022-09-13T16:00:00',
	          display: 'background'
	        },
	
	        // red areas where no events can be dropped
	        {
	          start: '2022-09-24',
	          end: '2022-09-28',
	          overlap: false,
	          display: 'background',
	          color: '#ff9f89'
	        },
	        {
	          start: '2022-09-06',
	          end: '2022-09-08',
	          overlap: false,
	          display: 'background',
	          color: '#ff9f89'
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

  #holiday-personal-calendar {
    max-width: 1100px;
    margin: 0 auto;
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
			<div class="adminx-main-content">

				<div id='holiday-personal-calendar'></div>
				
			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp" />
	</div>
	
	

</body>
</html>