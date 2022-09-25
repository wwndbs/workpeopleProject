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
<style>
.google-visualization-orgchart-table {
	width:90%;
	height:80%;
	font-size:18px;
	font-border:10px;
}
</style>
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
	                <div class="top-wrapper" style="width:1500px;">
						<div class="chart_area">
							<div align="right">
									<br>
	                                <a data-toggle="modal" class="btn btn-secondary" data-target="#addOrgModal" style="color:white;" >등록하기</a>&nbsp;&nbsp;&nbsp;
	                        </div>
		                    <!--게시판 부분-->
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
					                               [{v:'이사장', f:'이사장<div style="color:blue;">홍길동</div>'},
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
			                                // 클릭시 실행
			                                google.visualization.events.addListener(chart, 'select', function() {
			                                    // grab a few details before redirecting
												if(confirm(data.getValue(chart.getSelection()[0].row, 0)+" 을 삭제하시겠습니까?")){
													console.log(data.getValue(chart.getSelection()[0].row, 0));
													let orgName = data.getValue(chart.getSelection()[0].row, 0);
													console.log(orgName);
													$("#delorgchart").val(orgName);
													$("#deleteOrgChartModal").modal("show");
													
													// 모달 div 영역에 data.getValue(chart.getSelection()[0].row, 0)를 뿌려준 후
													// 모달이 뜨게끔 => $("모달요소선택자").modal("show");
													// 모달이 뜨게끔 => $("모달요소선택자").modal("hide"); -> 모달창 취소버튼 클릭시 숨겨주기 (여기있는거아님)
												}
			                                });
			                            }
			                        </script>
		                        </form>
		                     </div>
	                   </div>
	                </div>
	            </div>
	      </div>
	      
	      <div class="modal fade" id="addOrgModal">
	        <div class="modal-dialog modal-sm">
	            <div class="modal-content">
	            	<!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title">새로운 항목 추가</h4>
		            </div>
		            
		            <form action="addOrgChart.co" method="post">
		                <!-- Modal Body -->
		                <div class="modal-body">
		                    <label for="userPwd" class="mr-sm-2"></label>
		                    <select id="depName" class="form-control" name="depName" style="height:40px; width:100%" required>
                            	<option value=""></option>
			                        <c:choose>
				                		<c:when test="${ empty deplist }">
				                			<tr>
				                				<td colspan="6">선택할 부서가 존재하지 않습니다.</td>
				                			</tr>
				                		</c:when>
				                		<c:otherwise>
				                			<c:forEach var="d" items="${ deplist }">
						                     <option value="${d.depName }">${d.depName}</option>
				                    		</c:forEach>
				                    	</c:otherwise>
									</c:choose>
                           	</select>
		                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="상위 부서" id="parOb" name="parOb" required>
		                </div>
		                
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <button type="submit" class="btn btn-primary">추가</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                </div>
		            </form>
	            </div>
	       	</div>
    	</div>
	    
	    <div class="modal fade" id="deleteOrgChartModal">
	        <div class="modal-dialog modal-sm">
	            <div class="modal-content">
	            	<!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title">조직도 객체 삭제</h4>
		            </div>
	
		            <form action="deleteOrgChart.co" method="post">
		                <!-- Modal Body -->
		                <div class="modal-body">
							정말로 <input type="text" id="delorgchart" name="depName" readonly style="width:150px; height:30px;" >를 삭제하시겠습니까?
		                </div>
		                
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                	<button type="submit" class="btn btn-danger">삭제하기</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                </div>
		            </form>
	            </div>
	       	</div>
    	</div>
	    
	    
	      
    </div>

	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>