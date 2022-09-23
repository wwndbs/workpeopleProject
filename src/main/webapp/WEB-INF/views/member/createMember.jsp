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
		
		<div class="adminx-content">
        <div class="adminx-main-content">
            <div class="container-fluid">

                <!--메인페이지 컨텐츠-->
                <div class="top-wrapper" id="member-wrapper">

                    <!--게시판 부분-->
                    <div id="upm-area" class="upm-area">
                        
                        <div id="upm1">

                            <h2>사원 계정 생성</h2>
                            <br>
                            <br>
                            <!--프로필 부분-->
                            <div class="profile-alert-wrapper">
                                <div class="sanprofile-area">
                                <img src="resources/profile_images/defaultProfile.jpg" alt="프로필이미지" id="profileImg" ><br>
                                <span id="profile-name"></span><br>
                                <span id="department-name"></span>
                                </div>
                            </div>
                        </div>
                        <div id="upm2">
                            
                            <form id="upmForm" method="post" action="create.me" enctype="multipart/form-data">
                                <table id="upmTable" align="center">

                                    <tr style="height:50px;">
                                        <td style="font-weight:800;">사내이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input style="height:40px;" type="text" id="email" class="form-control" name="email" style="height:30px;" placeholder="사내이메일" required></td>
                                    </tr>

                                    <tr style="height:50px;">
                                        <td style="font-weight:800;">이름</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input style="height:40px;" type="text" id="userName" class="form-control" name="userName" style="height:30px;" placeholder="사원명" required></td>
                                    </tr>

                                    <tr style="height:50px;">
                                        <td style="font-weight:800;">휴대폰 (-를 제외한 숫자만 입력해주세요)</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input style="height:40px;" type="text" id="phone" class="form-control" name="phone" style="height:30px;" placeholder="010-0000-0000" required></td>
                                    </tr>
                                    
                                    <tr style="height:50px;">
                                        <td style="font-weight:800;">개인이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input style="height:40px;" type="text" id="userEmail" class="form-control" name="userEmail" style="height:30px;" placeholder="사원 개인 이메일" ></td>
                                    </tr>
                                    
                                    <tr style="height:50px;">
                                        <td style="font-weight:800;">부서/직책 선택</td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <select id="depName" class="form-control" name="depName" style="height:40px; width:100%" required>
                                                <option value="${m.depName}">${m.depName}</option>
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
                                        </td>
                                        
                                        <td>
                                            <select id="jobName" class="form-control" name="jobName" style="height:40px; width:100%" required>
                                                <option value="${m.jobName}">${m.jobName}</option>
                                                <c:choose>
							                		<c:when test="${ empty joblist }">
							                			<tr>
							                				<td colspan="6">선택할 직책이 존재하지 않습니다.</td>
							                			</tr>
							                		</c:when>
							                		<c:otherwise>
							                			<c:forEach var="j" items="${ joblist }">
									                     <option value="${j.jobName }">${j.jobName }</option>
							                    		</c:forEach>
							                    	</c:otherwise>
												</c:choose>
                                            </select>
                                        </td>
                                    </tr>
                                    
                                    <tr style="height:50px;">
                                        <td style="font-weight:800;">임시비밀번호</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input style="height:40px;" type="text" id="userPwd" class="form-control" name="userPwd" style="height:30px;" placeholder="임시비밀번호" required></td>
                                    </tr>
                                    
                                    
                                </table>
                                <br>
                                <div align="center">
                                    <button type="submit" id="loginbtn" class="btn btn-primary btn4">생성하기</button>
                                    <button type="reset" id="loginbtn" class="btn btn-secondary">취소하기</button>
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
 </div>

	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>