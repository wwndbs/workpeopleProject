<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
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
                <div class="top-wrapper" style="width:1500px;">
					<div class="chart_area">
						<div align="right">
                                <button type="submit" id="loginbtn" data-toggle="modal" data-target="#loginModal">등록하기</button>
                                <button type="submit" id="loginbtn" data-toggle="modal" data-target="#loginModal">수정하기</button>
                                <button type="reset" id="loginbtn" data-toggle="modal" data-target="#loginModal">삭제하기</button>
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
		                                data.addColumn('string', 'ToolTip');
		                        
		                                data.addRows([
		                                [{v:'이사장', f:'이사장<div style="color:blue; ">홍길동</div>'},
		                                '', '연락처 : 010-1111-1111'],
		                                [{v:'부이사장', f:'부이사장<div style="color:blue;">홍일동</div>'},
		                                '이사장', '연락처 : 010-1111-0001'],
		                                [{v:'총괄팀장', f:'총괄팀장<div style="color:blue;">홍삼동</div>'},
		                                '이사장', '연락처 : 010-1111-0003'],
		                            
		                                [{v:'총괄본부장', f:'총괄본부장<div style="color:blue;">홍이동</div>'},
		                                '이사장', '010-1111-0002'],
		                            
		                                ['사업팀', '총괄팀장', '010-2222-0001'],
		                                ['관리팀', '총괄팀장', '010-3333-0001'],
		                                ['영업팀', '총괄팀장', '010-4444-0001'],
		                                ['안전팀', '총괄팀장', '010-5555-0001'],
		                                ['전산실', '총괄팀장', '010-6666-0001'],
		                                
		                                ['팀장', '사업팀', '010-2222-0001'],
		                                ['대리', '팀장', '010-2222-0001']
		                                ]);
		                        
		                                var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
		                                chart.draw(data, {allowHtml:true});
		                            	}
		                        </script>        
	                        </form>
	                     </div>
                   </div>

                    <div align="center"> <!-- 모델창 처리 해야됨 여기-->
                        <h3>새로운 항목 등록</h3>
                        
                        <table style="padding: 10px;">
                            <tr>
                                <td>상위조직 :</td>
                                <td><input type="text" style="height:30px;"></td>
                            </tr>
                            
                            <tr>
                                <td>생성부서 :</td>
                                <td><input type="text" style="height:30px;"></td>
                            </tr>
                        </table>
                        <div align="center">
                            <button type="submit" id="loginbtn" data-toggle="modal" data-target="#loginModal">생성하기</button>
                            <button type="reset" id="loginbtn" data-toggle="modal" data-target="#loginModal">취소하기</button>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>