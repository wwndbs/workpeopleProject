<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- favicon 설정 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<!-- 
	author : 박상현
	
	경로는 servlet-context.xml파일에 <resources mapping="/resources/**" location="/resources/" /> 로 명시되어있어
	resources로 경로를 시작하면됨
	
	header.jsp에 link 넣음
 -->

</head>
<body>
	<div class="adminx-container">
		<!-- 상단 메뉴 바 -->
		<jsp:include page="../common/header.jsp" />
		
		<!-- 좌측 슬라이드 메뉴 바 -->
		<jsp:include page="../common/menubar.jsp" />
		
		<!-- 컨텐츠 부분 wrapper -->
	    <div class="adminx-content">
	        <div class="adminx-main-content">
	            <div class="container-fluid">
	
	                <!--메인페이지 컨텐츠-->
	                <div class="top-wrapper" style="width:2000px; height:700px;">
	
	                    <!--게시판 부분-->
	                    <div class="contents">
	                    	<h3>조직도 조회</h3>
		                    <div id="chart_div"></div>
		                    <form>
	                           <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	                           
	                           <script type="text/javascript">
	                           google.charts.load('current', {packages:["orgchart"]});
	                           google.charts.setOnLoadCallback(drawChart);
	                       
	                           function drawChart() {
                               	   var data = new google.visualization.DataTable();
	                        	   data.addColumn('string', 'Name');
	                               data.addColumn('string', 'Manager');
	                       
	                               data.addRows([
		                               [{v:'이사장', f:'이사장<div style="color:blue; ">홍길동</div>'},
		                               ''],
										
		                               <c:choose>
					                		<c:when test="${ empty list }">
					                		</c:when>
					                		<c:otherwise>
					                			<c:forEach var="c" items="${ list }">
													['${c.depName}','${c.parOb}'],
					                    		</c:forEach>
					                    	</c:otherwise>
										</c:choose>
		                               
	                               ]);
	                       
	                               var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
	                               chart.draw(data, {allowHtml:true});
	                           }
	                           </script>        
	
	                        </form>
		                    </div>
						</div>
	                </div>
	           </div>
	       </div>
	</div>
	
	<script>
		// 프로젝트 슬라이드
		$(function() {
			let position = 0;
			$(".slide-btn>#right-btn").click(function() {
				position += 235;
				$(".project-container").css('transform', 'translateX(-' + position + 'px)');
				
				if (position > 235) {
					position = -235;
				}
			})

			$(".slide-btn>#left-btn").click(function() {
				position -= 235;
				$(".project-container").css('transform', 'translateX(-' + position + 'px)');
				
				if (position < 0) {
					position = 705;
				}
			})
		})
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>