<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크피플</title>
<!-- 
	author : 최영헌
	
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
                <div class="top-wrapper">

                    <!--게시판 부분-->
                    <div id="upm-area" class="upm-area">
                        
                        <div id="upm1">

                            <h2>개인 정보 수정</h2>
                            <br>
                            <br>
                            <!--프로필 부분-->
                            <div class="profile-alert-wrapper">
                                <div class="profile-area">
                                <img src="resources/profile_images/defaultProfile.jpg" alt="프로필이미지"><br>
                                <span id="profile-name"></span><br>
                                <span id="department-name"></span>
                                </div>
                            </div>
                        </div>
                        <div id="upm2">
                            
                            <form id="upmForm" method="post" action="" enctype="multipart/form-data">
                                <table id="upmTable" align="center">

                                    <tr>
                                        <td style="font-weight:800;">사내이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="" class="form-control" name="" style="height:30px;" placeholder="사내이메일" required readonly></td>
                                    </tr>

                                    <tr>
                                        <td style="font-weight:800;">이름</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="" class="form-control" name="" style="height:30px;" placeholder="사원명" required></td>
                                    </tr>

                                    <tr>
                                        <td style="font-weight:800;">휴대폰</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="" class="form-control" name="" style="height:30px;" placeholder="010-0000-0000" required></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800;">개인이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="" class="form-control" name="" style="height:30px;" placeholder="이메일" required></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800;">생년월일</td>
                                    </tr>

                                    <tr>
                                        <td align="center"><input type="text" id="" class="form-control" name="" style="height:30px;" placeholder="생년월일" required readonly></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800;">임시비밀번호</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="" class="form-control" name="" style="height:30px;" placeholder="사원번호" required></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800;">입사일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="" class="form-control" name="" style="height:30px;" placeholder="YYYY-MM-DD" required readonly></td>
                                    </tr>
                                </table>
                                <br>
                                <div align="center">
                                    <button type="" id="loginbtn" data-toggle="modal" data-target="#loginModal">비밀번호 변경</button>
                                    <button type="submit" id="loginbtn" >저장하기</button>
                                    <button type="reset" id="loginbtn" >취소하기</button>
                                </div>
                            </form>
                        </div>

                        <div id="create3">
                        </div>
                        
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 변경</h4>
            </div>

            <form action="login.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userPwd" class="mr-sm-2"></label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="현재 비밀번호" id="" name="">
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="변경할 비밀번호" id="" name="">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">변경</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
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