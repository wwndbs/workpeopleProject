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
<style>
	#profileImg{
	    width:150px;
	    height:150px;
	    border:1px solid lightgray;
	    border-radius: 50%;
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
   	 <div class="adminx-content" style="width:1500px;">
        <div class="adminx-main-content">
            <div class="container-fluid" >

                <!--메인페이지 컨텐츠-->
                <div class="top-wrapper"  >

                    <!--게시판 부분-->
                    <div id="upm-area" class="upm-area">
                        
                        <div id="upm1">

                            <h2>개인 정보 수정</h2>
                            <br>
                            <br>
                            <!--프로필 부분-->
                            <div class="profile-alert-wrapper">
                                <div class="profile-area">
                                <img id="profileImg" src="<c:out value='${loginUser.profImg}' default='resources/profile_images/defaultProfile.jpg' />" onclick="$('#profileImgFile').click();">
                				<input type="file" id="profileImgFile" style="display:none;"><br>                                
                                <span id="profile-name"></span><br>
                                <span id="department-name"></span>
                                </div>
                            </div>
                            
                            <script>
								$(function(){
									$("#profileImgFile").change(function(){
										
										// AJAX로 파일을 넘기고자 할 경우 ( 단순한 택스트를 넘기기 )
										/*$.ajax({
											url:"",
											data:{
												
											}
										})*/
										
										// 가상의 폼 요소를 만들어서 데이터를 담은 후 전달하기
										// => FormData 객체
										let formData = new FormData();
										
										let uploadFile = this.files[0] // 현재 선택한 파일객체 ( 사용자가 선택한 첨부파일 )
										console.log(uploadFile);
										
										
										// 업로드할 파일 담기
										formData.append("uploadFile",uploadFile); // 폼에 데이터(파일) 담기 (키,벨류)  | 취소버튼 클릭시 undefined가 담김
										formData.append("email","${loginUser.email}"); // 단순 택스트도 넣을 수 있음 
																// 단, userId는 문자열이므로 자바스크립트의 문자열로 취급하기위해 따옴표 필요
										formData.append("originalFile","${loginUser.profImg}"); // 기존의 프로필이미지가 없었을경우 => 빈 문자열이 넘어감 ""
										// 기존의 프로필 이미지를 지우는 과정이 필요해서 기존의 이미지 경로를 가져가야됨
										
										
										$.ajax({
											url:"uploadProfile.me",
											data: formData, // 파일 자체 + 택스트가 담겨있는 form
											contentType: false,  // 파일을 넘길떈 무조건 false
											processData: false, // 파일을 넘길떈 무조건 false
											type: "POST", // 파일을 넘길땐 무조건 포스트방식
											success:function(){
												location.reload();
												// 기존의 페이지 강제로 새로고침 실행 시키기
											},
											error:function(){
												console.log("프로필 이미지 변경용 ajax통신 실패");
											}
										})
										
									})
								})
							</script>
                            
                            
                        </div>
                        <div id="upm2">
                            
                            <form id="upmForm" method="post" action="update.me" enctype="multipart/form-data">
                                <table id="upmTable" align="center">

                                    <tr>
                                        <td style="font-weight:800;">사내이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="email" name="email" class="form-control" style="height:30px;" value="${loginUser.email}" readonly></td>
                                    </tr>
					
                                    <tr>
                                        <td style="font-weight:800;">이름</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="userName" name="userName" class="form-control" style="height:30px;" placeholder="${loginUser.userName}" required readonly></td>
                                    </tr>

                                    <tr>
                                        <td style="font-weight:800;">휴대폰</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="phone" name="phone" class="form-control" style="height:30px;" placeholder="${loginUser.phone}" required></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800;">개인이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="userEmail" name="userEmail" class="form-control" style="height:30px;" placeholder="${loginUser.userEmail }"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800;">생년월일</td>
                                    </tr>

                                    <tr>
                                        <td align="center"><input type="text" id="birthday" name="birthday" class="form-control" style="height:30px;" placeholder="${loginUser.birthday }"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800;">입사일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="createDate" class="form-control" name="createDate" style="height:30px;" placeholder="${loginUser.createDate }" required readonly></td>
                                    </tr>
                                </table>
                                <br>
                                <div align="center">
                                    <a data-toggle="modal" class="btn btn-secondary" data-target="#passwordModal" style="color:white;" >비밀번호 변경</a> 
                                    <button type="submit" class="btn btn-secondary" >저장하기</button>
                                    <button type="reset" class="btn btn-secondary" >취소하기</button>
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

    <div class="modal fade" id="passwordModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 변경</h4>
            </div>

            <form action="updatePwd.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                	<input type="hidden" name="email" value="${ loginUser.email }">
                    <label for="userPwd" class="mr-sm-2"></label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="현재 비밀번호" name="userPwd" required>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="변경할 비밀번호" name="updatePwd" required>
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