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
			<div class="adminx-main-content">

				<div id='holiday-personal-calendar'></div>
				
			</div>
		</div>
		
		<jsp:include page="../common/footer.jsp" />
	</div>
	
	

</body>
</html>