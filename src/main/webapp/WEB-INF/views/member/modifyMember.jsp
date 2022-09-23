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
                <div class="top-wrapper" id="san-wrapper">

                    <!--게시판 부분-->
                    <div id="upm-area" class="upm-area">
                        
                        <div id="upm1">

                            <h2>사원 정보 수정</h2>
                            <br>
                            <br>
                            <!--프로필 부분-->
                            <div class="profile-alert-wrapper">
                                <div class="sanprofile-area">
                                <img id="profileImg" src="<c:out value='${m.profImg}' default='resources/profile_images/defaultProfile.jpg' />"><br>
                                <span id="profile-name"></span><br>
                                <span id="department-name"></span>
                                </div>
                            </div>
                        </div>
                        <div id="upm2">
                            
                            <form id="upmForm" method="post" action="modifyMember.me" enctype="multipart/form-data">
                                <table id="upmTable" align="center">

                                    <tr>
                                        <td style="font-weight:800; height:50px;">사내이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="email" class="form-control" name="email" style="height:40px;" placeholder="${m.email }" required readonly></td>
                                    </tr>

                                    <tr>
                                        <td style="font-weight:800; height:50px;">이름</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="userName" class="form-control" name="userName" style="height:40px;" value="${m.userName }"></td>
                                    </tr>

                                    <tr>
                                        <td style="font-weight:800; height:50px;">휴대폰 (-를 제외한 숫자만 입력해주세요)</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="phone" class="form-control" name="phone" style="height:40px;" value="${m.phone }" ></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800; height:40px;">개인이메일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="userEmail" class="form-control" name="userEmail" style="height:40px;" placeholder="${m.userEmail }" ></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800; height:50px;">생년월일 (YY-MM-DD)</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="birthday" class="form-control" name="birthday" style="height:40px;" placeholder="${m.birthday }" ></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800; height:50px;">부서/직책</td>
                                    </tr>

									<tr>
                                        <td style="width:380px;">
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

									<tr>
                                        <td style="font-weight:800; height:50px;">사원번호</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="userNo" class="form-control" name="userNo" style="height:40px;" value="${m.userNo }" required readonly></td>
                                    </tr>
                                    
                                    <tr>
                                        <td style="font-weight:800; height:50px;">입사일</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center"><input type="text" id="createDate" class="form-control" name="createDate" style="height:40px;" placeholder="${m.createDate }" required readonly></td>
                                    </tr>
                                </table>
                                <br>
                                <div align="center">
                                    <a style="color:white;" class="btn btn-secondary" href="delete.me?no=${m.userNo}">삭제하기</a>
                                    <button type="submit" class="btn btn-secondary">수정하기</button>
                                    <button type="reset"class="btn btn-secondary" >취소하기</button>
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