<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- 
	author : 최영현
	
	경로는 servlet-context.xml파일에 <resources mapping="/resources/**" location="/resources/" /> 로 명시되어있어
	resources로 경로를 시작하면됨
	
	header.jsp에 link 넣음
 -->
<style>
	table{
	    width: 100%;
	    border: 1px solid #8e8e8edb;
	    padding: 10px;
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
                <div class="top-wrapper">

                    <!--게시판 부분-->
                    <div id="mtr-area" class="mtr-area">

                        <h3> 회의실 수정 및 삭제</h3>

                        <div id="mtr2">
                            
                            <form id="mtrForm" method="post" action="" enctype="multipart/form-data">
                                
                                
                                <table id="meetingRoomTable" align="center">

                                    <tr>
                                        <td colspan="4"><input placeholder="기존 회의실 이름" style="height: 30px;"></td>
                                        <td style="font-weight:800; font-size: 25; width: 120px;">이용 시간</td>
                                    </tr>

                                    <tr style="height: 10px;"></tr>
                                    <tr style="height: 80px">
                                        <td rowspan="3" id="mtr-img"style="width: 180px; padding-right:10px;">
                                            <img alt="image" class="img-fluid rounded" src="./imgs/people/7.jpg">
                                        </td>
                                        <td style="font-weight:800; width:150px;">면적 :</td>
                                        <td style="width:60px;"><input placeholder="기존 면적" style="height: 30px;"></td>
                                        <td style="width:100px"></td>
                                        <td> 시작시간 :</td>

                                        <td style="width: 130px;">
                                            <select id="" class="form-control" name="" style="height:40px; width:90%" required>
                                                <option value="">시간선택</option>
                                                <option value="">9:00 ~ 10:00</option>
                                                <option value="">10:00 ~ 11:00</option>
                                                <option value="">11:00 ~ 12:00</option>
                                                <option value="">13:00 ~ 14:00</option>
                                                <option value="">14:00 ~ 15:00</option>
                                                <option value="">15:00 ~ 16:00</option>
                                                <option value="">16:00 ~ 17:00</option>
                                                <option value="">17:00 ~ 18:00</option>
                                            </select>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td style="font-weight:800;">
                                            수용인원 : 
                                        </td>
                                        <td>
                                            <input placeholder="기존 수용인원" style="height: 30px;">
                                        </td>
                                        <td></td>
                                        
                                        <td> 종료시간 :</td>

                                        <td style="width: 130px;">
                                            <select id="" class="form-control" name="" style="height:40px; width:90%" required>
                                                <option value="">시간선택</option>
                                                <option value="">9:00 ~ 10:00</option>
                                                <option value="">10:00 ~ 11:00</option>
                                                <option value="">11:00 ~ 12:00</option>
                                                <option value="">13:00 ~ 14:00</option>
                                                <option value="">14:00 ~ 15:00</option>
                                                <option value="">15:00 ~ 16:00</option>
                                                <option value="">16:00 ~ 17:00</option>
                                                <option value="">17:00 ~ 18:00</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="font-weight:800;">
                                            최저 이용시간 : 
                                        </td>

                                        <td>
                                            <input placeholder="기존 최저이용시간" style="height: 30px;">
                                        </td>
                                        <td colspan="3"></td>
                                    </tr>

                                    <tr style="height: 50px;">
                                        <td>
                                            
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="4"></td>

                                        <td>
                                            <button type="submit" id="meetingbtn" style="height:30px; width:80px">수정</button>
                                        </td>

                                        <td>
                                            <button type="submit" id="meetingbtn" style="height:30px; width:80px">취소</button>
                                        </td>
                                        <td>
                                            <button type="submit" id="meetingbtn" style="height:30px; width:80px">삭제</button>
                                        </td>
                                        
                                    </tr>
                                </table>
                                <br>
                            </form>
                        </div>
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