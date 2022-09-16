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
	#hold{
	  	background-color: gainsboro;
	  	text-align:center;   
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
	                <div class="top-wrapper" style="width:1500px; height:1000px;">
	
	                    <!--게시판 부분-->
	                    <div id="mtr-area" class="mtr-area">
	
	                        <h3> 회의실 관리 </h3>
	
	                        <div id="mtr2">
	                            
	                            <form id="mtrForm" method="post" action="" enctype="multipart/form-data">
	                                
	                                <table id="meetingRoomTable" align="center">
	
	                                    <tr>
	                                        <td colspan="7" style="font-weight:800; font-size: 25;">회의실 이름</td>
	                                        <td><input type="checkbox" name="" style="width:20px; height:20px;"></td>
	                                    </tr>
	
	                                    <tr style="height: 10px;"></tr>
	                                    <tr style="height: 80px">
	                                        <td rowspan="3" id="mtr-img"style="width: 200px; padding-right:10px;">
	                                            <img alt="image" class="img-fluid rounded" src="./imgs/people/7.jpg">
	                                        </td>
	                                        <td style="font-weight:800; width: 130px;">면적 :</td>
	                                        <td style="width: 60px;">20</td>
	                                        <td style="width:50px"></td>
	                                        <td>시작 시간 :</td>
	                                        <td style="width: 100px;">
	                                        </td>
	
	                                        <td style="width: 100px;">
	                                                9:00 ~ 10:00
	                                        </td>
	
	                                    </tr>
	
	                                    <tr>
	                                        <td style="font-weight:800;">
	                                            수용인원 : 
	                                        </td>
	                                        <td>
	                                            8명
	                                        </td>
	                                        <td></td>
	                                        <td>종료 시간 :</td>
	                                        <td style="width: 100px;">
	                                        </td>
	
	                                        <td style="width: 130px;">
	                                            17:00 ~ 18:00
	                                        </td>
	                                    </tr>
	
	                                    <tr>
	                                        <td style="font-weight:800;">
	                                            최저 이용시간 : 
	                                        </td>
	
	                                        <td>
	                                            1시간
	                                        </td>
	                                        <td colspan="3"></td>
	                                    </tr>
	
	                                    <tr>
	                                        <td colspan="6"></td>
	                                        <td>
	                                            <button type="submit" id="meetingbtn" style="height:30px; width:90%">수정하기</button>
	                                        </td>
	                                        
	                                    </tr>
	                                    
	                                </table> 
	                                <br>
	
	                                <table id="meetingRoomTable" align="center">
	
	                                    <tr>
	                                        <td colspan="7" style="font-weight:800; font-size: 25;">회의실 이름</td>
	                                        <td><input type="checkbox" name="" style="width:20px; height:20px;"></td>
	                                    </tr>
	
	                                    <tr style="height: 10px;"></tr>
	                                    <tr style="height: 80px">
	                                        <td rowspan="3" id="mtr-img"style="width: 200px; padding-right:10px;">
	                                            <img alt="image" class="img-fluid rounded" src="./imgs/people/7.jpg">
	                                        </td>
	                                        <td style="font-weight:800; width: 130px;">면적 :</td>
	                                        <td style="width: 60px;">20</td>
	                                        <td style="width:50px"></td>
	                                        <td>시작 시간 :</td>
	                                        <td style="width: 100px;">
	                                        </td>
	
	                                        <td style="width: 100px;">
	                                                9:00 ~ 10:00
	                                        </td>
	
	                                    </tr>
	
	                                    <tr>
	                                        <td style="font-weight:800;">
	                                            수용인원 : 
	                                        </td>
	                                        <td>
	                                            8명
	                                        </td>
	                                        <td></td>
	                                        <td>종료 시간 :</td>
	                                        <td style="width: 100px;">
	                                        </td>
	
	                                        <td style="width: 130px;">
	                                            17:00 ~ 18:00
	                                        </td>
	                                    </tr>
	
	                                    <tr>
	                                        <td style="font-weight:800;">
	                                            최저 이용시간 : 
	                                        </td>
	
	                                        <td>
	                                            1시간
	                                        </td>
	                                        <td colspan="3"></td>
	                                    </tr>
	
	                                    <tr>
	                                        <td colspan="6"></td>
	                                        <td>
	                                            <button type="submit" id="meetingbtn" style="height:30px; width:90%">수정하기</button>
	                                        </td>
	                                        
	                                    </tr>
	                                    
	                                </table>
	                                <br>
	                                <table id="meetingRoomTable" align="center">
	
	                                    <tr>
	                                        <td colspan="7" style="font-weight:800; font-size: 25;">회의실 이름</td>
	                                        <td><input type="checkbox" name="" style="width:20px; height:20px;"></td>
	                                    </tr>
	
	                                    <tr style="height: 10px;"></tr>
	                                    <tr style="height: 80px">
	                                        <td rowspan="3" id="mtr-img"style="width: 200px; padding-right:10px;">
	                                            <img alt="image" class="img-fluid rounded" src="./imgs/people/7.jpg">
	                                        </td>
	                                        <td style="font-weight:800; width: 130px;">면적 :</td>
	                                        <td style="width: 60px;">20</td>
	                                        <td style="width:50px"></td>
	                                        <td>시작 시간 :</td>
	                                        <td style="width: 100px;">
	                                        </td>
	
	                                        <td style="width: 100px;">
	                                                9:00 ~ 10:00
	                                        </td>
	
	                                    </tr>
	
	                                    <tr>
	                                        <td style="font-weight:800;">
	                                            수용인원 : 
	                                        </td>
	                                        <td>
	                                            8명
	                                        </td>
	                                        <td></td>
	                                        <td>종료 시간 :</td>
	                                        <td style="width: 100px;">
	                                        </td>
	
	                                        <td style="width: 130px;">
	                                            17:00 ~ 18:00
	                                        </td>
	                                    </tr>
	
	                                    <tr>
	                                        <td style="font-weight:800;">
	                                            최저 이용시간 : 
	                                        </td>
	
	                                        <td>
	                                            1시간
	                                        </td>
	                                        <td colspan="3"></td>
	                                    </tr>
	
	                                    <tr>
	                                        <td colspan="6"></td>
	                                        <td>
	                                            <button type="submit" id="meetingbtn" style="height:30px; width:90%">수정하기</button>
	                                        </td>
	                                        
	                                    </tr>
	                                    
	                                </table>
	                                <br>
	
	                                <div align="right">
	                                    <button type="submit" id="meetingbtn" >회의실 등록</button>
	                                    <button type="submit" id="meetingbtn" >삭제</button>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
 	</div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>